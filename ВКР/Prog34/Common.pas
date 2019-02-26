unit Common;

interface
uses SysUtils, Math, StdCtrls;

const
  cSS=SizeOf(Single);
  tProcInterMax=1000;
  nLevMax=25;
  nWidthMax=1000;
  nChannMax=50;

type
  pSingle=^Single;
  aW_pSingle=array[0..tProcInterMax] of pSingle;
  aL_pSingle=array[0..nLevMax] of pSingle;
  aM_pSingle=array[0..nWidthMax] of pSingle;

var
  nLoadPr: Integer;
  TC1,TC2,NCY1: array[1..2] of Integer;
  NCY0,NCF0,NCV0,NCW0,NCW1,NCL0,NCL1,NCM0,NCM1: LongWord;
  TC0,Nwin,Nvel: Integer;
  H1,H2: Real;
  pCY0: array[1..3,1..2] of pSingle;
  pY0: pSingle=nil;
  pCF0: array[1..3,1..2] of pSingle;
  pGF0: array[1..3,1..2] of pSingle;
  pCV0: array[1..3,1..2] of pSingle;
  pCE0: array[1..3,1..2] of pSingle;
  pGV0: array[1..3,1..2] of pSingle;
  pGE0: array[1..3,1..2] of pSingle;
  pCW0: array[1..3,1..2] of aW_pSingle;
  pW0: aW_pSingle;
  pCL0: array[1..3,1..2] of aL_pSingle;
  pCM0: array[1..3,1..2] of aM_pSingle;

  bProb,bCalc: array [1..2] of Boolean;
  bOut: array [1..2] of Boolean;
  bWLCheck: Boolean;
  ProgDir,WorkDir: String;
  ProbeName: array[1..2] of String;
  St_FIO,St_BDate,St_Group,St_TDate,St_Test,St_Proba,St_ADate: array[1..3] of String;
  DS: Char;
// �����
  sLoadType: array[1..2] of String;
  bProbVary0,bProbVary1,bProbVary2: Boolean;
  bTextFile,bBinFile,bImportFile: Boolean;
  tProcStart: array[1..2] of Integer;
  tProcLength,tProcInter: Integer;
  Fdiscr: Word;
  dT: Real;
  tProbLength: array[1..2] of Integer;
  bBlackman,bHanning,bHamming,bBlackmanHarris: Boolean;
  bExactBlackman,bFlatTop,bTriangle,bNoFilter: Boolean;
  bTitle,bChann: Boolean;
  ChanD: Byte=2;
  NodeIndex,NodeLevel,NodeParent: Integer;
  AxisName: array[1..3,1..2] of String;
// �����-������
// ����-������
  bVelchVary1,bVelchVary2: Boolean;
  Tvel,Svel: Real;
  bError: Boolean;
// ������� ������
  bWinVary1,bWinVary2: Boolean;
  Twin: Integer;
  bOut1Prob,bOut2Prob: Boolean;
// �������������
  bSpGrammVary: Boolean;
  SGPalName: String;
  bDiscrSpG,bSmoothSpG: Boolean;
// �������-������
  bWaveLet1,bWaveLet2,bWaveLet3: Boolean;
  WLPalName: String;
  bWLdb2,bWLdb3,bWLdb4,bMorlet,bNotWL: Boolean;
  bWLAxisXT,bWLAxisXN: Boolean;
  Kmor: Real;
  bCorrectMor: Boolean;
// ����������
  bDataExport: Boolean;
  DataExportDir: String;
// �������
  nProb,nProb0,nAxis0: Byte;
  nSelectChann,nAxis: array[1..2] of Byte;
  bDim: array[1..3,1..4] of Boolean;
  sPr1,sPr2: array[1..3] of String;
  sAT1,sAT2: array[1..3] of String;
  bGraph: Boolean;
  nChann: Integer;
  SelChann: array[1..2,1..nChannMax] of Integer;
  dLeftG,dRightG,dTopG,dBottomG: Integer;
  dLeftD,dRightD,dTopD,dBottomD: Integer;

procedure MainStatus(bP1,bC1,bP2,bC2: Boolean);
function __SetDecSeparator(S: String): Real;
function Ed_Filter(V: String): String;
function BoolToInt(B: Boolean): Integer;
procedure MainInit;
procedure pFreeMemProb;
procedure pFreeMemFour;
procedure pFreeMemVelch;
procedure pFreeMemWin;
procedure pFreeMemWaveLet;
procedure pFreeMemMorlet;
procedure ReadPar;
procedure WritePar;
procedure Option;
procedure NewOption(S: TObject);
procedure OptionOkClick;
procedure _pSetWin;
procedure SetH(Sender: TObject);
procedure Center(N1,N2: Integer; pC0,pY0: pSingle);
procedure Filter(N1,N2: Integer; pY0: pSingle);
procedure SetAmpl(Sender: TObject);
function _fExp(R0: Real): Integer;
function _frSetMult(I1,I2: Integer; p: pSingle; Lb: TLabel): Real;
procedure pSetAxisTitle;
procedure pChangeMorlet(K: Real);

implementation
uses Main, ProbeText, ProbeImport, FourierAnalys, VelchAnalys, WinFourier,
     SpectroGramm, WaveLet, Morlet, DataExport;

//==============================================================================
function BoolToInt(B: Boolean): Integer;
begin
  if B then BoolToInt:=1 else BoolToInt:=0;
end;
//------------------------------------------------------------------------------
function __SetDecSeparator(S: String): Real;
var
  n: Integer;
begin
  if DS='.' then begin n:=Pos(',',S); if n<>0 then S[n]:='.'; end;
  if DS=',' then begin n:=Pos('.',S); if n<>0 then S[n]:=','; end;
  __SetDecSeparator:=StrToFloat(S);
end;
//------------------------------------------------------------------------------
function Ed_Filter(V: String): String;
var
  n: Word;
  C: Char;
  bP: Boolean;
begin
  bP:=FALSE;
  for n:=1 to Length(V) do
  begin
    C:=V[n];
    if ((C='.')and(bP=TRUE)) then Delete(V,n,1);
    if (C='.') then bP:=TRUE;
    if (C='-')and(n>1) then Delete(V,n,1);
  end;
  Ed_Filter:=V;
end;
//------------------------------------------------------------------------------
procedure MainStatus(bP1,bC1,bP2,bC2: Boolean);
var
  bA: Boolean;
begin
  bProb[1]:=bP1;
  bCalc[1]:=bC1 and bProb[1];
  bProb[2]:=bP2;
  bCalc[2]:=bC2 and bProb[2];

  with Form1 do
  begin
    MM_File_Prob2.Enabled:=(bP1 and (nProb0=2));

    if (PageC.TabIndex=1)or(PageC.TabIndex=2)or(PageC.TabIndex=3)or
       (PageC.TabIndex=4)or((PageC.TabIndex=5)and(bMorlet)) then
    bA:=TRUE else bA:=FALSE;
    GB_Amplitude.Visible:=bA;

    if (PageC.TabIndex=1)or(PageC.TabIndex=2)or(PageC.TabIndex=4)or
       ((PageC.TabIndex=5)and(bMorlet)) then bA:=TRUE else bA:=FALSE;
    GB_Frequency.Visible:=bA;

    if (PageC.TabIndex=1)or(PageC.TabIndex=2) then bA:=TRUE else bA:=FALSE;
    GB_GraphParam2.Visible:=bA;

    bA:=(PageC.TabIndex=5)and(bMorlet);
    GB_DaubechLevel.Visible:=not bA;
    GB_WLDisplay.Visible:=not bA;

    Ed_nProb.Enabled:=not bProb[1];
    UD_nProb.Enabled:=not bProb[1];
    Ed_nAxis.Enabled:=not bProb[1];
    UD_nAxis.Enabled:=not bProb[1];

    TS_CL.Visible:=not bNotWL;

    TableA.Active:=(PageC.TabIndex=6);

    Ed_DaubechLevel.Visible:=((not bMorlet)and(RB_bWLGraph.Checked));
    UD_DaubechLevel.Visible:=((not bMorlet)and(RB_bWLGraph.Checked));

    UD_H1.Max:=(Fdiscr div 2)*10-1;
    if H1>UD_H1.Max/10 then
    begin
      H1:=0;
      Ed_H1.Text:=FloatToStr(H1);
    end;  
    UD_H2.Max:=(Fdiscr div 2)*10;
    if H2>UD_H2.Max/10 then
    begin
      H2:=UD_H2.Max/10;
      Ed_H2.Text:=FloatToStr(H2);
    end;

    Ed_Fdiscr.Enabled:=(not bProb[1]);
  end;
end;
//------------------------------------------------------------------------------
procedure MainInit;
var
  Ax,Pr: Byte;
  k: LongWord;
begin
  GetDir(0,ProgDir);
  ReadPar;
  DS:=DecimalSeparator;
  pSetAxisTitle;

  for Ax:=1 to 3 do for Pr:=1 to 2 do
  begin
    pY0:=nil;         pCY0[Ax,Pr]:=nil;
    pCF0[Ax,Pr]:=nil; pGF0[Ax,Pr]:=nil;
    pCV0[Ax,Pr]:=nil; pCE0[Ax,Pr]:=nil; pGV0[Ax,Pr]:=nil; pGE0[Ax,Pr]:=nil;
    for k:=0 to tProcInterMax do pCW0[Ax,Pr,k]:=nil;
    for k:=0 to nLevMax do pCL0[Ax,Pr,k]:=nil;
    for k:=0 to nWidthMax do pCM0[Ax,Pr,k]:=nil;
  end;
  for k:=0 to tProcInterMax do pW0[k]:=nil;

  with Form1 do
  begin
    P_Option.Visible:=FALSE;
    Ed_H2.Text:=FloatToStr(H2);
    UD_H2.Position:=Round(H2);
    UD_H2.Position:=Round(H2*10);
    Ed_H1.Text:=FloatToStr(H1);
    UD_H1.Position:=Round(H1);
    UD_H1.Position:=Round(H1*10);

    P_Option.Left:=50;
    P_Option.Top:=0;
    P_Test.Left:=100;
    P_Test.Top:=0;
    Pl_SetTitle.Left:=12;
    Pl_SetTitle.Top:=224;
    Pl_TreeV.Left:=64;
    Pl_TreeV.Top:=24;
  end;

  for Ax:=1 to 2 do bOut[Ax]:=TRUE;
  MainStatus(FALSE,FALSE,FALSE,FALSE);
end;
//------------------------------------------------------------------------------
procedure pFreeMemProb;
var
  Ax,Pr: Byte;
begin
  if (pY0<>nil) then
  begin
    FreeMem(pY0,(NCY0+1)*cSS); pY0:=nil;
  end;
  for Ax:=1 to 3 do for Pr:=1 to 2 do if (pCY0[Ax,Pr]<>nil) then
  begin
    FreeMem(pCY0[Ax,Pr],(NCY0+1)*cSS); pCY0[Ax,Pr]:=nil;
  end;
end;
//------------------------------------------------------------------------------
procedure pFreeMemFour;
var
  Ax,Pr: Byte;
begin
  for Ax:=1 to 3 do for Pr:=1 to 2 do if (pCF0[Ax,Pr]<>nil) then
  begin
    FreeMem(pCF0[Ax,Pr],(NCF0+1)*cSS); pCF0[Ax,Pr]:=nil;
    FreeMem(pGF0[Ax,Pr],(NCF0+1)*cSS); pGF0[Ax,Pr]:=nil;
  end;
end;
//------------------------------------------------------------------------------
procedure pFreeMemVelch;
var
  Ax,Pr: Byte;
begin
  for Ax:=1 to 3 do for Pr:=1 to 2 do if (pCV0[Ax,Pr]<>nil) then
  begin
    FreeMem(pCV0[Ax,Pr],(NCV0+1)*cSS); pCV0[Ax,Pr]:=nil;
    FreeMem(pCE0[Ax,Pr],(NCV0+1)*cSS); pCE0[Ax,Pr]:=nil;
    FreeMem(pGV0[Ax,Pr],(NCV0+1)*cSS); pGV0[Ax,Pr]:=nil;
    FreeMem(pGE0[Ax,Pr],(NCV0+1)*cSS); pGE0[Ax,Pr]:=nil;
  end;
end;
//------------------------------------------------------------------------------
procedure pFreeMemWin;
var
  Ax,Pr: Byte;
  t: Word;
begin
  for t:=0 to NCW0 do if (pW0[t]<>nil) then
  begin
    FreeMem(pW0[t],(NCW1+1)*cSS); pW0[t]:=nil;
  end;
  for Ax:=1 to 3 do for Pr:=1 to 2 do
   for t:=0 to NCW0 do if (pCW0[Ax,Pr,t]<>nil) then
  begin
    FreeMem(pCW0[Ax,Pr,t],(NCW1+1)*cSS); pCW0[Ax,Pr,t]:=nil;
  end;
end;
//------------------------------------------------------------------------------
procedure pFreeMemWaveLet;
var
  Ax,Pr: Byte;
  L: Word;
begin
  for Ax:=1 to 3 do for Pr:=1 to 2 do for L:=0 to NCL0 do
   if (pCL0[Ax,Pr,L]<>nil) then
  begin
    FreeMem(pCL0[Ax,Pr,L],(NCL1+1)*cSS); pCL0[Ax,Pr,L]:=nil;
  end;
end;
//------------------------------------------------------------------------------
procedure pFreeMemMorlet;
var
  Pr,Ax: Byte;
  x: Word;
begin
  for Ax:=1 to 3 do for Pr:=1 to 2 do for x:=0 to NCM0 do
   if (pCM0[Ax,Pr,x]<>nil) then
  begin
    FreeMem(pCM0[Ax,Pr,x],(NCM1+1)*cSS); pCM0[Ax,Pr,x]:=nil;
  end;
end;
//------------------------------------------------------------------------------
procedure ReadPar;
var
  T: TextFile;
  k,n,b: Byte;
  R: String[6];
begin
  Assign(T,ProgDir+'\_Stab.ini');
  ReSet(T);
    ReadLn(T,WorkDir);
// �����
    ReadLn(T);
    ReadLn(T,b);        bTextFile:=(b=1);
    ReadLn(T,b);        bBinFile:=(b=1);
    ReadLn(T,b);        bImportFile:=(b=1);
    ReadLn(T,tProcStart[1]);
    ReadLn(T,tProcStart[2]);
    ReadLn(T,tProcInter);
    ReadLn(T,Fdiscr);   dT:=1/Fdiscr;
    ReadLn(T,b);        bBlackman:=(b=1);
    ReadLn(T,b);        bHanning:=(b=1);
    ReadLn(T,b);        bHamming:=(b=1);
    ReadLn(T,b);        bBlackmanHarris:=(b=1);
    ReadLn(T,b);        bExactBlackman:=(b=1);
    ReadLn(T,b);        bFlatTop:=(b=1);
    ReadLn(T,b);        bTriangle:=(b=1);
    ReadLn(T,b);        bNoFilter:=(b=1);
// �����-������
    ReadLn(T);
// ����-������
    ReadLn(T);
    ReadLn(T,Tvel);
    ReadLn(T,Svel);
    ReadLn(T,b);        bError:=(b=1);
// �������������
    ReadLn(T);
    ReadLn(T,SGPalName);
    ReadLn(T,b);        bDiscrSpG:=(b=1);
    ReadLn(T,b);        bSmoothSpG:=(b=1);
// ������� ������
    ReadLn(T);
    ReadLn(T,Twin);
    ReadLn(T,b);        bOut1Prob:=(b=1);
    ReadLn(T,b);        bOut2Prob:=(b=1);
// �������-������
    ReadLn(T);
    ReadLn(T,WLPalName);
    ReadLn(T,b);        bNotWL:=(b=1);
    ReadLn(T,b);        bWLdb2:=(b=1);
    ReadLn(T,b);        bWLdb3:=(b=1);
    ReadLn(T,b);        bWLdb4:=(b=1);
    ReadLn(T,b);        bMorlet:=(b=1);
    ReadLn(T,b);        Form1.UD_DaubechLevel2.Position:=b;
    ReadLn(T,b);        Form1.UD_DaubechLevel1.Position:=b;
    ReadLn(T,b);        bWLAxisXT:=(b=1);
    ReadLn(T,b);        bWLAxisXN:=(b=1);
    ReadLn(T,Kmor);
    ReadLn(T,b);        bCorrectMor:=(b=1);
// ����������
    ReadLn(T);
    ReadLn(T,DataExportDir);
// �������
    ReadLn(T);
    ReadLn(T,nProb0);
    ReadLn(T,nAxis0);
    for k:=1 to 4 do
    begin
      for n:=1 to 3 do begin Read(T,b); bDim[n][k]:=(b=1); end;
      ReadLn(T);
    end;
    ReadLn(T,dLeftG);
    ReadLn(T,dRightG);
    ReadLn(T,dTopG);
    ReadLn(T,dBottomG);
    ReadLn(T,dLeftD);
    ReadLn(T,dRightD);
    ReadLn(T,dTopD);
    ReadLn(T,dBottomD);
//..............................................................................
    ReadLn(T);
    ReadLn(T,b);        Form1.RB_bRemvl.Checked:=(b=1);
    ReadLn(T,b);        Form1.RB_bPower.Checked:=(b=1);
    ReadLn(T,b);        Form1.RB_bLog10.Checked:=(b=1);
    ReadLn(T,b);        Form1.CB_Adge.ItemIndex:=b;
    ReadLn(T,b);        Form1.CB_Diag.ItemIndex:=b;
    ReadLn(T,R);        H2:=__SetDecSeparator(R);
    ReadLn(T,R);        H1:=__SetDecSeparator(R);
    ReadLn(T,b);        bWLCheck:=(b=1);
  CloseFile(T);
end;
//------------------------------------------------------------------------------
procedure WritePar;
var
  T: TextFile;
  k,n: Byte;
begin
  Assign(T,ProgDir+'\_Stab.ini');
  ReWrite(T);
    WriteLn(T,WorkDir);
    WriteLn(T,' �����');
    WriteLn(T,BoolToInt(bTextFile):6,' ':8,'bTextFile');
    WriteLn(T,BoolToInt(bBinFile):6,' ':8,'bBinFile');
    WriteLn(T,BoolToInt(bImportFile):6,' ':8,'bImportFile');
    WriteLn(T,tProcStart[1]:6,' ':8,'tProcStart1');
    WriteLn(T,tProcStart[2]:6,' ':8,'tProcStart2');
    WriteLn(T,tProcInter:6,' ':8,'tProcInter');
    WriteLn(T,Fdiscr:6,' ':8,'Fdiscr');
    WriteLn(T,BoolToInt(bBlackman):6,' ':8,'Blackman');
    WriteLn(T,BoolToInt(bHanning):6,' ':8,'Hanning');
    WriteLn(T,BoolToInt(bHamming):6,' ':8,'Hamming');
    WriteLn(T,BoolToInt(bBlackmanHarris):6,' ':8,'BlackmanHarris');
    WriteLn(T,BoolToInt(bExactBlackman):6,' ':8,'ExactBlackman');
    WriteLn(T,BoolToInt(bFlatTop):6,' ':8,'Triangle');
    WriteLn(T,BoolToInt(bTriangle):6,' ':8,'FlatTop');
    WriteLn(T,BoolToInt(bNoFilter):6,' ':8,'NoFilter');
    WriteLn(T,' �����-������');
    WriteLn(T,' ����-������');
    WriteLn(T,Tvel:6:1,' ':8,'������ ����');
    WriteLn(T,Svel:6:1,' ':8,'��� ����');
    WriteLn(T,BoolToInt(bError):6,' ':8,'bError');
    WriteLn(T,' �������������');
    WriteLn(T,SGPalName);
    WriteLn(T,BoolToInt(bDiscrSpG):6,' ':8,'bDiscrSpG');
    WriteLn(T,BoolToInt(bSmoothSpG):6,' ':8,'bSmoothSpG');
    WriteLn(T,' ������� ������');
    WriteLn(T,Twin:6,' ':8,'������ ����');
    WriteLn(T,BoolToInt(bOut1Prob):6,' ':8,'1 �����');
    WriteLn(T,BoolToInt(bOut2Prob):6,' ':8,'2 �����');
    WriteLn(T,' �������-������');
    WriteLn(T,WLPalName);
    WriteLn(T,BoolToInt(bNotWL):6,' ':8,'bNotWL');
    WriteLn(T,BoolToInt(bWLdb2):6,' ':8,'db2');
    WriteLn(T,BoolToInt(bWLdb3):6,' ':8,'db3');
    WriteLn(T,BoolToInt(bWLdb4):6,' ':8,'db4');
    WriteLn(T,BoolToInt(bMorlet):6,' ':8,'bMorlet');
    WriteLn(T,Form1.UD_DaubechLevel2.Position:6,' ':8,'Top Level');
    WriteLn(T,Form1.UD_DaubechLevel1.Position:6,' ':8,'Bot Level');
    WriteLn(T,BoolToInt(bWLAxisXT):6,' ':8,'�����');
    WriteLn(T,BoolToInt(bWLAxisXN):6,' ':8,'�������');
    WriteLn(T,Kmor:6:2,' ':8,'Kmor');
    WriteLn(T,BoolToInt(bCorrectMor):6,' ':8,'bCorrectMor');
    WriteLn(T,' ����������');
    WriteLn(T,DataExportDir);
    WriteLn(T,' �������');
    WriteLn(T,nProb0:6,' ':8,'nProb');
    WriteLn(T,nAxis0:6,' ':8,'nAxis');
    for k:=1 to 4 do
    begin
      for n:=1 to 3 do Write(T,BoolToInt(bDim[n][k]):2);
      WriteLn(T,' ':8,'bDim'+IntToStr(k));
    end;
    WriteLn(T,dLeftG:6,' ':8,'dLeftG');
    WriteLn(T,dRightG:6,' ':8,'dRightG');
    WriteLn(T,dTopG:6,' ':8,'dTopG');
    WriteLn(T,dBottomG:6,' ':8,'dBottomG');
    WriteLn(T,dLeftD:6,' ':8,'dLeftD');
    WriteLn(T,dRightD:6,' ':8,'dRightD');
    WriteLn(T,dTopD:6,' ':8,'dTopD');
    WriteLn(T,dBottomD:6,' ':8,'dBottomD');
    WriteLn(T,' ...............................................................');
    WriteLn(T,BoolToInt(Form1.RB_bRemvl.Checked):6,' ':8,'bAmpl');
    WriteLn(T,BoolToInt(Form1.RB_bPower.Checked):6,' ':8,'bPower');
    WriteLn(T,BoolToInt(Form1.RB_bLog10.Checked):6,' ':8,'bLog10');
    WriteLn(T,Form1.CB_Adge.ItemIndex:6,' ':8,'AdgeGroup.ItemIndex');
    WriteLn(T,Form1.CB_Diag.ItemIndex:6,' ':8,'Diagnose.ItemIndex');
    WriteLn(T,H2:6:1,' ':8,'H2');
    WriteLn(T,H1:6:1,' ':8,'H1');
    WriteLn(T,BoolToInt(bWLCheck):6,' ':8,'bWLCheck');
  CloseFile(T);
end;
//------------------------------------------------------------------------------
procedure pChangeMorlet(K: Real);
var
  i: Word;
  a,b,x: Real;
begin
  with Form1 do
  begin
    Ss_Mor0.AddXY(0,0);
    Ss_Mor0.AddXY(1,0);
    Ss_MorRe.Clear;
    Ss_MorIm.Clear;
    a:=0.125;
    b:=0.5;
    for i:=0 to 100 do
    begin
      x:=i/100;
      Ss_MorRe.AddXY(x,exp(-sqr(x-b)/2/sqr(a))*cos(K*(x-b)/a));
      Ss_MorIm.AddXY(x,exp(-sqr(x-b)/2/sqr(a))*sin(K*(x-b)/a));
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Option;
begin
  Form1.P_Option.Visible:=not Form1.P_Option.Visible;
  if Form1.P_Option.Visible then with Form1 do
  begin
    Update;
    bProbVary0:=FALSE;
    bProbVary1:=FALSE;
    bProbVary2:=FALSE;
    bVelchVary1:=FALSE;
    bVelchVary2:=FALSE;
    bWinVary1:=FALSE;
    bWinVary2:=FALSE;
    bSpGrammVary:=FALSE;
    bWaveLet1:=FALSE;
    bWaveLet2:=FALSE;
    bWaveLet3:=FALSE;
    bDataExport:=FALSE;
  // �����
    RB_bTextFile.Checked:=bTextFile;
    RB_bBinFile.Checked:=bBinFile;
    RB_bImportFile.Checked:=bImportFile;
    UD_tProcStart1.Position:=tProcStart[1];
    UD_tProcStart2.Position:=tProcStart[2];
    UD_tProcInter.Position:=tProcInter;
    Ed_Fdiscr.Text:=IntToStr(Fdiscr);
    RB_bBlackman.Checked:=bBlackman;
    RB_bHanning.Checked:=bHanning;
    RB_bHamming.Checked:=bHamming;
    RB_bBlackmanHarris.Checked:=bBlackmanHarris;
    RB_bExactBlackman.Checked:=bExactBlackman;
    RB_bFlatTop.Checked:=bFlatTop;
    RB_bTriangle.Checked:=bTriangle;
    RB_bNoFilter.Checked:=bNoFilter;
  // ����-������
    UD_Tvel.Position:=Round(Tvel*5);
    Ed_Tvel.Text:=FloatToStr(Tvel);
    UD_Svel.Position:=Round(Svel*5);
    Ed_Svel.Text:=FloatToStr(Svel);
    CB_bError.Checked:=bError;
  // ������� ������
    UD_Twin.Position:=Twin;
    RB_bOut1St.Checked:=bOut1Prob;
    RB_bOut2St.Checked:=bOut2Prob;
  // �������������
    Ed_SGPalName.Text:=SGPalName;
    RB_bDiscrSpG.Checked:=bDiscrSpG;
    RB_bSmoothSpG.Checked:=bSmoothSpG;
  // �������-������
    Ed_WLPalName.Text:=WLPalName;
    RB_bNotWL.Checked:=bNotWL;
    RB_bWLdb2.Checked:=bWLdb2;
    RB_bWLdb3.Checked:=bWLdb3;
    RB_bWLdb4.Checked:=bWLdb4;
    RB_bMorlet.Checked:=bMorlet;
    RB_bWLAxisXT.Checked:=bWLAxisXT;
    RB_bWLAxisXN.Checked:=bWLAxisXN;
    UD_Kmor.Position:=Round(Kmor);
    CB_bCorrectMor.Checked:=bCorrectMor;
    pChangeMorlet(Kmor);
  // ����������
    Ed_DataExportDir.Text:=DataExportDir;
  // �������
    UD_nProb.Position:=nProb0;
    UD_nAxis.Position:=nAxis0;
    RB_bDim11.Checked:=bDim[1][1];
    RB_bDim21.Checked:=bDim[2][1];
    RB_bDim31.Checked:=bDim[3][1];
    RB_bDim12.Checked:=bDim[1][2];
    RB_bDim22.Checked:=bDim[2][2];
    RB_bDim32.Checked:=bDim[3][2];
    RB_bDim13.Checked:=bDim[1][3];
    RB_bDim23.Checked:=bDim[2][3];
    RB_bDim33.Checked:=bDim[3][3];
    RB_bDim14.Checked:=bDim[1][4];
    RB_bDim24.Checked:=bDim[2][4];
    RB_bDim34.Checked:=bDim[3][4];
    UD_dLeftG.Position:=dLeftG;
    UD_dRightG.Position:=dRightG;
    UD_dTopG.Position:=dTopG;
    UD_dBottomG.Position:=dBottomG;
    UD_dLeftD.Position:=dLeftD;
    UD_dRightD.Position:=dRightD;
    UD_dTopD.Position:=dTopD;
    UD_dBottomD.Position:=dBottomD;

    Bt_OptionOk.Enabled:=TRUE;
    Bt_OptionApply.Enabled:=FALSE;
  end;
end;
//------------------------------------------------------------------------------
procedure NewOption(S: TObject);
var
  P,Q: PChar;
  DEDir: String;
begin
  with Form1 do
  begin
// �����
    if (S=RB_bBlackman)or(S=RB_bHanning)or(S=RB_bHamming)or
       (S=RB_bBlackmanHarris)or(S=RB_bExactBlackman)or(S=RB_bFlatTop)or
       (S=RB_bTriangle)or(S=RB_bNoFilter)or(S=Ed_Fdiscr) then bProbVary0:=TRUE;
    if (S=Ed_tProcStart1)or(S=UD_tProcStart1) then bProbVary1:=TRUE;
    if (S=Ed_tProcStart2)or(S=UD_tProcStart2) then bProbVary2:=TRUE;
    if (S=Ed_tProcInter)or(S=UD_tProcInter) then
    begin
      bProbVary1:=TRUE;
      bProbVary2:=TRUE;
    end;
// ����-������
    if (S=UD_Tvel) then Ed_Tvel.Text:=FloatToStr(UD_Tvel.Position/5);
    if (S=UD_Svel) then Ed_Svel.Text:=FloatToStr(UD_Svel.Position/5);
    if ((S=UD_Tvel)or(S=Ed_Tvel)) then bVelchVary1:=TRUE;
    if ((S=UD_Svel)or(S=Ed_Svel)or(S=CB_bError)) then bVelchVary2:=TRUE;
// ������� �����-������
    if (S=RB_bOut1St)or(S=RB_bOut2St) then bWinVary1:=TRUE;
    if (S=UD_Twin)or(S=Ed_Twin) then bWinVary2:=TRUE;
// �������������
    if (S=RB_bDiscrSpG)or(S=RB_bSmoothSpG) then bSpGrammVary:=TRUE;
    if S=Bt_SGSelPal then
    begin
      OpenD_Palette.InitialDir:=ProgDir+'\_Palette';
      if OpenD_Palette.Execute then
      begin
        Ed_SGPalName.Text:=ExtractFileName(OpenD_Palette.FileName);
        bSpGrammVary:=TRUE;
      end;
    end;
// �������-������
    Ed_Kmor.Enabled:=RB_bMorlet.Checked;
    UD_Kmor.Enabled:=RB_bMorlet.Checked;
    Lb_Kmor.Enabled:=RB_bMorlet.Checked;
    CB_bCorrectMor.Enabled:=RB_bMorlet.Checked;
    if S=Bt_WLSelPal then
    begin
      OpenD_Palette.InitialDir:=ProgDir+'\_Palette';
      if OpenD_Palette.Execute then
      begin
        Ed_WLPalName.Text:=ExtractFileName(OpenD_Palette.FileName);
        bWaveLet1:=TRUE;
      end;
    end;
    if (S=RB_bWLdb2)or(S=RB_bWLdb3)or(S=RB_bWLdb4)or(S=RB_bMorlet)or
       (S=RB_bNotWL)or(S=CB_bCorrectMor)or(S=Ed_Kmor)or(S=UD_Kmor) then
     bWaveLet2:=TRUE;
    if (S=RB_bWLAxisXT)or(S=RB_bWLAxisXN) then
     bWaveLet3:=TRUE;
// ����������
    if S=Bt_DBaseSelect then
    begin
      if OpenD1.Execute then
      begin
        DEDir:=OpenD1.FileName+#0;
        P:=@DEDir[1];
        Q:=StrRScan(P,'\'); Q^:=#0;
        Q:=StrRScan(P,'\'); Q^:=#0;
        SetLength(DEDir,StrLen(P));
        Ed_DataExportDir.Text:=DEDir;
        bDataExport:=TRUE;
      end else bDataExport:=FALSE;
    end;
// �������
    if (S=Ed_nProb)or(S=UD_nProb)or(S=Ed_nAxis)or(S=UD_nAxis) then
     bGraph:=TRUE;

    if S=Bt_OptionCancel then P_Option.Visible:=FALSE;
  end;
end;
//------------------------------------------------------------------------------
procedure OptionOkClick;
begin
  with Form1 do
  begin
    P_Option.Visible:=FALSE;
    Update;

    Ed_Status2.Text:='';
    Ed_Status2.Update;

// �����
    bTextFile:=RB_bTextFile.Checked;
    bBinFile:=RB_bBinFile.Checked;
    bImportFile:=RB_bImportFile.Checked;
    bBlackman:=RB_bBlackman.Checked;
    bHanning:=RB_bHanning.Checked;
    bHamming:=RB_bHamming.Checked;
    bBlackmanHarris:=RB_bBlackmanHarris.Checked;
    bExactBlackman:=RB_bExactBlackman.Checked;
    bFlatTop:=RB_bFlatTop.Checked;
    bTriangle:=RB_bTriangle.Checked;
    bNoFilter:=RB_bNoFilter.Checked;
    tProcStart[1]:=UD_tProcStart1.Position;
    tProcStart[2]:=UD_tProcStart2.Position;
    tProcInter:=UD_tProcInter.Position;
    Fdiscr:=StrToInt(Ed_Fdiscr.Text); dT:=1/Fdiscr;
    if bProbVary0 then if bProb[1] then
    begin
      MainStatus(bProb[1],FALSE,bProb[2],FALSE);
//      _pSetNC;
      pOutProb;
      pGetFourier;
      GetVelch;
      GetFourWin;
      OutSpGramm;
//      if not bNotWL then if bMorlet then GetMorlet else GetDaubech;
      if (bWLdb2 or bWLdb3 or bWLdb4) then GetDaubech;
      MainStatus(bProb[1],TRUE and bProb[1],bProb[2],TRUE and bProb[2]);
    end;
    if (bProbVary1 and bProbVary2) then
    begin
      pFreeMemProb;
      pFreeMemFour;
      pFreeMemVelch;
      pFreeMemWin;
      pFreeMemWaveLet;
      pFreeMemMorlet;
      bProb[1]:=FALSE;
      bProb[2]:=FALSE;
    end;
    if bProbVary1 then
    begin
      nLoadPr:=1;
      if not bProb[2] then nProb:=1;
      if (sLoadType[nLoadPr]='_pReadChan') then _pReadChan;
      if (sLoadType[nLoadPr]='_fbReadChanTree') then _fbReadChanTree;
      if (sLoadType[nLoadPr]='_pReadBin') then _pReadBin;
      if (sLoadType[nLoadPr]='ImportChan') then ImportChan;
    end;
    if bProbVary2 then
    begin
      nLoadPr:=2;
      nProb:=2;
      if (sLoadType[nLoadPr]='_pReadChan') then _pReadChan;
      if (sLoadType[nLoadPr]='_fbReadChanTree') then _fbReadChanTree;
      if (sLoadType[nLoadPr]='_pReadBin') then _pReadBin;
      if (sLoadType[nLoadPr]='ImportChan') then ImportChan;
//      nProb:=0;
//      if bProb[1] then inc(nProb);
//      if bProb[2] then inc(nProb);
    end;
// ����-������
    Tvel:=UD_Tvel.Position/5;
    Svel:=UD_Svel.Position/5;
    bError:=CB_bError.Checked;
    if bVelchVary1 then pFreeMemVelch;
    if (bVelchVary1 or bVelchVary2) then
    begin
      MainStatus(bProb[1],FALSE,bProb[2],FALSE);
      GetVelch;
      MainStatus(bProb[1],TRUE and bProb[1],bProb[2],TRUE and bProb[2]);
    end;
// ������� ������
    bOut1Prob:=RB_bOut1St.Checked;
    bOut2Prob:=RB_bOut2St.Checked;
    Twin:=UD_Twin.Position;
    if bWinVary1 then
    begin
      WinFourStatus(RB_bSelPr1.Checked,RB_bSelPr2.Checked);
      OutFourWin;
    end;
    if bWinVary2 then
    begin
      pFreeMemWin;
      MainStatus(bProb[1],FALSE,bProb[2],FALSE);
      SetFequencyUD;
      GetFourWin;
      OutSpGramm;
      MainStatus(bProb[1],TRUE and bProb[1],bProb[2],TRUE and bProb[2]);
    end;
// �������������
    SGPalName:=Ed_SGPalName.Text;
    bDiscrSpG:=RB_bDiscrSpG.Checked;
    bSmoothSpG:=RB_bSmoothSpG.Checked;
    if bSpGrammVary then
    begin
      MainStatus(bProb[1],FALSE,bProb[2],FALSE);
      SGReadPal;
      OutSpGramm;
      MainStatus(bProb[1],TRUE and bProb[1],bProb[2],TRUE and bProb[2]);
    end;
// �������-������
    bNotWL:=RB_bNotWL.Checked;
    WLPalName:=Ed_WLPalName.Text;
    bWLdb2:=RB_bWLdb2.Checked;
    bWLdb3:=RB_bWLdb3.Checked;
    bWLdb4:=RB_bWLdb4.Checked;
    bMorlet:=RB_bMorlet.Checked;
    Kmor:=UD_Kmor.Position;
    bCorrectMor:=CB_bCorrectMor.Checked;
    bWLAxisXT:=RB_bWLAxisXT.Checked;
    bWLAxisXN:=RB_bWLAxisXN.Checked;
    if bWaveLet1 then
    begin
      MainStatus(bProb[1],FALSE,bProb[2],FALSE);
      WLOutPalette;
      if not bNotWL then if bMorlet then GetMorlet else OutDaubech;
      MainStatus(bProb[1],TRUE and bProb[1],bProb[2],TRUE and bProb[2]);
    end;
    if bWaveLet2 then
    begin
      MainStatus(bProb[1],FALSE,bProb[2],FALSE);
      pFreeMemWaveLet;
      pFreeMemMorlet;
      if (not bNotWL) then if bMorlet then GetMorlet
      else begin ReadMotherWL; GetDaubech; end;
      MainStatus(bProb[1],TRUE and bProb[1],bProb[2],TRUE and bProb[2]);
      WLStatus;
    end;
    if bWaveLet3 then WLStatus;
// ����������
    DataExportDir:=Ed_DataExportDir.Text;
    if bDataExport then DBaseSelect;
// �������
    nProb0:=UD_nProb.Position;
    nAxis0:=UD_nAxis.Position;
    bDim[1][1]:=RB_bDim11.Checked;
    bDim[2][1]:=RB_bDim21.Checked;
    bDim[3][1]:=RB_bDim31.Checked;
    bDim[1][2]:=RB_bDim12.Checked;
    bDim[2][2]:=RB_bDim22.Checked;
    bDim[3][2]:=RB_bDim32.Checked;
    bDim[1][3]:=RB_bDim13.Checked;
    bDim[2][3]:=RB_bDim23.Checked;
    bDim[3][3]:=RB_bDim33.Checked;
    bDim[1][4]:=RB_bDim14.Checked;
    bDim[2][4]:=RB_bDim24.Checked;
    bDim[3][4]:=RB_bDim34.Checked;
    dLeftG:=StrToInt(Ed_dLeftG.Text);
    dRightG:=StrToInt(Ed_dRightG.Text);
    dTopG:=StrToInt(Ed_dTopG.Text);
    dBottomG:=StrToInt(Ed_dBottomG.Text);
    dLeftD:=StrToInt(Ed_dLeftD.Text);
    dRightD:=StrToInt(Ed_dRightD.Text);
    dTopD:=StrToInt(Ed_dTopD.Text);
    dBottomD:=StrToInt(Ed_dBottomD.Text);
    if bGraph then
    begin
      _pSetWin;
      _pCS_Win;
      _pCL_Win;
    end;
  end;

  pSetAxisTitle;
  MainStatus(bProb[1],bCalc[1],bProb[2],bCalc[2]);
  WritePar;
end;
//------------------------------------------------------------------------------
procedure _pSetWin;
const
  dH=2;
var
  WCh,HCh,dHCh,nA: Integer;
begin
  with Form1 do
  begin
    WCh:=GB_SpectrumType.Left-10;
    HCh:=TS_CY.Height-(nAxis0+1)*dH;
    dHCh:=HCh div nAxis0;

    nA:=nAxis0;
    Ch_CY1.Visible:=(nA>=1);  Ch_CY2.Visible:=(nA>=2);  Ch_CY3.Visible:=(nA>=3);
    Ch_CF1.Visible:=(nA>=1);  Ch_CF2.Visible:=(nA>=2);  Ch_CF3.Visible:=(nA>=3);
    Ch_CV1.Visible:=(nA>=1);  Ch_CV2.Visible:=(nA>=2);  Ch_CV3.Visible:=(nA>=3);
    Ch_CW1.Visible:=(nA>=1);  Ch_CW2.Visible:=(nA>=2);  Ch_CW3.Visible:=(nA>=3);

    if nAxis0>=1 then
    begin
      Ch_CY1.Height:=dHCh;  Ch_CY1.Top:=dH;             Ch_CY1.Width:=WCh;
      Ch_CF1.Height:=dHCh;  Ch_CF1.Top:=dH;             Ch_CF1.Width:=WCh;
      Ch_CV1.Height:=dHCh;  Ch_CV1.Top:=dH;             Ch_CV1.Width:=WCh;
      Ch_CW1.Height:=dHCh;  Ch_CW1.Top:=dH;             Ch_CW1.Width:=WCh;
      Ch_CL1g.Height:=dHCh; Ch_CL1g.Top:=dH;            Ch_CL1g.Width:=WCh;
    end;
    if nAxis0>=2 then
    begin
      Ch_CY2.Height:=dHCh;  Ch_CY2.Top:=dHCh+2*dH;      Ch_CY2.Width:=WCh;
      Ch_CF2.Height:=dHCh;  Ch_CF2.Top:=dHCh+2*dH;      Ch_CF2.Width:=WCh;
      Ch_CV2.Height:=dHCh;  Ch_CV2.Top:=dHCh+2*dH;      Ch_CV2.Width:=WCh;
      Ch_CW2.Height:=dHCh;  Ch_CW2.Top:=dHCh+2*dH;      Ch_CW2.Width:=WCh;
      Ch_CL2g.Height:=dHCh; Ch_CL2g.Top:=dHCh+2*dH;     Ch_CL2g.Width:=WCh;
    end;
    if nAxis0>=3 then
    begin
      Ch_CY3.Height:=dHCh;  Ch_CY3.Top:=2*dHCh+3*dH;    Ch_CY3.Width:=WCh;
      Ch_CF3.Height:=dHCh;  Ch_CF3.Top:=2*dHCh+3*dH;    Ch_CF3.Width:=WCh;
      Ch_CV3.Height:=dHCh;  Ch_CV3.Top:=2*dHCh+3*dH;    Ch_CV3.Width:=WCh;
      Ch_CW3.Height:=dHCh;  Ch_CW3.Top:=2*dHCh+3*dH;    Ch_CW3.Width:=WCh;
      Ch_CL3g.Height:=dHCh; Ch_CL3g.Top:=2*dHCh+3*dH;   Ch_CL3g.Width:=WCh;
    end;
    PageC.ActivePageIndex:=0;
    TS_CY.Update;
    PageC.ActivePageIndex:=1;
    TS_CF.Update;
    PageC.ActivePageIndex:=2;
    TS_CV.Update;
    PageC.ActivePageIndex:=3;
    TS_CW.Update;
    PageC.ActivePageIndex:=5;
    TS_CL.Update;
  end;
end;
//------------------------------------------------------------------------------
procedure SetH(Sender: TObject);
begin
  with Form1 do
  begin
    if Sender=Ed_H1 then
    begin
      H1:=StrToFloat(Ed_H1.Text);
      if H1>=H2 then H1:=H2-0.1;
      UD_H1.Position:=Round(H1*10);
    end;
    if Sender=UD_H1 then
    begin
      H1:=UD_H1.Position/10;
      if H1>=H2 then H1:=H2-0.1;
      Ed_H1.Text:=FloatToStr(H1);
    end;
    if Sender=Ed_H2 then
    begin
      H2:=StrToFloat(Ed_H2.Text);
      if H2<=H1 then H2:=H1+0.1;
      UD_H2.Position:=Round(H2*10);
    end;
    if Sender=UD_H2 then
    begin
      H2:=UD_H2.Position/10;
      if H2<=H1 then H2:=H1+0.1;
      Ed_H2.Text:=FloatToStr(H2);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure Center(N1,N2: Integer; pC0,pY0: pSingle);
var
  i: Integer;
  D,A00,A01,A11,B0,B1,a,b: Real;
  pC,pY: pSingle;
begin
  A00:=N2-N1+1; A01:=0; A11:=0; B0:=0; B1:=0;
  for i:=N1 to N2 do
  begin
    pC:=pC0; inc(pC,i);
    A01:=A01+i;
    A11:=A11+i*i;
    B0:=B0+pC^;
    B1:=B1+pC^*i;
  end;
  D:=A00*A11-A01*A01;
  a:=(B0*A11-B1*A01)/D;
  b:=(B1*A00-B0*A01)/D;

  for i:=N1 to N2 do
  begin
    pC:=pC0; inc(pC,i);
    pY:=pY0; inc(pY,i);
    pY^:=pC^-a-b*i;
  end;
end;
//------------------------------------------------------------------------------
procedure Filter(N1,N2: Integer; pY0: pSingle);
var
  i,dN: Integer;
  w: Real;
  pY: pSingle;
begin
  if bNoFilter then Exit;
  dN:=N2-N1+1;
  for i:=N1 to N2 do
  begin
    pY:=pY0; inc(pY,i);
    w:=2*Pi*(i-N1)/dN;
    if bBlackman then
     pY^:=pY^*(0.42-0.50*cos(w)+0.08*cos(2*w))*2.3810;
    if bHanning then
     pY^:=0.5*pY^*(1-cos(w))*2;
    if bHamming then
     pY^:=pY^*(0.54-0.46*cos(w))*1.8519;
    if bBlackmanHarris then
     pY^:=pY^*(0.42323-0.49755*cos(w)+0.07922*cos(2*w))*2.3628;
    if bExactBlackman then
     pY^:=pY^*(7938-9240*cos(w)+1430*cos(2*w))/18608*2.3442;
    if bTriangle then pY^:=pY^*(0.2156-0.4166*cos(w)+
     0.2773*cos(2*w)-0.08358*cos(3*w)+0.006947*cos(4*w))*4.6382;

    w:=(2*i-dN)/dN;
    if bFlatTop then pY^:=pY^*(1-abs(w));
  end;
end;
//------------------------------------------------------------------------------
procedure SetAmpl(Sender: TObject);
begin
  pSetAxisTitle;
end;
//------------------------------------------------------------------------------
function _fExp(R0: Real): Integer;
var
  R,m: Real;
begin
  R0:=abs(R0);
  R:=R0;
  m:=1;
  While R>10 do begin m:=m*10; R:=R0/m; end;
  While R<1 do begin m:=m/10; R:=R0/m; end;
  _fExp:=Round(log10(m));
end;
//------------------------------------------------------------------------------
function _frSetMult(I1,I2: Integer; p: pSingle; Lb: TLabel): Real;
var
  i,m: Integer;
  Mx,Mult: Real;
begin
  Mx:=abs(p^);
  for i:=I1+1 to I2 do begin inc(p); if abs(p^)>Mx then Mx:=abs(p^); end;
  m:=_fExp(Mx);
  Mult:=IntPower(10,m);
  Lb.Caption:=IntToStr(m);
  _frSetMult:=Mult;
end;
//------------------------------------------------------------------------------
procedure pSetAxisTitle;
var
  Ax: Byte;
begin
  with Form1 do
  begin
    for Ax:=1 to 3 do
    begin
      if bDim[Ax,1] then begin sPr1[Ax]:='��������,'; sPr2[Ax]:='      ��'; end;
      if bDim[Ax,2] then begin sPr1[Ax]:='    ����,'; sPr2[Ax]:='      ��'; end;
      if bDim[Ax,3] then begin sPr1[Ax]:='  ������,'; sPr2[Ax]:='     �*�'; end;
      if bDim[Ax,4] then begin sPr1[Ax]:=         ''; sPr2[Ax]:='      ��'; end;
    end;

    if RB_bRemvl.Checked then for Ax:=1 to 3 do
    begin
      if bDim[Ax,1] then begin sAT1[Ax]:='  ��������,'; sAT2[Ax]:='        ��'; end;
      if bDim[Ax,2] then begin sAT1[Ax]:='      ����,'; sAT2[Ax]:='        ��'; end;
      if bDim[Ax,3] then begin sAT1[Ax]:='    ������,'; sAT2[Ax]:='       �*�'; end;
      if bDim[Ax,4] then begin sAT1[Ax]:=           ''; sAT2[Ax]:='        ��'; end;
    end;

    if RB_bPower.Checked then for Ax:=1 to 3 do
    begin
      if bDim[Ax,1] then begin sAT1[Ax]:='��������^2,'; sAT2[Ax]:='   ��^2/��'; end;
      if bDim[Ax,2] then begin sAT1[Ax]:='    ����^2,'; sAT2[Ax]:='   ��^2/��'; end;
      if bDim[Ax,3] then begin sAT1[Ax]:='  ������^2,'; sAT2[Ax]:='(�*�)^2/��'; end;
      if bDim[Ax,4] then begin sAT1[Ax]:=           ''; sAT2[Ax]:='   ��^2/��'; end;
    end;
    if RB_bLog10.Checked then for Ax:=1 to 3 do
                         begin sAT1[Ax]:='  ��������,'; sAT2[Ax]:='        ��'; end;

//Proba
    Ch_CY1.LeftAxis.Title.Caption:=Trim(sPr1[1])+' '+Trim(sPr2[1]);
    Ch_CY2.LeftAxis.Title.Caption:=Trim(sPr1[2])+' '+Trim(sPr2[2]);
    Ch_CY3.LeftAxis.Title.Caption:=Trim(sPr1[3])+' '+Trim(sPr2[3]);
// ����� ������
    Ch_CF1.LeftAxis.Title.Caption:=Trim(sAT1[1])+' '+Trim(sAT2[1]);
    Ch_CF2.LeftAxis.Title.Caption:=Trim(sAT1[2])+' '+Trim(sAT2[2]);
    Ch_CF3.LeftAxis.Title.Caption:=Trim(sAT1[3])+' '+Trim(sAT2[3]);
// ���� ������
    Ch_CV1.LeftAxis.Title.Caption:=Trim(sAT1[1])+' '+Trim(sAT2[1]);
    Ch_CV2.LeftAxis.Title.Caption:=Trim(sAT1[2])+' '+Trim(sAT2[2]);
    Ch_CV3.LeftAxis.Title.Caption:=Trim(sAT1[3])+' '+Trim(sAT2[3]);
// ������� ����� ������
    Ch_CW1.LeftAxis.Title.Caption:=Trim(sAT1[1])+' '+Trim(sAT2[1]);
    Ch_CW2.LeftAxis.Title.Caption:=Trim(sAT1[2])+' '+Trim(sAT2[2]);
    Ch_CW3.LeftAxis.Title.Caption:=Trim(sAT1[3])+' '+Trim(sAT2[3]);
// ��������������
    Ch_CS11.Title.Text[0]:=Trim(sAT1[1])+' '+Trim(sAT2[1]);
    Ch_CS21.Title.Text[0]:=Trim(sAT1[2])+' '+Trim(sAT2[2]);
    Ch_CS31.Title.Text[0]:=Trim(sAT1[3])+' '+Trim(sAT2[3]);
    Ch_CS12.Title.Text[0]:=Trim(sAT1[1])+' '+Trim(sAT2[1]);
    Ch_CS22.Title.Text[0]:=Trim(sAT1[2])+' '+Trim(sAT2[2]);
    Ch_CS32.Title.Text[0]:=Trim(sAT1[3])+' '+Trim(sAT2[3]);
// ������� �����
    if bMorlet then
    begin
      Ch_CL11.Title.Text[0]:=Trim(sAT1[1])+' '+Trim(sAT2[1]);
      Ch_CL21.Title.Text[0]:=Trim(sAT1[2])+' '+Trim(sAT2[2]);
      Ch_CL31.Title.Text[0]:=Trim(sAT1[3])+' '+Trim(sAT2[3]);
      Ch_CL12.Title.Text[0]:=Trim(sAT1[1])+' '+Trim(sAT2[1]);
      Ch_CL22.Title.Text[0]:=Trim(sAT1[2])+' '+Trim(sAT2[2]);
      Ch_CL32.Title.Text[0]:=Trim(sAT1[3])+' '+Trim(sAT2[3]);
    end
    else begin
      Ch_CL11.Title.Text[0]:='���������, ��';
      Ch_CL21.Title.Text[0]:='���������, ��';
      Ch_CL31.Title.Text[0]:='���������, ��';
      Ch_CL12.Title.Text[0]:='���������, ��';
      Ch_CL22.Title.Text[0]:='���������, ��';
      Ch_CL32.Title.Text[0]:='���������, ��';
    end;
  end;
end;
//==============================================================================

end.

