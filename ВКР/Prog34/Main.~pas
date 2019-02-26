unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, TeEngine, Series, ExtCtrls, TeeProcs, Chart, Math,
  StdCtrls, OleServer, DB, DBTables, Grids, DBGrids, dbcgrids, Mask, DBCtrls,
  Common, Control, ProbeText, ProbeImport, FourierAnalys, VelchAnalys, WinFourier,
  SpectroGramm, WaveLet, Morlet, DataExport,Test;

type
  TForm1 = class(TForm)
    PageC: TPageControl;
    TS_CY: TTabSheet;
    TS_CF: TTabSheet;
    TS_CS: TTabSheet;
    TS_CW: TTabSheet;
    TS_CL: TTabSheet;
    TS_DataExport: TTabSheet;
    OpenD1: TOpenDialog;
    MainMenu1: TMainMenu;
    MM_File: TMenuItem;
    MM_File_Prob1: TMenuItem;
    N1: TMenuItem;
    MM_File_Exit: TMenuItem;
    MM_File_Prob2: TMenuItem;
    Ch_CY1: TChart;
    Ss_CY11: TLineSeries;
    Ch_CY2: TChart;
    Ch_CF1: TChart;
    Lb_CF11: TLabel;
    Lb_CF12: TLabel;
    Lb_CF1m: TLabel;
    Ch_CW1: TChart;
    Ch_CW2: TChart;
    Ss_CW11: TLineSeries;
    Ss_CW12: TLineSeries;
    Ss_CW13: TLineSeries;
    Ss_CW14: TLineSeries;
    Ss_CW15: TLineSeries;
    Ss_CW21: TLineSeries;
    Ss_CW22: TLineSeries;
    Ss_CW23: TLineSeries;
    Ss_CW24: TLineSeries;
    Ss_CW25: TLineSeries;
    Ch_CF2: TChart;
    Lb_StabName1: TLabel;
    Ed_ProbeName1: TEdit;
    Lb_StabName2: TLabel;
    Ed_ProbeName2: TEdit;
    Ss_CF22: TLineSeries;
    Ss_CF2m: TLineSeries;
    Ss_CF11: TLineSeries;
    Ss_CF12: TLineSeries;
    Ss_CF1m: TLineSeries;
    Lb_CF2m: TLabel;
    Lb_CF21: TLabel;
    Lb_CF22: TLabel;
    Ss_CY12: TLineSeries;
    Ss_CY21: TLineSeries;
    Ss_CY22: TLineSeries;
    Ss_CY20: TLineSeries;
    Ss_CY10: TLineSeries;
    GB_SpectrumType: TGroupBox;
    RB_bInit: TRadioButton;
    RB_bCentre: TRadioButton;
    RB_bFiltr: TRadioButton;
    GB_OutStab: TGroupBox;
    RB_bSelPr1: TRadioButton;
    RB_bSelPr2: TRadioButton;
    GB_Window_Frequency: TGroupBox;
    Lb_F1: TLabel;
    Lb_F2: TLabel;
    Lb_F3: TLabel;
    Lb_F4: TLabel;
    Lb_F5: TLabel;
    Ed_F1: TEdit;
    UD_F1: TUpDown;
    Ed_F2: TEdit;
    UD_F2: TUpDown;
    Ed_F3: TEdit;
    UD_F3: TUpDown;
    Ed_F4: TEdit;
    UD_F4: TUpDown;
    Ed_F5: TEdit;
    UD_F5: TUpDown;
    GB_Amplitude: TGroupBox;
    RB_bRemvl: TRadioButton;
    RB_bPower: TRadioButton;
    Ss_CW1m: TLineSeries;
    Lb_CW11: TLabel;
    Lb_CW12: TLabel;
    Lb_CW13: TLabel;
    Lb_CW14: TLabel;
    Lb_CW15: TLabel;
    Lb_CW1m: TLabel;
    Lb_CW21: TLabel;
    Lb_CW22: TLabel;
    Lb_CW23: TLabel;
    Lb_CW24: TLabel;
    Lb_CW25: TLabel;
    Lb_CW2m: TLabel;
    Ss_CW2m: TLineSeries;
    Ch_CS12: TChart;
    Im_CS12: TImage;
    Ss_CS12: TLineSeries;
    Ch_CS22: TChart;
    Ss_CS22: TLineSeries;
    Im_CS22: TImage;
    Lb_SGPalName: TLabel;
    Pl_SaveResult: TPanel;
    GB_Save1: TGroupBox;
    CB_bStabGrammSave: TCheckBox;
    CB_bFourierSave: TCheckBox;
    CB_bSpecGrammSave: TCheckBox;
    CB_bWinFourierSave: TCheckBox;
    CB_bWaveLetSave: TCheckBox;
    GB_Frequency: TGroupBox;
    Lb_HMax: TLabel;
    Lb_HMin: TLabel;
    Ed_H2: TEdit;
    UD_H2: TUpDown;
    Ed_H1: TEdit;
    UD_H1: TUpDown;
    MM_Option: TMenuItem;
    Ss_CF21: TLineSeries;
    GB_SGColScale: TGroupBox;
    RB_SGScaleAbs: TRadioButton;
    RB_SGScaleRlt: TRadioButton;
    RB_bLog10: TRadioButton;
    TableA: TTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    TableAName: TStringField;
    TableABDate: TDateField;
    TableAGroup: TStringField;
    TableATest: TStringField;
    TableAAdgeGroup: TStringField;
    TableADiagnose: TStringField;
    TableAResult: TStringField;
    DBNavigator1: TDBNavigator;
    TableAInsDate: TStringField;
    TableAAnalDate: TStringField;
    TableASample: TStringField;
    GB_Filter: TGroupBox;
    CB_bName: TCheckBox;
    CB_bAdge: TCheckBox;
    CB_bDiag: TCheckBox;
    Pl_Adge: TPanel;
    CB_Adge: TComboBox;
    Lb_AdgeGroup: TLabel;
    Bt_AdgeAdd: TButton;
    Bt_AdgeDel: TButton;
    Bt_AdgeOk: TButton;
    Pl_Diag: TPanel;
    CB_Diag: TComboBox;
    Lb_Diagnose: TLabel;
    Bt_DiagAdd: TButton;
    Bt_DiagDel: TButton;
    Bt_DiagOk: TButton;
    Bt_DiagCencel: TButton;
    Bt_AdgeCencel: TButton;
    Ch_CL11: TChart;
    Im_CL11: TImage;
    Ss_CL11: TLineSeries;
    Ch_CL12: TChart;
    Ch_CL21: TChart;
    Ch_CL22: TChart;
    Ss_CL21: TLineSeries;
    Im_CL21: TImage;
    Ss_CL12: TLineSeries;
    Ss_CL22: TLineSeries;
    Im_CL12: TImage;
    Im_CL22: TImage;
    GB_DaubechLevel: TGroupBox;
    Ed_DaubechLevel2: TEdit;
    UD_DaubechLevel2: TUpDown;
    UD_DaubechLevel1: TUpDown;
    Lb_DaubechLevel2: TLabel;
    Lb_DaubechLevel1: TLabel;
    Ch_CL1g: TChart;
    Ss_WLXY10: TLineSeries;
    Ed_DaubechLevel1: TEdit;
    GB_WLDisplay: TGroupBox;
    RB_bWLDiagr: TRadioButton;
    RB_bWLGraph: TRadioButton;
    Ed_DaubechLevel: TEdit;
    UD_DaubechLevel: TUpDown;
    OpenD_Palette: TOpenDialog;
    Lb_WLPalName: TLabel;
    GB_WLColScale: TGroupBox;
    RB_WLScaleAbs: TRadioButton;
    RB_WLScaleRlt: TRadioButton;
    P_Option: TPanel;
    PC_Option: TPageControl;
    TS_Option_Probe: TTabSheet;
    GB_NumberWindow: TGroupBox;
    RB_bHanning: TRadioButton;
    RB_bBlackman: TRadioButton;
    RB_bHamming: TRadioButton;
    RB_bBlackmanHarris: TRadioButton;
    RB_bExactBlackman: TRadioButton;
    RB_bTriangle: TRadioButton;
    RB_bFlatTop: TRadioButton;
    RB_bNoFilter: TRadioButton;
    TabSheet3: TTabSheet;
    GroupBox3: TGroupBox;
    RB_bDiscrSpG: TRadioButton;
    RB_bSmoothSpG: TRadioButton;
    GB_SGColPal: TGroupBox;
    Bt_SGSelPal: TButton;
    TabSheet1: TTabSheet;
    GB_Option_Window: TGroupBox;
    RB_bOut1St: TRadioButton;
    RB_bOut2St: TRadioButton;
    GB_Twin: TGroupBox;
    Lb_Twin: TLabel;
    Ed_Twin: TEdit;
    UD_Twin: TUpDown;
    TabSheet4: TTabSheet;
    GB_WaveLet2: TGroupBox;
    RB_bWLdb2: TRadioButton;
    RB_bWLdb3: TRadioButton;
    RB_bWLdb4: TRadioButton;
    GB_WaveLet4: TGroupBox;
    Bt_WLSelPal: TButton;
    TabSheet5: TTabSheet;
    GB_DBase: TGroupBox;
    Bt_DBaseSelect: TButton;
    GB_WaveLet1: TGroupBox;
    RB_bWLAxisXT: TRadioButton;
    RB_bWLAxisXN: TRadioButton;
    Ss_WLXY11: TLineSeries;
    Ss_WLXY12: TLineSeries;
    MM_Test: TMenuItem;
    P_Test: TPanel;
    GB_Test: TGroupBox;
    Lb_Test1: TLabel;
    Lb_Test2: TLabel;
    Lb_Test3: TLabel;
    Ed_TestSt1: TEdit;
    Ed_TestSt2: TEdit;
    Ed_TestSt3: TEdit;
    Ed_TestSt4: TEdit;
    Ed_TestFn1: TEdit;
    Ed_TestFn2: TEdit;
    Ed_TestFn3: TEdit;
    Ed_TestFn4: TEdit;
    Ed_TestHz1: TEdit;
    Ed_TestHz2: TEdit;
    Ed_TestHz3: TEdit;
    Ed_TestHz4: TEdit;
    CB_bTest1: TCheckBox;
    CB_bTest2: TCheckBox;
    CB_bTest3: TCheckBox;
    CB_bTest4: TCheckBox;
    Bt_TestOk: TButton;
    Bt_TestCancel: TButton;
    TS_CV: TTabSheet;
    Ch_CV1: TChart;
    Lb_V11: TLabel;
    Lb_V12: TLabel;
    Lb_V1m: TLabel;
    Ch_CV2: TChart;
    Lb_V21: TLabel;
    Lb_V22: TLabel;
    Lb_V2m: TLabel;
    Ss_CV21: TLineSeries;
    Ss_CV22: TLineSeries;
    Ss_CV2m: TLineSeries;
    Ss_CV11: TLineSeries;
    Ss_CV12: TLineSeries;
    Ss_CV1m: TLineSeries;
    GB_GraphParam2: TGroupBox;
    RB_bSpec: TRadioButton;
    RB_bDiff: TRadioButton;
    RB_bRltn: TRadioButton;
    TabSheet7: TTabSheet;
    GB_CV1: TGroupBox;
    Ed_Svel: TEdit;
    UD_Svel: TUpDown;
    UD_Tvel: TUpDown;
    Ed_Tvel: TEdit;
    Lb_Tvel: TLabel;
    Lb_Svel: TLabel;
    PopupMenu1: TPopupMenu;
    Bt_OptionOk: TButton;
    Bt_OptionCancel: TButton;
    GB_ProbeInput: TGroupBox;
    RB_bTextFile: TRadioButton;
    RB_bImportFile: TRadioButton;
    GB_RecordLength: TGroupBox;
    Ed_tProcInter: TEdit;
    UD_tProcInter: TUpDown;
    Lb_tProbInter: TLabel;
    Ed_SGPalName: TEdit;
    Ed_WLPalName: TEdit;
    Ed_DataExportDir: TEdit;
    Ed_Status: TEdit;
    CB_bValchSave: TCheckBox;
    Pl_SetTitle: TPanel;
    SG_SetTitle: TStringGrid;
    Lb_SetTitle1: TLabel;
    Bt_SetTitleYes: TButton;
    Lb_SetTitle2: TLabel;
    Button2: TButton;
    SaveD: TSaveDialog;
    Pl_TreeV: TPanel;
    TreeV: TTreeView;
    Bt_NoTreeV: TButton;
    Bt_SetTitleNo: TButton;
    GB_Save2: TGroupBox;
    Bt_SaveResult: TButton;
    CB_bSave2: TCheckBox;
    CB_bSave1: TCheckBox;
    Ed_Status2: TEdit;
    Bt_OpenTreeV: TButton;
    Lb_MultCY2a: TLabel;
    Ch_CY3: TChart;
    Ss_CY31: TLineSeries;
    Ss_CY32: TLineSeries;
    Ss_CY30: TLineSeries;
    TS_Graph: TTabSheet;
    GB_Graph1: TGroupBox;
    Ed_nAxis: TEdit;
    UD_nAxis: TUpDown;
    Bt_HApply: TButton;
    Ch_CF3: TChart;
    Ss_CF3m: TLineSeries;
    Ss_CF31: TLineSeries;
    Ss_CF32: TLineSeries;
    Ch_CV3: TChart;
    Ss_CV32: TLineSeries;
    Ss_CV31: TLineSeries;
    Ss_CV3m: TLineSeries;
    Ch_CW3: TChart;
    Ss_CW31: TLineSeries;
    Ss_CW32: TLineSeries;
    Ss_CW33: TLineSeries;
    Ss_CW34: TLineSeries;
    Ss_CW35: TLineSeries;
    Ss_CW3m: TLineSeries;
    Lb_MultCY2b: TLabel;
    Lb_MultCY3a: TLabel;
    Lb_MultCY3b: TLabel;
    Lb_CF31: TLabel;
    Lb_CF32: TLabel;
    Lb_CF3m: TLabel;
    Lb_V31: TLabel;
    Lb_V32: TLabel;
    Lb_V3m: TLabel;
    Lb_CW31: TLabel;
    Lb_CW32: TLabel;
    Lb_CW33: TLabel;
    Lb_CW34: TLabel;
    Lb_CW35: TLabel;
    Lb_CW3m: TLabel;
    Ch_CS32: TChart;
    Ss_CS32: TLineSeries;
    Im_CS32: TImage;
    Ch_CL31: TChart;
    Im_CL31: TImage;
    Ss_CL31: TLineSeries;
    Ch_CL32: TChart;
    Im_CL32: TImage;
    Ss_CL32: TLineSeries;
    Ch_CL2g: TChart;
    Ss_WLXY21: TLineSeries;
    Ss_WLXY22: TLineSeries;
    Ss_WLXY20: TLineSeries;
    Ch_CL3g: TChart;
    Ss_WLXY31: TLineSeries;
    Ss_WLXY32: TLineSeries;
    Ss_WLXY30: TLineSeries;
    Lb_MultCF1a: TLabel;
    Lb_MultCF1b: TLabel;
    Lb_MultCF2a: TLabel;
    Lb_MultCF2b: TLabel;
    Lb_MultCF3a: TLabel;
    Lb_MultCF3b: TLabel;
    Lb_MultCV1a: TLabel;
    Lb_MultCV1b: TLabel;
    Lb_MultCV2a: TLabel;
    Lb_MultCV2b: TLabel;
    Lb_MultCV3a: TLabel;
    Lb_MultCV3b: TLabel;
    Lb_MultCS12a: TLabel;
    Lb_MultCS12b: TLabel;
    Lb_MultCS22a: TLabel;
    Lb_MultCS22b: TLabel;
    Lb_MultCS32a: TLabel;
    Lb_MultCS32b: TLabel;
    Lb_MultCL11a: TLabel;
    Lb_MultCL11b: TLabel;
    Lb_MultCL21a: TLabel;
    Lb_MultCL21b: TLabel;
    Lb_MultCL31a: TLabel;
    Lb_MultCL31b: TLabel;
    Lb_MultCL12a: TLabel;
    Lb_MultCL12b: TLabel;
    Lb_MultCL22a: TLabel;
    Lb_MultCL22b: TLabel;
    Lb_MultCL32a: TLabel;
    Lb_MultCL32b: TLabel;
    Ch_CS11: TChart;
    Im_CS11: TImage;
    Lb_MultCS11a: TLabel;
    Lb_MultCS11b: TLabel;
    Ss_CS11: TLineSeries;
    Ch_CS21: TChart;
    Im_CS21: TImage;
    Lb_MultCS21a: TLabel;
    Lb_MultCS21b: TLabel;
    Ss_CS21: TLineSeries;
    Ch_CS31: TChart;
    Im_CS31: TImage;
    Lb_MultCS31a: TLabel;
    Lb_MultCS31b: TLabel;
    Ss_CS31: TLineSeries;
    Ed_nProb: TEdit;
    Lb_nAxis: TLabel;
    Lb_nProb: TLabel;
    UD_nProb: TUpDown;
    GB_Graph5: TGroupBox;
    Ss_GE111: TPointSeries;
    Ss_GE112: TPointSeries;
    Ss_GE121: TPointSeries;
    Ss_GE122: TPointSeries;
    Ss_GE211: TPointSeries;
    Ss_GE212: TPointSeries;
    Ss_GE221: TPointSeries;
    Ss_GE222: TPointSeries;
    Ss_GE311: TPointSeries;
    Ss_GE312: TPointSeries;
    Ss_GE321: TPointSeries;
    Ss_GE322: TPointSeries;
    Bt_NewBD: TButton;
    Lb_NewBD: TLabel;
    GB_CV2: TGroupBox;
    CB_bError: TCheckBox;
    Ed_ExportDir1: TEdit;
    Ed_ExportDir2: TEdit;
    Lb_MultCY1a: TLabel;
    Lb_MultCY1b: TLabel;
    Lb_MultCW1a: TLabel;
    Lb_MultCW1b: TLabel;
    Lb_MultCW2a: TLabel;
    Lb_MultCW2b: TLabel;
    Lb_MultCW3a: TLabel;
    Lb_MultCW3b: TLabel;
    GB_Graph2: TGroupBox;
    RB_bDim11: TRadioButton;
    RB_bDim12: TRadioButton;
    RB_bDim13: TRadioButton;
    RB_bDim14: TRadioButton;
    GB_Graph3: TGroupBox;
    RB_bDim21: TRadioButton;
    RB_bDim22: TRadioButton;
    RB_bDim23: TRadioButton;
    RB_bDim24: TRadioButton;
    GB_Graph4: TGroupBox;
    RB_bDim31: TRadioButton;
    RB_bDim32: TRadioButton;
    RB_bDim33: TRadioButton;
    RB_bDim34: TRadioButton;
    Lb_Dim1: TLabel;
    Lb_Dim2: TLabel;
    Lb_Dim3: TLabel;
    Lb_Dim4: TLabel;
    Bt_GApply: TButton;
    Bt_LApply: TButton;
    Ed_TestAm1: TEdit;
    Ed_TestAm3: TEdit;
    Ed_TestAm4: TEdit;
    Ed_TestAm2: TEdit;
    Label1: TLabel;
    RB_bMorlet: TRadioButton;
    GB__WaveLet3: TGroupBox;
    Ed_Kmor: TEdit;
    Lb_Kmor: TLabel;
    Ch_Morlet: TChart;
    Ss_MorRe: TLineSeries;
    Ss_MorIm: TLineSeries;
    Ss_Mor0: TLineSeries;
    Lb_MorletRe: TLabel;
    Lb_MorletIm: TLabel;
    UD_Kmor: TUpDown;
    CB_bCorrectMor: TCheckBox;
    Ed_tProcStart1: TEdit;
    UD_tProcStart1: TUpDown;
    Lb_tProbStart: TLabel;
    GB_VectorSelect: TGroupBox;
    RB_bVectorForce: TRadioButton;
    RB_bVectorMoment: TRadioButton;
    RB_bNotWL: TRadioButton;
    Ss_CF1p: TLineSeries;
    Ss_CF2p: TLineSeries;
    Ss_CF3p: TLineSeries;
    Ss_CV1p: TLineSeries;
    Ss_CV2p: TLineSeries;
    Ss_CV3p: TLineSeries;
    GB_Graph6: TGroupBox;
    Ed_dLeftG: TEdit;
    Ed_dRightG: TEdit;
    Ed_dTopG: TEdit;
    Ed_dBottomG: TEdit;
    UD_dLeftG: TUpDown;
    UD_dRightG: TUpDown;
    UD_dTopG: TUpDown;
    UD_dBottomG: TUpDown;
    Lb_dLeftG: TLabel;
    Lb_dRightG: TLabel;
    Lb_TopG: TLabel;
    Lb_dBottomG: TLabel;
    Bt_GraphCorr: TButton;
    CB_bSave3: TCheckBox;
    Pl_SGColPal: TPanel;
    Im_SGColPal: TImage;
    Lb_SGCol10: TLabel;
    Lb_SGCol09: TLabel;
    Lb_SGCol08: TLabel;
    Lb_SGCol07: TLabel;
    Lb_SGCol06: TLabel;
    Lb_SGCol05: TLabel;
    Lb_SGCol04: TLabel;
    Lb_SGCol03: TLabel;
    Lb_SGCol02: TLabel;
    Lb_SGCol01: TLabel;
    Lb_SGCol00: TLabel;
    Pl_WLColPal: TPanel;
    Im_WLColPal: TImage;
    Lb_WLCol10: TLabel;
    Lb_WLCol09: TLabel;
    Lb_WLCol08: TLabel;
    Lb_WLCol07: TLabel;
    Lb_WLCol06: TLabel;
    Lb_WLCol05: TLabel;
    Lb_WLCol04: TLabel;
    Lb_WLCol03: TLabel;
    Lb_WLCol02: TLabel;
    Lb_WLCol01: TLabel;
    Lb_WLCol00: TLabel;
    Ed_ExportDir3: TEdit;
    LB_FMean1: TListBox;
    LB_FMean2: TListBox;
    LB_FMean3: TListBox;
    LB_VMean1: TListBox;
    LB_VMean2: TListBox;
    LB_VMean3: TListBox;
    Ed_tProcStart2: TEdit;
    UD_tProcStart2: TUpDown;
    Label3: TLabel;
    Bt_OptionApply: TButton;
    Ed_Fdiscr: TEdit;
    Label2: TLabel;
    RB_bBinFile: TRadioButton;
    CB_RecordDelete: TCheckBox;
    GroupBox1: TGroupBox;
    Lb_dLeftD: TLabel;
    Lb_dRightD: TLabel;
    Lb_dTopD: TLabel;
    Lb_dBottomD: TLabel;
    Ed_dLeftD: TEdit;
    Ed_dRightD: TEdit;
    Ed_dTopD: TEdit;
    Ed_dBottomD: TEdit;
    UD_dLeftD: TUpDown;
    UD_dRightD: TUpDown;
    UD_dTopD: TUpDown;
    UD_dBottomD: TUpDown;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure OutAll;
    procedure ProbeLoadClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SetAmplitude(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Ch_CFMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SB_FSpFChange(Sender: TObject);
    procedure SetStabType(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SB_StabChange(Sender: TObject);
    procedure UpD_SetFreq(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Ch_CWMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SetSpecType(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PageCChange(Sender: TObject);
    procedure Bt_SaveResultClick(Sender: TObject);
    procedure RB_bOutStMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_CSMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MM_OptionClick(Sender: TObject);
    procedure RB_SGScaleMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure TableABeforeDelete(DataSet: TDataSet);
    procedure CB_bFilterClick(Sender: TObject);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Bt_AdgeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Bt_DiagMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RB_WLScaleMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure UpD_TwinMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_WLMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MM_TestClick(Sender: TObject);
    procedure Bt_TestCancelClick(Sender: TObject);
    procedure Bt_TestOkClick(Sender: TObject);
    procedure Ch_CVMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MM_File_ExitClick(Sender: TObject);
    procedure Bt_OptionOkClick(Sender: TObject);
    procedure OptionMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Bt_SetTitleYesMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button2Click(Sender: TObject);
    procedure Bt_NoTreeVClick(Sender: TObject);
    procedure Bt_SetTitleNoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Bt_OpenTreeVMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Bt_HApplyMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure UD_H2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure UD_H1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Ed_H2Change(Sender: TObject);
    procedure Ed_H1Change(Sender: TObject);
    procedure TreeVChange(Sender: TObject; Node: TTreeNode);
    procedure Bt_NewBDClick(Sender: TObject);
    procedure Bt_GApplyMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Ed_FChange(Sender: TObject);
    procedure Bt_LApplyMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RB_WLMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormResize(Sender: TObject);
    procedure Ch_CFMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Ch_CVMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Bt_GraphCorrClick(Sender: TObject);
    procedure Ed_KeyPress_Wrd(Sender: TObject; var Key: Char);
    procedure Ed_KeyPress_Int(Sender: TObject; var Key: Char);
    procedure Ed_KeyPress_Real(Sender: TObject; var Key: Char);
    procedure Bt_OptionApplyMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Ed_EditEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
{$R *.dfm}

// Main ========================================================================
procedure TForm1.FormCreate(Sender: TObject);
begin
  PageC.ActivePageIndex:=0;
  MainInit;
  pFourierInit;
  VelchInit;
  WinFourInit;
  SGInit;
  WLInit;
  DataExportInit;
end;
//..............................................................................
procedure TForm1.FormResize(Sender: TObject);
begin
  _pSetWin;
  _pCS_Win;
  _pCL_Win;
end;
//..............................................................................
procedure TForm1.MM_File_ExitClick(Sender: TObject);
begin
  Close;
end;
//..............................................................................
procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TableA.Active:=FALSE;
  pFreeMemProb;  
  pFreeMemFour;
  pFreeMemVelch;
  pFreeMemWin;
  pFreeMemWaveLet;
  pFreeMemMorlet;
  WritePar;
  WriteDialog_ini;
end;
// Common ----------------------------------------------------------------------
procedure TForm1.MM_OptionClick(Sender: TObject);
begin
  Option;
end;
//..............................................................................
procedure TForm1.OptionMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  NewOption(Sender);
end;
//..............................................................................
procedure TForm1.Bt_OptionOkClick(Sender: TObject);
begin
  OptionOkClick;
end;
//..............................................................................
procedure TForm1.PageCChange(Sender: TObject);
begin
  MainStatus(bProb[1],bCalc[1],bProb[2],bCalc[2]);
end;
//..............................................................................
procedure TForm1.SetAmplitude(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MainStatus(bProb[1],FALSE,bProb[2],FALSE);
  SetAmpl(Sender);
  pOutFourier;
  OutVelch;
  OutFourWin;
  OutSpGramm;
  if bMorlet then OutMorlet;
  MainStatus(bProb[1],TRUE and bProb[1],bProb[2],TRUE and bProb[2]);
end;
// Загрузка Пробы --------------------------------------------------------------
procedure TForm1.OutAll;
begin
  PageC.ActivePageIndex:=0;
  pOutProb;
  PageC.ActivePageIndex:=1;
  pGetFourier;
  PageC.ActivePageIndex:=2;
  GetVelch;
  PageC.ActivePageIndex:=3;
  GetFourWin;
  PageC.ActivePageIndex:=4;
  OutSpGramm;
  PageC.ActivePageIndex:=5;
  if (not bNotWL) then if bMorlet then GetMorlet else GetDaubech;
  PageC.ActivePageIndex:=0;
  ResultSaveStatus;
end;
//..............................................................................
procedure TForm1.ProbeLoadClick(Sender: TObject);
begin
  if not bProb[1] then
  begin
    Form1.BorderStyle:=bsSingle;
    Form1.BorderIcons:=[biSystemMenu,biMinimize];
    _pSetWin;
    _pCS_Win;
    _pCL_Win;
  end;

  if Sender=MM_File_Prob1 then
  begin
    if not bProb[2] then nProb:=1;
    nLoadPr:=1;
    ProbeName[1]:='';
    ExportDir[1]:='';
    Ed_ExportDir1.Text:=ExportDir[1];
  end;

  if Sender=MM_File_Prob2 then
  begin
    nProb:=2;
    nLoadPr:=2;
    ProbeName[2]:='';
    ExportDir[2]:='';
    Ed_ExportDir2.Text:=ExportDir[2];
  end;

  if bTextFile then if _fbGetTitleType then
  begin
    _pReadTitle;
    if bChann then _fbOutTreeVText else _pReadChan;
  end;

  if bBinFile then _pReadBin;

  if bImportFile then OutTreeVImport;
end;
//..............................................................................
procedure TForm1.TreeVChange(Sender: TObject; Node: TTreeNode);
var
  m,n,nLevel: Word;
begin
  NodeParent:=Node.Parent.Index;
  NodeLevel:=Node.Level;
//  NodeIndex:=Node.Index;

  if bTextFile   and (NodeLevel<1) then Exit;
  if bImportFile and (NodeLevel<2) then Exit;

  for m:=1 to 50 do SelChann[nLoadPr,m]:=-1;

  nLevel:=TreeV.Items.Count-1;
            
  m:=0;
  for n:=NodeLevel to nLevel do
  begin
    if TreeV.Items.Item[n].Selected then
    begin
      inc(m);
      SelChann[nLoadPr,m]:=TreeV.Items.Item[n].Index;
      if bTextFile then SelChann[nLoadPr,m]:=SelChann[nLoadPr,m]+1;
    end;
  end;
  if nLoadPr=1 then nSelectChann[1]:=Min(m,nAxis0);
  if nLoadPr=2 then
  begin
    nSelectChann[2]:=Min(m,nAxis0);
//    if bTextFile and (nAxis[2]>nAxis[1]) then nAxis[2]:=nAxis[1];
  end;  
end;
//..............................................................................
procedure TForm1.Bt_OpenTreeVMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TreeV.Items.Clear;

  if bTextFile then if NodeLevel=1 then
  begin
    Pl_TreeV.Visible:=FALSE;
    Update;
    _fbReadChanTree;
  end;

  if bImportFile then if NodeLevel=2 then
  begin
    Pl_TreeV.Visible:=FALSE;
    Update;
    ImportChan;
  end;
end;
//..............................................................................
procedure TForm1.SetStabType(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  pOutProb;
end;
//..............................................................................
procedure TForm1.SB_StabChange(Sender: TObject);
begin
  pOutProb;
end;
// FourierAnalys ---------------------------------------------------------------
procedure TForm1.SetSpecType(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  pOutFourier;
  OutVelch;
end;
//..............................................................................
procedure TForm1.SB_FSpFChange(Sender: TObject);
begin
  pOutFourier;
end;
//..............................................................................
procedure TForm1.Ch_CFMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then pOutFourierMean(Sender,X);
end;
//..............................................................................
procedure TForm1.Ch_CFMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbLeft then pOutFourierMar(Sender,X);
end;
// Velch -----------------------------------------------------------------------
procedure TForm1.Ch_CVMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then OutVelchMean(Sender,X);
end;

procedure TForm1.Ch_CVMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbLeft then OutVelchMar(Sender,X);
end;
// WinFourier ------------------------------------------------------------------
procedure TForm1.UpD_SetFreq(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SetFequencyUD;
end;
//..............................................................................
procedure TForm1.Ed_FChange(Sender: TObject);
begin
  SetFequencyEd;
end;
//..............................................................................
procedure TForm1.Bt_GApplyMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  OutFourWin;
end;
//..............................................................................
procedure TForm1.Ch_CWMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  OutWinMar(Sender,X);
end;
//..............................................................................
procedure TForm1.RB_bOutStMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  OutFourWin;
end;
//..............................................................................
procedure TForm1.UpD_TwinMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
end;
// SpectroGramm ----------------------------------------------------------------
procedure TForm1.Im_CSMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  OutSGMar(Sender,X,Y);
end;
//..............................................................................
procedure TForm1.RB_SGScaleMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MainStatus(bProb[1],FALSE,bProb[2],FALSE);
  OutSpGramm;
  MainStatus(bProb[1],TRUE and bProb[1],bProb[2],TRUE and bProb[2]);
end;
// WaveLet ---------------------------------------------------------------------
procedure TForm1.RB_WLScaleMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  MainStatus(bProb[1],FALSE,bProb[2],FALSE);
  if not bNotWL then if bMorlet then GetMorlet else GetDaubech;
  MainStatus(bProb[1],TRUE and bProb[1],bProb[2],TRUE and bProb[2]);
end;
//..............................................................................
procedure TForm1.Bt_LApplyMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MainStatus(bProb[1],FALSE,bProb[2],FALSE);
  if Form1.RB_bWLDiagr.Checked then OutDaubech;
  if Form1.RB_bWLGraph.Checked then OutDaubechXY;
  MainStatus(bProb[1],TRUE and bProb[1],bProb[2],TRUE and bProb[2]);
end;
//..............................................................................
procedure TForm1.Im_WLMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if not bNotWL then if bMorlet then SetCMm(Sender,X,Y) else SetCLm(Sender,X,Y);
end;
// DataExport ------------------------------------------------------------------
procedure TForm1.Bt_SaveResultClick(Sender: TObject);
begin
  if CB_bSave1.Checked then begin SetTitle(1); Exit; end;
  if CB_bSave2.Checked then begin SetTitle(2); Exit; end;
  if CB_bSave3.Checked then begin SetTitle(3); Exit; end;
end;
//..............................................................................
procedure TForm1.Bt_AdgeMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  pAdgeDialog(Sender,X,Y);
end;
//..............................................................................
procedure TForm1.Bt_DiagMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  pDiagDialog(Sender,X,Y);
end;
//..............................................................................
procedure TForm1.DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbLeft then pFilter;
  if Button=mbRight then
  begin
    if DBGrid1.SelectedField.DisplayName='Возрастная гр.' then
     pAdgeDialog(Sender,X,Y);
    if DBGrid1.SelectedField.DisplayName='Диагноз' then
     pDiagDialog(Sender,X,Y);
  end;
end;
//..............................................................................
procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
  OpenExportDir;
end;
//..............................................................................
procedure TForm1.TableABeforeDelete(DataSet: TDataSet);
begin
  RecordDelete;
end;
//..............................................................................
procedure TForm1.CB_bFilterClick(Sender: TObject);
begin
  pSetFilter;
end;
// DataExport ------------------------------------------------------------------
procedure TForm1.MM_TestClick(Sender: TObject);
begin
  P_Test.Visible:=not P_Test.Visible;
  if P_Test.Visible then ReadTest;
end;
//..............................................................................
procedure TForm1.Bt_TestCancelClick(Sender: TObject);
begin
  P_Test.Visible:=FALSE;
end;
//..............................................................................
procedure TForm1.Bt_TestOkClick(Sender: TObject);
begin
  P_Test.Visible:=FALSE;
  Update;
  GetTest;
  MainStatus(TRUE,FALSE,FALSE,FALSE);
  OutAll;
  MainStatus(TRUE,TRUE,FALSE,FALSE);
end;
//==============================================================================
procedure TForm1.Bt_SetTitleYesMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  SetTitleYes;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  OpenExportDir;
end;

procedure TForm1.Bt_NoTreeVClick(Sender: TObject);
begin
  Pl_TreeV.Visible:=FALSE;
  TreeV.Items.Clear;
end;

procedure TForm1.Bt_SetTitleNoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  SetTitleNo;
end;
//-Регулировка частоты----------------------------------------------------------
procedure TForm1.UD_H2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  H2:=UD_H2.Position/10;
  Ed_H2.Text:=FloatToStr(H2);
end;
//..............................................................................
procedure TForm1.UD_H1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  H1:=UD_H1.Position/10;
  Ed_H1.Text:=FloatToStr(H1);
end;
//..............................................................................
procedure TForm1.Ed_H2Change(Sender: TObject);
var
  H2m: Real;
begin
  H2m:=Fdiscr div 2;
  if Ed_H2.Text='' then Exit;
  Ed_H2.Text:=Ed_Filter(Ed_H2.Text);
  H2:=StrToFloat(Ed_H2.Text);
  if H2>H2m then begin H2:=H2m; Ed_H2.Text:=FloatToStr(H2); end;
  UD_H2.Position:=Round(H2*10);
end;
//..............................................................................
procedure TForm1.Ed_H1Change(Sender: TObject);
begin
  if Ed_H1.Text='' then Exit;
  Ed_H1.Text:=Ed_Filter(Ed_H1.Text);
  H1:=StrToFloat(Ed_H1.Text);
  UD_H1.Position:=Round(H1*10);
end;
//..............................................................................
procedure TForm1.Bt_HApplyMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Ed_H1.Text='' then Ed_H1.Text:=FloatToStr(H1);
  if Ed_H2.Text='' then Ed_H2.Text:=FloatToStr(H2);
  Ed_Status2.Text:='';
  if H2<=H1 then begin Ed_Status2.Text:='Уточните значения частот'; Exit; end;
  MainStatus(bProb[1],FALSE,bProb[2],FALSE);
  SetH(Sender);
  pOutFourier;
  OutVelch;
  OutSpGramm;
  if bMorlet then GetMorlet;
  MainStatus(bProb[1],TRUE and bProb[1],bProb[2],TRUE and bProb[2]);
end;
//------------------------------------------------------------------------------
procedure TForm1.Bt_NewBDClick(Sender: TObject);
var
  F: File of Byte;
  i,I0: Integer;
  D: array[1..5000] of Byte;
  FoldName: String;
begin
  if SaveD.Execute then
  begin
    FoldName:=SaveD.FileName;
    MkDir(FoldName);
    MkDir(FoldName+'\__DBase');

    AssignFile(F,ProgDir+'\_BDmodel\__DBase\Stab.db');
    ReSet(F);
      I0:=0;
      While not EoF(F) do begin inc(I0); Read(F,D[I0]); end;
    CloseFile(F);
    AssignFile(F,FoldName+'\__DBase\Stab.db');
    ReWrite(F);
      for i:=1 to I0 do Write(F,D[i]);
    CloseFile(F);

    AssignFile(F,ProgDir+'\_BDmodel\__DBase\Stab.VAL');
    ReSet(F);
      I0:=0;
      While not EoF(F) do begin inc(I0); Read(F,D[I0]); end;
    CloseFile(F);
    AssignFile(F,FoldName+'\__DBase\Stab.VAL');
    ReWrite(F);
      for i:=1 to I0 do Write(F,D[i]);
    CloseFile(F);

    AssignFile(F,ProgDir+'\_BDmodel\__DBase\Stab.XG0');
    ReSet(F);
      I0:=0;
      While not EoF(F) do begin inc(I0); Read(F,D[I0]); end;
    CloseFile(F);
    AssignFile(F,FoldName+'\__DBase\Stab.XG0');
    ReWrite(F);
      for i:=1 to I0 do Write(F,D[i]);
    CloseFile(F);

    AssignFile(F,ProgDir+'\_BDmodel\__DBase\Stab.YG0');
    ReSet(F);
      I0:=0;
      While not EoF(F) do begin inc(I0); Read(F,D[I0]); end;
    CloseFile(F);
    AssignFile(F,FoldName+'\__DBase\Stab.YG0');
    ReWrite(F);
      for i:=1 to I0 do Write(F,D[i]);
    CloseFile(F);

    Form1.Ed_DataExportDir.Text:=FoldName;
    bDataExport:=TRUE;
  end;
end;

procedure TForm1.RB_WLMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  WLStatus;
end;
//==============================================================================

procedure TForm1.Bt_GraphCorrClick(Sender: TObject);
begin
  if Sender=Ed_dLeftG   then UD_dLeftG.Position:=  StrToInt(Ed_dLeftG.Text)+50;
  if Sender=Ed_dRightG  then UD_dRightG.Position:= StrToInt(Ed_dRightG.Text)+50;
  if Sender=Ed_dTopG    then UD_dTopG.Position:=   StrToInt(Ed_dTopG.Text)+50;
  if Sender=Ed_dBottomG then UD_dBottomG.Position:=StrToInt(Ed_dBottomG.Text)+50;
end;

procedure TForm1.Ed_KeyPress_Wrd(Sender: TObject; var Key: Char);
begin
  if Ord(Key)<>8 then if (not (Key in ['0'..'9'])) then Key:=#0;
end;

procedure TForm1.Ed_KeyPress_Int(Sender: TObject; var Key: Char);
begin
  if Ord(Key)<>8 then if (not (Key in ['-','0'..'9'])) then Key:=#0;
end;

procedure TForm1.Ed_KeyPress_Real(Sender: TObject; var Key: Char);
begin
  if Ord(Key)<>8 then if (not (Key in ['.','0'..'9'])) then Key:=#0;
end;

procedure TForm1.Bt_OptionApplyMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  _fCheckEdit;
end;

procedure TForm1.Ed_EditEnter(Sender: TObject);
begin
  NewOption(Sender);
  Bt_OptionOk.Enabled:=FALSE;
  Bt_OptionApply.Enabled:=TRUE;
end;

end.

