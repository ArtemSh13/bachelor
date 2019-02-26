unit DataExport;

interface
uses Windows, Variants, SysUtils, Dialogs, Graphics, Forms, Math, Chart,
   Messages, Classes, Controls,
   ComCtrls, Menus, TeEngine, Series, ExtCtrls, TeeProcs,
  StdCtrls, OleServer, DB, DBTables, Grids, DBGrids, dbcgrids, Mask, DBCtrls;

var
  ExportDir: array[1..3] of String;

procedure DataExportInit;
procedure ReadDialog_ini;
procedure WriteDialog_ini;
procedure ResultSaveStatus;
procedure SaveInBase;
procedure SetTitle(n: Integer);
procedure SetTitleYes;
procedure SetTitleNo;
procedure SaveResult;
procedure WriteTitle(FileName: String);
procedure pProbSave;
procedure pFourierSave;
procedure pValchSave;
procedure pWinFourierSave;
procedure pSpecGrammSave;
procedure pWaveLetSave;
procedure OpenExportDir;
procedure RecordDelete;
procedure pAdgeDialog(Sender:TObject; X,Y:Integer);
procedure pDiagDialog(Sender:TObject; X,Y:Integer);
procedure pSetFilter;
procedure pFilter;
procedure DBaseSelect;

implementation
uses Main, Common, ProbeText, FourierAnalys, VelchAnalys,
     SpectroGramm, WinFourier, Morlet;

var
  nSavePr: Byte;
  DataBaseName,SaveName1,SaveName2,SaveName3: String;
  Fltr,fName,fAdge,fDiag: String;
//==============================================================================
procedure DataExportInit;
begin
  ReadDialog_ini;

  ResultSaveStatus;
  DataBaseName:=DataExportDir+'\__DBase';

  if FileExists(DataBaseName+'\Stab.db') then
  begin
    Form1.TableA.DatabaseName:=DataBaseName;
    Form1.TableA.TableName:='Stab.DB';
  end else
  begin
    Option;
    Form1.PC_Option.TabIndex:=6;
    Form1.Update;
  end;

  Fltr:='';
end;
//------------------------------------------------------------------------------
procedure ReadDialog_ini;
var
  T: TextFile;
  N0,n: Integer;
  R: String;
begin
  AssignFile(T,ProgDir+'\_Adge.ini');
  ReSet(T);
  ReadLn(T,N0);
  for n:=1 to N0 do begin ReadLn(T,R); Form1.CB_Adge.Items.Add(R); end;
  ReadLn(T,n); Form1.CB_Adge.ItemIndex:=n;
  CloseFile(T);

  AssignFile(T,ProgDir+'\_Diag.ini');
  ReSet(T);
  ReadLn(T,N0);
  for n:=1 to N0 do begin ReadLn(T,R); Form1.CB_Diag.Items.Add(R); end;
  ReadLn(T,n); Form1.CB_Diag.ItemIndex:=n;
  CloseFile(T);
end;
//------------------------------------------------------------------------------
procedure WriteDialog_ini;
var
  T: TextFile;
  n: Integer;
begin
  AssignFile(T,ProgDir+'\_Adge.ini');
  ReWrite(T);
  WriteLn(T,Form1.CB_Adge.Items.Count);
  for n:=1 to Form1.CB_Adge.Items.Count do WriteLn(T,Form1.CB_Adge.Items[n-1]);
  WriteLn(T,Form1.CB_Adge.ItemIndex);
  CloseFile(T);

  AssignFile(T,ProgDir+'\_Diag.ini');
  ReWrite(T);
  WriteLn(T,Form1.CB_Diag.Items.Count);
  for n:=1 to Form1.CB_Diag.Items.Count do WriteLn(T,Form1.CB_Diag.Items[n-1]);
  WriteLn(T,Form1.CB_Diag.ItemIndex);
  CloseFile(T);
end;
//------------------------------------------------------------------------------
procedure ResultSaveStatus;
begin
  Form1.CB_bSave1.Enabled:=bProb[1];
  Form1.CB_bSave1.Checked:=FALSE;
  Form1.Ed_ExportDir1.Enabled:=bProb[1];

  Form1.CB_bSave2.Enabled:=bProb[2];
  Form1.CB_bSave2.Checked:=FALSE;
  Form1.Ed_ExportDir2.Enabled:=bProb[2];

  Form1.CB_bSave3.Enabled:=bProb[2];
  Form1.CB_bSave3.Checked:=FALSE;
  Form1.Ed_ExportDir3.Enabled:=bProb[2];

  Form1.GB_Save1.Enabled:=bProb[1];
end;
//------------------------------------------------------------------------------
procedure SetTitle(n: Integer);
begin
  nSavePr:=n;

  with Form1 do
  begin
    Pl_SetTitle.Visible:=TRUE;
    Lb_SetTitle2.Caption:=IntToStr(nSavePr);

    SG_SetTitle.Cells[0,0]:=' ��� ��������';
    SG_SetTitle.Cells[0,1]:=' ���� ��������';
    SG_SetTitle.Cells[0,2]:=' ������';
    SG_SetTitle.Cells[0,3]:=' ���� ������������';
    SG_SetTitle.Cells[0,4]:=' ����';
    SG_SetTitle.Cells[0,5]:=' �����';

    if (nSavePr=1)or(nSavePr=2) then
     if St_FIO[nSavePr]='' then St_FIO[nSavePr]:='���';

    if (nSavePr=3) then
    begin
      St_FIO[nSavePr]:='��� ��������';
    end;

    if St_BDate[nSavePr]='' then St_BDate[nSavePr]:='01.01.1900';

    SG_SetTitle.Cells[1,0]:=St_FIO[nSavePr];
    SG_SetTitle.Cells[1,1]:=St_BDate[nSavePr];
    SG_SetTitle.Cells[1,2]:=St_Group[nSavePr];
    SG_SetTitle.Cells[1,3]:=St_TDate[nSavePr];
    SG_SetTitle.Cells[1,4]:=St_Test[nSavePr];
    SG_SetTitle.Cells[1,5]:=St_Proba[nSavePr];
  end;
end;
//------------------------------------------------------------------------------
function ConvADate(D: String): String;
var
  n: Integer;
begin
  for n:=1 to Length(D) do if (Copy(D,n,1)='.')or(Copy(D,n,1)=':') then
  begin
    Delete(D,n,1);
    Insert('_',D,n);
  end;
  ConvADate:=D;
end;
//------------------------------------------------------------------------------
procedure SetTitleYes;
begin
  Form1.Pl_SetTitle.Visible:=FALSE;
  Form1.Update;

  St_FIO[nSavePr]:=  Form1.SG_SetTitle.Cells[1,0];
  St_BDate[nSavePr]:=Form1.SG_SetTitle.Cells[1,1];
  St_Group[nSavePr]:=Form1.SG_SetTitle.Cells[1,2];
  St_TDate[nSavePr]:=Form1.SG_SetTitle.Cells[1,3];
  St_Test[nSavePr]:= Form1.SG_SetTitle.Cells[1,4];
  St_Proba[nSavePr]:=Form1.SG_SetTitle.Cells[1,5];
  St_ADate[nSavePr]:=DateTimeToStr(Now);

  if nSavePr=1 then SaveName1:=St_FIO[nSavePr]+'_'+St_Proba[nSavePr]+'_'+
                                               ConvADate(St_ADate[nSavePr]);
  if nSavePr=2 then SaveName2:=St_FIO[nSavePr]+'_'+St_Proba[nSavePr]+'_'+
                                               ConvADate(St_ADate[nSavePr]);
  if nSavePr=3 then SaveName3:=St_FIO[1]+' & '+St_FIO[2]+' '+
                                               ConvADate(DateTimeToStr(Now));
  SaveResult;

  if nSavePr=1 then Form1.CB_bSave1.Checked:=FALSE;
  if nSavePr=2 then Form1.CB_bSave2.Checked:=FALSE;
  if nSavePr=3 then Form1.CB_bSave3.Checked:=FALSE;
end;
//------------------------------------------------------------------------------
procedure SetTitleNo;
begin
  Form1.Pl_SetTitle.Visible:=FALSE;
end;
//------------------------------------------------------------------------------
procedure SaveResult;
var
  SaveName: String;
begin
  if nSavePr=1 then SaveName:=SaveName1;
  if nSavePr=2 then SaveName:=SaveName2;
  if nSavePr=3 then SaveName:=SaveName3;

  with Form1 do
  begin
    SaveD.InitialDir:=DataExportDir;
    SaveD.FileName:=ExtractFileName(SaveName);
    if SaveD.Execute then
    begin
      ExportDir[nSavePr]:=SaveD.FileName;
      if nSavePr=1 then Ed_ExportDir1.Text:=ExportDir[1];
      if nSavePr=2 then Ed_ExportDir2.Text:=ExportDir[2];
      if nSavePr=3 then Ed_ExportDir3.Text:=ExportDir[3];
      MkDir(ExportDir[nSavePr]);

      if CB_bStabGrammSave.Checked then pProbSave;
      if CB_bFourierSave.Checked then pFourierSave;
      if CB_bValchSave.Checked then pValchSave;
      if CB_bWinFourierSave.Checked then pWinFourierSave;
      if nSavePr<>3 then
      begin
        if CB_bSpecGrammSave.Checked then pSpecGrammSave;
        if CB_bWaveLetSave.Checked then pWaveLetSave;
      end;

      SaveInBase;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure SaveInBase;
var
  Len: Integer;
  ExportFolder: String;
begin
  with Form1 do
  begin
    TableA.Append;
    TableA.Edit;

    TableA.Fields.FieldByName('Name').AsString:=     St_FIO[nSavePr];
    TableA.Fields.FieldByName('BDate').AsString:=    St_BDate[nSavePr];
    TableA.Fields.FieldByName('Group').AsString:=    St_Group[nSavePr];
    TableA.Fields.FieldByName('AdgeGroup').AsString:=CB_Adge.Text;
    TableA.Fields.FieldByName('Diagnose').AsString:= CB_Diag.Text;
    TableA.Fields.FieldByName('InsDate').AsString:=  St_TDate[nSavePr];
    TableA.Fields.FieldByName('Test').AsString:=     St_Test[nSavePr];
    TableA.Fields.FieldByName('Sample').AsString:=   St_Proba[nSavePr];
    TableA.Fields.FieldByName('AnalDate').AsString:= St_ADate[nSavePr];

    Len:=Length(DataExportDir);

    ExportFolder:=ExportDir[nSavePr];
    Delete(ExportFolder,1,Len+1);

    Form1.TableA.Fields.FieldByName('Result').AsString:=ExportFolder;
    Form1.TableA.Post;
  end;
end;
//------------------------------------------------------------------------------
procedure WriteTitle(FileName: String);
var
  T: TextFile;
begin
  Assign(T,FileName);
  ReWrite(T);
  WriteLn(T,'��� ��������',' ':8,     St_FIO[nSavePr]);
  WriteLn(T,'���� ��������',' ':7,    St_BDate[nSavePr]);
  WriteLn(T,'������',' ':14,          St_Group[nSavePr]);
  WriteLn(T,'���� ������������',' ':3,St_TDate[nSavePr]);
  WriteLn(T,'����',' ':16,            St_Test[nSavePr]);
  WriteLn(T,'�����',' ':15,           St_Proba[nSavePr]);
  WriteLn(T);
  CloseFile(T);
end;
//------------------------------------------------------------------------------
procedure _SaveGraph(PageN: Byte; Ch1,Ch2,Ch3: TChart; St: String);
var
  nAx: Byte;
  Ch_L,Ch_T,Ch_W,Ch_H: Word;
  bmp: TBitmap;
  DC: HDC;
begin
  with Form1 do
  begin
    PageC.ActivePageIndex:=PageN;
    DC:=GetDC(0);

    Ch_W:=Ch1.Width+dRightG+dLeftG;
    Ch_H:=Ch1.Height+dBottomG+dTopG;

    bmp:=TBitmap.Create;
    bmp.Width:= Ch_W;
    bmp.Height:=Ch_H;

    Ch_L:=Left+PageC.Left+TS_CY.Left+Ch1.Left-dLeftG;

    if nSavePr<=2 then nAx:=nAxis[nSavePr] else nAx:=nAxis[2];

    if nAx>=1 then
    begin
      Ch_T:=Top+PageC.Top+40+TS_CY.Top+Ch1.Top-dTopG;
      bitblt(bmp.Canvas.Handle,0,0,Ch_W,Ch_H, DC,Ch_L,Ch_T, SRCCOPY);
      bmp.SaveToFile(ExportDir[nSavePr]+'\'+St+'_X.bmp');
    end;

    if nAx>=2 then
    begin
      Ch_T:=Top+PageC.Top+40+TS_CY.Top+Ch2.Top-dTopG;
      bitblt(bmp.Canvas.Handle,0,0,Ch_W,Ch_H, DC,Ch_L,Ch_T, SRCCOPY);
      bmp.SaveToFile(ExportDir[nSavePr]+'\'+St+'_Y.bmp');
    end;

    if nAx>=3 then
    begin
      Ch_T:=Top+PageC.Top+40+TS_CY.Top+Ch3.Top-dTopG;
      bitblt(bmp.Canvas.Handle,0,0,Ch_W,Ch_H, DC,Ch_L,Ch_T, SRCCOPY);
      bmp.SaveToFile(ExportDir[nSavePr]+'\'+St+'_Z.bmp');
    end;

    bOut[1]:=TRUE; bOut[2]:=TRUE;

    ReleaseDC(0, DC);

    Form1.PageC.ActivePageIndex:=6;
  end;
end;
//------------------------------------------------------------------------------
procedure pProbSave;
var
  Ax: Byte;
  T: TextFile;
  i: Integer;
  FName,St1,St2: String;
  pCY: pSingle;
begin
  if (nSavePr<3) then for i:=1 to 2 do bOut[i]:=(nSavePr=i);
  pOutProb;

  with Form1 do _SaveGraph(0, Ch_CY1,Ch_CY2,Ch_CY3, '1_�����');

  pOutProb;
  if nSavePr=3 then Exit;

  FName:=ExportDir[nSavePr]+'\1_�����.txt';
  WriteTitle(FName);

  AssignFile(T,FName);
  Append(T);
    St1:='     �����,'+' '+sPr1[1];
    St2:='       ��� '+' '+sPr2[1]+' ';
    if nAxis[nSavePr]>=2 then
    begin
      St1:=St1+' '+sPr1[2];
      St2:=St2+' '+sPr2[2]+' ';
    end;
    if nAxis[nSavePr]>=3 then
    begin
      St1:=St1+' '+sPr1[3];
      St2:=St2+' '+sPr2[3];
    end;

    WriteLn(T,St1);
    WriteLn(T,St2);

    for i:=1 to NCY0 do
    begin
//      St1:=FloatToStrF(i*dt,ffExponent,2,1);
      Write(T,i*dt:10:5);
      for Ax:=1 to nAxis[nSavePr] do
      begin
        pCY:=pCY0[Ax,nSavePr]; inc(pCY,i);
        Write(T,pCY^:10:4);
      end;
      WriteLn(T);
    end;
  CloseFile(T);
end;
//------------------------------------------------------------------------------
procedure pFourierSave;
var
  T: TextFile;
  Ax: Byte;
  j: Integer;
  F: Real;
  FName,St1,St2: String;
  pCF: pSingle;
begin
  if (nSavePr<3) then for j:=1 to 2 do bOut[j]:=(nSavePr=j);
  pOutFourier;

  with Form1 do _SaveGraph(1, Ch_CF1,Ch_CF2,Ch_CF3, '2_������_�����');
  pSaveMeanF(nSavePr, ExportDir[nSavePr]+'\2_�������_�����.txt');

  pOutFourier;
  if nSavePr=3 then Exit;

  FName:=ExportDir[nSavePr]+'\2_������_�����.txt';
  WriteTitle(FName);

  AssignFile(T,FName);
  Append(T);
    St1:='�������,'+' '+sAT1[1];
    St2:='     �� '+' '+sAT2[1]+' ';
    if nAxis[nSavePr]>=2 then
    begin
      St1:=St1+' '+sAT1[2];
      St2:=St2+' '+sAT2[2]+' ';
    end;
    if nAxis[nSavePr]>=3 then
    begin
      St1:=St1+' '+sAT1[3];
      St2:=St2+' '+sAT2[3];
    end;

    WriteLn(T,St1);
    WriteLn(T,St2);

    with Form1 do for j:=0 to NCY0 div 2 do
    begin
      Write(T,j/NCY0/dT:7:4);
      for Ax:=1 to nAxis[nSavePr] do
      begin
        pCF:=pCF0[Ax,nSavePr]; inc(pCF,j);
        F:=pCF^;
        if RB_bRemvl.Checked then F:=sqrt(F);
        if RB_bLog10.Checked then if F>1E-9 then F:=10*Log10(F) else F:=-90;
        Write(T,FloatToStrF(F,ffExponent,3,2):12);
      end;
      WriteLn(T);
    end;
  CloseFile(T);
end;
//------------------------------------------------------------------------------
procedure pValchSave;
var
  T: TextFile;
  Ax: Byte;
  j: Integer;
  V: Real;
  FName,St1,St2: String;
  pCV: pSingle;
begin
  if (nSavePr<3) then for j:=1 to 2 do bOut[j]:=(nSavePr=j);
  OutVelch;

  with Form1 do _SaveGraph(2, Ch_CV1,Ch_CV2,Ch_CV3, '3_������_�����');
  pSaveMeanV(nSavePr, ExportDir[nSavePr]+'\3_�������_�����.txt');

  OutVelch;
  if  nSavePr=3 then Exit;

  FName:=ExportDir[nSavePr]+'\3_������_�����.txt';
  WriteTitle(FName);

  AssignFile(T,FName);
  Append(T);
    St1:='�������,'+' '+sAT1[1];
    St2:='     �� '+' '+sAT2[1]+' ';
    if nAxis[nSavePr]>=2 then
    begin
      St1:=St1+' '+sAT1[2];
      St2:=St2+' '+sAT2[2]+' ';
    end;
    if nAxis[nSavePr]>=3 then
    begin
      St1:=St1+' '+sAT1[3];
      St2:=St2+' '+sAT2[3];
    end;

    WriteLn(T,St1);
    WriteLn(T,St2);

    with Form1 do for j:=0 to (Nvel div 2)-1 do
    begin
      Write(T,j/Nvel/dT:7:4);
      for Ax:=1 to nAxis[nSavePr] do
      begin
        pCV:=pCV0[Ax,nSavePr]; inc(pCV,j);
        V:=pCV^;
        if RB_bRemvl.Checked then V:=sqrt(V);
        if RB_bLog10.Checked then if V>1E-9 then V:=10*Log10(V) else V:=-90;
        Write(T,FloatToStrF(V,ffExponent,3,2):12);
      end;
      WriteLn(T);
    end;
  CloseFile(T);
end;
//------------------------------------------------------------------------------
procedure pWinFourierSave;
var
  TW: TextFile;
  Ax: Byte;
  t,T1,T2,j: Integer;
  W: Real;
  bSelPr1,bSelPr2: Boolean;
  FName: String;
  pCW: pSingle;
begin
  if bOut1Prob and (nSavePr=3) then Exit;

  bSelPr1:=Form1.RB_bSelPr1.Checked;
  bSelPr2:=Form1.RB_bSelPr2.Checked;

  with Form1 do
  begin
    if (nSavePr<3) then for j:=1 to 2 do bOut[j]:=(nSavePr=j);

    RB_bSelPr1.Checked:=(nSavePr=1);
    RB_bSelPr2.Checked:=(nSavePr=2);

    OutFourWin;

    _SaveGraph(3, Ch_CW1,Ch_CW2,Ch_CW3, '4_O������_�����');

    RB_bSelPr1.Checked:=bSelPr1;
    RB_bSelPr2.Checked:=bSelPr2;

    OutFourWin;
    if  nSavePr=3 then Exit;
  end;

  FName:=ExportDir[nSavePr]+'\4_�������_�����.txt';
  WriteTitle(FName);

  T1:=Twin div 2;
  T2:=TC0-T1;

  AssignFile(TW,FName);
  Append(TW);
    with Form1 do for Ax:=1 to nAxis[nSavePr] do
    begin
      if Ax=1 then WriteLn(TW,Trim(sAT1[1])+' '+Trim(sAT2[1]));
      if Ax=2 then WriteLn(TW,Trim(sAT1[2])+' '+Trim(sAT2[2]));
      if Ax=3 then WriteLn(TW,Trim(sAT1[3])+' '+Trim(sAT2[3]));
      WriteLn(TW);
      WriteLn(TW,'�������,','                   �����, ���');
      Write(TW,'     ��');
      for t:=T1 to T2 do Write(TW,t:10);
      WriteLn(TW);
      for j:=0 to Round(Twin/dT/2) do
      begin
        Write(TW,j/Twin:7:4);
        for t:=T1 to T2 do
        begin
          pCW:=pCW0[Ax,nSavePr][t]; inc(pCW,j);
          W:=pCW^;
          if RB_bRemvl.Checked then W:=sqrt(W/(2*Pi));
          if RB_bLog10.Checked then if W>1E-9 then W:=10*Log10(W) else W:=-90;
          Write(TW,FloatToStrF(W,ffExponent,3,2):10);
        end;
        WriteLn(TW);
      end;
      WriteLn(TW);
    end;
  CloseFile(TW);
end;
//------------------------------------------------------------------------------
procedure _SaveColPal(PageN: Byte; Panel: TPanel; St: String);
var
 Pl_L,Pl_T,Pl_W,Pl_H: Word;
 bmp: TBitmap;
 DC: HDC;
begin
  with Form1 do
  begin
    PageC.ActivePageIndex:=PageN;
    DC:=GetDC(0);

    Pl_W:=Panel.Width+6;
    Pl_H:=Panel.Height+8;

    bmp:=TBitmap.Create;
    bmp.Width:= Pl_W;
    bmp.Height:=Pl_H;

    Pl_L:=Left+PageC.Left+TS_CS.Left+Panel.Left;
    Pl_T:=Top+PageC.Top+40+TS_CS.Top+Panel.Top;
    bitblt(bmp.Canvas.Handle,0,0,Pl_W,Pl_H, DC,Pl_L,Pl_T, SRCCOPY);
    bmp.SaveToFile(ExportDir[nSavePr]+'\'+St+'.bmp');

    ReleaseDC(0, DC);

    Form1.PageC.ActivePageIndex:=6;
  end;
end;
//------------------------------------------------------------------------------
procedure _SaveDiagr(PageN: Byte; Ch11,Ch21,Ch31,Ch12,Ch22,Ch32: TChart; St: String);
var
 Ch_L,Ch_T,Ch_W,Ch_H: Word;
 bmp: TBitmap;
 DC: HDC;
begin
  with Form1 do
  begin
    PageC.ActivePageIndex:=PageN;
    DC:=GetDC(0);

    Ch_W:=Ch11.Width+dRightD+dLeftD;
    Ch_H:=Ch11.Height+dBottomD+dTopD;

    bmp:=TBitmap.Create;
    bmp.Width:= Ch_W;
    bmp.Height:=Ch_H;

    if nSavePr=1 then
    begin
      Ch_L:=Left+PageC.Left+TS_CY.Left+Ch11.Left-dLeftD;
      if nAxis[1]>=1 then
      begin
        Ch_T:=Top+PageC.Top+40+TS_CY.Top+Ch11.Top-dTopD;
        bitblt(bmp.Canvas.Handle,0,0,Ch_W,Ch_H, DC,Ch_L,Ch_T, SRCCOPY);
        bmp.SaveToFile(ExportDir[nSavePr]+'\'+St+'_X.bmp');
      end;

      if nAxis[1]>=2 then
      begin
        Ch_T:=Top+PageC.Top+40+TS_CY.Top+Ch21.Top-dTopD;
        bitblt(bmp.Canvas.Handle,0,0,Ch_W,Ch_H, DC,Ch_L,Ch_T, SRCCOPY);
        bmp.SaveToFile(ExportDir[nSavePr]+'\'+St+'_Y.bmp');
      end;

      if nAxis[1]>=3 then
      begin
        Ch_T:=Top+PageC.Top+40+TS_CY.Top+Ch31.Top-dTopD;
        bitblt(bmp.Canvas.Handle,0,0,Ch_W,Ch_H, DC,Ch_L,Ch_T, SRCCOPY);
        bmp.SaveToFile(ExportDir[nSavePr]+'\'+St+'_Z.bmp');
      end;
    end;

    if nSavePr=2 then
    begin
      Ch_L:=Left+PageC.Left+TS_CY.Left+Ch12.Left-dLeftD;
      if nAxis[2]>=1 then
      begin
        Ch_T:=Top+PageC.Top+40+TS_CY.Top+Ch12.Top-dTopD;
        bitblt(bmp.Canvas.Handle,0,0,Ch_W,Ch_H, DC,Ch_L,Ch_T, SRCCOPY);
        bmp.SaveToFile(ExportDir[nSavePr]+'\'+St+'_X.bmp');
      end;

      if nAxis[2]>=2 then
      begin
        Ch_T:=Top+PageC.Top+40+TS_CY.Top+Ch22.Top-dTopD;
        bitblt(bmp.Canvas.Handle,0,0,Ch_W,Ch_H, DC,Ch_L,Ch_T, SRCCOPY);
        bmp.SaveToFile(ExportDir[nSavePr]+'\'+St+'_Y.bmp');
      end;

      if nAxis[2]>=3 then
      begin
        Ch_T:=Top+PageC.Top+40+TS_CY.Top+Ch32.Top-dTopD;
        bitblt(bmp.Canvas.Handle,0,0,Ch_W,Ch_H, DC,Ch_L,Ch_T, SRCCOPY);
        bmp.SaveToFile(ExportDir[nSavePr]+'\'+St+'_Z.bmp');
      end;
    end;

    ReleaseDC(0, DC);

    Form1.PageC.ActivePageIndex:=6;
  end;
end;
//------------------------------------------------------------------------------
procedure pSpecGrammSave;
begin
  with Form1 do
  begin
    _SaveDiagr(4, Ch_CS11,Ch_CS21,Ch_CS31,Ch_CS12,Ch_CS22,Ch_CS32, '5_�������������');
    _SaveColPal(4, Pl_SGColPal, '5_�������������_�������');
  end;
end;
//------------------------------------------------------------------------------
procedure pWaveLetSave;
const
  St: array[1..3] of String=('X','Y','Z');
var
  T: TextFile;
  Ax: Byte;
  S: File of Single;
  i,j: Word;
  pCM: pSingle;
begin
  with Form1 do
  begin
    WriteTitle(ExportDir[nSavePr]+'\6_�����_������.txt');

    AssignFile(T,ExportDir[nSavePr]+'\6_�����_������.txt');
    Append(T);
      WriteLn(T);
      WriteLn(T,' ��������� ������ = ',T0_Morlet);
      WriteLn(T,' ��������� ������ = ',H0_Morlet);
      WriteLn(T);
      for i:=1 to T0_Morlet do Write(T,T_Morlet[i]:0:3,' ');
      if T0_Morlet<H0_Morlet then for i:=T0_Morlet+1 to H0_Morlet do Write(T,' 0');
      WriteLn(T);
      WriteLn(T);
      for j:=H0_Morlet downto 1 do Write(T,H_Morlet[j]:0:3,' ');
      if H0_Morlet<T0_Morlet then for i:=H0_Morlet+1 to T0_Morlet do Write(T,' 0');
      WriteLn(T);
    CloseFile(T);

    for Ax:=1 to nAxis[nSavePr] do
    begin
      AssignFile(S,ExportDir[nSavePr]+'\6_�����_������_'+St[Ax]+'.bin');
      ReWrite(S);
        for j:=H0_Morlet downto 1 do for i:=1 to T0_Morlet do
        begin
          pCM:=pCM0[Ax,nSavePr][i]; inc(pCM,j);
          Write(S,pCM^);
        end;
      CloseFile(S);
    end;

    _SaveDiagr(5, Ch_CL11,Ch_CL21,Ch_CL31,Ch_CL12,Ch_CL22,Ch_CL32, '6_�������');
    _SaveColPal(5, Pl_WLColPal, '6_�������_�������');
  end;
end;
//------------------------------------------------------------------------------
procedure OpenExportDir;
var
  OpenDir,OpenFile: String;
begin
  OpenDir:=DataExportDir+'\'+Form1.TableA.Fields.FieldByName('Result').AsString;
  OpenFile:=OpenDir+'\__��������.txt';
  Form1.OpenD1.InitialDir:=OpenDir;
  Form1.OpenD1.FileName:=OpenFile;
  if Form1.OpenD1.Execute then
  begin
  end;
end;
//------------------------------------------------------------------------------
procedure RecordDelete;
var
  RecDir,S: String;
begin
  RecDir:=DataExportDir+'\'+Form1.TableA.Fields.FieldByName('Result').AsString;

  S:=RecDir+'\1_�����.txt';            if FileExists(S) then DeleteFile(S);
  S:=RecDir+'\1_�����_X.bmp';          if FileExists(S) then DeleteFile(S);
  S:=RecDir+'\1_�����_Y.bmp';          if FileExists(S) then DeleteFile(S);
  S:=RecDir+'\1_�����_Z.bmp';          if FileExists(S) then DeleteFile(S);

  S:=RecDir+'\2_������_�����.txt';     if FileExists(S) then DeleteFile(S);
  S:=RecDir+'\2_�������_�����.txt';    if FileExists(S) then DeleteFile(S);
  S:=RecDir+'\2_������_�����_X.bmp';   if FileExists(S) then DeleteFile(S);
  S:=RecDir+'\2_������_�����_Y.bmp';   if FileExists(S) then DeleteFile(S);
  S:=RecDir+'\2_������_�����_Z.bmp';   if FileExists(S) then DeleteFile(S);

  S:=RecDir+'\3_������_�����.txt';     if FileExists(S) then DeleteFile(S);
  S:=RecDir+'\3_�������_�����.txt';    if FileExists(S) then DeleteFile(S);
  S:=RecDir+'\3_������_�����_X.bmp';   if FileExists(S) then DeleteFile(S);
  S:=RecDir+'\3_������_�����_Y.bmp';   if FileExists(S) then DeleteFile(S);
  S:=RecDir+'\3_������_�����_Z.bmp';   if FileExists(S) then DeleteFile(S);

  S:=RecDir+'\4_�������_�����.txt';    if FileExists(S) then DeleteFile(S);
  S:=RecDir+'\4_O������_�����_X.bmp';  if FileExists(S) then DeleteFile(S);
  S:=RecDir+'\4_O������_�����_Y.bmp';  if FileExists(S) then DeleteFile(S);
  S:=RecDir+'\4_O������_�����_Z.bmp';  if FileExists(S) then DeleteFile(S);

  S:=RecDir+'\5_�������������_�������.bmp';  if FileExists(S) then DeleteFile(S);
  S:=RecDir+'\5_�������������_X.bmp';  if FileExists(S) then DeleteFile(S);
  S:=RecDir+'\5_�������������_Y.bmp';  if FileExists(S) then DeleteFile(S);
  S:=RecDir+'\5_�������������_Z.bmp';  if FileExists(S) then DeleteFile(S);

  S:=RecDir+'\6_�������_�������.bmp';  if FileExists(S) then DeleteFile(S);
  S:=RecDir+'\6_�������_X.bmp';        if FileExists(S) then DeleteFile(S);
  S:=RecDir+'\6_�������_Y.bmp';        if FileExists(S) then DeleteFile(S);
  S:=RecDir+'\6_�������_Z.bmp';        if FileExists(S) then DeleteFile(S);
  S:=RecDir+'\6_�����_������.txt';     if FileExists(S) then DeleteFile(S);
  S:=RecDir+'\6_�����_������_X.bin';   if FileExists(S) then DeleteFile(S);
  S:=RecDir+'\6_�����_������_Y.bin';   if FileExists(S) then DeleteFile(S);
  S:=RecDir+'\6_�����_������_Z.bin';   if FileExists(S) then DeleteFile(S);

  if (not Form1.CB_RecordDelete.Checked) then RmDir(RecDir);
  Form1.CB_RecordDelete.Checked:=FALSE;
end;
//------------------------------------------------------------------------------
procedure pAdgeDialog(Sender:TObject; X,Y:Integer);
begin
  with Form1 do
  begin
    Pl_Adge.Visible:=TRUE;
    CB_Adge.Sorted:=TRUE;
    if Sender=Bt_AdgeDel then CB_Adge.Items.Delete(CB_Adge.ItemIndex);
    if Sender=Bt_AdgeAdd then CB_Adge.Items.Add(CB_Adge.Text);
    if Sender=Bt_AdgeOk then
    begin
      TableA.Edit;
      TableA.Fields.FieldByName('AdgeGroup').AsString:=CB_Adge.Text;
      TableA.Post;
    end;
    if Sender=Bt_AdgeCencel then Pl_Adge.Visible:=FALSE;
  end;
end;
//------------------------------------------------------------------------------
procedure pDiagDialog(Sender:TObject; X,Y:Integer);
begin
  with Form1 do
  begin
    Pl_Diag.Visible:=TRUE;
    CB_Diag.Sorted:=TRUE;
    if Sender=Bt_DiagAdd then CB_Diag.Items.Add(CB_Diag.Text);
    if Sender=Bt_DiagOk then
    begin
      TableA.Edit;
      TableA.Fields.FieldByName('Diagnose').AsString:=CB_Diag.Text;
      TableA.Post;
    end;
    if Sender=Bt_DiagCencel then Pl_Diag.Visible:=FALSE;
  end;
end;
//------------------------------------------------------------------------------
procedure pSetFilter;
begin
  with Form1 do
  begin
    if not CB_bName.Checked then fName:='';
    if not CB_bAdge.Checked then fAdge:='';
    if not CB_bDiag.Checked then fDiag:='';
    TableA.Filtered:=CB_bName.Checked or CB_bAdge.Checked or CB_bDiag.Checked;
    if Fltr<>'' then pFilter;
  end;
end;
//------------------------------------------------------------------------------
procedure pFilter;
var
  Name,Ed: String;
begin
  Name:=Form1.DBGrid1.SelectedField.DisplayName;
  Ed:=Form1.DBGrid1.SelectedField.Text;
  Fltr:='';

  if Form1.CB_bName.Checked then
  begin
    if Name='�������' then fName:='Name='+''''+Ed+'''';
    Fltr:=fName;
  end;

  if Form1.CB_bAdge.Checked then
  begin
    if Name='���������� ��.' then fAdge:='AdgeGroup='+''''+Ed+'''';
    if fAdge<>'' then if Fltr='' then Fltr:=fAdge else Fltr:=Fltr+' and '+fAdge;
  end;

  if Form1.CB_bDiag.Checked then
  begin
    if Name='�������' then fDiag:='Diagnose='+''''+Ed+'''';
    if fDiag<>'' then if Fltr='' then Fltr:=fDiag else Fltr:=Fltr+' and '+fDiag;
  end;
  Form1.TableA.Filter:=Fltr;
end;
//------------------------------------------------------------------------------
procedure DBaseSelect;
begin
  DataBaseName:=DataExportDir+'\__DBase';
  Form1.TableA.Active:=FALSE;
  Form1.TableA.DatabaseName:=DataBaseName;
  Form1.TableA.TableName:='Stab.DB';
end;
//==============================================================================

end.

