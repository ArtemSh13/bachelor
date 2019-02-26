unit WaveLet;

interface
uses Math, SysUtils, QGraphics, ExtCtrls, Chart, Types, Graphics, StdCtrls, Common;

procedure _pCL_Win;
procedure WLInit;
procedure WLStatus;
procedure ReadMotherWL;
procedure WLOutPalette;
procedure WLOutScale;
function Power2(n: Integer): Integer;
procedure GetDaubech;
procedure WLCheck;
procedure __GetWLZmax;
procedure __OutDaubech(Pr,Ax: Integer);
procedure OutDaubech;
procedure SetCLm(Send:TObject; X,Y:Integer);
procedure OutDaubechXY;

var
  Lmin,Lmax: array[1..3,1..2] of Real;
  L0min,L0max: Real;
  NWL: Integer;
  WLRGB: array[0..100] of LongInt;
  Hm1,Hm2: Real;
  
implementation
uses
  Main, SpectroGramm;

var
  Lev0,Lev1,Lev2: Integer;
  Xp,dXp,Yp,dYp: array [1..3,1..2] of Integer;
  Freq: array[0..15] of Real;
  H,G: array[0..7] of Real;
  bWL1Calc,bWL2Calc: Boolean;
  MultCL: array[1..3,1..2] of Real;
  pCh: array[1..3,1..2] of ^TChart;
  pIm: array[1..3,1..2] of ^TImage;

//==============================================================================
procedure _pCL_Win;
const
  dH=2;
  dW=2;
var
  Pr,Ax: Byte;
  TS_H,TS_W: Integer;
  H,W: Integer;
begin
  with Form1 do
  begin
    TS_H:=TS_CL.ClientHeight;
    TS_W:=GB_SpectrumType.Left-10;

    H:=(TS_H-dH*(nAxis0+1)) div nAxis0;
    W:=(TS_W-dW*(nProb0+1)) div nProb0;

    for Pr:=1 to 2 do for Ax:=1 to 3 do pCh[Ax,Pr].Visible:=FALSE;

    for Pr:=1 to nProb0 do for Ax:=1 to nAxis0 do
    begin
      pCh[Ax,Pr].Height:=H;  pCh[Ax,Pr].Top:= dH+(H+dH)*(Ax-1);
      pCh[Ax,Pr].Width :=W;  pCh[Ax,Pr].Left:=dW+(W+dW)*(Pr-1);
      pCh[Ax,Pr].Visible:=TRUE;
      pIm[Ax,Pr].Width:=
       (pCh[Ax,Pr].BottomAxis.IEndPos-pCh[Ax,Pr].BottomAxis.IStartPos+1);
      pIm[Ax,Pr].Height:=
       (Ch_CS11.LeftAxis.IEndPos-Ch_CS11.LeftAxis.IStartPos+1);
    end;

    PageC.ActivePageIndex:=5;
    TS_CL.Update;
    PageC.ActivePageIndex:=0;
  end;
end;
//------------------------------------------------------------------------------
procedure WLInit;
var
  Pr,Ax: Byte;
begin
  for Pr:=1 to 2 do for Ax:=1 to 3 do
  begin Xp[Ax,Pr]:=-5; dXp[Ax,Pr]:=0; Yp[Ax,Pr]:=-5; dYp[Ax,Pr]:=0; end;

  with Form1 do
  begin
    pCh[1,1]:=@Ch_CL11; pCh[1,2]:=@Ch_CL12;
    pCh[2,1]:=@Ch_CL21; pCh[2,2]:=@Ch_CL22;
    pCh[3,1]:=@Ch_CL31; pCh[3,2]:=@Ch_CL32;

    pIm[1,1]:=@Im_CL11; pIm[1,2]:=@Im_CL12;
    pIm[2,1]:=@Im_CL21; pIm[2,2]:=@Im_CL22;
    pIm[3,1]:=@Im_CL31; pIm[3,2]:=@Im_CL32;
  end;

  Lev0:=0;
  bWL1Calc:=FALSE;
  bWL2Calc:=FALSE;
  ReadMotherWL;
  WLOutPalette;
  WLOutScale;
  WLStatus;
end;
//------------------------------------------------------------------------------
procedure WLStatus;
var
  P1,P2,Lev: Integer;
  dH: Real;
  TTitle,BTitle: String;
begin
  with Form1 do
  begin
    if bMorlet then
    begin
      if H2-H1> 10.0 then dH:=5.0;
      if H2-H1<=10.0 then dH:=2.0;
      if H2-H1<= 5.0 then dH:=1.0;
      if H2-H1<= 2.0 then dH:=0.5;
      if H2-H1<= 1.0 then dH:=0.2;
      if H2-H1<= 0.5 then dH:=0.1;

      if bProb[1] then
      begin
        P1:=TC1[1]-1; P2:=TC2[1];
        if bWLAxisXN then begin P1:=Round(P1/dT+1); P1:=Round(P2/dT); end;

        Ss_CL11.Clear; Ss_CL11.AddXY(P1,Hm1); Ss_CL11.AddXY(P2,Hm2);
        Ch_CL11.LeftAxis.Increment:=dH;

        Ss_CL21.Clear; Ss_CL21.AddXY(P1,Hm1); Ss_CL21.AddXY(P2,Hm2);
        Ch_CL21.LeftAxis.Increment:=dH;

        Ss_CL31.Clear; Ss_CL31.AddXY(P1,Hm1); Ss_CL31.AddXY(P2,Hm2);
        Ch_CL31.LeftAxis.Increment:=dH;
      end;

      if bProb[2] then
      begin
        P1:=TC1[2]-1; P2:=TC2[2];
        if bWLAxisXN then begin P1:=Round(P1/dT+1); P1:=Round(P2/dT); end;

        Ss_CL12.Clear; Ss_CL12.AddXY(P1,Hm1); Ss_CL12.AddXY(P2,Hm2);
        Ch_CL12.LeftAxis.Increment:=dH;

        Ss_CL22.Clear; Ss_CL22.AddXY(P1,Hm1); Ss_CL22.AddXY(P2,Hm2);
        Ch_CL22.LeftAxis.Increment:=dH;

        Ss_CL32.Clear; Ss_CL32.AddXY(P1,Hm1); Ss_CL32.AddXY(P2,Hm2);
        Ch_CL32.LeftAxis.Increment:=dH;
      end;
      Ch_CL11.LeftAxis.Title.Caption:='�������, ��';
      Ch_CL21.LeftAxis.Title.Caption:='�������, ��';
      Ch_CL31.LeftAxis.Title.Caption:='�������, ��';
      Ch_CL12.LeftAxis.Title.Caption:='�������, ��';
      Ch_CL22.LeftAxis.Title.Caption:='�������, ��';
      Ch_CL32.LeftAxis.Title.Caption:='�������, ��';
    end;

    if not bMorlet then
    begin
      Ed_DaubechLevel2.Visible:=RB_bWLDiagr.Checked;
      UD_DaubechLevel2.Visible:=RB_bWLDiagr.Checked;
      Lb_DaubechLevel2.Visible:=RB_bWLDiagr.Checked;
      if Lev0>0 then UD_DaubechLevel2.Max:=Lev0;

      Ed_DaubechLevel1.Visible:=RB_bWLDiagr.Checked;
      UD_DaubechLevel1.Visible:=RB_bWLDiagr.Checked;
      Lb_DaubechLevel1.Visible:=RB_bWLDiagr.Checked;
      if Lev0>0 then UD_DaubechLevel1.Max:=Lev0;

      Ed_DaubechLevel.Visible:=RB_bWLGraph.Checked;
      UD_DaubechLevel.Visible:=RB_bWLGraph.Checked;
      if Lev0>0 then UD_DaubechLevel.Max:=Lev0+1;

      Lev1:=UD_DaubechLevel1.Position;
      Lev2:=UD_DaubechLevel2.Position;

      if bProb[1] then
      begin
        P1:=NCY1[1]-1; P2:=P1+Power2(Lev0)-1;
        if bWLAxisXT then begin P1:=Round(P1*dT); P2:=Round(P2*dT); end;

        Ss_CL11.Clear; Ss_CL11.AddXY(P1,Lev1); Ss_CL11.AddXY(P2,Lev2+1);
        Ch_CL11.LeftAxis.Title.Caption:='�������';
        Ss_CL21.Clear; Ss_CL21.AddXY(P1,Lev1); Ss_CL21.AddXY(P2,Lev2+1);
        Ch_CL21.LeftAxis.Title.Caption:='�������';
        Ss_CL31.Clear; Ss_CL31.AddXY(P1,Lev1); Ss_CL31.AddXY(P2,Lev2+1);
        Ch_CL31.LeftAxis.Title.Caption:='�������';
      end;
      if bProb[2] then
      begin
        P1:=NCY1[2]-1; P2:=P1+Power2(Lev0)-1;
        if bWLAxisXT then begin P1:=Round(P1*dT); P2:=Round(P2*dT); end;
        Ss_CL12.Clear; Ss_CL12.AddXY(P1,Lev1); Ss_CL12.AddXY(P2,Lev2+1);
        Ch_CL12.LeftAxis.Title.Caption:='�������';
        Ss_CL22.Clear; Ss_CL22.AddXY(P1,Lev1); Ss_CL22.AddXY(P2,Lev2+1);
        Ch_CL22.LeftAxis.Title.Caption:='�������';
        Ss_CL32.Clear; Ss_CL32.AddXY(P1,Lev1); Ss_CL32.AddXY(P2,Lev2+1);
        Ch_CL32.LeftAxis.Title.Caption:='�������';
      end;
    end;

    if bWLAxisXT then BTitle:='�����, ���';
    if bWLAxisXN then BTitle:='������';

    Ch_CL1g.Visible:=(not bMorlet) and RB_bWLGraph.Checked and (nAxis0>=1);
    Ch_CL2g.Visible:=(not bMorlet) and RB_bWLGraph.Checked and (nAxis0>=2);
    Ch_CL3g.Visible:=(not bMorlet) and RB_bWLGraph.Checked and (nAxis0>=3);

    Ch_CL11.BottomAxis.Title.Caption:=BTitle;
    Ch_CL21.BottomAxis.Title.Caption:=BTitle;
    Ch_CL31.BottomAxis.Title.Caption:=BTitle;
    Ch_CL12.BottomAxis.Title.Caption:=BTitle;
    Ch_CL22.BottomAxis.Title.Caption:=BTitle;
    Ch_CL32.BottomAxis.Title.Caption:=BTitle;

    Lev:=Form1.UD_DaubechLevel.Position;
    TTitle:=FloatToStrF(Freq[Lev],ffFixed,4,4)+' - '+
     FloatToStrF(Freq[Lev+1],ffFixed,4,4)+' ��';
    Ch_CL1g.Title.Text[0]:=TTitle;
    Ch_CL2g.Title.Text[0]:=TTitle;
    Ch_CL3g.Title.Text[0]:=TTitle;
  end;
end;
//------------------------------------------------------------------------------
procedure ReadMotherWL;
var
  T: TextFile;
  n: Integer;
begin
  AssignFile(T,ProgDir+'\_MotherWL.ini');
  ReSet(T);

  if bWLdb2 then for n:=0 to 3 do
    ReadLn(T,H[n],G[n]);

  if bWLdb3 then for n:=0 to 5 do
  begin
    Read(T,H[n],H[n]);
    ReadLn(T,H[n],G[n]);
  end;

  if bWLdb4 then for n:=0 to 7 do
  begin
    Read(T,H[n],H[n]);
    Read(T,H[n],H[n]);
    ReadLn(T,H[n],G[n]);
  end;
  CloseFile(T);
end;
//------------------------------------------------------------------------------
procedure WLOutPalette;
var
  T: TextFile;
  n,x,y,dy,m: Integer;
begin
  WLStatus;
  Form1.Lb_WLPalName.Caption:=WLPalName;

  AssignFile(T,ProgDir+'\_Palette\'+WLPalName);
  ReSet(T);
  n:=-1;
  While not EoF(T) do
  begin inc(n); ReadLn(T,WLRGB[n],WLRGB[n],WLRGB[n],WLRGB[n]); end;
  CloseFile(T);
  NWL:=n;
  dy:=300 div NWL;
  m:=NWL div 10;

  for x:=0 to 41 do for y:=0 to 300 do
   Form1.Im_WLColPal.Canvas.Pixels[x,y]:=clWhite;
  for n:=1 to NWL do for y:=(n-1)*dy to n*dy-1 do for x:=0 to 30 do
   Form1.Im_WLColPal.Canvas.Pixels[x,y]:=WLRGB[NWL-n+1];

  for x:=31 to 37 do Form1.Im_WLColPal.Canvas.Pixels[x,299]:=clBlack;
  for n:=0 to NWL do if (n mod m = 0) then
    for x:=31 to 37 do Form1.Im_WLColPal.Canvas.Pixels[x,n*dy]:=clBlack
    else
    for x:=31 to 34 do Form1.Im_WLColPal.Canvas.Pixels[x,n*dy]:=clBlack;

  for n:=1 to NWL do for x:=0 to 40 do for y:=(n-1)*8 to n*8-1 do
  Form1.Im_WLColPal.Height:=dy*NWL;
end;
//------------------------------------------------------------------------------
procedure WLOutScale;
var
  L0: Real;
begin
  with Form1 do
  begin
    if RB_WLScaleRlt.Checked then L0:=1;
    if RB_WLScaleAbs.Checked then L0:=L0max-L0min;

    Lb_WLCol00.Caption:=FloatToStrF(L0*0.0+L0min,ffFixed,3,2);
    Lb_WLCol01.Caption:=FloatToStrF(L0*0.1+L0min,ffFixed,3,2);
    Lb_WLCol02.Caption:=FloatToStrF(L0*0.2+L0min,ffFixed,3,2);
    Lb_WLCol03.Caption:=FloatToStrF(L0*0.3+L0min,ffFixed,3,2);
    Lb_WLCol04.Caption:=FloatToStrF(L0*0.4+L0min,ffFixed,3,2);
    Lb_WLCol05.Caption:=FloatToStrF(L0*0.5+L0min,ffFixed,3,2);
    Lb_WLCol06.Caption:=FloatToStrF(L0*0.6+L0min,ffFixed,3,2);
    Lb_WLCol07.Caption:=FloatToStrF(L0*0.7+L0min,ffFixed,3,2);
    Lb_WLCol08.Caption:=FloatToStrF(L0*0.8+L0min,ffFixed,3,2);
    Lb_WLCol09.Caption:=FloatToStrF(L0*0.9+L0min,ffFixed,3,2);
    Lb_WLCol10.Caption:=FloatToStrF(L0*1.0+L0min,ffFixed,3,2);
  end;
end;
//------------------------------------------------------------------------------
function Power2(n: Integer): Integer;
var
  R,k: Integer;
begin
 R:=1;
  for k:=1 to n do R:=R*2;
  Power2:=R;
end;
//------------------------------------------------------------------------------
procedure GetDaubech;
var
  i,j,J0,n,Lev,P2,P22,Ax: Integer;
  pCY,pY,pCL,pCL1: pSingle;
begin
  J0:=3;
  if bWLdb3 then J0:=5;
  if bWLdb4 then J0:=7;

  if bProb[1] and not bCalc[1] then
  begin
    Lev0:=2;
    While Power2(Lev0)<=NCY0 do inc(Lev0);
    Lev0:=Lev0-1;
    NCL0:=Lev0;
    NCL1:=Power2(Lev0);
    WLStatus;

    Freq[Lev0+1]:=1/dT/2;
    for lev:=Lev0 downto 1 do Freq[Lev]:=Freq[Lev+1]/2;
    Freq[0]:=0;

    P2:=Power2(Lev0);
    for Ax:=1 to nAxis[1] do
    begin
      for Lev:=0 to NCL0 do if (pCL0[Ax,1,Lev]=nil) then
       GetMem(pCL0[Ax,1,Lev],(NCL1+1)*cSS);

      for i:=1 to P2 do
      begin
        pCY:=pCY0[Ax,1]; inc(pCY,i+NCY1[1]-1);
        pY:=pY0; inc(pY,i);
        pY^:=pCY^;
      end;
      Center(1,P2,pY0,pY0);
      Filter(1,P2,pY0);
      for i:=0 to P2-1 do
      begin
        pY:=pY0; inc(pY,i+1);
        pCL:=pCL0[Ax,1][Lev0]; inc(pCL,i);
        pCL^:=pY^;
      end;
    end;
    for Lev:=Lev0-1 downto 0 do
    begin
      P2:=Power2(Lev);
      P22:=2*P2;
      for Ax:=1 to nAxis[1] do
      begin
        Form1.Ed_Status.Text:=' ����� 1, ��� '+IntToStr(Ax)+': �������-������';
        Form1.Ed_Status.Update;
        for i:=0 to P22-1 do
        begin
          pCL:=pCL0[Ax,1][Lev]; inc(pCL,i); pCL^:=0;
        end;
        for i:=0 to P2-1 do
        begin
          for j:=0 to J0 do
          begin
            n:=(2*i+j);
            if n>=P22 then n:=n-P22;
            pCL1:=pCL0[Ax,1][Lev+1]; inc(pCL1,n);
            pCL:=pCL0[Ax,1][Lev]; inc(pCL,i);    pCL^:=pCL^+pCL1^*H[j];
            pCL:=pCL0[Ax,1][Lev]; inc(pCL,i+P2); pCL^:=pCL^+pCL1^*G[j];
          end;
        end;
      end;
    end;
  end;

  if bProb[2] and not bCalc[2] then
  begin
    Form1.Ed_Status.Text:=' ����� �2: �������-������';
    Form1.Ed_Status.Update;
    P2:=Power2(Lev0);
    for Ax:=1 to nAxis[2] do
    begin
      for i:=1 to P2 do
      begin
        for Lev:=0 to NCL0 do if (pCL0[Ax,2,Lev]=nil) then
         GetMem(pCL0[Ax,2,Lev],(NCL1+1)*cSS);

        pCY:=pCY0[Ax,2]; inc(pCY,i+NCY1[2]-1);
        pY:=pY0; inc(pY0,i);
        pY^:=pCY^;
      end;
      Center(1,P2,pY0,pY0);
      Filter(1,P2,pY0);
      for i:=0 to P2-1 do
      begin
        pY:=pY0; inc(pY0,i+1);
        pCL:=pCL0[Ax,2][Lev0]; inc(pCL,i);
        pCL^:=pY^;
      end;
    end;

    for Lev:=Lev0-1 downto 0 do
    begin
      P2:=Power2(Lev);
      P22:=2*P2;
      for Ax:=1 to nAxis[2] do
      begin
        Form1.Ed_Status.Text:=' ����� 2, ��� '+IntToStr(Ax)+': �������-������';
        Form1.Ed_Status.Update;
        for i:=0 to P22-1 do
        begin pCL:=pCL0[Ax,2][Lev]; inc(pCL,i); pCL^:=0; end;
        for i:=0 to P2-1 do
        begin
          for j:=0 to J0 do
          begin
            n:=(2*i+j);
            if n>=P22 then n:=n-P22;
            pCL1:=pCL0[Ax,2][Lev+1]; inc(pCL1,n);
            pCL:=pCL0[Ax,2][Lev]; inc(pCL,i);    pCL^:=pCL^+pCL1^*H[j];
            pCL:=pCL0[Ax][2,Lev]; inc(pCL,i+P2); pCL^:=pCL^+pCL1^*G[j];
          end;
        end;
      end;
    end;
  end;

  if Form1.RB_bWLDiagr.Checked then OutDaubech;
  if Form1.RB_bWLGraph.Checked then OutDaubechXY;

  Form1.Ed_Status.Text:='';
  Form1.Ed_Status.Update;

  if bWLCheck then WLCheck;
end;
//------------------------------------------------------------------------------
procedure __GetWLZmax;
var
  i,M,Lev,L,P2,Ax: Integer;
  Z: Real;
  pCL: pSingle;
begin
  L0min:= 10000;
  L0max:=-10000;

  if (bProb[1] and (not bCalc[1])) then
  begin
    for Ax:=1 to nAxis[1] do
    begin
      Lmin[Ax][1]:= 10000;
      Lmax[Ax][1]:=-10000;
      for L:=Lev1-1 to Lev2-1 do
      begin
        if L=-1 then Lev:=0 else Lev:=L;
        P2:=Power2(Lev);
        for i:=P2 to 2*P2-1 do
        begin
          if L=-1 then begin pCL:=pCL0[Ax][1][Lev]; inc(pCL,i-P2); Z:=pCL^; end
          else         begin pCL:=pCL0[Ax][1][Lev]; inc(pCL,i);    Z:=pCL^; end;
          Z:=abs(Z);
          if Z<Lmin[Ax][1] then Lmin[Ax][1]:=Z;
          if Z>Lmax[Ax][1] then Lmax[Ax][1]:=Z;
        end;
      end;
      if Lmin[Ax][1]<L0min then L0min:=Lmin[Ax][1];
      if Lmax[Ax][1]>L0max then L0max:=Lmax[Ax][1];
    end;
    for Ax:=1 to nAxis[1] do
    begin
      if Form1.RB_WLScaleAbs.Checked then
      begin
        Lmin[Ax][1]:=L0min;
        Lmax[Ax][1]:=L0max;
      end;
      M:=_fExp(Lmax[Ax][1]);
      MultCL[Ax][1]:=IntPower(10,M);
      if Ax=1 then Form1.Lb_MultCL11b.Caption:=FloatToStr(M);
      if Ax=2 then Form1.Lb_MultCL21b.Caption:=FloatToStr(M);
      if Ax=3 then Form1.Lb_MultCL31b.Caption:=FloatToStr(M);
    end;
  end;

  if (bProb[2] and (not bCalc[2])) then
  begin
    for Ax:=1 to nAxis[2] do
    begin
      Lmin[Ax][2]:= 10000;
      Lmax[Ax][2]:=-10000;
      for L:=Lev1-1 to lev2-1 do
      begin
        if L=-1 then Lev:=0 else Lev:=L;
        P2:=Power2(Lev);
        for i:=P2 to 2*P2-1 do
        begin
          if L=-1 then begin pCL:=pCL0[Ax][2][Lev]; inc(pCL,i-P2); Z:=pCL^; end
          else         begin pCL:=pCL0[Ax][2][Lev]; inc(pCL,i);    Z:=pCL^; end;
          Z:=abs(Z);
          if Z<Lmin[Ax][2] then Lmin[Ax][2]:=Z;
          if Z>Lmax[Ax][2] then Lmax[Ax][2]:=Z;
        end;
      end;
      if Lmin[Ax][2]<L0min then L0min:=Lmin[Ax][2];
      if Lmax[Ax][2]>L0max then L0max:=Lmax[Ax][2];
    end;
    for Ax:=1 to nAxis[2] do
    begin
      if Form1.RB_WLScaleAbs.Checked then
      begin
        Lmin[Ax][2]:=L0min;
        Lmax[Ax][2]:=L0max;
      end;
      M:=_fExp(Lmax[Ax][2]);
      MultCL[Ax][2]:=IntPower(10,M);
      if Ax=1 then Form1.Lb_MultCL12b.Caption:=FloatToStr(M);
      if Ax=2 then Form1.Lb_MultCL22b.Caption:=FloatToStr(M);
      if Ax=3 then Form1.Lb_MultCL32b.Caption:=FloatToStr(M);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure __OutDaubech(Pr,Ax: Integer);
var
  X,dY,Y,n,i,j,W,H,P2,Lev,L: Integer;
  Z: Real;
  pCL: pSingle;
begin
  if not bProb[1] then Exit;
  W:=pIm[Ax,Pr].Width;
  H:=pIm[Ax,Pr].Height;
  pIm[Ax,Pr].Visible:=TRUE;

  for j:=0 to H do
  begin
    L:=Trunc((1-j/H)*(Lev2-Lev1+1)+Lev1)-1;
    if L>=0 then Lev:=L else Lev:=0;
    P2:=Power2(Lev);
    if (1-j/H)*(Lev2-Lev1+2)+Lev1-1<0 then P2:=0;
    for i:=0 to W do
    begin
      X:=Trunc(i/W*P2);
      if (L>=0)and(L<Lev0) then
      begin      pCL:=pCL0[Ax,Pr][Lev]; inc(pCL,X+P2); Z:=pCL^; end
      else begin pCL:=pCL0[Ax,Pr][Lev]; inc(pCL,X);    Z:=pCL^; end;
      Z:=abs(Z);
      n:=Round((Z-Lmin[Ax,Pr])/(Lmax[Ax,Pr]-Lmin[Ax,Pr])*NWL);
      if n>NWL then n:=NWL;
      if n<1 then n:=1;
      pIm[Ax,Pr].Canvas.Pixels[i,j]:=WLRGB[n];
    end;
  end;

  dY:=Round(H/(Lev2-Lev1+1));
  Y:=H+dY-14;
  for Lev:=Lev1 to Lev2 do
  begin
    Y:=Y-dY;
    pIm[Ax,Pr].Canvas.TextOut(10,Y,FloatToStrF(Freq[Lev],ffFixed,4,4)+' ');
  end;
end;
//------------------------------------------------------------------------------
procedure OutDaubech;
var
  Pr,Ax: Byte;
  R: TRect;
begin
  if not bProb[1] then Exit;

  __GetWLZmax;
  WLOutScale;
  WLStatus;

  for Pr:=1 to nProb do if not bCalc[Pr] then for Ax:=1 to nAxis0 do
   pIm[Ax,Pr].Visible:=FALSE;

  for Pr:=1 to nProb do if (not bCalc[Pr]) then for Ax:=1 to nAxis[Pr] do
  begin
    Xp[Ax,Pr]:=-5; dXp[Ax,Pr]:=0; Yp[Ax,Pr]:=-5; dYp[Ax,Pr]:=0;
    __OutDaubech(Pr,Ax);
  end;
end;
//------------------------------------------------------------------------------
procedure OutDaubechXY;
var
  i,Lev,L,P2,Ax: Integer;
  pCL,pCL1: pSingle;
begin
  if not bProb[1] then Exit;
  WLStatus;

  with Form1 do
  begin
    L:=UD_DaubechLevel.Position-1;
    if L>=0 then Lev:=L else Lev:=0;
    P2:=Power2(Lev);

    Ss_WLXY10.Clear;
    Ss_WLXY10.AddXY(0,0); Ss_WLXY10.AddXY(P2,0);
    Ss_WLXY20.Clear;
    Ss_WLXY20.AddXY(0,0); Ss_WLXY20.AddXY(P2,0);
    Ss_WLXY30.Clear;
    Ss_WLXY30.AddXY(0,0); Ss_WLXY30.AddXY(P2,0);

    Ss_WLXY11.Clear;
    Ss_WLXY21.Clear;
    Ss_WLXY31.Clear;
    Ss_WLXY12.Clear;
    Ss_WLXY22.Clear;
    Ss_WLXY32.Clear;

    if bProb[1] then
    begin
      if Lev<Lev0 then for Ax:=1 to nAxis[1] do
      begin
        pCL:=pCL0[Ax][1][Lev]; inc(pCL,2*P2);
        pCL1:=pCL0[Ax][1][Lev]; inc(pCL,2*P2-1);
        pCL^:=pCL1^;
      end;
      if (Lev=Lev0)or(L=-1) then for i:=0 to P2 do
      begin
        if nAxis[1]>=1 then
        begin
          pCL:=pCL0[1][1][Lev]; inc(pCL,i);
          Ss_WLXY11.AddXY(i,pCL^);
        end;
        if nAxis[1]>=2 then
        begin
          pCL:=pCL0[2][1][Lev]; inc(pCL,i);
          Ss_WLXY21.AddXY(i,pCL^);
        end;
        if nAxis[1]>=3 then
        begin
          pCL:=pCL0[3][1][Lev]; inc(pCL,i);
          Ss_WLXY31.AddXY(i,pCL^);
        end;
      end
      else for i:=P2 to 2*P2 do
      begin
        if nAxis[1]>=1 then
        begin
          pCL:=pCL0[1][1][Lev]; inc(pCL,i);
          Ss_WLXY11.AddXY(i-P2,pCL^);
        end;
        if nAxis[1]>=2 then
        begin
          pCL:=pCL0[2][1][Lev]; inc(pCL,i);
          Ss_WLXY21.AddXY(i-P2,pCL^);
        end;
        if nAxis[1]>=3 then
        begin
          pCL:=pCL0[3][1][Lev]; inc(pCL,i);
          Ss_WLXY31.AddXY(i-P2,pCL^);
        end;
      end;
    end;

    if bProb[2] then
    begin
      if Lev<Lev0 then for Ax:=1 to nAxis[2] do
      begin
        pCL:=pCL0[Ax][2][Lev]; inc(pCL,2*P2);
        pCL1:=pCL0[Ax][2][Lev]; inc(pCL,2*P2-1);
        pCL^:=pCL1^;
      end;
      if (Lev=Lev0)or(L=-1) then for i:=0 to P2 do
      begin
        if nAxis[2]>=1 then
        begin
          pCL:=pCL0[1][2][Lev]; inc(pCL,i);
          Ss_WLXY12.AddXY(i,pCL^);
        end;
        if nAxis[2]>=2 then
        begin
          pCL:=pCL0[2][2][Lev]; inc(pCL,i);
          Ss_WLXY22.AddXY(i,pCL^);
        end;
        if nAxis[2]>=3 then
        begin
          pCL:=pCL0[3][2][Lev]; inc(pCL,i);
          Ss_WLXY32.AddXY(i,pCL^);
        end;
      end
      else for i:=P2 to 2*P2 do
      begin
        if nAxis[2]>=1 then
        begin
          pCL:=pCL0[1][2][Lev]; inc(pCL,i);
          Ss_WLXY12.AddXY(i-P2,pCL^);
        end;
        if nAxis[2]>=2 then
        begin
          pCL:=pCL0[2][2][Lev]; inc(pCL,i);
          Ss_WLXY22.AddXY(i-P2,pCL^);
        end;
        if nAxis[2]>=3 then
        begin
          pCL:=pCL0[3][2][Lev]; inc(pCL,i);
          Ss_WLXY32.AddXY(i-P2,pCL^);
        end;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure SetCLm(Send: TObject; X,Y: Integer);
var
  a,Ax,p,Pr: Byte;
  i,W,H,dX,dY,Lev,Smpl,P2,dXN: Integer;
  WL1,dH,dW,dXT: Real;
  pCL: pSingle;
begin
  for p:=1 to 2 do for a:=1 to 3 do if Send=pIm[a,p]^ then begin Pr:=p; Ax:=a; end;
  if nAxis[Pr]<Ax then Exit;

  W:=pIm[Ax,Pr].Width;
  H:=pIm[Ax,Pr].Height;
  dH:=H/(Lev2-Lev1+1);
  Lev:=(H-Y) div Round(dH)+Lev1;
  P2:=Power2(Lev-1);
  Smpl:=Trunc(X/W*P2);
  dW:=W/P2;

  with Form1 do
  begin
    pIm[Ax,Pr].Canvas.Pen.Mode:=pmNotXor;

    pIm[Ax,Pr].Canvas.MoveTo(Xp[Ax,Pr]-dXp[Ax,Pr],Yp[Ax,Pr]-dYp[Ax,Pr]);
    pIm[Ax,Pr].Canvas.LineTo(Xp[Ax,Pr]+dXp[Ax,Pr]+1,Yp[Ax,Pr]-dYp[Ax,Pr]);
    pIm[Ax,Pr].Canvas.LineTo(Xp[Ax,Pr]+dXp[Ax,Pr]+1,Yp[Ax,Pr]+dYp[Ax,Pr]);
    pIm[Ax,Pr].Canvas.LineTo(Xp[Ax,Pr]-dXp[Ax,Pr],Yp[Ax,Pr]+dYp[Ax,Pr]);
    pIm[Ax,Pr].Canvas.LineTo(Xp[Ax,Pr]-dXp[Ax,Pr],Yp[Ax,Pr]-dYp[Ax,Pr]);

    X:=Trunc((Smpl+0.5)/P2*W);
    dX:=Round(dW/2)-1;
    Y:=Round(H-(Lev-Lev1+0.5)*dH);
    dY:=Round(dH/2)-1;
    pIm[Ax,Pr].Canvas.MoveTo(X-dX,Y-dY);
    pIm[Ax,Pr].Canvas.LineTo(X+dX+1,Y-dY);
    pIm[Ax,Pr].Canvas.LineTo(X+dX+1,Y+dY);
    pIm[Ax,Pr].Canvas.LineTo(X-dX,Y+dY);
    pIm[Ax,Pr].Canvas.LineTo(X-dX,Y-dY);
    Xp[Ax,Pr]:=X; dXp[Ax,Pr]:=dX; Yp[Ax,Pr]:=Y; dYp[Ax,Pr]:=dY;

    pIm[Ax,Pr].Canvas.Pen.Mode:=pmCopy;

    if bWLAxisXN then
    begin
      dXN:=Round(Power2(Lev0)/P2);
      pCh[Ax,Pr].BottomAxis.Title.Caption:=IntToStr(NCY1[Pr]+dXN*Smpl-1)+'-'+
      IntToStr(NCY1[Pr]+dXN*(Smpl+1)-1)+'       ������';
    end;
    if bWLAxisXT then
    begin
      dXT:=Power2(Lev0)*dT/P2;
      pCh[Ax,Pr].BottomAxis.Title.Caption:=FloatToStr(TC1[Pr]+dXT*Smpl-1)+' - '+
       FloatToStr(TC1[Pr]+dXT*(Smpl+1)-1)+'      �����, ���';
    end;
    pCh[Ax,Pr].LeftAxis.Title.Caption:='�������    '+IntToStr(Lev);

    dec(Lev);
    if Lev<0 then Lev:=0 else Smpl:=Smpl+P2;

    pCL:=pCL0[Ax][Pr][Lev]; inc(pCL,Smpl);
    pCh[Ax,Pr].Title.Text[0]:=FloatToStrF(pCL^/MultCL[Ax][Pr],ffFixed,3,3);
  end;
end;
//------------------------------------------------------------------------------
procedure WLCheck;
var
  T: TextFile;
  i,j,J0,n,Lev,P2,P1: Integer;
  St: String;
begin
{  AssignFile(T,ProgDir+'\___PPPP0.txt');
  ReWrite(T);
  for Lev:=0 to Lev0 do
  begin
    P2:=Power2(Lev);
    WriteLn(T,'_________ Lev = ',Lev);
    if Lev=Lev0 then for i:=0 to P2-1 do
     WriteLn(T,i:4,CL[1][1][Lev,i]:10:4)
    else
    for i:=0 to P2-1 do
     WriteLn(T,i:4,CL[1][1][Lev,i]:10:4,CL[1][1][Lev,i+P2]:10:4);
  end;
  CloseFile(T);
{--}
{  AssignFile(T,ProgDir+'\___PPPP1.txt');
  ReWrite(T);
  for Lev:=0 to Lev0 do
  begin
    P2:=Power2(Lev);
    St:='';
    if P2>64 then begin P2:=64; St:=' ...'; end;
    WriteLn(T,'_________ Lev = ',Lev);
    for i:=0 to P2-1 do Write(T,CL[1][1][Lev,i]:11:5);    WriteLn(T,St);
    for i:=0 to P2-1 do Write(T,CL[1][1][Lev,i+P2]:11:5); WriteLn(T,St);
  end;
  CloseFile(T);
{--}
{  J0:=3;
  if bWLdb3 then J0:=5;
  if bWLdb4 then J0:=7;

  for i:=0 to Power2(Lev1) do CL[1][2][Lev1,i]:=CL[1][1][Lev1,i];

  for Lev:=1 to Lev0 do
  begin
    P2:=Power2(Lev);
    P1:=P2 div 2;
    for i:=P1 to P2-1 do CL[1][2][Lev-1,i]:=CL[1][1][Lev-1,i];
    for i:=0 to P2-1 do
    begin
      for j:=0 to J0 do
      begin
        if ((i-j) mod 2)=0 then
        begin
          n:=(i-j) div 2;
          if n<0 then n:=n+P1;
          CL[1][2][Lev,i]:=CL[1][2][Lev,i]+CL[1][2][Lev-1,n]*H[j]+CL[1][2][Lev-1,n+P1]*G[j];
        end;
      end;
    end;
  end;

  AssignFile(T,ProgDir+'\___PPPP2.txt');
  ReWrite(T);
  for Lev:=lev1 to Lev0 do
  begin
    P2:=Power2(Lev);
    St:='';
    if P2>64 then begin P2:=64; St:=' ...'; end;
    WriteLn(T,'_________ Lev = ',Lev);
    for i:=0 to P2-1 do Write(T,CL[1][2][Lev,i]:11:5);    WriteLn(T,St);
  end;
  CloseFile(T);}
end;
//==============================================================================

end.
