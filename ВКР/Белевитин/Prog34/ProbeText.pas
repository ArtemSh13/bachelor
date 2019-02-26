unit ProbeText;

interface
uses SysUtils, Math, Chart, Series, StdCtrls;

procedure pProcLength(n: Integer);
function _fSetTC: Boolean;
procedure _pSetNC;
function  _fbOutTreeVText: Boolean;
function _fbGetTitleType: Boolean;
procedure _pReadTitle;
procedure _pReadChan;
procedure _pReadBin;
function  _fbReadChanTree: Boolean;
procedure pOutProb;

implementation
uses Main, Common;

var
  ChannName: array[1..nChannMax] of String;
  iTitleType,iChannType: Integer;
  LineC: array[0..3,0..3] of Byte;
  Mult: array[1..3] of Real;
  Kod: set of Char=['0'..'9','+','-'];
//==============================================================================
procedure pProcLength(n: Integer);
begin
  tProbLength[nLoadPr]:=Trunc(n*dT);
end;
//------------------------------------------------------------------------------
function _fSetTC: Boolean;
var
  St: String;
begin
  _fSetTC:=FALSE;

  if nProb>=1 then St:=' Длина Пробы, сек: '+IntToStr(tProbLength[1])+' (1) ';
  if nProb>=2 then St:=St+IntToStr(tProbLength[2])+'(2)';
  Form1.Ed_Status2.Text:=St;
  Form1.Ed_Status2.Update;

  if (tProcStart[nLoadPr]+tProcInter-1)>tProbLength[nLoadPr] then
  begin
    St:=St+' Уточните границы обработки Пробы '+IntToStr(nLoadPr);
    Form1.Ed_Status2.Text:=St;
    Exit;
  end;

  TC1[nLoadPr]:=tProcStart[nLoadPr];
  TC2[nLoadPr]:=tProcStart[nLoadPr]+tProcInter-1;
  TC0:=tProcInter;

  _fSetTC:=TRUE;
end;
//------------------------------------------------------------------------------
procedure _pSetNC;
begin
  NCY1[nLoadPr]:=Round((TC1[nLoadPr]-1)/dT)+1;
  NCY0:=Round(tProcInter/dT);
end;
//------------------------------------------------------------------------------
function Convert(TDate: String): String;
var
  n,nP: Integer;
  D: String;
  S: String[1];
begin
  D:='';
  nP:=0;
  for n:=1 to Length(TDate) do
  begin
    S:=Copy(TDate,n,1);
    if S='.' then inc(nP);
    if (nP=3)and(TDate[n]='.') then S:=' ';
    if (nP>3)and(TDate[n]='.') then S:=':';
    D:=D+S;
  end;
  Convert:=D;
end;
//------------------------------------------------------------------------------
function _fbGetTitleType: Boolean;
var
  T: TextFile;
  n: Integer;
  C: array[1..2] of Char;
  EoL: Boolean;
begin
  _fbGetTitleType:=FALSE;
// iChannType=1 - нет заголовка, нет названия каналов                 0 0
// iChannType=2 - нет заголовка, есть названия каналов                0 1
// iTitleType=1 - есть заголовок СТАРЫЙ, нет названия каналов         1 0
// iTitleType=2 - есть заголовок НОВЫЙ, есть названия каналов         2 1
// iTitleType=3 - есть заголовок НЕСТАНДАРТНЫЙ, нет названия каналов  3 0

  Form1.OpenD1.InitialDir:=WorkDir;
  if Form1.OpenD1.Execute then ProbeName[nLoadPr]:=Form1.OpenD1.FileName
  else Exit;
  WorkDir:=ExtractFileDir(ProbeName[nLoadPr]);

  AssignFile(T,ProbeName[nLoadPr]);
  ReSet(T);
    for n:=1 to 2 do
    begin
      C[n]:=' ';
      While C[n]=' ' do Read(T,C[n]);
      ReadLn(T);
      EoL:=EoLn(T);
    end;

    if EoL then begin iTitleType:=0; iChannType:=3; LineC[0,3]:=0; end else
    begin
      if (C[1] in Kod)and(C[2] in Kod) then
      begin iTitleType:=0; iChannType:=0; LineC[0,0]:=0; end;

      if (C[1]='%')and(C[2] in Kod) then
      begin iTitleType:=0; iChannType:=1; LineC[0,1]:=0; end;

      if (not(C[1] in Kod)and(C[1]<>'%'))and(C[2] in Kod) then
      begin iTitleType:=1; iChannType:=0; LineC[1,0]:=9; end;

      if (C[1]='%')and(C[2]='%') then
      begin iTitleType:=2; iChannType:=1; LineC[2,1]:=10; end;

      if (C[1] in Kod)and(not(C[2] in Kod)and(C[1]<>'%')) then
      begin iTitleType:=3; iChannType:=0; LineC[3,0]:=7; end;
    end;
  CloseFile(T);

  if iTitleType>0 then bTitle:=TRUE else bTitle:=FALSE;
  if iChannType>0 then bChann:=TRUE else bChann:=FALSE;

  _fbGetTitleType:=TRUE;
end;
//------------------------------------------------------------------------------
procedure _pReadTitle;
var
  T: TextFile;
begin
  St_FIO[nLoadPr]:='';
  St_BDate[nLoadPr]:='';
  St_Group[nLoadPr]:='';
  St_TDate[nLoadPr]:='';
  St_Test[nLoadPr]:='';
  St_Proba[nLoadPr]:='';

  if bTitle then
  begin
    Assign(T,ProbeName[nLoadPr]);
    ReSet(T);

    if iTitleType=1 then
    begin
      ReadLn(T,St_FIO[nLoadPr]);
      ReadLn(T,St_BDate[nLoadPr]);
      ReadLn(T);
      ReadLn(T,St_Group[nLoadPr]);
      ReadLn(T);
      ReadLn(T,St_TDate[nLoadPr]);
      ReadLn(T,St_Test[nLoadPr]);
      ReadLn(T,St_Proba[nLoadPr]);
    end;

    if iTitleType=2 then
    begin
      ReadLn(T,St_FIO[nLoadPr]);     Delete(St_FIO[nLoadPr],1,1);
      ReadLn(T,St_BDate[nLoadPr]);   Delete(St_BDate[nLoadPr],1,1);
      ReadLn(T);
      ReadLn(T,St_Group[nLoadPr]);   Delete(St_Group[nLoadPr],1,1);
      ReadLn(T);
      ReadLn(T,St_TDate[nLoadPr]);   Delete(St_TDate[nLoadPr],1,1);
      ReadLn(T,St_Test[nLoadPr]);    Delete(St_Test[nLoadPr],1,1);
      ReadLn(T,St_Proba[nLoadPr]);   Delete(St_Proba[nLoadPr],1,1);
    end;

    if iTitleType=3 then
    begin
      ReadLn(T);
      ReadLn(T,St_FIO[nLoadPr]);
      ReadLn(T,St_Test[nLoadPr]);
      ReadLn(T,St_Proba[nLoadPr]);
      ReadLn(T);
      ReadLn(T);
      ReadLn(T,St_TDate[nLoadPr]);
      St_TDate[nLoadPr]:=Convert(St_TDate[nLoadPr]);
    end;
    CloseFile(T);
  end else begin St_FIO[nLoadPr]:='ФИО'; St_BDate[nLoadPr]:='01.01.1900'; end;
end;
//------------------------------------------------------------------------------
procedure _pReadChan;
var
  T: TextFile;
  i,n,Ax: Integer;
  B: String[1];
  R: String[15];
  pCY: pSingle;
begin
  sLoadType[nLoadPr]:='_pReadChan';

// Определение количества колонок
  AssignFile(T,ProbeName[nLoadPr]);
  ReSet(T);
    for n:=1 to LineC[iTitleType,iChannType] do ReadLn(T);
    n:=0;
    Read(T,B);
    While not EoLn(T) do
    begin
      While (not EoLn(T))and((B=' ')or(B=#9)) do Read(T,B);
      if not EoLn(T) then inc(n);
      While (not EoLn(T))and(B<>' ')and(B<>#9) do Read(T,B);
    end;
    nAxis[nLoadPr]:=Min(n,nAxis0);
  CloseFile(T);
  if nAxis[2]>nAxis[1] then nAxis[2]:=nAxis[1];
// Определение длины пробы
  AssignFile(T,ProbeName[nLoadPr]);
  ReSet(T);
    i:=0;
    While (not EoF(T)) do begin inc(i); ReadLn(T); end;
  CloseFile(T);

  if nLoadPr=1 then MainStatus(FALSE,FALSE,bProb[2],bCalc[2]);
  if nLoadPr=2 then MainStatus(bProb[1],bCalc[1],FALSE,FALSE);

  pProcLength(i);
  if not _fSetTC then Exit;
  _pSetNC;

  if (pY0=nil) then GetMem(pY0,(NCY0+1)*cSS);
  for Ax:=1 to nAxis[nLoadPr] do if (pCY0[Ax,nLoadPr]=nil) then
   GetMem(pCY0[Ax,nLoadPr],(NCY0+1)*cSS);

  AssignFile(T,ProbeName[nLoadPr]);
  ReSet(T);
    for n:=1 to LineC[iTitleType,iChannType] do ReadLn(T);
    for i:=1 to NCY1[nLoadPr]-1 do ReadLn(T);

    for i:=1 to NCY0 do
    begin
      for Ax:=1 to nAxis[nLoadPr] do
      begin
        pCY:=pCY0[Ax,nLoadPr]; inc(pCY,i);
        Read(T,R);
        pCY^:=__SetDecSeparator(R);
      end;
      ReadLn(T);
    end;
  CloseFile(T);
  AxisName[1,nLoadPr]:='Стабилографический сигнал X';
  AxisName[2,nLoadPr]:='Стабилографический сигнал Y';

  if nLoadPr=1 then Form1.Ed_ProbeName1.Text:=ProbeName[nLoadPr];
  if nLoadPr=2 then Form1.Ed_ProbeName2.Text:=ProbeName[nLoadPr];

  if nLoadPr=1 then MainStatus(TRUE,FALSE,bProb[2],bCalc[2]);
  if nLoadPr=2 then MainStatus(bProb[1],bCalc[1],TRUE,FALSE);

  Form1.Update;
  Form1.OutAll;
  if nLoadPr=1 then MainStatus(TRUE,TRUE,bProb[2],bCalc[2]);
  if nLoadPr=2 then MainStatus(bProb[1],bCalc[1],TRUE,TRUE);
end;
//------------------------------------------------------------------------------
function _fbOutTreeVText: Boolean;
var
  T: TextFile;
  i,j,n: Integer;
  R: String[1];
  ProbeTitle: String;
begin
  _fbOutTreeVText:=FALSE;
  Form1.GB_VectorSelect.Visible:=FALSE;

  for n:=1 to nChannMax do ChannName[n]:='';

  Assign(T,ProbeName[nLoadPr]);
  ReSet(T);
    for n:=1 to LineC[iTitleType,iChannType] do ReadLn(T);

    Read(T,R);
    i:=0;
    n:=1;
    While not EoLn(T) do
    begin
      Read(T,R);
      if R=' ' then inc(i) else i:=0;
      if i<3 then ChannName[n]:=ChannName[n]+R
      else begin
        i:=0;
        inc(n);
        j:=0;
        While (j<50)and(R=' ') do begin inc(j); Read(T,R); end;
        if j>50 then Break;
        ChannName[n]:=ChannName[n]+R;
      end;
    end;
    nChann:=n;
  CloseFile(T);

  if (not bTitle) then ProbeTitle:='Проба - Без заголовка'
  else ProbeTitle:=St_FIO[nLoadPr]+' '+St_Proba[nLoadPr];

  Form1.TreeV.Items.Add(nil,ProbeTitle);
  for n:=1 to nChann do
   Form1.TreeV.Items.AddChild(Form1.TreeV.Items.Item[0],ChannName[n]);

  Form1.Pl_TreeV.Visible:=TRUE;

  _fbOutTreeVText:=TRUE;
end;
//------------------------------------------------------------------------------
function _fbReadChanTree: Boolean;
var
  T: TextFile;
  i,n,Ax: Integer;
  R: Real;
  pCY: pSingle;
begin
  _fbReadChanTree:=FALSE;
  sLoadType[nLoadPr]:='_fbReadChanTree';

  nAxis[nLoadPr]:=nSelectChann[nLoadPr];
  if (nAxis[2]>nAxis[1]) then nAxis[2]:=nAxis[1];

// Определение длины пробы
  AssignFile(T,ProbeName[nLoadPr]);
  ReSet(T);
    i:=0;
    While (not EoF(T)) do begin inc(i); ReadLn(T); end;
  CloseFile(T);

  if nLoadPr=1 then MainStatus(FALSE,FALSE,bProb[2],bCalc[2]);
  if nLoadPr=2 then MainStatus(bProb[1],bCalc[1],FALSE,FALSE);

  pProcLength(i);
  if not _fSetTC then Exit;
  _pSetNC;

  if (pY0=nil) then GetMem(pY0,(NCY0+1)*cSS);
  for Ax:=1 to nAxis[nLoadPr] do if (pCY0[Ax,nLoadPr]=nil) then
   GetMem(pCY0[Ax,nLoadPr],(NCY0+1)*cSS);

  AssignFile(T,ProbeName[nLoadPr]);
  ReSet(T);
    for n:=1 to LineC[iTitleType,iChannType]+1 do ReadLn(T);
    for i:=1 to NCY1[nLoadPr]-1 do ReadLn(T);

    for i:=1 to NCY0 do for Ax:=1 to nAxis[nLoadPr] do
    begin
      for n:=1 to SelChann[nLoadPr,Ax]-1 do Read(T,R);
      pCY:=pCY0[Ax][nLoadPr]; inc(pCY,i);
      ReadLn(T,pCY^);
    end;
  CloseFile(T);

  if nLoadPr=1 then MainStatus(TRUE,FALSE,bProb[2],bCalc[2]);
  if nLoadPr=2 then MainStatus(bProb[1],bCalc[1],TRUE,FALSE);

  for Ax:=1 to 3 do AxisName[Ax,nLoadPr]:='';
  for Ax:=1 to nAxis[nLoadPr] do
  begin
    AxisName[Ax,nLoadPr]:=ChannName[SelChann[nLoadPr,Ax]];
    While AxisName[Ax,nLoadPr][1] in ['.','0'..'9'] do
     Delete(AxisName[Ax,nLoadPr],1,1);
  end;

  Form1.Ed_ProbeName1.Text:=ProbeName[1];
  Form1.Ed_ProbeName2.Text:=ProbeName[2];
  _fbReadChanTree:=TRUE;

  Form1.Update;
  Form1.OutAll;
  if nLoadPr=1 then MainStatus(TRUE,TRUE,bProb[2],bCalc[2]);
  if nLoadPr=2 then MainStatus(bProb[1],bCalc[1],TRUE,TRUE);
end;
//------------------------------------------------------------------------------
procedure _pReadBin;
var
  C: SmallInt;
  i: LongWord;
  B: File of SmallInt;
  pCY: pSingle;
begin
  sLoadType[nLoadPr]:='_pReadBin';

  if (ProbeName[nLoadPr]='') then
  begin
    Form1.OpenD1.InitialDir:=WorkDir;
    if Form1.OpenD1.Execute then ProbeName[nLoadPr]:=Form1.OpenD1.FileName
    else Exit;
    WorkDir:=ExtractFileDir(ProbeName[nLoadPr]);
  end;

// Определение длины пробы
  AssignFile(B,ProbeName[nLoadPr]);
  ReSet(B);
    i:=0;
    While (not EoF(B)) do begin inc(i); Read(B,C); end;
  CloseFile(B);

  pProcLength(i);
  if not _fSetTC then Exit;
  _pSetNC;

  if (pY0=nil) then GetMem(pY0,(NCY0+1)*cSS);
  if (pCY0[1,nLoadPr]=nil) then GetMem(pCY0[1,nLoadPr],(NCY0+1)*cSS);

  nAxis[nLoadPr]:=1;

  AssignFile(B,ProbeName[nLoadPr]);
  ReSet(B);
    for i:=1 to NCY1[nLoadPr]-1 do Read(B,C);
    for i:=1 to NCY0 do
    begin
      Read(B,C);
      pCY:=pCY0[1][nLoadPr]; inc(pCY,i);
      pCY^:=C;
    end;
  CloseFile(B);
  AxisName[1,nLoadPr]:='Оцифрованный сигнал';

  if nLoadPr=1 then MainStatus(TRUE,FALSE,bProb[2],bCalc[2]);
  if nLoadPr=2 then MainStatus(bProb[1],bCalc[1],TRUE,FALSE);

  Form1.Ed_ProbeName1.Text:=ProbeName[1];
  Form1.Ed_ProbeName2.Text:=ProbeName[2];

  Form1.Update;
  Form1.OutAll;
  if nLoadPr=1 then MainStatus(TRUE,TRUE,bProb[2],bCalc[2]);
  if nLoadPr=2 then MainStatus(bProb[1],bCalc[1],TRUE,TRUE);

  bChann:=FALSE;
end;
//------------------------------------------------------------------------------
procedure pOutProb;
var
  Pr,Ax: Byte;
  i,N,T1,T2: Integer;
  pSs: array[1..3,0..2] of ^TLineSeries;
  pLb: array[1..3] of ^TLabel;
  pCY,pY: pSingle;
  pCh: array[1..3] of ^TChart;
begin
  if not bProb[1] then Exit;

  with Form1 do
  begin
    Ed_Status.Text:=' Проба';
    Ed_Status.Update;

    pCh[1]:=@Ch_CY1;    pLb[1]:=@Lb_MultCY1b;
    pCh[2]:=@Ch_CY2;    pLb[2]:=@Lb_MultCY2b;
    pCh[3]:=@Ch_CY3;    pLb[3]:=@Lb_MultCY3b;
    pSs[1,0]:=@Ss_CY10; pSs[1,1]:=@Ss_CY11; pSs[1,2]:=@Ss_CY12;
    pSs[2,0]:=@Ss_CY20; pSs[2,1]:=@Ss_CY21; pSs[2,2]:=@Ss_CY22;
    pSs[3,0]:=@Ss_CY30; pSs[3,1]:=@Ss_CY31; pSs[3,2]:=@Ss_CY32;

    for Ax:=1 to 3 do pCh[Ax].Title.Text[0]:='';
    if bOut[1] then for Ax:=1 to nAxis[1] do
     pCh[Ax].Title.Text[0]:=Trim(AxisName[Ax,1]);
    if bOut[2] then for Ax:=1 to nAxis[2] do
     pCh[Ax].Title.Text[0]:=pCh[Ax].Title.Text[0]+'    '+AxisName[Ax,2];

    if (bOut[1] and bOut[2]) then
    begin
      if ((nProb=1)or((nProb=2)and(NCY1[1]=NCY1[2]))) then
      begin
        N:=NCY1[1]-1; T1:=TC1[1]-1; T2:=TC2[1];
      end;
      if ((nProb=2)and(NCY1[1]<>NCY1[2])) then
      begin
        N:=0;         T1:=0;        T2:=TC0;
      end;
    end;
    if ((nProb=2)and(bOut[1] and (not bOut[2]))) then
    begin
      N:=NCY1[1]-1; T1:=TC1[1]-1; T2:=TC2[1];
    end;
    if ((nProb=2)and((not bOut[1]) and bOut[2])) then
    begin
      N:=NCY1[2]-1; T1:=TC1[2]-1; T2:=TC2[2];
    end;

    for Pr:=0 to nProb0 do for Ax:=1 to nAxis0 do pSs[Ax,Pr].Clear;

    for Pr:=1 to nProb do if bOut[Pr] then for Ax:=1 to nAxis[Pr] do
    begin
      if RB_bInit.Checked then for i:=1 to NCY0 do
      begin
        pCY:=pCY0[Ax,Pr]; inc(pCY,i);
        pY:=pY0; inc(pY,i);
        pY^:=pCY^;
      end;

      if RB_bCentre.Checked then
      begin
        Center(1,NCY0,pCY0[Ax,Pr],pY0);
      end;

      if RB_bFiltr.Checked  then
      begin
        Center(1,NCY0,pCY0[Ax,Pr],pY0);
        Filter(1,NCY0,pY0);
      end;

      if ((not(bOut[1] and bOut[2]))or((bOut[1] and bOut[2])and(Pr=1))) then
       Mult[Ax]:=_frSetMult(1,NCY0, pY0, pLb[Ax]^);

      pY:=pY0; inc(pY); pY0^:=pY^;
      for i:=0 to NCY0 do
      begin
        pY:=pY0; inc(pY,i);
        pSs[Ax,Pr].AddXY((i+N)*dT,pY^/Mult[Ax]);
      end;

      if RB_bCentre.Checked or RB_bFiltr.Checked then
      begin
        pSs[Ax,0].AddXY(T1,0);
        pSs[Ax,0].AddXY(T2,0);
      end;
      pCh[Ax].Update;
    end;

    Ed_Status.Text:='';
    Ed_Status.Update;
  end;
end;
//==============================================================================

end.

