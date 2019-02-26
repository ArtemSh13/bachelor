unit WinFourier;

interface
uses SysUtils, Math, ComCtrls, Series, Chart,
  StdCtrls;

procedure WinFourStatus(bOutSt1,bOutSt2: Boolean);
procedure WinFourInit;
procedure SetFequencyUD;
procedure SetFequencyEd;
procedure GetFourWin;
procedure OutFourWin;
procedure ClearWinMar;
procedure OutWinMar(Send: TObject; X: Integer);
//==============================================================================
implementation
uses Main, Common;

var
  Xp: array[1..3] of Integer;
  nF: array[1..5] of Integer;
  pEdF: array[1..5] of ^TEdit;
  pUDF: array[1..5] of ^TUpDown;
  MultCW: array[1..3] of Real;
  pCh: array[1..3] of ^TChart;
  pSsW: array[1..3,1..5] of ^TLineSeries;
  pSsM: array[1..3] of ^TLineSeries;
  pLbM: array[1..3] of ^TLabel;
  pLbW: array[1..3,1..5] of ^TLabel;
  bMar: array[1..3] of Boolean;

//==============================================================================
procedure WinFourInit;
var
  Ax: Byte;
begin
  for Ax:=1 to 3 do Xp[Ax]:=0;
  for Ax:=1 to 3 do bMar[Ax]:=FALSE;

  with Form1 do
  begin
    pEdF[1]:=@Ed_F1; pEdF[2]:=@Ed_F2; pEdF[3]:=@Ed_F3; pEdF[4]:=@Ed_F4; pEdF[5]:=@Ed_F5;
    pUDF[1]:=@UD_F1; pUDF[2]:=@UD_F2; pUDF[3]:=@UD_F3; pUDF[4]:=@UD_F4; pUDF[5]:=@UD_F5;

    pCh[1]:=@Ch_CW1; pCh[2]:=@Ch_CW2; pCh[3]:=@Ch_CW3;

    pSsW[1,1]:=@Ss_CW11; pSsW[2,1]:=@Ss_CW21; pSsW[3,1]:=@Ss_CW31;
    pSsW[1,2]:=@Ss_CW12; pSsW[2,2]:=@Ss_CW22; pSsW[3,2]:=@Ss_CW32;
    pSsW[1,3]:=@Ss_CW13; pSsW[2,3]:=@Ss_CW23; pSsW[3,3]:=@Ss_CW33;
    pSsW[1,4]:=@Ss_CW14; pSsW[2,4]:=@Ss_CW24; pSsW[3,4]:=@Ss_CW34;
    pSsW[1,5]:=@Ss_CW15; pSsW[2,5]:=@Ss_CW25; pSsW[3,5]:=@Ss_CW35;

    pSsM[1]:=@Ss_CW1m; pSsM[2]:=@Ss_CW2m; pSsM[3]:=@Ss_CW3m;
    pLbM[1]:=@Lb_CW1m; pLbM[2]:=@Lb_CW2m; pLbM[3]:=@Lb_CW3m;

    pLbW[1,1]:=@Lb_CW11; pLbW[2,1]:=@Lb_CW21; pLbW[3,1]:=@Lb_CW31;
    pLbW[1,2]:=@Lb_CW12; pLbW[2,2]:=@Lb_CW22; pLbW[3,2]:=@Lb_CW32;
    pLbW[1,3]:=@Lb_CW13; pLbW[2,3]:=@Lb_CW23; pLbW[3,3]:=@Lb_CW33;
    pLbW[1,4]:=@Lb_CW14; pLbW[2,4]:=@Lb_CW24; pLbW[3,4]:=@Lb_CW34;
    pLbW[1,5]:=@Lb_CW15; pLbW[2,5]:=@Lb_CW25; pLbW[3,5]:=@Lb_CW35;
  end;
  WinFourStatus(FALSE,FALSE);
end;
//------------------------------------------------------------------------------
procedure WinFourStatus(bOutSt1,bOutSt2: Boolean);
var
  Ax,Pr: Byte;
  St: String;
begin
  with Form1 do
  begin
    RB_bSelPr1.Enabled:=bCalc[1];
    RB_bSelPr1.Checked:=bOutSt1;
    RB_bSelPr2.Enabled:=bCalc[2];
    RB_bSelPr2.Checked:=bOutSt2;
    if bOut1Prob then GB_Window_Frequency.Height:=198;
    if bOut2Prob then GB_Window_Frequency.Height:=82;
    GB_OutStab.Visible:=bOut1Prob;

    for Ax:=1 to 3 do for Pr:=2 to 5 do
     if (Pr=2) then pLbW[Ax,Pr].Visible:=(bOut1Prob or bProb[2])
     else pLbW[Ax,Pr].Visible:=bOut1Prob;

    for Ax:=1 to 3 do
     if bOut1Prob then pCh[Ax].Title.Text[0]:='  ��������� ���������'
     else pCh[Ax].Title.Text[0]:=FloatToStrF(nF[1]/Twin,ffFixed,5,4)+
      '  ��������� ���������, ��';
  end;
end;
//------------------------------------------------------------------------------
procedure SetFequencyUD;
var
  n: Byte;
begin
  if not bProb[1] then Exit;

  with Form1 do for n:=1 to 5 do
  begin
    nF[n]:=pUDF[n].Position;
    pEdF[n].Text:=FloatToStr(nF[n]/Twin);
  end;
end;
//------------------------------------------------------------------------------
procedure SetFequencyEd;
var
  n: Byte;
begin
  if not bProb[1] then Exit;

  with Form1 do
  begin
    for n:=1 to 5 do
    begin
      if pEdF[n].Text='' then Exit;
      nF[n]:=Round(StrToFloat(pEdF[n].Text)*Twin);
      pUDF[n].Position:=nF[n];
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure __GetFourWin(pCY0: pSingle; pCW0: aW_pSingle);
var
  i,j,I1,I2,t,Twin2,Jwin: Integer;
  w,Re,Im: Real;
  pY,pW: pSingle;
  St: String;
begin
  Twin2:=Twin div 2;
  Jwin:=(Nwin div 2)-1;

  St:=Form1.Ed_Status.Text;
  for t:=Twin2 to TC0-Twin2 do
  begin
    if bBinFile then
    begin
      Form1.Ed_Status.Text:=St+' '+IntToStr(TC0-t);
      Form1.Ed_Status.Update;
    end;
    I1:=Round((t-Twin2)/dT+1);
    I2:=I1+Nwin-1;
    Center(I1,I2,pCY0,pY0);
    Filter(I1,I2,pY0);
    for j:=0 to Jwin do
    begin
      w:=2*Pi*j/Nwin;
      Re:=0;
      Im:=0;
      for i:=I1 to I2 do
      begin
        pY:=pY0; inc(pY,i);
        Re:=Re+pY^*cos(w*(i-I1));
        Im:=Im+pY^*sin(w*(i-I1));
      end;
      pW:=pCW0[t]; inc(pW,j);
      pW^:=(2*Pi)*4*(sqr(Re)+sqr(Im))/sqr(Nwin);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure GetFourWin;
var
  Pr,Ax: Byte;
  t: Word;
begin
  Nwin:=Round(Twin/dT);
  NCW0:=TC0;
  NCW1:=Nwin div 2;

  with Form1 do
  begin
    for Pr:=1 to nProb do if (bProb[Pr] and (not bCalc[Pr])) then
    begin
      for t:=0 to NCW0 do if (pW0[t]=nil) then  GetMem(pW0[t],(NCW1+1)*cSS);
      for Ax:=1 to nAxis[Pr] do
      begin
        for t:=0 to NCW0 do
         if (pCW0[Ax,Pr,t]=nil) then GetMem(pCW0[Ax,Pr,t],(NCW1+1)*cSS);
        Ed_Status.Text:=' ����� '+IntToStr(Pr)+', ��� '+IntToStr(Ax)+': ������� �����-������';
        Ed_Status.Update;
        __GetFourWin(pCY0[Ax,Pr],pCW0[Ax,Pr]);
      end;
      if Pr=1 then WinFourStatus(TRUE,FALSE);
      if Pr=2 then WinFourStatus(FALSE,TRUE);
    end;
    OutFourWin;

    Ed_Status.Text:='';
    Ed_Status.Update;
  end;
end;
//------------------------------------------------------------------------------
procedure OutFourWin;
var
  Pr,Ax: Byte;
  t,T1,T2,n,M: Integer;
  C,Cm: Real;
  W: array[0..1500] of Single;
  pMul: array[1..3] of ^TLabel;
  pW: pSingle;
begin
  if not bProb[1] then Exit;

  with Form1 do
  begin
    PMul[1]:=@Lb_MultCW1b;
    PMul[2]:=@Lb_MultCW2b;
    PMul[3]:=@Lb_MultCW3b;

    for Pr:=1 to 5 do for Ax:=1 to 3 do pSsW[Ax,Pr].Clear;

    T1:=Twin div 2;
    T2:=TC0-(Twin div 2);

    if bOut1Prob then
    begin
      if RB_bSelPr1.Checked then Pr:=1;
      if RB_bSelPr2.Checked then Pr:=2;

      for Ax:=1 to nAxis[Pr] do
      begin
        Cm:=0;
        for n:=1 to 5 do for t:=T1 to T2 do
        begin
          pW:=pCW0[Ax,Pr][t]; inc(pW,nF[n]);
          C:=pW^;
          if RB_bRemvl.Checked then C:=sqrt(C/(2*Pi));
          if RB_bLog10.Checked then if C>1E-9 then C:=10*Log10(C) else C:=-90;
          if abs(C)>Cm then Cm:=abs(C);
        end;
        M:=_fExp(Cm);
        MultCW[Ax]:=IntPower(10,M);
        pMul[Ax].Caption:=FloatToStr(M);
      end;

      for n:=1 to 5 do for Ax:=1 to nAxis[Pr] do
      begin
        for t:=T1 to T2 do
        begin
          pW:=pCW0[Ax,Pr][t]; inc(pW,nF[n]);
          W[t]:=pW^;
          if RB_bRemvl.Checked then W[t]:=sqrt(W[t]/(2*Pi));
          if RB_bLog10.Checked then if W[t]>1E-9 then
           W[t]:=10*Log10(W[t]) else W[t]:=-90;
          pSsW[Ax,n].AddXY(t+TC1[Pr]-1,W[t]/MultCW[Ax]);
        end;
        pCh[Ax].Update;
      end;
    end;

    if bOut2Prob then
    begin
      for Pr:=1 to nProb do if bOut[Pr] then for Ax:=1 to nAxis[Pr] do
      begin
        for t:=T1 to T2 do
        begin
          pW:=pCW0[Ax,Pr][t]; inc(pW,nF[1]);
          W[t]:=pW^;
          if RB_bRemvl.Checked then W[t]:=sqrt(W[t]/(2*Pi));
          if RB_bLog10.Checked then if W[t]>1E-9 then W[t]:=10*Log10(W[t]) else W[t]:=-90;
        end;
        if Pr=1 then MultCW[Ax]:=_frSetMult(T1,T2, @W[T1], pMul[Ax]^);
        if (nProb=1)or(TC1[1]=TC1[2]) then
         for t:=T1 to T2 do pSsW[Ax,Pr].AddXY(t+TC1[1]-1,W[t]/MultCW[Ax])
        else for t:=T1 to T2 do pSsW[Ax,Pr].AddXY(t,W[t]/MultCW[Ax]);
        pCh[Ax].Update;
      end;
    end;
    WinFourStatus(RB_bSelPr1.Checked,RB_bSelPr2.Checked);
  end;

  ClearWinMar;
  if (bOut[1] and bOut[2]) then
   for Ax:=1 to nAxis[1] do if bMar[Ax] then OutWinMar(pCh[Ax]^,Xp[Ax]);
end;
//------------------------------------------------------------------------------
procedure ClearWinMar;
var
  Ax,Pr: Byte;
begin
  for Ax:=1 to nAxis[1] do
  begin
    pSsM[Ax].Clear;
    pLbM[Ax].Caption:='';
    for Pr:=1 to 5 do pLbW[Ax,Pr].Caption:='';
  end;
end;
//------------------------------------------------------------------------------
procedure OutWinMar(Send: TObject; X: Integer);
var
  Pr,a,Ax: Byte;
  n,X1,X2,j,Jmin,J1,J2,Jmax,N0,Nx: Integer;
begin
  with Form1 do
  begin
    for a:=1 to nAxis0 do if Send=pCh[a]^ then Ax:=a;
    if Ax>nAxis[1] then Exit;

    pCh[Ax].Update;
    Xp[Ax]:=X;
    X1:=pCh[Ax].BottomAxis.IStartPos;
    X2:=pCh[Ax].BottomAxis.IEndPos;
    if X<X1 then X:=X1;
    if X>X2 then X:=X2;
    Jmin:=Round(pSsW[Ax,1].MinXValue);
    Jmax:=Round(pSsW[Ax,1].MaxXValue);
    J1:=Round(pCh[Ax].BottomAxis.Minimum);
    J2:=Round(pCh[Ax].BottomAxis.Maximum);
    j:=Round((X-X1)/(X2-X1)*(J2-J1)+J1);
    if J2-J1<=0 then Exit;

    N0:=pSsW[Ax,1].Count;
    Nx:=Round((j-Jmin)/(Jmax-Jmin)*(N0-1));

    pSsM[Ax].Clear;
    pSsM[Ax].AddXY(j,(pCh[Ax].LeftAxis.Minimum+pCh[Ax].LeftAxis.Maximum)/2);

    pLbM[Ax].Caption:=IntToStr(j);

    if bOut1Prob then for n:=1 to 5 do
       pLbW[Ax,n].Caption:=FloatToStrF(pSsW[Ax,n].YValues[Nx],ffFixed,4,3);

    if bOut2Prob then for Pr:=1 to nProb do if bOut[Pr] then if Ax<=nAxis[Pr] then
     pLbW[Ax,Pr].Caption:=FloatToStrF(pSsW[Ax,Pr].YValues[Nx],ffFixed,4,3);
  end;
  bMar[Ax]:=TRUE;
end;
//==============================================================================

end.
