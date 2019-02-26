unit Control;

interface
uses SysUtils;

function _fCheckEdit: Boolean;

implementation
uses Main, Common;

//==============================================================================
function _fCheckEdit: Boolean;
var
  V: String;
begin
  with Form1 do
  begin
// �����
    V:=Ed_tProcStart1.Text;
    if (V='') then V:=IntToStr(tProcStart[1]);
    if StrToInt(V)>UD_tProcStart1.Max then V:=IntToStr(UD_tProcStart1.Max);
    if StrToInt(V)<UD_tProcStart1.Min then V:=IntToStr(UD_tProcStart1.Min);
    Ed_tProcStart1.Text:=V;

    V:=Ed_tProcStart2.Text;
    if (V='') then V:=IntToStr(tProcStart[2]);
    if StrToInt(V)>UD_tProcStart2.Max then V:=IntToStr(UD_tProcStart2.Max);
    if StrToInt(V)<UD_tProcStart2.Min then V:=IntToStr(UD_tProcStart2.Min);
    Ed_tProcStart2.Text:=V;

    V:=Ed_tProcInter.Text;
    if (V='')  then V:=IntToStr(tProcInter);
    if StrToInt(V)>UD_tProcInter.Max then V:=IntToStr(UD_tProcInter.Max);
    if StrToInt(V)<UD_tProcInter.Min then V:=IntToStr(UD_tProcInter.Min);
    Ed_tProcInter.Text:=V;
// ����
    V:=Ed_Filter(Ed_Tvel.Text);
    if (V='') then V:=FloatToStr(Tvel);
    if Round(StrToFloat(V)*5)>UD_Tvel.Max then V:=FloatToStr(UD_Tvel.Max);
    if Round(StrToFloat(V)*5)<UD_Tvel.Min then V:=FloatToStr(UD_Tvel.Min);
    Ed_Tvel.Text:=V;
    UD_Tvel.Position:=Round(StrToFloat(V)*5);

    if (StrToFloat(Ed_Tvel.Text)>UD_tProcInter.Position) then
    begin
      Ed_Status2.Text:=' ����� ������ < ������ ���� (����)';
      Exit;
    end;

    V:=Ed_Filter(Ed_Svel.Text);
    if (V='') then V:=FloatToStr(Svel);
    if Round(StrToFloat(V)*5)>UD_Svel.Max then V:=FloatToStr(UD_Svel.Max/5);
    if Round(StrToFloat(V)*5)<UD_Svel.Min then V:=FloatToStr(UD_Svel.Min/5);
    Ed_Svel.Text:=V;
    UD_Svel.Position:=Round(StrToFloat(V)*5);
// ������� �����-������
    V:=Ed_Twin.Text;
    if (V='') then V:=IntToStr(Twin);
    if StrToInt(V)>UD_Twin.Max then V:=IntToStr(UD_Twin.Max);
    if StrToInt(V)<UD_Twin.Min then V:=IntToStr(UD_Twin.Min);
    Ed_Twin.Text:=V;

    if (StrToFloat(Ed_Twin.Text)>UD_tProcInter.Position) then
    begin
      Ed_Status2.Text:=' ����� ������ < ������ ���� (�������)';
      Exit;
    end;
// �������
    if (Ed_Kmor.Text='') then Ed_Kmor.Text:=FloatToStr(Kmor);
    if Ed_Kmor.Text='' then
    begin
      Ed_Status2.Text:=' ������������ ��������� ��������� (�������)';
      Exit;
    end;
    pChangeMorlet(StrToFloat(Ed_Kmor.Text));
// �������
    V:=Ed_nProb.Text;
    if (V='') then V:=IntToStr(nProb);
    if StrToInt(V)>UD_nProb.Max then V:=IntToStr(UD_nProb.Max);
    if StrToInt(V)<UD_nProb.Min then V:=IntToStr(UD_nProb.Min);
    Ed_nProb.Text:=V;

    V:=Ed_nAxis.Text;
    if (V='') then V:=IntToStr(nAxis0);
    if StrToInt(V)>UD_nAxis.Max then V:=IntToStr(UD_nAxis.Max);
    if StrToInt(V)<UD_nAxis.Min then V:=IntToStr(UD_nAxis.Min);
    Ed_nAxis.Text:=V;

    V:=Ed_Filter(Ed_dLeftG.Text);
    if (V='') then V:=IntToStr(dLeftG);
    if StrToInt(V)>UD_dLeftG.Max then V:=IntToStr(UD_dLeftG.Max);
    if StrToInt(V)<UD_dLeftG.Min then V:=IntToStr(UD_dLeftG.Min);
    Ed_dLeftG.Text:=V;

    V:=Ed_Filter(Ed_dRightG.Text);
    if (V='') then V:=IntToStr(dRightG);
    if StrToInt(V)>UD_dRightG.Max then V:=IntToStr(UD_dRightG.Max);
    if StrToInt(V)<UD_dRightG.Min then V:=IntToStr(UD_dRightG.Min);
    Ed_dRightG.Text:=V;

    V:=Ed_Filter(Ed_dTopG.Text);
    if (V='') then V:=IntToStr(dTopG);
    if StrToInt(V)>UD_dTopG.Max then V:=IntToStr(UD_dTopG.Max);
    if StrToInt(V)<UD_dTopG.Min then V:=IntToStr(UD_dTopG.Min);
    Ed_dTopG.Text:=V;

    V:=Ed_Filter(Ed_dBottomG.Text);
    if (V='') then V:=IntToStr(dBottomG);
    if StrToInt(V)>UD_dBottomG.Max then V:=IntToStr(UD_dBottomG.Max);
    if StrToInt(V)<UD_dBottomG.Min then V:=IntToStr(UD_dBottomG.Min);
    Ed_dBottomG.Text:=V;

    V:=Ed_Filter(Ed_dLeftD.Text);
    if (V='') then V:=IntToStr(dLeftD);
    if StrToInt(V)>UD_dLeftD.Max then V:=IntToStr(UD_dLeftD.Max);
    if StrToInt(V)<UD_dLeftD.Min then V:=IntToStr(UD_dLeftD.Min);
    Ed_dLeftD.Text:=V;

    V:=Ed_Filter(Ed_dRightD.Text);
    if (V='') then V:=IntToStr(dRightD);
    if StrToInt(V)>UD_dRightD.Max then V:=IntToStr(UD_dRightD.Max);
    if StrToInt(V)<UD_dRightD.Min then V:=IntToStr(UD_dRightD.Min);
    Ed_dRightD.Text:=V;

    V:=Ed_Filter(Ed_dTopD.Text);
    if (V='') then V:=IntToStr(dTopD);
    if StrToInt(V)>UD_dTopD.Max then V:=IntToStr(UD_dTopD.Max);
    if StrToInt(V)<UD_dTopD.Min then V:=IntToStr(UD_dTopD.Min);
    Ed_dTopD.Text:=V;

    V:=Ed_Filter(Ed_dBottomD.Text);
    if (V='') then V:=IntToStr(dBottomD);
    if StrToInt(V)>UD_dBottomD.Max then V:=IntToStr(UD_dBottomD.Max);
    if StrToInt(V)<UD_dBottomD.Min then V:=IntToStr(UD_dBottomD.Min);
    Ed_dBottomD.Text:=V;

    Bt_OptionOk.Enabled:=TRUE;
    Bt_OptionApply.Enabled:=FALSE;
  end;
end;
//==============================================================================
end.
