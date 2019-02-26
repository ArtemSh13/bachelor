unit SpectroGramm;

interface
uses SysUtils, QGraphics, ExtCtrls, Graphics, Math, Types, Chart, Series, StdCtrls;

procedure _pCS_Win;
procedure SGInit;
procedure SGReadPal;
procedure SGOutPalette;
procedure __OutSpGramm(Pr,Ax: Byte);
procedure OutSpGramm;
procedure __OutColScale;
procedure OutSGMar(Send: TObject; X,Y: Integer);

//==============================================================================
implementation
uses Main, Common, DataExport;

var
  NSG: Integer;
  J1,J2: Integer;
  dFr: Real;
  SGRGB: array[0..100] of LongInt;
  Smax,Smin: array[1..3,1..2] of Real;
  S0max,S0min: Real;
  Xp,Yp: array[1..3,1..2] of Integer;
  MultCS: array[1..3,1..2] of Real;
  pCh: array[1..3,1..2] of ^TChart;
  pIm: array[1..3,1..2] of ^TImage;
//==============================================================================
procedure _pCS_Win;
const
  dH=2;
  dW=2;
var
  Ax,Pr: Byte;
  TS_H,TS_W: Integer;
  Ch_H,Ch_W: Integer;
begin
  with Form1 do
  begin
    TS_H:=TS_CS.ClientHeight;
    TS_W:=GB_SpectrumType.Left-10;

    Ch_H:=(TS_H-dH*(nAxis0+1)) div nAxis0;
    Ch_W:=(TS_W-dW*(nProb0+1)) div nProb0;

    for Pr:=1 to 2 do for Ax:=1 to 3 do pCh[Ax,Pr].Visible:=FALSE;

    for Pr:=1 to nProb0 do for Ax:=1 to nAxis0 do
    begin
      pCh[Ax,Pr].Height:=Ch_H;  pCh[Ax,Pr].Top:= dH+(Ch_H+dH)*(Ax-1);
      pCh[Ax,Pr].Width :=Ch_W;  pCh[Ax,Pr].Left:=dW+(Ch_W+dW)*(Pr-1);
      pCh[Ax,Pr].Visible:=TRUE;
      pIm[Ax,Pr].Width:=
       (pCh[Ax,Pr].BottomAxis.IEndPos-pCh[Ax,Pr].BottomAxis.IStartPos+1);
      pIm[Ax,Pr].Height:=
       (Ch_CS11.LeftAxis.IEndPos-Ch_CS11.LeftAxis.IStartPos+1);
    end;

    PageC.ActivePageIndex:=4;
    TS_CS.Update;
  end;
end;
//------------------------------------------------------------------------------
procedure __SGStatus;
var
  Ax,Pr: Byte;
  dH: Real;
  pSs: array[1..3,1..2] of ^TLineSeries;
begin
  if H2-H1> 10.0 then dH:=5.0;
  if H2-H1<=10.0 then dH:=2.0;
  if H2-H1<= 5.0 then dH:=1.0;
  if H2-H1<= 2.0 then dH:=0.5;
  if H2-H1<= 1.0 then dH:=0.2;
  if H2-H1<= 0.5 then dH:=0.1;

  with Form1 do
  begin
    pSs[1,1]:=@Ss_CS11; pSs[1,2]:=@Ss_CS12;
    pSs[2,1]:=@Ss_CS21; pSs[2,2]:=@Ss_CS22;
    pSs[3,1]:=@Ss_CS31; pSs[3,2]:=@Ss_CS32;

    for Pr:=1 to nProb0 do for Ax:=1 to 3 do
    begin
      pSs[Ax,Pr].Clear;
      pSs[Ax,Pr].AddXY(TC1[1]+(Twin div 2)-1,H1);
      pSs[Ax,Pr].AddXY(TC2[1]-(Twin div 2),H2);
      pCh[Ax,Pr].LeftAxis.Increment:=dH;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure SGInit;
var
  Pr,Ax: Byte;
begin
  SGOutPalette;

  with Form1 do
  begin
  for Pr:=1 to 2 do for Ax:=1 to 3 do begin Xp[Ax,Pr]:=-5; Yp[Ax,Pr]:=-5; end;
    pCh[1,1]:=@Ch_CS11; pCh[1,2]:=@Ch_CS12;
    pCh[2,1]:=@Ch_CS21; pCh[2,2]:=@Ch_CS22;
    pCh[3,1]:=@Ch_CS31; pCh[3,2]:=@Ch_CS32;

    pIm[1,1]:=@Im_CS11; pIm[1,2]:=@Im_CS12;
    pIm[2,1]:=@Im_CS21; pIm[2,2]:=@Im_CS22;
    pIm[3,1]:=@Im_CS31; pIm[3,2]:=@Im_CS32;
  end;

  __SGStatus;
end;
//------------------------------------------------------------------------------
procedure SGReadPal;
begin
  SGInit;
  SGOutPalette;
  OutSpGramm;
end;
//------------------------------------------------------------------------------
procedure SGOutPalette;
var
  T: TextFile;
  n,x,y,dy,m: Integer;
begin
//  __SGStatus;
  Form1.Lb_SGPalName.Caption:=SGPalName;

  AssignFile(T,ProgDir+'\_Palette\'+SGPalName);
  ReSet(T);
  n:=-1;
  While not EoF(T) do
  begin inc(n); ReadLn(T,SGRGB[n],SGRGB[n],SGRGB[n],SGRGB[n]); end;
  CloseFile(T);
  NSG:=n;
  dy:=300 div NSG;
  m:=NSG div 10;

  for x:=0 to 41 do for y:=0 to 300 do
   Form1.Im_SGColPal.Canvas.Pixels[x,y]:=clWhite;
  for n:=1 to NSG do for y:=(n-1)*dy to n*dy-1 do for x:=0 to 30 do
   Form1.Im_SGColPal.Canvas.Pixels[x,y]:=SGRGB[NSG-n+1];

  for x:=31 to 37 do Form1.Im_SGColPal.Canvas.Pixels[x,299]:=clBlack;
  for n:=0 to NSG do if (n mod m = 0) then
    for x:=31 to 37 do Form1.Im_SGColPal.Canvas.Pixels[x,n*dy]:=clBlack
    else
    for x:=31 to 34 do Form1.Im_SGColPal.Canvas.Pixels[x,n*dy]:=clBlack;

  for n:=1 to NSG do for x:=0 to 40 do for y:=(n-1)*8 to n*8-1 do
  Form1.Im_SGColPal.Height:=dy*NSG;
end;
//------------------------------------------------------------------------------
procedure __OutColScale;
var
  S0: Real;
begin
  with Form1 do
  begin
    if RB_SGScaleRlt.Checked then S0:=1;
    if RB_SGScaleAbs.Checked then S0:=S0max;

    Lb_SGCol00.Caption:='0.00';
    Lb_SGCol01.Caption:=FloatToStrF(S0*0.1,ffFixed,3,2);
    Lb_SGCol02.Caption:=FloatToStrF(S0*0.2,ffFixed,3,2);
    Lb_SGCol03.Caption:=FloatToStrF(S0*0.3,ffFixed,3,2);
    Lb_SGCol04.Caption:=FloatToStrF(S0*0.4,ffFixed,3,2);
    Lb_SGCol05.Caption:=FloatToStrF(S0*0.5,ffFixed,3,2);
    Lb_SGCol06.Caption:=FloatToStrF(S0*0.6,ffFixed,3,2);
    Lb_SGCol07.Caption:=FloatToStrF(S0*0.7,ffFixed,3,2);
    Lb_SGCol08.Caption:=FloatToStrF(S0*0.8,ffFixed,3,2);
    Lb_SGCol09.Caption:=FloatToStrF(S0*0.9,ffFixed,3,2);
    Lb_SGCol10.Caption:=FloatToStrF(S0*1.0,ffFixed,3,2);
  end;
end;
//------------------------------------------------------------------------------
procedure __GetZmax;
var
  Pr,Ax: Byte;
  i,j,M: Integer;
  S: Real;
  bMul: array[1..3,1..2] of ^TLabel;
  pCW: pSingle;
begin
  for Pr:=1 to nProb do if not bCalc[Pr] then for Ax:=1 to nAxis0 do
  begin
    Smin[Ax][Pr]:=+10000;
    Smax[Ax][Pr]:=-10000;
  end;

  with Form1 do
  begin
    bMul[1,1]:=@Lb_MultCS11b; bMul[1,2]:=@Lb_MultCS12b;
    bMul[2,1]:=@Lb_MultCS21b; bMul[2,2]:=@Lb_MultCS22b;
    bMul[3,1]:=@Lb_MultCS31b; bMul[3,2]:=@Lb_MultCS32b;

    for Pr:=1 to nProb do if not bCalc[Pr] then for Ax:=1 to nAxis[Pr] do
     for i:=(Twin div 2) to TC0-(Twin div 2) do for j:=J1 to J2 do
    begin
      pCW:=pCW0[Ax,Pr][i]; inc(pCW,j);
      S:=pCW^;
      if RB_bRemvl.Checked then S:=sqrt(S/(2*Pi));
      if RB_bLog10.Checked then if S>1E-9 then S:=10*Log10(S) else S:=-90;
      if S<Smin[Ax][Pr] then Smin[Ax][Pr]:=S;
      if S>Smax[Ax][Pr] then Smax[Ax][Pr]:=S;
    end;

    S0min:=Smin[1][1];
    S0max:=Smax[1][1];
    for Pr:=1 to nProb do for Ax:=1 to nAxis[Pr] do
    begin
      if S0min>Smin[Ax][Pr] then S0min:=Smin[Ax][Pr];
      if S0max<Smax[Ax][Pr] then S0max:=Smax[Ax][Pr];
    end;

    if RB_SGScaleAbs.Checked then for Pr:=1 to nProb do for Ax:=1 to nAxis[Pr] do
    begin
      Smin[Ax][Pr]:=S0min;
      Smax[Ax][Pr]:=S0max;
    end;

    for Pr:=1 to nProb do if not bCalc[Pr] then for Ax:=1 to nAxis[Pr] do
    begin
      M:=_fExp(Smax[Ax][Pr]);
      MultCS[Ax][Pr]:=IntPower(10,M);
      bMul[Ax,Pr].Caption:=FloatToStr(M);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure __OutSpGramm(Pr,Ax: Byte);
var
  n,i,j,Ix,Iy,Im_W,Im_H: Integer;
  Rx,Ry,z11,z21,z12,z22,z1,z2,z: Real;
  pCW,pW: pSingle;
begin
  __SGStatus;

  with Form1 do
  begin
    for i:=(Twin div 2) to TC0-(Twin div 2) do for j:=J1 to J2 do
    begin
      pCW:=pCW0[Ax,Pr][i]; inc(pCW,j);
      pW:=pW0[i]; inc(pW,j);
      pW^:=pCW^;
      if RB_bRemvl.Checked then pW^:=sqrt(pW^/(2*Pi));
      if RB_bLog10.Checked then if pW^>1E-9 then pW^:=10*Log10(pW^) else pW^:=-90;
    end;

    Im_W:=pIm[1,1].Width;
    Im_H:=pIm[1,1].Height;

    for i:=0 to Im_W do for j:=0 to Im_H do
    begin
      Rx:=i/Im_W*(TC0-1-Twin)+(1+(Twin div 2));
      Ry:=((1-j/Im_H)*(H2-H1)+H1)/dFr;

      z:=0;

      if bDiscrSpG then
      begin
        Ix:=Round(Rx);
        Iy:=Round(Ry);
        pW:=pW0[Ix]; inc(pW,Iy);
        z:=pW^/Smax[Ax,Pr];
      end;

      if bSmoothSpG then
      begin
        Ix:=Trunc(Rx);
        Iy:=Trunc(Ry);
        pW:=pW0[Ix]; inc(pW,Iy);     z11:=pW^;
        pW:=pW0[Ix]; inc(pW,Iy+1);   z12:=pW^;
        pW:=pW0[Ix+1]; inc(pW,Iy);   z21:=pW^;
        pW:=pW0[Ix+1]; inc(pW,Iy+1); z22:=pW^;
        z1:=(z12-z11)*(Ry-Iy)+z11;
        z2:=(z22-z21)*(Ry-Iy)+z21;
        z:=((z2-z1)*(Rx-Ix)+z1-Smin[Ax,Pr])/(Smax[Ax,Pr]-Smin[Ax,Pr]);
      end;

      n:=Round(z*NSG);
      if n>NSG then n:=NSG;
      if n<1 then n:=1;
      pIm[Ax,Pr].Canvas.Pixels[i,j]:=SGRGB[n];
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure OutSpGramm;
var
  Pr,Ax: Byte;
begin
  if not bProb[1] then Exit;

  with Form1 do
  begin
    dFr:=1/Twin;
    J1:=Round(H1/dFr);
    J2:=Round(H2/dFr);
    __GetZmax;

    for Pr:=1 to nProb do if (bProb[Pr] and (not bCalc[Pr])) then
     for Ax:=1 to nAxis0 do pIm[Ax,Pr].Visible:=FALSE;

    for Pr:=1 to nProb do if (bProb[Pr] and (not bCalc[Pr])) then
     for Ax:=1 to nAxis[Pr] do
    begin
      Xp[Ax,Pr]:=-5; Yp[Ax,Pr]:=-5;

      Ed_Status.Text:=' Проба '+IntToStr(Pr)+', Ось '+IntToStr(Ax)+': Спектрограмма';
      Ed_Status.Update;
      pIm[Ax,Pr].Visible:=TRUE;
      __OutSpGramm(Pr,Ax);
      pCh[Ax,Pr].Update;
    end;

    __SGStatus;
    __OutColScale;
    Ed_Status.Text:='';
    Ed_Status.Update;
  end;
end;
//------------------------------------------------------------------------------
procedure OutSGMar(Send: TObject; X,Y: Integer);
var
  p,Pr,a,Ax: Byte;
  i,W,H,dX,dY,MarX: Integer;
  MarY,TAF: Real;
  pCW: pSingle;
begin
  for p:=1 to 2 do for a:=1 to 3 do if Send=pIm[a,p]^ then begin Pr:=p; Ax:=a; end;
  if nAxis[Pr]<Ax then Exit;

  with Form1 do
  begin
    W:=pIm[1,1].Width;
    H:=pIm[1,1].Height;
    MarX:=Round((X+1)/(W)*(TC0-Twin)+(Twin div 2)-0.5);
    MarY:=Round(((1-Y/H)*(H2-H1)+H1)/dFr)*dFr;

    X:=Round((MarX-Twin div 2)/(TC0-Twin)*(W)-1);
    dX:=Round(W/(TC0-Twin));
    Y:=Round(H-H*(MarY-H1)/(H2-H1));
    dY:=Round(H/((H2-H1)/dFr)/2);

    pIm[Ax,Pr].Canvas.Pen.Mode:=pmNotXor;

    pIm[Ax,Pr].Canvas.MoveTo(Xp[Ax,Pr],Yp[Ax,Pr]-dY);
    pIm[Ax,Pr].Canvas.LineTo(Xp[Ax,Pr]+dX,Yp[Ax,Pr]-dY);
    if dY>0 then
    begin
      pIm[Ax,Pr].Canvas.LineTo(Xp[Ax,Pr]+dX,Yp[Ax,Pr]+dY);
      pIm[Ax,Pr].Canvas.LineTo(Xp[Ax,Pr],Yp[Ax,Pr]+dY);
      pIm[Ax,Pr].Canvas.LineTo(Xp[Ax,Pr],Yp[Ax,Pr]-dY);
    end;
    Xp[Ax,Pr]:=X;
    Yp[Ax,Pr]:=Y;

    pIm[Ax,Pr].Canvas.MoveTo(X,Y-dY);
    pIm[Ax,Pr].Canvas.LineTo(X+dX,Y-dY);
    if dY>0 then
    begin
      pIm[Ax,Pr].Canvas.LineTo(X+dX,Y+dY);
      pIm[Ax,Pr].Canvas.LineTo(X,Y+dY);
      pIm[Ax,Pr].Canvas.LineTo(X,Y-dY);
    end;

    pIm[Ax,Pr].Canvas.Pen.Mode:=pmCopy;

    pCW:=pCW0[Ax,Pr][MarX]; inc(pCW,Round(MarY/dFr));
    TAF:=pCW^;
    if RB_bRemvl.Checked then TAF:=sqrt(TAF/(2*Pi));
    if RB_bLog10.Checked then if TAF>1E-9 then TAF:=10*Log10(TAF) else TAF:=-90;

    pCh[Ax,Pr].BottomAxis.Title.Caption:=
     IntToStr(MarX+tProcStart[Pr])+'       Время, сек';
    pCh[Ax,Pr].LeftAxis.Title.Caption:=
     'Частота, Гц     '+FloatToStrF(MarY,ffFixed,4,4);
    pCh[Ax,Pr].Title.Text[0]:='      '+FloatToStrF(TAF/MultCS[Ax,Pr],ffFixed,6,4)+
     '    '+Trim(sAT1[Ax])+' '+Trim(sAT2[Ax]);
  end;
end;
//==============================================================================

end.
