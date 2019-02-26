unit Morlet;

interface
uses SysUtils, Math, Graphics, ExtCtrls, Chart, StdCtrls;

procedure GetMorlet;
procedure OutMorlet;
procedure MorletOutScale;
procedure SetCMm(Send: TObject; X,Y: Integer);

var
  T_Morlet,H_Morlet: array[1..1000] of Single;
  T0_Morlet,H0_Morlet: Word;
  Mmax: array[1..3,1..2] of Real;
  Mmin: array[1..3,1..2] of Real;

implementation
uses
  Main, Common, WaveLet;

var
  MMax0,Mmin0,M1,M2: Real;
  bMar: array[1..3,1..2] of Boolean;
  Xold,Yold: array[1..3,1..2] of Integer;
  MultCM: array[1..3,1..2] of Real;
  pCh: array[1..3,1..2] of ^TChart;
  pIm: array[1..3,1..2] of ^TImage;
  pLb: array[1..3,1..2] of ^TLabel;
  X0,Y0: Integer;

//==============================================================================
procedure MorletOutScale;
var
  M0: Real;
begin
  with Form1 do
  begin
    if RB_WLScaleRlt.Checked then M0:=1;
    if RB_WLScaleAbs.Checked then M0:=Mmax0;

    Lb_WLCol00.Caption:=FloatToStrF(M0*0.0,ffFixed,3,2);
    Lb_WLCol01.Caption:=FloatToStrF(M0*0.1,ffFixed,3,2);
    Lb_WLCol02.Caption:=FloatToStrF(M0*0.2,ffFixed,3,2);
    Lb_WLCol03.Caption:=FloatToStrF(M0*0.3,ffFixed,3,2);
    Lb_WLCol04.Caption:=FloatToStrF(M0*0.4,ffFixed,3,2);
    Lb_WLCol05.Caption:=FloatToStrF(M0*0.5,ffFixed,3,2);
    Lb_WLCol06.Caption:=FloatToStrF(M0*0.6,ffFixed,3,2);
    Lb_WLCol07.Caption:=FloatToStrF(M0*0.7,ffFixed,3,2);
    Lb_WLCol08.Caption:=FloatToStrF(M0*0.8,ffFixed,3,2);
    Lb_WLCol09.Caption:=FloatToStrF(M0*0.9,ffFixed,3,2);
    Lb_WLCol10.Caption:=FloatToStrF(M0*1.0,ffFixed,3,2);
  end;
end;
//------------------------------------------------------------------------------
procedure GetMorlet;
var
  Ax,Pr: Byte;
  i,j,k,K1,K2: Integer;
  Re,Im,a,b,x,dx,F,G: Real;
  H,dH,b1,b2,db: Real;
  pY,pCM: pSingle;
begin
 if not bProb[1] then Exit;

  with Form1 do
  begin
    pCh[1,1]:=@Ch_CL11;   pIm[1,1]:=@Im_CL11;   pLb[1,1]:=@Lb_MultCL11b;
    pCh[2,1]:=@Ch_CL21;   pIm[2,1]:=@Im_CL21;   pLb[2,1]:=@Lb_MultCL21b;
    pCh[3,1]:=@Ch_CL31;   pIm[3,1]:=@Im_CL31;   pLb[3,1]:=@Lb_MultCL31b;
    pCh[1,2]:=@Ch_CL12;   pIm[1,2]:=@Im_CL12;   pLb[1,2]:=@Lb_MultCL12b;
    pCh[2,2]:=@Ch_CL22;   pIm[2,2]:=@Im_CL22;   pLb[2,2]:=@Lb_MultCL22b;
    pCh[3,2]:=@Ch_CL32;   pIm[3,2]:=@Im_CL32;   pLb[3,2]:=@Lb_MultCL32b;

    a:=TC0;
    Hm1:=Kmor/(2*Pi*a);
    if H1>Hm1 then Hm1:=H1;
    Hm2:=H2;

    X0:=pIm[1,1].Width;
    Y0:=pIm[1,1].Height;
    NCM0:=X0;
    NCM1:=Y0;

    dH:=(Hm2-Hm1)/Y0;
    b1:=0;
    b2:=TC0;
    db:=(b2-b1)/X0;

    dx:=dT;
    for Pr:=1 to nProb do if (bProb[Pr] and (not bCalc[Pr])) then
     for Ax:=1 to nAxis[Pr] do
    begin
      for k:=0 to NCM0 do if (pCM0[Ax,Pr,k]=nil) then
       GetMem(pCM0[Ax,Pr,k],(NCM1+1)*cSS);

      Center(1,NCY0,pCY0[Ax,Pr],pY0);

      Mmax[Ax,Pr]:=-10000;
      Mmin[Ax,Pr]:= 10000;
      H:=Hm1;

      for j:=Y0 downto 1 do
      begin
        Ed_Status.Text:=' Проба '+IntToStr(Pr)+' Ось '+IntToStr(Ax)+
         ': Морле-анализ '+IntToStr(j);
        Ed_Status.Update;

        b:=b1;
        for i:=1 to X0 do
        begin
          Re:=0;
          Im:=0;
          a:=Kmor/(2*Pi*H);
          K1:=Round((b-4*a)/dx); if K1<1   then K1:=1;
          K2:=Round((b+4*a)/dx); if K2>NCY0 then K2:=NCY0;
          for k:=K1 to K2 do
          begin
            x:=k*dx;
            F:=exp(-sqr((x-b)/a)/2);
            G:=Kmor*(x-b)/a;
            pY:=pY0; inc(pY,k);
            Re:=Re+F*cos(G)*pY^*dx;
            Im:=Im+F*sin(G)*pY^*dx;
          end;
          pCM:=pCM0[Ax,Pr][i]; inc(pCM,j);
          pCM^:=(Re*Re+Im*Im)/sqr(1.25);
          if bCorrectMor then pCM^:=pCM^/(a*a);

          if pCM^>Mmax[Ax,Pr] then Mmax[Ax,Pr]:=pCM^;
          if pCM^<Mmin[Ax,Pr] then Mmin[Ax,Pr]:=pCM^;

          if (Pr=1)and(Ax=1)and(j=1) then T_Morlet[i]:=b;
          b:=b+db;
        end;
        if (Pr=1)and(Ax=1) then H_Morlet[j]:=H;
        H:=H+dH;
      end;
    end;
    T0_Morlet:=X0;
    H0_Morlet:=Y0;

    Mmax0:=Mmax[1,1];
    for Pr:=1 to nProb do for Ax:=1 to nAxis[Pr] do
     if Mmax[Ax,Pr]>Mmax0 then Mmax0:=Mmax[Ax,Pr];

    Mmin0:=Mmin[1,1];
    for Pr:=1 to nProb do for Ax:=1 to nAxis[Pr] do
     if Mmin[Ax,Pr]<Mmin0 then Mmin0:=Mmin[Ax,Pr];

    OutMorlet;
  end;
end;
//------------------------------------------------------------------------------
procedure OutMorlet;
var
  Ax,Pr: Byte;
  i,j,n,M: Integer;
  Z: Real;
  pCM: pSingle;
begin
  if (not bProb[1])and(not bProb[2]) then Exit;

  with Form1 do
  begin
    WLStatus;

    for Pr:=1 to nProb do if bProb[Pr] and not bCalc[Pr] then for Ax:=1 to nAxis0 do
     pIm[Ax,Pr].Visible:=FALSE;

    for Pr:=1 to nProb do if not bCalc[Pr] then for Ax:=1 to nAxis[Pr] do
    begin
      Xold[Ax,Pr]:=-5; Yold[Ax,Pr]:=-5;

      if RB_WLScaleAbs.Checked then begin M1:=Mmin0; M2:=Mmax0; end
      else begin M1:=Mmin[Ax,Pr]; M2:=Mmax[Ax,Pr]; end;

      if RB_bLog10.Checked then
      begin
        if M1>1E-9 then M1:=10*Log10(M1) else M1:=-90;
        M2:=10*Log10(M2);
      end;

      if RB_bLog10.Checked then M:=_fExp(M1) else M:=_fExp(M2);
      MultCM[Ax][Pr]:=IntPower(10,M);
      pLb[Ax,Pr].Caption:=FloatToStr(M);

      pIm[Ax,Pr].Visible:=TRUE;

      for j:=Y0 downto 1 do for i:=0 to X0 do
      begin
        pCM:=pCM0[Ax,Pr,i]; inc(pCM,j); Z:=pCM^;

        if RB_bPower.Checked then Z:=Z/M2;
        if RB_bRemvl.Checked then Z:=sqrt(Z/M2);
        if RB_bLog10.Checked then
        begin
          if Z>1E-9 then Z:=10*Log10(Z) else Z:=-90;
          Z:=(Z-M1)/(M2-M1);
        end;

        n:=Round(Z*NWL);
        if n>NWL then n:=NWL;
        if n<0 then n:=0;
        pIm[Ax,Pr].Canvas.Pixels[i,j]:=WLRGB[n];
      end;
      pCh[Ax,Pr].Update;
    end;
    MorletOutScale;
    Ed_Status.Text:='';
    Ed_Status.Update;
  end;
end;
//------------------------------------------------------------------------------
procedure SetCMm(Send: TObject; X,Y: Integer);
var
  p,Pr,a,Ax: Integer;
  H,dH,b,Z: Real;
  StB,StT: String;
  pCM: pSingle;
begin
  for p:=1 to 2 do for a:=1 to 3 do if Send=pIm[a,p]^ then begin Pr:=p; Ax:=a; end;
  if nAxis[Pr]<Ax then Exit;

  with Form1 do
  begin
    pIm[Ax,Pr].Canvas.Pen.Mode:=pmNotXor;

    pIm[Ax,Pr].Canvas.MoveTo(Xold[Ax,Pr]-5,Yold[Ax,Pr]);
    pIm[Ax,Pr].Canvas.LineTo(Xold[Ax,Pr]+5,Yold[Ax,Pr]);
    pIm[Ax,Pr].Canvas.MoveTo(Xold[Ax,Pr],Yold[Ax,Pr]-5);
    pIm[Ax,Pr].Canvas.LineTo(Xold[Ax,Pr],Yold[Ax,Pr]+5);
    Xold[Ax][Pr]:=X;
    Yold[Ax][Pr]:=Y;

    pIm[Ax,Pr].Canvas.MoveTo(X-5,Y);
    pIm[Ax,Pr].Canvas.LineTo(X+5,Y);
    pIm[Ax,Pr].Canvas.MoveTo(X,Y-5);
    pIm[Ax,Pr].Canvas.LineTo(X,Y+5);

    pIm[Ax,Pr].Canvas.Pen.Mode:=pmCopy;

    dH:=(Hm2-Hm1)/Y0;
    H:=Hm1+dH*(Y0-Y);
    b:=TC0/X0*X;

    pCM:=pCM0[Ax,Pr,Y];
    inc(pCM,X);
    Z:=pCM^;

    if RB_bRemvl.Checked then Z:=sqrt(Z);
    if RB_bLog10.Checked then if Z>1E-9 then Z:=10*Log10(Z) else Z:=-90;

    if bWLAxisXN then StB:=IntToStr(Round((b+TC1[Pr]-1)/dT+1))+'       Отсчет';
    if bWLAxisXT then StB:=FloatToStrF((b+TC1[Pr]-1),ffFixed,5,1)+'      Время, сек';

    pCh[Ax,Pr].Title.Text[0]:='      '+FloatToStrF(Z/MultCM[Ax][Pr],ffFixed,5,3)+
     '   '+Trim(sAT1[Ax])+' '+Trim(sAT2[Ax]);
    pCh[Ax,Pr].LeftAxis.Title.Caption:=
     'Частота, Гц     '+FloatToStrF(H,ffFixed,4,4);
    pCh[Ax,Pr].BottomAxis.Title.Caption:=StB;
  end;
end;
//==============================================================================

end.
