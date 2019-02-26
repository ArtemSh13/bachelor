unit FourierAnalys;

interface
uses SysUtils, Math, Common, Series, Chart, StdCtrls;

procedure pFourierInit;
procedure pFourierStatus;
procedure pGetFourier;
procedure pOutFourier;
procedure pClearFourierMar(Ax: Byte);
procedure pOutFourierMar(Send: TObject; X: Integer);
procedure pOutFourierMean(Send: TObject; X: Integer);
procedure pSaveMeanF(Pr: Byte; FName: String);

implementation
uses Main;

var
  NF1,NF2: Integer;
  Xp: array[1..3] of Integer;
  MultCF: array[1..3] of Real;
  pCh: array[1..3] of ^TChart;
  pSsF: array[1..3,1..2] of ^TLineSeries;
  pSsM: array[1..3] of ^TLineSeries;
  pSsP: array[1..3] of ^TLineSeries;
  pLbF: array[1..3,1..2] of ^TLabel;
  pLbM: array[1..3] of ^TLabel;
  pLB: array[1..3] of ^TListBox;
  sFourSpec: String;
  bMean,bMar: array[1..3] of Boolean;
  nMean: array[1..3] of Byte;
  XMean: array[1..3,1..40] of Integer;
  Mean,dMean: array[1..3,1..2,1..20] of Real;

//------------------------------------------------------------------------------
procedure pFourierInit;
var
  Ax: Byte;
begin
  for Ax:=1 to 3 do Xp[Ax]:=0;
  for Ax:=1 to 3 do bMean[Ax]:=FALSE;
  for Ax:=1 to 3 do bMar[Ax]:=FALSE;

  with Form1 do
  begin
    pCh[1]:=@Ch_CF1; pSsF[1,1]:=@Ss_CF11; pSsF[1,2]:=@Ss_CF12;
    pCh[2]:=@Ch_CF2; pSsF[2,1]:=@Ss_CF21; pSsF[2,2]:=@Ss_CF22;
    pCh[3]:=@Ch_CF3; pSsF[3,1]:=@Ss_CF31; pSsF[3,2]:=@Ss_CF32;

    pSsM[1]:=@Ss_CF1m; pSsP[1]:=@Ss_CF1p;
    pSsM[2]:=@Ss_CF2m; pSsP[2]:=@Ss_CF2p;
    pSsM[3]:=@Ss_CF3m; pSsP[3]:=@Ss_CF3p;

    pLbM[1]:=@Lb_CF1m; pLbF[1,1]:=@Lb_CF11; pLbF[1,2]:=@Lb_CF12;
    pLbM[2]:=@Lb_CF2m; pLbF[2,1]:=@Lb_CF21; pLbF[2,2]:=@Lb_CF22;
    pLbM[3]:=@Lb_CF3m; pLbF[3,1]:=@Lb_CF31; pLbF[3,2]:=@Lb_CF32;

    pLB[1]:=@LB_FMean1; pLB[2]:=@LB_FMean2; pLB[3]:=@LB_FMean3;
end;
  pFourierStatus;
end;
//------------------------------------------------------------------------------
procedure pFourierStatus;
var
  Ax: Byte;
  dH: Real;
  bA: Boolean;
begin
  with Form1 do
  begin
    if H2-H1> 10.0 then dH:=2.0;
    if H2-H1<=10.0 then dH:=1.0;
    if H2-H1<= 5.0 then dH:=0.5;
    if H2-H1<= 2.0 then dH:=0.2;
    if H2-H1<= 1.0 then dH:=0.1;
    for Ax:=1 to 3 do pCh[Ax].BottomAxis.Increment:=dH;

    if RB_bSpec.Checked then sFourSpec:='Частотный спектр';
    if RB_bDiff.Checked then sFourSpec:='Проба1 - Проба2';
    if RB_bRltn.Checked then sFourSpec:='Проба1 / Проба2';
    for Ax:=1 to 3 do pCh[Ax].Title.Text[0]:=sFourSpec;

    for Ax:=1 to 3 do pLbF[Ax,2].Visible:=RB_bSpec.Checked;

    RB_bSpec.Enabled:=bProb[1];

    if (RB_bRltn.Checked)or(RB_bDiff.Checked) then bA:=FALSE else bA:=TRUE;
    RB_bLog10.Enabled:=bA;

    if (RB_bLog10.Checked)or(not bProb[2]) then bA:=FALSE else bA:=TRUE;
    RB_bRltn.Enabled:=bA;
    RB_bDiff.Enabled:=bA;
  end;
end;
//------------------------------------------------------------------------------
procedure __GetFourier(pY0,pCF0: pSingle);
var
  i,j: Integer;
  w,Re,Im: Real;
  pY,pCF: pSingle;
  St: String;
begin
  St:=Form1.Ed_Status.Text;
  for j:=0 to NCF0  do
  begin
    if bBinFile then if ((j mod 100)=0) then
    begin
      Form1.Ed_Status.Text:=St+' '+IntToStr(NCF0-j);
      Form1.Ed_Status.Update;
    end;
    w:=2*Pi*j/NCY0;
    Re:=0; Im:=0;
    pY:=pY0;
    for i:=0 to NCY0-1 do
    begin
      inc(pY);
      Re:=Re+pY^*cos(w*i);
      Im:=Im+pY^*sin(w*i);
    end;
    pCF:=pCF0; inc(pCF,j);
    pCF^:=(2*Pi)*4*(sqr(Re)+sqr(Im))/sqr(NCY0);
  end;
end;
//------------------------------------------------------------------------------
procedure pGetFourier;
var
  Pr,Ax: Integer;
begin
  NCF0:=NCY0 div 2;

  with Form1 do
  begin
    for Pr:=1 to nProb do if (bProb[Pr] and (not bCalc[Pr])) then
     for Ax:=1 to nAxis[Pr] do
    begin
      Ed_Status.Text:=' Проба '+IntToStr(Pr)+', Ось '+IntToStr(Ax)+': Фурье-анализ';
      Ed_Status.Update;
      if (pCF0[Ax,Pr]=nil) then
      begin
        GetMem(pCF0[Ax,Pr],(NCF0+1)*cSS);
        GetMem(pGF0[Ax,Pr],(NCF0+1)*cSS);
      end;
      Center(1,NCY0,pCY0[Ax][Pr],pY0);
      Filter(1,NCY0,pY0);
      __GetFourier(pY0,pCF0[Ax,Pr]);
    end;
    pOutFourier;

    Ed_Status.Text:='';
    Ed_Status.Update;
  end; 
end;
//------------------------------------------------------------------------------
procedure pOutFourier;
var
  Ax,Pr,nPr: Byte;
  j: Integer;
  M: array[1..3] of Real;
  pMul: array[1..3] of ^TLabel;
  pCF,pGF,pGF1,pGF2: pSingle;
begin
  with Form1 do
  begin
    pMul[1]:=@Lb_MultCF1b; pMul[2]:=@Lb_MultCF2b; pMul[3]:=@Lb_MultCF3b;

    NF1:=Round(H1*NCY0*dT);
    NF2:=Round(H2*NCY0*dT);

    for Pr:=1 to 2 do for Ax:=1 to 3 do pSsF[Ax,Pr].Clear;

    for Pr:=1 to nProb do if bProb[Pr] then for Ax:=1 to nAxis[Pr] do
     for j:=NF1 to NF2 do
    begin
      pCF:=pCF0[Ax,Pr]; inc(pCF,j);
      pGF:=pGF0[Ax,Pr]; inc(pGF,j);
      pGF^:=pCF^;
      if RB_bRemvl.Checked then pGF^:=sqrt(pGF^/(2*Pi));
      if RB_bLog10.Checked then if pGF^>1E-9 then pGF^:=10*Log10(pGF^)
      else pGF^:=-90;
    end;

    if ((bProb[2])and(not RB_bSpec.Checked)) then for Ax:=1 to nAxis[2] do
     for j:=NF1 to NF2 do
    begin
      pGF1:=pGF0[Ax,1]; inc(pGF1,j);
      pGF2:=pGF0[Ax,2]; inc(pGF2,j);
      if RB_bDiff.Checked then pGF1^:=pGF1^-pGF2^;
      if RB_bRltn.Checked then if pGF2^>1E-10 then pGF1^:=pGF1^/pGF2^ else pGF1^:=0;
    end;

    nPr:=nProb;
    if (not RB_bSpec.Checked) then nPr:=1;

    for Ax:=1 to 3 do MultCF[Ax]:=0;
    for Pr:=1 to nPr do if bOut[Pr] then for Ax:=1 to nAxis[Pr] do
    begin
      M[Ax]:=_frSetMult(NF1,NF2,pGF0[Ax,Pr],pMul[Ax]^);
      if MultCF[Ax]<M[Ax] then MultCF[Ax]:=M[Ax];
    end;

    for Pr:=1 to nPr do if bOut[Pr] then for Ax:=1 to nAxis[Pr] do
    begin
      for j:=NF1 to NF2 do
      begin
        pGF:=pGF0[Ax,Pr]; inc(pGF,j);
        pSsF[Ax,Pr].AddXY(j/NCY0/dT,pGF^/MultCF[Ax]);
      end;
      pMul[Ax].Caption:=FloatToStr(Log10(MultCF[Ax]));
      pCh[Ax].Update;
    end;
  end;

  for Ax:=1 to nAxis[1] do pClearFourierMar(Ax);
  if (bOut[1] and bOut[2]) then
  begin
    for Ax:=1 to nAxis[1] do if bMar[Ax]  then pOutFourierMar(pCh[Ax]^,Xp[Ax]);
    for Ax:=1 to nAxis[1] do if bMean[Ax] then pOutFourierMean(pCh[Ax]^,-1);
  end;

  pFourierStatus;
end;
//------------------------------------------------------------------------------
procedure pClearFourierMar(Ax: Byte);
var
  Pr: Byte;
begin
  pSsM[Ax].Clear;
  pSsP[Ax].Clear;
  pLbM[Ax].Caption:='';
  for Pr:=1 to 2 do
  begin
    pLbF[Ax,Pr].Caption:='';
    pLB[Ax].Visible:=FALSE;
    pLB[Ax].Clear;
  end;
end;
//------------------------------------------------------------------------------
procedure pOutFourierMar(Send: TObject; X: Integer);
var
  a,Ax: Byte;
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
      Jmin:=Round((pSsF[Ax,1].MinXValue)*NCY0*dT);
      Jmax:=Round((pSsF[Ax,1].MaxXValue)*NCY0*dT);
      J1:=Round((pCh[Ax].BottomAxis.Minimum)*NCY0*dT);
      J2:=Round((pCh[Ax].BottomAxis.Maximum)*NCY0*dT);
      j:=Round((X-X1)/(X2-X1)*(J2-J1)+J1);

      N0:=pSsF[Ax,1].Count;
      Nx:=Round((j-Jmin)/(Jmax-Jmin)*(N0-1));

      pClearFourierMar(Ax);
      pCh[Ax].Update;

      pSsM[Ax].AddXY(j/NCY0/dT,(pCh[Ax].LeftAxis.Minimum+pCh[Ax].LeftAxis.Maximum)/2);

      pLbM[Ax].Caption:=FloatToStrF(j/NCY0/dT,ffFixed,4,4);

      pLbF[Ax,1].Caption:=FloatToStrF(pSsF[Ax,1].YValues[Nx],ffFixed,5,4);

      if bProb[2] and RB_bSpec.Checked and (Ax<=nAxis[2]) then
       pLbF[Ax,2].Caption:=FloatToStrF(pSsF[Ax,2].YValues[Nx],ffFixed,5,4);
    end;
    pSsP[Ax].Clear;
    bMean[Ax]:=FALSE;
    bMar[Ax]:=TRUE;
  end;
end;
//------------------------------------------------------------------------------
procedure pOutFourierMean(Send: TObject; X: Integer);
var
  a,Ax,Pr,n,k,M: Byte;
  X1,X2,j,Jmin,J1,J2,Jmax,N0,Nx,XM,dn: Integer;
  pGF: pSingle;
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
      Jmin:=Round((pSsF[Ax,1].MinXValue)*NCY0*dT);
      Jmax:=Round((pSsF[Ax,1].MaxXValue)*NCY0*dT);
      J1:=Round((pCh[Ax].BottomAxis.Minimum)*NCY0*dT);
      J2:=Round((pCh[Ax].BottomAxis.Maximum)*NCY0*dT);
      j:=Round((X-X1)/(X2-X1)*(J2-J1)+J1);

      N0:=pSsF[Ax,1].Count;
      Nx:=Round((j-Jmin)/(Jmax-Jmin)*(N0-1));

      pSsM[Ax].AddXY(j/NCY0/dT,(pCh[Ax].LeftAxis.Minimum+pCh[Ax].LeftAxis.Maximum)/2);

      pLbM[Ax].Caption:=FloatToStrF(j/NCY0/dT,ffFixed,4,4);

      pLbF[Ax,1].Caption:=FloatToStrF(pSsF[Ax,1].YValues[Nx],ffFixed,4,4);

      if bProb[2] and RB_bSpec.Checked and (Ax<=nAxis[2]) then
       pLbF[Ax,2].Caption:=FloatToStrF(pSsF[Ax,2].YValues[Nx],ffFixed,4,4);
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
            pGF:=pGF0[Ax,Pr]; inc(pGF,n);
            Mean[Ax,Pr,k]:=Mean[Ax,Pr,k]+pGF^/dn;
            dMean[Ax,Pr,k]:=dMean[Ax,Pr,k]+sqr(pGF^)/dn;
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
        pSsM[Ax].AddXY(XMean[Ax,2*k-1]/NCY0/dT,
         (pCh[Ax].LeftAxis.Minimum+pCh[Ax].LeftAxis.Maximum)/2);
        pSsM[Ax].AddXY(XMean[Ax,2*k]/NCY0/dT,
         (pCh[Ax].LeftAxis.Minimum+pCh[Ax].LeftAxis.Maximum)/2);

        pSsP[Ax].AddXY(XMean[Ax,2*k-1]/NCY0/dT,0);
        pSsP[Ax].AddXY(XMean[Ax,2*k-1]/NCY0/dT,
         (pCh[Ax].LeftAxis.Minimum+pCh[Ax].LeftAxis.Maximum)/2);
        pSsP[Ax].AddXY(XMean[Ax,2*k]/NCY0/dT,
         (pCh[Ax].LeftAxis.Minimum+pCh[Ax].LeftAxis.Maximum)/2);
        pSsP[Ax].AddXY(XMean[Ax,2*k]/NCY0/dT,0);
      end;
    end;
    bMar[Ax]:=FALSE;
    bMean[Ax]:=TRUE;
  end;
end;
//------------------------------------------------------------------------------
procedure pSaveMeanF(Pr: Byte; FName: String);
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
        F1:=FloatToStrF(XMean[Ax,2*n-1]/NCY0/dT,ffExponent,4,2);
        F2:=FloatToStrF(XMean[Ax,2*n]/NCY0/dT,ffExponent,4,2);
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

