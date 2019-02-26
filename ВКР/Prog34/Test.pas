unit Test;

interface
uses SysUtils,Forms;

procedure ReadTest;
procedure GetTest;

implementation
uses
  Main, Common, ProbeText, SpectroGramm, WaveLet;

var
  St,Fn: array[1..4] of Integer;
  Hz,Am: array[1..4] of Real;
  bTest: array[1..4] of Boolean;
//==============================================================================
procedure ReadTest;
var
  T: TextFile;
  n: Integer;
  b: array[1..4] of Integer;
begin
  AssignFile(T,ProgDir+'\_Test.ini');
  ReSet(T);
  for n:=1 to 4 do ReadLn(T,St[n],Fn[n],Hz[n],Am[n],b[n]);
  CloseFile(T);

  Form1.Ed_TestSt1.Text:=IntToStr(St[1]);
  Form1.Ed_TestSt2.Text:=IntToStr(St[2]);
  Form1.Ed_TestSt3.Text:=IntToStr(St[3]);
  Form1.Ed_TestSt4.Text:=IntToStr(St[4]);

  Form1.Ed_TestFn1.Text:=IntToStr(Fn[1]);
  Form1.Ed_TestFn2.Text:=IntToStr(Fn[2]);
  Form1.Ed_TestFn3.Text:=IntToStr(Fn[3]);
  Form1.Ed_TestFn4.Text:=IntToStr(Fn[4]);

  Form1.Ed_TestHz1.Text:=FloatToStr(Hz[1]);
  Form1.Ed_TestHz2.Text:=FloatToStr(Hz[2]);
  Form1.Ed_TestHz3.Text:=FloatToStr(Hz[3]);
  Form1.Ed_TestHz4.Text:=FloatToStr(Hz[4]);

  Form1.Ed_TestAm1.Text:=FloatToStr(Am[1]);
  Form1.Ed_TestAm2.Text:=FloatToStr(Am[2]);
  Form1.Ed_TestAm3.Text:=FloatToStr(Am[3]);
  Form1.Ed_TestAm4.Text:=FloatToStr(Am[4]);

  bTest[1]:=(b[1]=1); Form1.CB_bTest1.Checked:=(b[1]=1);
  bTest[2]:=(b[2]=1); Form1.CB_bTest2.Checked:=(b[2]=1);
  bTest[3]:=(b[3]=1); Form1.CB_bTest3.Checked:=(b[3]=1);
  bTest[4]:=(b[4]=1); Form1.CB_bTest4.Checked:=(b[4]=1);
end;
//------------------------------------------------------------------------------
procedure GetTest;
var
  T: TextFile;
  i,n,F0: Integer;
  b: array[1..4] of Integer;
  pCY: pSingle;
begin
  nAxis[1]:=1;

  St[1]:=StrToInt(Form1.Ed_TestSt1.Text);
  St[2]:=StrToInt(Form1.Ed_TestSt2.Text);
  St[3]:=StrToInt(Form1.Ed_TestSt3.Text);
  St[4]:=StrToInt(Form1.Ed_TestSt4.Text);

  Fn[1]:=StrToInt(Form1.Ed_TestFn1.Text);
  Fn[2]:=StrToInt(Form1.Ed_TestFn2.Text);
  Fn[3]:=StrToInt(Form1.Ed_TestFn3.Text);
  Fn[4]:=StrToInt(Form1.Ed_TestFn4.Text);

  Hz[1]:=StrToFloat(Form1.Ed_TestHz1.Text);
  Hz[2]:=StrToFloat(Form1.Ed_TestHz2.Text);
  Hz[3]:=StrToFloat(Form1.Ed_TestHz3.Text);
  Hz[4]:=StrToFloat(Form1.Ed_TestHz4.Text);

  Am[1]:=StrToFloat(Form1.Ed_TestAm1.Text);
  Am[2]:=StrToFloat(Form1.Ed_TestAm2.Text);
  Am[3]:=StrToFloat(Form1.Ed_TestAm3.Text);
  Am[4]:=StrToFloat(Form1.Ed_TestAm4.Text);

  b[1]:=BoolToInt(Form1.CB_bTest1.Checked); bTest[1]:=Form1.CB_bTest1.Checked;
  b[2]:=BoolToInt(Form1.CB_bTest2.Checked); bTest[2]:=Form1.CB_bTest2.Checked;
  b[3]:=BoolToInt(Form1.CB_bTest3.Checked); bTest[3]:=Form1.CB_bTest3.Checked;
  b[4]:=BoolToInt(Form1.CB_bTest4.Checked); bTest[4]:=Form1.CB_bTest4.Checked;

  AssignFile(T,ProgDir+'\_Test.ini');
  ReWrite(T);
  for n:=1 to 4 do WriteLn(T,St[n]:4,Fn[n]:6,Hz[n]:8:4,Am[n]:8:4,b[n]:4);
  CloseFile(T);

  for i:=0 to 30000 do
  begin
    pCY:=pCY0[1,1]; inc(pCY,i); pCY^:=0;
    pCY:=pCY0[2,1]; inc(pCY,i); pCY^:=0;
  end;

  if bTest[1] then for i:=St[1] to Fn[1] do
  begin
    pCY:=pCY0[1,1]; inc(pCY,St[1]);
    pCY^:=pCY^+Am[1]*sin(2*Pi*Hz[1]*i*dT);
  end;
  if bTest[2] then for i:=St[2] to Fn[2] do
  begin
    pCY:=pCY0[1,1]; inc(pCY,St[2]);
    pCY^:=pCY^+Am[2]*sin(2*Pi*Hz[2]*i*dT);
  end;
  if bTest[3] then for i:=St[3] to Fn[3] do
  begin
    pCY:=pCY0[1,1]; inc(pCY,St[3]);
    pCY^:=pCY^+Am[3]*sin(2*Pi*Hz[3]*i*dT);
  end;
  if bTest[4] then for i:=St[4] to Fn[4] do
  begin
    pCY:=pCY0[1,1]; inc(pCY,St[4]);
    pCY^:=pCY^+Am[4]*sin(2*Pi*Hz[4]*i*dT);
  end;

  F0:=0;
  for n:=1 to 4 do if (bTest[n])and(Fn[n]>F0) then F0:=Fn[n];

  tProcLength:=Trunc(F0*dT);

  TC1[1]:=1;
  TC2[1]:=Trunc(F0*dT);
  TC0:=TC2[1]-TC1[1]+1;
  nProb:=1;
  nAxis[1]:=1;

  _pSetNC;
  Form1.Ed_ProbeName1.Text:=ProbeName[1];

  Form1.BorderStyle:=bsSingle;
  Form1.BorderIcons:=[biSystemMenu,biMinimize];
  _pSetWin;
  _pCS_Win;
  _pCL_Win;
end;
//==============================================================================

end.
