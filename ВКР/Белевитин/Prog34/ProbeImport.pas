unit ProbeImport;

interface
uses SysUtils, ComObj, ActiveX, Types, Math, ComCtrls, StdCtrls;

function OutTreeVImport: Boolean;
function ImportChan: Boolean;

implementation
uses Main, Common, ProbeText;

type
  ISignalExporter = interface(IUnknown)
    ['{5F5CF2EC-9F6E-453C-8EE5-C7003BE498A7}']
    function GetTestCount(out Count: Integer): HResult; stdcall;
    function GetTestID(Index: Integer; out TestID: Integer): HResult; stdcall;
    function GetLastTestID(out TestID: Integer): HResult; stdcall;
    function GetActiveTestID(out TestID: Integer): HResult; stdcall;
    function GetOpenedTestCount(out Count: Integer): HResult; stdcall;
    function GetOpenedTestID(Index: Integer; out TestID: Integer): HResult; stdcall;
    function GetProbesCount(TestID: Integer; out Count: Integer): HResult; stdcall;
    function GetProbeID(TestID: Integer; Index: Integer; out ProbeID: Integer): HResult; stdcall;
    function GetChannelCount(ProbeID: Integer; out Count: Integer): HResult; stdcall;
    function GetChannelID(ProbeID: Integer; Index: Integer; out ChannelID: Integer): HResult; stdcall;
    function GetChannelType(ChannelID: Integer; out ChannelType: Integer): HResult; stdcall;
    function GetSignal(ProbeID: Integer; ChannelID: Integer; out Signal: PSafeArray): HResult; stdcall;
    function GetPatientName(TestID: Integer; out Name: PAnsiChar): HResult; stdcall;
    function GetPatientBirthday(TestID: Integer; out Birthday: TDateTime): HResult; stdcall;
    function GetTestName(TestID: Integer; out Name: PAnsiChar): HResult; stdcall;
    function GetTestDateTime(TestID: Integer; out DateTime: TDateTime): HResult; stdcall;
    function GetProbeName(ProbeID: Integer; out Name: PAnsiChar): HResult; stdcall;
  end;  // of ISignalExporter

const
  CLASS_SignalExporter: TGUID='{45809734-A07A-4718-9C54-D62188776B87}';
//  Константы каналов. Жестко прошиты в StabMed2. От версии не меняются.
  ChanName: array[0..18] of String=
              ('Стабилографический сигнал',             // 10
               'Стабилографический сигнал 1',           // 11
               'Стабилографический сигнал 2',           // 12
               'Стабилографический сигнал спинки',      // 15
               'Стабилографический сигнал стопы',       // 16
               'Стабилографический сигнал рук',         // 17
               'Моменты MX и MY левого подлокотника',   // 18
               'Моменты MX и MY правого подлокотника',  // 19
               'Баллистограмма',                        // 20
               'Баллистограмма 1',                      // 21
               'Баллистограмма 2',                      // 22
               'Баллистограмма спинки',                 // 25
               'Баллистограмма стопы',                  // 26
               'Баллистограмма рук',                    // 27
               'Баллистограмма левого подлокотника',    // 28
               'Баллистограмма правого подлокотника',   // 29
               'Пульс',                                 // 41
               'Дыхание 1',                             // 61
               'Главный вектор сил и моментов');        //380   Выдает 180 ?

var
  J0,TestID: Integer;
  Conv: array[10..500] of Integer;
  Sign: array of TDoubleDynArray;

//==============================================================================
function OutTreeVImport: Boolean;
var
  p,c,PrC,ChC,ProbeID,ChanId,It1,It2: Integer;
  StabMed2: ISignalExporter;
  A,B : PAnsiChar;
begin
  Form1.Ed_Status2.Text:=' Обращение к программе StabMed. Ждите';
  Form1.Ed_Status2.Update;
  OutTreeVImport:=FALSE;

  for c:=10 to 180 do Conv[c]:=0;
  Conv[10]:= 0;  Conv[11]:= 1;  Conv[12]:= 2;  Conv[15]:= 3;  Conv[16]:= 4;
  Conv[17]:= 5;  Conv[18]:= 6;  Conv[19]:= 7;  Conv[20]:= 8;  Conv[21]:= 9;
  Conv[22]:=10;  Conv[25]:=11;  Conv[26]:=12;  Conv[27]:=13;  Conv[28]:=14;
  Conv[29]:=15;  Conv[41]:=16;  Conv[61]:=17;  Conv[380]:=18;

// Создаем COM-объект и запрашиваем у него интерфейс
  StabMed2 := CreateComObject(CLASS_SignalExporter) as ISignalExporter;

  Form1.TreeV.Items.Clear;
  Form1.GB_VectorSelect.Visible:=FALSE;

  if StabMed2 <> nil then with Form1 do
  begin
    StabMed2.GetActiveTestID(TestID);
    StabMed2.GetPatientName(TestID,A);
    if A=nil then
    begin
      Ed_Status2.Text:=' Загрузите программу StabMed и выберите пробу';
      Exit;
    end else Ed_Status2.Text:='';
    StabMed2.GetTestName(TestID,B);
    TreeV.Items.Add(nil,A+' '+B);

    StabMed2.GetProbesCount(TestID,PrC);

    It2:=0;
    for p:=0 to PrC-1 do
    begin
      StabMed2.GetProbeID(TestID,p,ProbeID);
      StabMed2.GetProbeName(ProbeID,A);

      inc(It2); It1:=It2;
      TreeV.Items.AddChild(TreeV.Items.Item[0],A);

      StabMed2.GetChannelCount(ProbeID,ChC);

      for c:=0 to ChC-2 do
      begin
        StabMed2.GetChannelID(ProbeID,c,ChanId);
        if ChanID=180 then ChanID:=380;
        if ChanID=380 then Form1.GB_VectorSelect.Visible:=TRUE;
        if ((ChanId>=10)and(ChanId<=61))or(ChanId=380) then
        begin
          inc(It2);
          TreeV.Items.AddChild(TreeV.Items.Item[It1],ChanName[Conv[ChanId]]);
        end;
      end;
    end;
    StabMed2 := nil;
  end;
  Form1.Pl_TreeV.Visible:=TRUE;
  OutTreeVImport:=TRUE;
end;
//------------------------------------------------------------------------------
function __GetSignal(Server: ISignalExporter; ProbeID,ChanID: Integer): Boolean;
type
  TBounds = array [0..1] of
  record
    L, U : Integer;
  end;
  TIndexes = packed record
    Row, Col : DWord;
  end;
var
  Signal : PSafeArray;
  I, J   : Integer;
  Bnd    : TBounds;
  Idxs   : TIndexes;
  Value  : OleVariant;
begin
  Result := false;
  Server.GetSignal ( ProbeID, ChanID, Signal );
// Получим диапазон измерений массива
  if Signal <> nil then
  begin
    for I:=0 to 1 do
    begin
      SafeArrayGetLBound ( Signal, I+1, Bnd[I].L );
      SafeArrayGetUBound ( Signal, I+1, Bnd[I].U );
    end;

// Создадим временный массив
    SetLength ( Sign, Bnd[0].U - Bnd[0].L + 1);
    for I:=0 to Length(Sign) - 1 do
     SetLength ( Sign[I], Bnd[1].U - Bnd[1].L + 1 );

// Разбираем массив на составляющие
    for I := Bnd[0].L to Bnd[0].U do
    begin
      for J := Bnd[1].L to Bnd[1].U do
      begin
        Idxs.Row := I;
        Idxs.Col := J;
        // Получение элемента массива
        if SafeArrayGetElement ( Signal, Idxs, Value ) = S_OK then
          Sign[I][J] := Value
        else
          Break;
      end;
    end;

    Result := true;

// Удалим PSafeArray
    SafeArrayDestroy(Signal);
  end;
end;  // off GetSignal
//------------------------------------------------------------------------------
procedure ImportTitle(StabMed2 : ISignalExporter; StabN,ProbeID: Integer);
var
  Data : PAnsiChar;
  Date : TDateTime;
begin
  StabMed2.GetPatientName(TestID,Data);
  St_FIO[StabN]:=Data;
  StabMed2.GetPatientBirthday(TestID,Date);
  St_BDate[StabN]:=FormatDateTime('dd.mm.yyyy',Date);
  St_Group[StabN]:='-';
  StabMed2.GetTestDateTime(TestID,Date);
  St_TDate[StabN]:=FormatDateTime('dd.mm.yyyy',Date);
  StabMed2.GetTestName(TestID,Data);
  St_Test[StabN]:=Data;
  StabMed2.GetProbeName(ProbeID,Data);
  St_Proba[StabN]:=Data;
end;
//------------------------------------------------------------------------------
function ImportChan: Boolean;
var
  nColumn,Ax,n0: Byte;
  SCh,j,ProbeID,ChanId: Integer;
  StabMed2 : ISignalExporter;
  A,ProbeName: String;
  pEdN: array[1..2] of ^TEdit;
  pCY: pSingle;
begin
  ImportChan:=FALSE;

  with Form1 do
  begin
    pEdN[1]:=@Ed_ProbeName1; pEdN[2]:=@Ed_ProbeName2;
  end;

  StabMed2 := CreateComObject(CLASS_SignalExporter) as ISignalExporter;

  StabMed2.GetProbeID(TestID,NodeParent,ProbeID);
  ImportTitle(StabMed2,nLoadPr,ProbeID);

  if nLoadPr=1 then MainStatus(FALSE,FALSE,bProb[2],bCalc[2]);
  if nLoadPr=2 then MainStatus(bProb[1],bCalc[1],FALSE,FALSE);

  Ax:=0;
  for SCh:=1 to nSelectChann[nLoadPr] do
  begin
    StabMed2.GetChannelID(ProbeID,SelChann[nLoadPr,SCh],ChanID);
    n0:=0;
    if ChanID=180 then
    begin ChanID:=380; if Form1.RB_bVectorMoment.Checked then n0:=3; end;

    if (ChanID>=20)and(ChanID<=61) then nColumn:=1;
    if (ChanID>=10)and(ChanID<=19) then nColumn:=2;
    if (ChanID>=380) then nColumn:=3;

    __GetSignal(StabMed2,ProbeID,ChanID);

    if SCh=1 then
    begin
      J0:=Length(Sign[0]);
      pProcLength(J0);
      if not _fSetTC then Exit;
      _pSetNC;
    end;

    if ((nColumn>=1)and(Ax<nAxis0)) then
    begin
      inc(Ax);
      if (pY0=nil) then GetMem(pY0,(NCY0+1)*cSS);
      if (pCY0[Ax,nLoadPr]=nil) then GetMem(pCY0[Ax,nLoadPr],(NCY0+1)*cSS);

      for j:=NCY1[nLoadPr]-1 to NCY1[nLoadPr]+NCY0-2 do
      begin
        pCY:=pCY0[Ax][nLoadPr]; inc(pCY,j-NCY1[nLoadPr]+2);
        pCY^:=Sign[0+n0][j];
      end;

      if (nColumn=1) then AxisName[Ax,nLoadPr]:=ChanName[Conv[ChanId]];
      if (nColumn=2) then AxisName[Ax,nLoadPr]:=ChanName[Conv[ChanId]]+' X';
      if (nColumn=3) then if Form1.RB_bVectorMoment.Checked then
       AxisName[Ax,nLoadPr]:=ChanName[Conv[ChanId]]+' MX' else
       AxisName[Ax,nLoadPr]:=ChanName[Conv[ChanId]]+' PX';
    end;

    if ((nColumn>=2)and(Ax<nAxis0)) then
    begin
      inc(Ax);
      if (pCY0[Ax,nLoadPr]=nil) then GetMem(pCY0[Ax,nLoadPr],(NCY0+1)*cSS);

      for j:=NCY1[nLoadPr]-1 to NCY1[nLoadPr]+NCY0-2 do
      begin
        pCY:=pCY0[Ax][nLoadPr]; inc(pCY,j-NCY1[nLoadPr]+2);
        pCY^:=Sign[1+n0][j];
      end;

      if (nColumn=2) then AxisName[Ax,nLoadPr]:=ChanName[Conv[ChanId]]+' Y';
      if (nColumn=3) then if Form1.RB_bVectorMoment.Checked then
       AxisName[Ax,nLoadPr]:=ChanName[Conv[ChanId]]+' MY' else
       AxisName[Ax,nLoadPr]:=ChanName[Conv[ChanId]]+' PY';
    end;

    if ((nColumn>=3)and(Ax<nAxis0)) then
    begin
      inc(Ax);
      if (pCY0[Ax,nLoadPr]=nil) then GetMem(pCY0[Ax,nLoadPr],(NCY0+1)*cSS);

      for j:=NCY1[nLoadPr]-1 to NCY1[nLoadPr]+NCY0-2 do
      begin
        pCY:=pCY0[Ax][nLoadPr]; inc(pCY,j-NCY1[nLoadPr]+2);
        pCY^:=Sign[2+n0][j];
      end;

      if (nColumn=3) then if Form1.RB_bVectorMoment.Checked then
       AxisName[Ax,nLoadPr]:=ChanName[Conv[ChanId]]+' MZ' else
       AxisName[Ax,nLoadPr]:=ChanName[Conv[ChanId]]+' PZ';
    end;
    nAxis[nLoadPr]:=Ax;
  end;
  Form1.Update;

  if nLoadPr=1 then MainStatus(TRUE,FALSE,bProb[2],bCalc[2]);
  if nLoadPr=2 then MainStatus(bProb[1],bCalc[1],TRUE,FALSE);
  Form1.OutAll;
  if nLoadPr=1 then MainStatus(TRUE,TRUE,bProb[2],bCalc[2]);
  if nLoadPr=2 then MainStatus(bProb[1],bCalc[1],TRUE,TRUE);

  ProbeName:=St_FIO[nLoadPr]+' '+St_Proba[nLoadPr];
  pEdN[nLoadPr].Text:=ProbeName;
  pEdN[nLoadPr].Update;

  StabMed2:=nil;
  ImportChan:=TRUE;
  sLoadType[nLoadPr]:='ImportChan';
end;
//==============================================================================

end.
