unit VelchAnalys;

interface
uses Math, SysUtils, StdCtrls, Series, Chart;

procedure VelchInit;
procedure GetVelch;
procedure OutVelch;
procedure ClearVelchMar(Ax: Byte);
procedure OutVelchMar(Send: TObject; X: Integer);
procedure OutVelchMean(Send: TObject; X: Integer);
procedure pSaveMeanV(Pr: Byte; FName: String);

//==============================================================================
implementation
uses Main, Common;

var
  NV1,NV2: Integer;
  MultCV: array[1..3] of Real;
  Xp: array[1..3] of Integer;
  pCh: array[1..3] of ^TChart;
  pSsV: array[1..3,1..2] of ^TLineSeries;
  pSs1: array[1..3,1..2] of ^TLineSeries;
  pSs2: array[1..3,1..2] of ^TLineSeries;
  pSsM,pSsP: array[1..3] of ^TLineSeries;
  pLbV: array[1..3,1..2] of ^TLabel;
  pLbM: array[1..3] of ^TLabel;
  pLB: array[1..3] of ^TListBox;
  sVelch: String;
  bMean,bMar: array[1..3] of Boolean;
  nMean: array[1..3] of Byte;
  XMean: array[1..3,1..40] of Integer;
  Mean,dMean: array[1..3,1..2,1..20] of Real;

//==============================================================================
procedure __VelchStatus;
var
  Ax: Byte;
  dH: Real;
begin
  with Form1 do
  begin
    if H2-H1> 10.0 then dH:=2.0;
    if H2-H1<=10.0 then dH:=1.0;
    if H2-H1<= 5.0 then dH:=0.5;
    if H2-H1<= 2.0 then dH:=0.2;
    if H2-H1<= 1.0 then dH:=0.1;
    Ch_CV1.BottomAxis.Increment:=dH;
    Ch_CV2.BottomAxis.Increment:=dH;
    Ch_CV3.BottomAxis.Increment:=dH;

    if RB_bSpec.Checked then sVelch:='Частотный спектр';
    if RB_bDiff.Checked then sVelch:='Проба 1 - Проба 2';
    if RB_bRltn.Checked then sVelch:='Проба 1 / Проба 2';

    for Ax:=1 to 3 do pCh[Ax].Title.Text[0]:=sVelch;
  end;
end;
//------------------------------------------------------------------------------
procedure VelchInit;
var
  Ax: Byte;
begin
  for Ax:=1 to 3 do Xp[Ax]:=0;
  for Ax:=1 to 3 do bMean[Ax]:=FALSE;
  for Ax:=1 to 3 do bMar[Ax]:=FALSE;

  with Form1 do
  begin
    pCh[1]:=@Ch_CV1;
    pCh[2]:=@Ch_CV2;
    pCh[3]:=@Ch_CV3;

    pSsV[1,1]:=@Ss_CV11; pSs1[1,1]:=@Ss_GE111; pSs2[1,1]:=@Ss_GE112;
    pSsV[2,1]:=@Ss_CV21; pSs1[2,1]:=@Ss_GE211; pSs2[2,1]:=@Ss_GE212;
    pSsV[3,1]:=@Ss_CV31; pSs1[3,1]:=@Ss_GE311; pSs2[3,1]:=@Ss_GE312;
    pSsV[1,2]:=@Ss_CV12; pSs1[1,2]:=@Ss_GE121; pSs2[1,2]:=@Ss_GE122;
    pSsV[2,2]:=@Ss_CV22; pSs1[2,2]:=@Ss_GE221; pSs2[2,2]:=@Ss_GE222;
    pSsV[3,2]:=@Ss_CV32; pSs1[3,2]:=@Ss_GE321; pSs2[3,2]:=@Ss_GE322;

    pLbV[1,1]:=@Lb_V11; pLbV[1,2]:=@Lb_V12; pLbM[1]:=@Lb_V1m;
    pLbV[2,1]:=@Lb_V21; pLbV[2,2]:=@Lb_V22; pLbM[2]:=@Lb_V2m;
    pLbV[3,1]:=@Lb_V31; pLbV[3,2]:=@Lb_V32; pLbM[3]:=@Lb_V3m;

    pSsM[1]:=@Ss_CV1m; pSsP[1]:=@Ss_CV1p;
    pSsM[2]:=@Ss_CV2m; pSsP[2]:=@Ss_CV2p;
    pSsM[3]:=@Ss_CV3m; pSsP[3]:=@Ss_CV3p;

    pLB[1]:=@LB_VMean1; pLB[2]:=@LB_VMean2; pLB[3]:=@LB_VMean3;
  end;
  __VelchStatus;
end;
//------------------------------------------------------------------------------
procedure __GetVelch(pCY0,pCV0,pCE0: pSingle);
var
  i,j,n,I1,I2: Integer;
  w,Re,Im,V1,t: Real;
  pY,pCV,PCE: pSingle;
  St: String;
begin
  for j:=0 to NCV0 do
  begin
    pCV:=pCV0; inc(pCV,j); pCV^:=0;
    pCE:=pCE0; inc(pCE,j); pCE^:=0;
  end;

  St:=Form1.Ed_Status.Text;
  t:=0;
  n:=0;
  While t+Tvel<=TC0 do
  begin
    if bBinFile then
    begin
      Form1.Ed_Status.Text:=St+' '+FloatToStr(TC0-t-Tvel);
      Form1.Ed_Status.Update;
    end;
    inc(n);
    I1:=Round(t/dT+1);
    I2:=I1+Nvel-1;
    Center(I1,I2,pCY0,pY0);
    Filter(I1,I2,pY0);
    for j:=0 to NCV0 do
    begin
      w:=2*Pi*j/Nvel;
      Re:=0;
      Im:=0;
      for i:=I1 to I2 do
      begin
        pY:=pY0; inc(pY,i);
        Re:=Re+pY^*cos(w*(i-I1));
        Im:=Im+pY^*sin(w*(i-I1));
      end;
      pCV:=pCV0; inc(pCV,j);
      pCE:=pCE0; inc(pCE,j);
      V1:=(2*Pi)*4*(sqr(Re)+sqr(Im))/sqr(Nvel);
      pCV^:=pCV^+V1;
      pCE^:=pCE^+sqr(V1);
    end;
    t:=t+Svel;
  end;

  for j:=0 to NCV0 do
  begin
    pCV:=pCV0; inc(pCV,j);
    pCE:=pCE0; inc(pCE,j);
    pCV^:=pCV^/n;
    pCE^:=sqrt(abs(pCE^/n-sqr(pCV^)));
  end;
end;
//------------------------------------------------------------------------------
procedure GetVelch;
var
  Pr,Ax: Byte;
begin
  Nvel:=Round(Tvel/dT);
  NCV0:=(Nvel div 2)-1;

  with Form1 do
  begin
    for Pr:=1 to nProb do if (bProb[Pr] and (not bCalc[Pr])) then
     for Ax:=1 to nAxis[Pr] do
    begin
      if (pCV0[Ax,Pr]=nil) then
      begin
        GetMem(pCV0[Ax,Pr],(NCV0+2)*cSS);
        GetMem(pCE0[Ax,Pr],(NCV0+2)*cSS);
        GetMem(pGV0[Ax,Pr],(NCV0+2)*cSS);
        GetMem(pGE0[Ax,Pr],(NCV0+2)*cSS);
      end;
      Ed_Status.Text:=' Проба '+IntToStr(Pr)+', Ось '+IntToStr(Ax)+': Велч-анализ';
      Ed_Status.Update;
      __GetVelch(pCY0[Ax][Pr],pCV0[Ax][Pr],pCE0[Ax][Pr]);
    end;
    OutVelch;

    Ed_Status.Text:='';
    Ed_Status.Update;
  end;
end;
//------------------------------------------------------------------------------
procedure OutVelch;
var
  Ax,Pr,nPr: Byte;
  j: Integer;
  k,R: Real;
  M: array[1..3] of Real;
  pMul: array[1..3] of ^TLabel;
  pCV,pCE,pGV,pGV1,pGV2,pGE: pSingle;
begin
  NV1:=Round(H1*Nvel*dT);
  NV2:=Round(H2*Nvel*dT);

  with Form1 do
  begin
    pMul[1]:=@Lb_MultCV1b;
    pMul[2]:=@Lb_MultCV2b;
    pMul[3]:=@Lb_MultCV3b;

    for Pr:=1 to 2 do for Ax:=1 to 3 do
    begin
      pSsV[Ax,Pr].Clear;
      pSs1[Ax,Pr].Clear;
      pSs2[Ax,Pr].Clear;
    end;

    for Pr:=1 to nProb do for Ax:=1 to nAxis[Pr] do for j:=NV1 to NV2 do
    begin
      pCV:=pCV0[Ax,Pr]; inc(pCV,j);
      pGV:=pGV0[Ax,Pr]; inc(pGV,j);
      pGV^:=pCV^;
      pCE:=pCE0[Ax,Pr]; inc(pCE,j);
      pGE:=pGE0[Ax,Pr]; inc(pGE,j);
      pGE^:=pCE^;
      if abs(pGE^)<1.0E-30 then pGE^:=0;
      if RB_bRemvl.Checked then
      begin
        pGV^:=sqrt(pGV^/(2*Pi));
        if pGV^>0 then pGE^:=pGE^/pGV^/2/(2*Pi)
        else           pGE^:=0;
      end;
      if RB_bLog10.Checked then if pGV^>1E-9 then pGV^:=10*Log10(pGV^)
      else                                        pGV^:=-90;
    end;

    if ((bProb[2])and(not RB_bSpec.Checked)) then for Ax:=1 to nAxis[2] do
     for j:=NV1 to NV2 do
    begin
      pGV1:=pGV0[Ax,1]; inc(pGV1,j);
      pGV2:=pGV0[Ax,2]; inc(pGV2,j);
      if RB_bDiff.Checked then pGV1^:=pGV1^-pGV2^;
      if RB_bRltn.Checked then if pGV2^>1E-10 then pGV1^:=pGV1^/pGV2^ else pGV1^:=0;
    end;

    nPr:=nProb;
    if (not RB_bSpec.Checked) then nPr:=1;

    for Ax:=1 to 3 do MultCV[Ax]:=0;
    for Pr:=1 to nPr do if bOut[Pr] then for Ax:=1 to nAxis[Pr] do
    begin
      M[Ax]:=_frSetMult(NV1,NV2,pGV0[Ax,Pr],pMul[Ax]^);
      if MultCV[Ax]<M[Ax] then MultCV[Ax]:=M[Ax];
    end;

    for Pr:=1 to nPr do if bOut[Pr] then for Ax:=1 to nAxis[Pr] do
    begin
      for j:=NV1 to NV2 do
      begin
        pGV:=pGV0[Ax][Pr]; inc(pGV,j);
        pGE:=pGE0[Ax][Pr]; inc(pGE,j);
        k:=j/Nvel/dT;
        pSsV[Ax,Pr].AddXY(k,pGV^/MultCV[Ax]);
        if bError and RB_bSpec.Checked and (not RB_bLog10.Checked) then
        begin
          R:=pGV^-pGE^;
          if R<0 then R:=0;
          pSs1[Ax][Pr].AddXY(k,R/MultCV[Ax]);
          pSs2[Ax][Pr].AddXY(k,(pGV^+pGE^)/MultCV[Ax]);
        end;
      end;
      pMul[Ax].Caption:=FloatToStr(Log10(MultCV[Ax]));
      pCh[Ax].Update;
    end;
  end;

  for Ax:=1 to nAxis[1] do ClearVelchMar(Ax);
  if (bOut[1] and bOut[2]) then
  begin
    for Ax:=1 to nAxis[1] do if bMar[Ax]  then OutVelchMar(pCh[Ax]^,Xp[Ax]);
    for Ax:=1 to nAxis[1] do if bMean[Ax] then OutVelchMean(pCh[Ax]^,-1);
  end;

  __VelchStatus;
end;
//------------------------------------------------------------------------------
procedure ClearVelchMar(Ax: Byte);
var
  Pr: Byte;
begin
  pSsM[Ax].Clear;
  pSsP[Ax].Clear;
  pLbM[Ax].Caption:='';
  for Pr:=1 to 2 do
  begin
    pLbV[Ax,Pr].Caption:='';
    pLB[Ax].Visible:=FALSE;
    pLB[Ax].Clear;
  end;
end;
//------------------------------------------------------------------------------
procedure OutVelchMar(Send: TObject; X: Integer);
var
  a,Ax,Pr: Byte;
  X1,X2,j,Jmin,J1,J2,Jmax,N0,Nx: Integer;
begin
  with Form1 do
  begin
    for a:=1 to nAxis0 do if Send=pCh[a]^ then Ax:=a;
    if Ax>nAxis[1] then Exit;

    if bProb[1] then
    begin
      pCh[Ax].Update;
      Xp[Ax]:=X;
      X1:=pCh[Ax].BottomAxis.IStartPos;
      X2:=pCh[Ax].BottomAxis.IEndPos;
      if X<X1 then X:=X1;
      if X>X2 then X:=X2;
      Jmin:=Round((pSsV[Ax,1].MinXValue)*Nvel*dT);
      Jmax:=Round((pSsV[Ax,1].MaxXValue)*Nvel*dT);
      J1:=Round((pCh[Ax].BottomAxis.Minimum)*Nvel*dT);
      J2:=Round((pCh[Ax].BottomAxis.Maximum)*Nvel*dT);
      j:=Round((X-X1)/(X2-X1)*(J2-J1)+J1);

      N0:=pSsV[Ax,1].Count;
      Nx:=Round((j-Jmin)/(Jmax-Jmin)*(N0-1));

      ClearVelchMar(Ax);
      pCh[Ax].Update;

      pSsM[Ax].AddXY(j/Nvel/dT,(pCh[Ax].LeftAxis.Minimum+pCh[Ax].LeftAxis.Maximum)/2);

      pLbM[Ax].Caption:=FloatToStrF(j/Nvel/dT,ffFixed,4,4);

      pLbV[Ax,1].Caption:=FloatToStrF(pSsV[Ax,1].YValues[Nx],ffFixed,5,4);

      if bProb[2] and RB_bSpec.Checked and (Ax<=nAxis[2]) then
       pLbV[Ax,2].Caption:=FloatToStrF(pSsV[Ax,2].YValues[Nx],ffFixed,5,4);
    end;
    pSsP[Ax].Clear;
    bMean[Ax]:=FALSE;
    bMar[Ax]:=TRUE;
  end;
end;
//------------------------------------------------------------------------------
procedure OutVelchMean(Send: TObject; X: Integer);
var
  a,Ax,Pr,n,k,M: Byte;
  X1,X2,j,Jmin,J1,J2,Jmax,N0,Nx,XM,dn: Integer;
  pGV: pSingle;
begin
  with Form1 do
  begin
    if (not RB_bSpec.Checked) then Exit;
    for a:=1 to nAxis0 do if Send=pCh[a]^ then Ax:=a;
    if Ax>nAxis[1] then Exit;

    if not bMean[Ax] then
    begin
      pSsM[Ax].Clear;
      nMean[Ax]:=0;
      for n:=1 to 40 do XMean[Ax,n]:=0;
    end;

    if bProb[1] and (X>0) then
    begin
      pCh[Ax].Update;
      Xp[Ax]:=-1;
      X1:=pCh[Ax].BottomAxis.IStartPos;
      X2:=pCh[Ax].BottomAxis.IEndPos;
      if X<X1 then X:=X1;
      if X>X2 then X:=X2;
      Jmin:=Round((pSsV[Ax,1].MinXValue)*Nvel*dT);
      Jmax:=Round((pSsV[Ax,1].MaxXValue)*Nvel*dT);
      J1:=Round((pCh[Ax].BottomAxis.Minimum)*Nvel*dT);
      J2:=Round((pCh[Ax].BottomAxis.Maximum)*Nvel*dT);
      j:=Round((X-X1)/(X2-X1)*(J2-J1)+J1);

      N0:=pSsV[Ax,1].Count;
      Nx:=Round((j-Jmin)/(Jmax-Jmin)*(N0-1));

      pSsM[Ax].AddXY(j/Nvel/dT,(pCh[Ax].LeftAxis.Minimum+pCh[Ax].LeftAxis.Maximum)/2);

      pLbM[Ax].Caption:=FloatToStrF(j/Nvel/dT,ffFixed,4,4);

      pLbV[Ax,1].Caption:=FloatToStrF(pSsV[Ax,1].YValues[Nx],ffFixed,4,4);

      if bProb[2] and RB_bSpec.Checked and (Ax<=nAxis[2]) then
       pLbV[Ax,2].Caption:=FloatToStrF(pSsV[Ax,2].YValues[Nx],ffFixed,4,4);
    end;

    if X>0 then
    begin
      inc(nMean[Ax]);
      XMean[Ax,nMean[Ax]]:=j;
      for n:=1 to nMean[Ax]-1 do for k:=n+1 to nMean[Ax] do if XMean[Ax,k]<XMean[Ax,n] then
      begin XM:=XMean[Ax,k]; XMean[Ax,k]:=XMean[Ax,n]; XMean[Ax,n]:=XM; end;
    end;

    if (nMean[Ax] mod 2)=0 then
    begin
      pLB[Ax].Visible:=TRUE;
      pLB[Ax].Clear;
      for Pr:=1 to nProb do if Ax<=nAxis[Pr] then
      begin
        M:=nMean[Ax] div 2;
        for k:=1 to M do
        begin
          dn:=XMean[Ax,2*k]-XMean[Ax,2*k-1]+1;
          Mean[Ax,Pr,k]:=0;
          dMean[Ax,Pr,k]:=0;
          for n:=XMean[Ax,2*k-1] to XMean[Ax,2*k] do
          begin
            pGV:=pGV0[Ax][Pr]; inc(pGV,n);
            Mean[Ax,Pr,k]:=Mean[Ax,Pr,k]+pGV^/dn;
            dMean[Ax,Pr,k]:=dMean[Ax,Pr,k]+sqr(pGV^)/dn;
          end;
          if dn>1 then dMean[Ax,Pr,k]:=sqrt((dMean[Ax,Pr,k]-sqr(Mean[Ax,Pr,k]))/(dn-1))
          else dMean[Ax,Pr,k]:=0;
        end;

        for k:=1 to M do
        begin
          pLB[Ax].Items[k-1+(Pr-1)*M]:=IntToStr(k)+') '+
           FloatToStrF(Mean[Ax,Pr,k],ffExponent,3,2)+
            ' +- '+FloatToStrF(dMean[Ax,Pr,k],ffExponent,3,2);
        end;
      end;

      pSsP[Ax].Clear;
      pCh[Ax].Update;
      for k:=1 to M do
      begin
        pSsM[Ax].AddXY(XMean[Ax,2*k-1]/Nvel/dT,
         (pCh[Ax].LeftAxis.Minimum+pCh[Ax].LeftAxis.Maximum)/2);
        pSsM[Ax].AddXY(XMean[Ax,2*k]/Nvel/dT,
         (pCh[Ax].LeftAxis.Minimum+pCh[Ax].LeftAxis.Maximum)/2);

        pSsP[Ax].AddXY(XMean[Ax,2*k-1]/Nvel/dT,0);
        pSsP[Ax].AddXY(XMean[Ax,2*k-1]/Nvel/dT,
         (pCh[Ax].LeftAxis.Minimum+pCh[Ax].LeftAxis.Maximum)/2);
        pSsP[Ax].AddXY(XMean[Ax,2*k]/Nvel/dT,
         (pCh[Ax].LeftAxis.Minimum+pCh[Ax].LeftAxis.Maximum)/2);
        pSsP[Ax].AddXY(XMean[Ax,2*k]/Nvel/dT,0);
      end;
    end;
    bMar[Ax]:=FALSE;
    bMean[Ax]:=TRUE;
  end;
end;
//------------------------------------------------------------------------------
procedure pSaveMeanV(Pr: Byte; FName: String);
const
  St: array[1..3] of String=('X','Y','Z');
var
  T: TextFile;
  Ax,n: Byte;
  F1,F2,M,dM: String;
begin
  if (not bMean[1])and(not bMean[2])and(not bMean[3]) then Exit;

  AssignFile(T,FName);
  ReWrite(T);
    WriteLn(T,'Ось  Нач. частота  Кон. частота     Среднее        СКО');
    for Ax:=1 to nAxis[Pr] do if bMean[Ax] then
    begin
      for n:=1 to (nMean[Ax] div 2) do
      begin
        if n=1 then Write(T,St[Ax]:3) else Write(T,' ':3);
        F1:=FloatToStrF(XMean[Ax,2*n-1]/Nvel/dT,ffExponent,4,2);
        F2:=FloatToStrF(XMean[Ax,2*n]/Nvel/dT,ffExponent,4,2);
        M:=FloatToStrF(Mean[Ax,Pr,n],ffExponent,4,2);
        dM:=FloatToStrF(dMean[Ax,Pr,n],ffExponent,4,2);
        WriteLn(T,F1:14,F2:14,M:12,dM:11);
      end;
      WriteLn(T);
    end;
  CloseFile(T);
end;
//==============================================================================

end.
