object Form1: TForm1
  Left = 243
  Top = 213
  Width = 917
  Height = 688
  Caption = 
    #1063#1072#1089#1090#1086#1090#1085#1099#1081' '#1072#1085#1072#1083#1080#1079' '#1089#1090#1072#1073#1080#1083#1086#1075#1088#1072#1092#1080#1095#1077#1089#1082#1080#1093' '#1089#1080#1075#1085#1072#1083#1086#1074'  FASS034  22.10.201' +
    '2 '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  DesignSize = (
    909
    639)
  PixelsPerInch = 96
  TextHeight = 13
  object Lb_StabName1: TLabel
    Left = 4
    Top = 8
    Width = 52
    Height = 16
    Caption = #1055#1088#1086#1073#1072' 1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Lb_StabName2: TLabel
    Left = 4
    Top = 36
    Width = 52
    Height = 16
    Caption = #1055#1088#1086#1073#1072' 2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object PageC: TPageControl
    Left = 2
    Top = 60
    Width = 903
    Height = 548
    ActivePage = TS_CY
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = PageCChange
    object TS_CY: TTabSheet
      Caption = #1055#1088#1086#1073#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      DesignSize = (
        895
        517)
      object Ch_CY1: TChart
        Left = 2
        Top = 2
        Width = 726
        Height = 168
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 2
        MarginLeft = 0
        MarginRight = 2
        MarginTop = 0
        Title.Alignment = taRightJustify
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          #1054#1089#1100' X')
        BottomAxis.Axis.Width = 3
        BottomAxis.AxisValuesFormat = '# ##0.###'
        BottomAxis.ExactDateTime = False
        BottomAxis.Increment = 5.000000000000000000
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        BottomAxis.MinorTickCount = 4
        BottomAxis.Title.Caption = #1042#1088#1077#1084#1103', '#1089#1077#1082
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.Axis.Width = 3
        LeftAxis.AxisValuesFormat = '# ##0.###'
        LeftAxis.ExactDateTime = False
        LeftAxis.Increment = 0.050000000000000000
        LeftAxis.LabelsAngle = 90
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.LabelsSeparation = 50
        LeftAxis.MinorTickCount = 4
        LeftAxis.Title.Caption = '__________'
        LeftAxis.Title.Font.Charset = RUSSIAN_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.ColorWidth = 0
        Legend.HorizMargin = 1
        Legend.LegendStyle = lsSeries
        Legend.ShadowSize = 0
        Legend.TextStyle = ltsPlain
        Legend.TopPos = 11
        Legend.Visible = False
        View3D = False
        Color = clWhite
        TabOrder = 0
        Anchors = [akLeft, akTop, akRight, akBottom]
        object Lb_MultCY1a: TLabel
          Left = 40
          Top = 8
          Width = 21
          Height = 13
          Caption = 'x10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCY1b: TLabel
          Left = 62
          Top = 0
          Width = 8
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Ss_CY10: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = -1
          Title = 'Series_CF0'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CY11: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          Title = 'Ss_'#1057'Y11'
          Pointer.HorizSize = 1
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
          Pointer.VertSize = 1
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CY12: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'Series_CF2'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object Ch_CY2: TChart
        Left = 2
        Top = 175
        Width = 726
        Height = 168
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 2
        MarginLeft = 0
        MarginRight = 2
        MarginTop = 0
        Title.Alignment = taRightJustify
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          #1054#1089#1100' Y')
        BottomAxis.Axis.Width = 3
        BottomAxis.ExactDateTime = False
        BottomAxis.Increment = 5.000000000000000000
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        BottomAxis.MinorTickCount = 4
        BottomAxis.Title.Caption = #1042#1088#1077#1084#1103', '#1089#1077#1082
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.Axis.Width = 3
        LeftAxis.ExactDateTime = False
        LeftAxis.Increment = 0.050000000000000000
        LeftAxis.LabelsAngle = 90
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.LabelsSeparation = 50
        LeftAxis.MinorTickCount = 4
        LeftAxis.Title.Caption = '__________'
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Visible = False
        View3D = False
        Color = clWhite
        TabOrder = 1
        Anchors = [akLeft, akTop, akRight, akBottom]
        object Lb_MultCY2a: TLabel
          Left = 40
          Top = 8
          Width = 21
          Height = 13
          Caption = 'x10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCY2b: TLabel
          Left = 62
          Top = 0
          Width = 8
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Ss_CY20: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = -1
          Title = 'Series_CS0'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CY21: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          Title = 'Series_CS1'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CY22: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'Series_CS2'
          Dark3D = False
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object GB_SpectrumType: TGroupBox
        Left = 740
        Top = 4
        Width = 153
        Height = 97
        Anchors = [akTop, akRight]
        Caption = #1058#1080#1087' '#1089#1087#1077#1082#1090#1088#1072
        TabOrder = 2
        object RB_bInit: TRadioButton
          Left = 4
          Top = 20
          Width = 137
          Height = 17
          Caption = #1048#1089#1093#1086#1076#1085#1099#1081
          Checked = True
          TabOrder = 0
          TabStop = True
          OnMouseUp = SetStabType
        end
        object RB_bCentre: TRadioButton
          Left = 4
          Top = 44
          Width = 137
          Height = 17
          Caption = #1062#1077#1085#1090#1088#1080#1088#1086#1074#1072#1085#1085#1099#1081
          TabOrder = 1
          OnMouseUp = SetStabType
        end
        object RB_bFiltr: TRadioButton
          Left = 4
          Top = 68
          Width = 137
          Height = 17
          Caption = #1062#1080#1092#1088#1086#1074#1086#1077' '#1086#1082#1085#1086
          TabOrder = 2
          OnMouseUp = SetStabType
        end
      end
      object Ch_CY3: TChart
        Left = 2
        Top = 348
        Width = 726
        Height = 168
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 2
        MarginLeft = 0
        MarginRight = 2
        MarginTop = 0
        Title.Alignment = taRightJustify
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          #1054#1089#1100' Z')
        BottomAxis.Axis.Width = 3
        BottomAxis.ExactDateTime = False
        BottomAxis.Increment = 5.000000000000000000
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        BottomAxis.MinorTickCount = 4
        BottomAxis.Title.Caption = #1042#1088#1077#1084#1103', '#1089#1077#1082
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.Axis.Width = 3
        LeftAxis.ExactDateTime = False
        LeftAxis.Increment = 0.050000000000000000
        LeftAxis.LabelsAngle = 90
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.Title.Caption = '__________'
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Visible = False
        View3D = False
        Color = clWhite
        TabOrder = 3
        Anchors = [akLeft, akTop, akRight, akBottom]
        object Lb_MultCY3a: TLabel
          Left = 40
          Top = 8
          Width = 21
          Height = 13
          Caption = 'x10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCY3b: TLabel
          Left = 62
          Top = 0
          Width = 8
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Ss_CY30: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlack
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CY31: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 10485760
          Title = 'Ss_CY31'
          LinePen.Color = 10485760
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CY32: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'Ss_CY32'
          LinePen.Color = clGreen
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
    end
    object TS_CF: TTabSheet
      BorderWidth = 1
      Caption = #1060#1091#1088#1100#1077'-'#1072#1085#1072#1083#1080#1079
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      DesignSize = (
        893
        515)
      object Ch_CF1: TChart
        Left = 2
        Top = 2
        Width = 708
        Height = 150
        AllowPanning = pmNone
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 2
        MarginLeft = 1
        MarginRight = 2
        MarginTop = 0
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          '__________    ')
        BottomAxis.Axis.Width = 3
        BottomAxis.ExactDateTime = False
        BottomAxis.Increment = 0.100000000000000000
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        BottomAxis.LabelsSeparation = 50
        BottomAxis.MinorTickCount = 9
        BottomAxis.Title.Caption = #1063#1072#1089#1090#1086#1090#1072', '#1043#1094
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.Axis.Width = 3
        LeftAxis.ExactDateTime = False
        LeftAxis.Increment = 0.050000000000000000
        LeftAxis.LabelsAngle = 90
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.LabelsSeparation = 50
        LeftAxis.MinorTickCount = 4
        LeftAxis.Title.Caption = '__________   '
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Visible = False
        TopAxis.Title.Font.Charset = DEFAULT_CHARSET
        TopAxis.Title.Font.Color = clBlack
        TopAxis.Title.Font.Height = -13
        TopAxis.Title.Font.Name = 'Arial'
        TopAxis.Title.Font.Style = []
        View3D = False
        Color = clWhite
        TabOrder = 0
        Anchors = [akLeft, akTop, akRight, akBottom]
        OnMouseDown = Ch_CFMouseDown
        OnMouseUp = Ch_CFMouseUp
        DesignSize = (
          708
          150)
        object Lb_CF11: TLabel
          Left = 96
          Top = 4
          Width = 66
          Height = 13
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_CF12: TLabel
          Left = 180
          Top = 4
          Width = 66
          Height = 13
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_CF1m: TLabel
          Left = 116
          Top = 134
          Width = 70
          Height = 13
          Anchors = [akLeft, akBottom]
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCF1a: TLabel
          Left = 40
          Top = 8
          Width = 21
          Height = 13
          Caption = 'x10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCF1b: TLabel
          Left = 62
          Top = 0
          Width = 8
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Ss_CF11: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          Title = 'Series_FSpF1'
          ValueFormat = '0.#'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CF12: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'Series_FSpF2'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CF1m: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Series_FSpFMar'
          LinePen.Visible = False
          Pointer.HorizSize = 1
          Pointer.InflateMargins = False
          Pointer.Style = psCross
          Pointer.VertSize = 400
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CF1p: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Ss_CF1p'
          LinePen.Color = clRed
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object Ch_CF2: TChart
        Left = 2
        Top = 175
        Width = 708
        Height = 150
        AllowPanning = pmNone
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 2
        MarginLeft = 1
        MarginRight = 2
        MarginTop = 0
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          '__________')
        BottomAxis.Axis.Width = 3
        BottomAxis.ExactDateTime = False
        BottomAxis.Increment = 0.100000000000000000
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        BottomAxis.LabelsSeparation = 50
        BottomAxis.MinorTickCount = 9
        BottomAxis.Title.Caption = #1063#1072#1089#1090#1086#1090#1072', '#1043#1094
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.Axis.Width = 3
        LeftAxis.ExactDateTime = False
        LeftAxis.LabelsAngle = 90
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.LabelsSeparation = 50
        LeftAxis.MinorTickCount = 4
        LeftAxis.Title.Caption = '__________'
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Visible = False
        View3D = False
        Color = clWhite
        TabOrder = 1
        Anchors = [akLeft, akTop, akRight, akBottom]
        OnMouseDown = Ch_CFMouseDown
        OnMouseUp = Ch_CFMouseUp
        DesignSize = (
          708
          150)
        object Lb_CF2m: TLabel
          Left = 116
          Top = 134
          Width = 66
          Height = 13
          Anchors = [akLeft, akBottom]
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_CF21: TLabel
          Left = 96
          Top = 4
          Width = 70
          Height = 13
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_CF22: TLabel
          Left = 180
          Top = 4
          Width = 70
          Height = 13
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCF2a: TLabel
          Left = 40
          Top = 8
          Width = 21
          Height = 13
          Caption = 'x10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCF2b: TLabel
          Left = 62
          Top = 0
          Width = 8
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Ss_CF21: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          Title = 'Series_FSpS1'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CF22: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'Series_FSpS2'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CF2m: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Series_FSpSMar'
          LinePen.Visible = False
          Pointer.HorizSize = 1
          Pointer.InflateMargins = False
          Pointer.Style = psCross
          Pointer.VertSize = 400
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CF2p: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Ss_CF2p'
          LinePen.Color = clRed
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object Ch_CF3: TChart
        Left = 2
        Top = 348
        Width = 708
        Height = 150
        AllowPanning = pmNone
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 2
        MarginLeft = 1
        MarginRight = 2
        MarginTop = 0
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          '__________')
        BottomAxis.Axis.Width = 3
        BottomAxis.ExactDateTime = False
        BottomAxis.Increment = 0.100000000000000000
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        BottomAxis.LabelsSeparation = 50
        BottomAxis.MinorTickCount = 9
        BottomAxis.Title.Caption = #1063#1072#1089#1090#1086#1090#1072', '#1043#1094
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.Axis.Width = 3
        LeftAxis.LabelsAngle = 90
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.LabelsSeparation = 50
        LeftAxis.MinorTickCount = 4
        LeftAxis.Title.Caption = '__________'
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Visible = False
        View3D = False
        Color = clWhite
        TabOrder = 2
        Anchors = [akLeft, akTop, akRight, akBottom]
        OnMouseDown = Ch_CFMouseDown
        OnMouseUp = Ch_CFMouseUp
        DesignSize = (
          708
          150)
        object Lb_CF31: TLabel
          Left = 96
          Top = 4
          Width = 70
          Height = 13
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_CF32: TLabel
          Left = 180
          Top = 4
          Width = 70
          Height = 13
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_CF3m: TLabel
          Left = 116
          Top = 134
          Width = 70
          Height = 13
          Anchors = [akLeft, akBottom]
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCF3a: TLabel
          Left = 40
          Top = 8
          Width = 21
          Height = 13
          Caption = 'x10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCF3b: TLabel
          Left = 62
          Top = 0
          Width = 8
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Ss_CF31: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          LinePen.Color = clBlue
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CF32: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          LinePen.Color = clGreen
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CF3m: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          LinePen.Color = clRed
          LinePen.Visible = False
          Pointer.HorizSize = 1
          Pointer.InflateMargins = False
          Pointer.Style = psCross
          Pointer.VertSize = 400
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CF3p: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Ss_CF3p'
          LinePen.Color = clRed
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object LB_FMean1: TListBox
        Left = 736
        Top = 2
        Width = 157
        Height = 69
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 16
        Items.Strings = (
          '')
        ParentFont = False
        TabOrder = 3
        Visible = False
      end
      object LB_FMean2: TListBox
        Left = 736
        Top = 76
        Width = 157
        Height = 69
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 4
        Visible = False
      end
      object LB_FMean3: TListBox
        Left = 736
        Top = 150
        Width = 157
        Height = 73
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 5
        Visible = False
      end
    end
    object TS_CV: TTabSheet
      Caption = #1042#1077#1083#1095'-'#1072#1085#1072#1083#1080#1079
      ImageIndex = 2
      DesignSize = (
        895
        517)
      object Ch_CV1: TChart
        Left = 2
        Top = 2
        Width = 726
        Height = 168
        AllowPanning = pmNone
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 2
        MarginLeft = 1
        MarginRight = 2
        MarginTop = 0
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          '__________    ')
        BottomAxis.Axis.Width = 3
        BottomAxis.ExactDateTime = False
        BottomAxis.Increment = 0.100000000000000000
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        BottomAxis.LabelsSeparation = 50
        BottomAxis.MinorTickCount = 9
        BottomAxis.Title.Caption = #1063#1072#1089#1090#1086#1090#1072', '#1043#1094
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.Axis.Width = 3
        LeftAxis.ExactDateTime = False
        LeftAxis.Increment = 1.000000000000000000
        LeftAxis.LabelsAngle = 90
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.LabelsSeparation = 50
        LeftAxis.MinorTickCount = 4
        LeftAxis.Title.Caption = '__________   '
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Visible = False
        TopAxis.Title.Font.Charset = DEFAULT_CHARSET
        TopAxis.Title.Font.Color = clBlack
        TopAxis.Title.Font.Height = -13
        TopAxis.Title.Font.Name = 'Arial'
        TopAxis.Title.Font.Style = []
        View3D = False
        Color = clWhite
        TabOrder = 0
        Anchors = [akLeft, akTop, akRight, akBottom]
        OnMouseDown = Ch_CVMouseDown
        OnMouseUp = Ch_CVMouseUp
        DesignSize = (
          726
          168)
        object Lb_V11: TLabel
          Left = 96
          Top = 4
          Width = 50
          Height = 13
          AutoSize = False
          Caption = '      '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_V12: TLabel
          Left = 180
          Top = 4
          Width = 50
          Height = 13
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_V1m: TLabel
          Left = 108
          Top = 152
          Width = 70
          Height = 13
          Anchors = [akLeft, akBottom]
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCV1a: TLabel
          Left = 40
          Top = 8
          Width = 21
          Height = 13
          Caption = 'x10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCV1b: TLabel
          Left = 62
          Top = 0
          Width = 8
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Ss_CV11: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          LinePen.Width = 2
          Pointer.Brush.Color = clBlue
          Pointer.InflateMargins = False
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_GE111: TPointSeries
          Marks.ArrowLength = 0
          Marks.Visible = False
          SeriesColor = clYellow
          Pointer.Brush.Color = clBlue
          Pointer.HorizSize = 2
          Pointer.InflateMargins = False
          Pointer.Pen.Color = clBlue
          Pointer.Style = psRectangle
          Pointer.VertSize = 1
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_GE112: TPointSeries
          Marks.ArrowLength = 0
          Marks.Visible = False
          SeriesColor = clGray
          Pointer.Brush.Color = clBlue
          Pointer.HorizSize = 2
          Pointer.InflateMargins = False
          Pointer.Pen.Color = clBlue
          Pointer.Style = psRectangle
          Pointer.VertSize = 1
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CV12: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_GE121: TPointSeries
          Marks.ArrowLength = 0
          Marks.Visible = False
          SeriesColor = clFuchsia
          Pointer.Brush.Color = clGreen
          Pointer.HorizSize = 2
          Pointer.InflateMargins = False
          Pointer.Pen.Color = clGreen
          Pointer.Style = psRectangle
          Pointer.VertSize = 1
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_GE122: TPointSeries
          Marks.ArrowLength = 0
          Marks.Visible = False
          SeriesColor = clTeal
          Pointer.Brush.Color = clGreen
          Pointer.HorizSize = 2
          Pointer.InflateMargins = False
          Pointer.Pen.Color = clGreen
          Pointer.Style = psRectangle
          Pointer.VertSize = 1
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CV1m: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Dark3D = False
          LinePen.Visible = False
          Pointer.HorizSize = 1
          Pointer.InflateMargins = False
          Pointer.Style = psCross
          Pointer.VertSize = 400
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CV1p: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Ss_CV1p'
          LinePen.Color = clRed
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object Ch_CV2: TChart
        Left = 2
        Top = 175
        Width = 726
        Height = 168
        AllowPanning = pmNone
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 2
        MarginLeft = 1
        MarginRight = 2
        MarginTop = 0
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          '__________    ')
        BottomAxis.Axis.Width = 3
        BottomAxis.ExactDateTime = False
        BottomAxis.Increment = 0.100000000000000000
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        BottomAxis.LabelsSeparation = 50
        BottomAxis.MinorTickCount = 9
        BottomAxis.Title.Caption = #1063#1072#1089#1090#1086#1090#1072', '#1043#1094
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.Axis.Width = 3
        LeftAxis.ExactDateTime = False
        LeftAxis.LabelsAngle = 90
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.LabelsSeparation = 50
        LeftAxis.MinorTickCount = 4
        LeftAxis.Title.Caption = '__________   '
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Visible = False
        TopAxis.Title.Font.Charset = DEFAULT_CHARSET
        TopAxis.Title.Font.Color = clBlack
        TopAxis.Title.Font.Height = -13
        TopAxis.Title.Font.Name = 'Arial'
        TopAxis.Title.Font.Style = []
        View3D = False
        Color = clWhite
        TabOrder = 1
        Anchors = [akLeft, akTop, akRight, akBottom]
        OnMouseDown = Ch_CVMouseDown
        OnMouseUp = Ch_CVMouseUp
        DesignSize = (
          726
          168)
        object Lb_V21: TLabel
          Left = 96
          Top = 4
          Width = 50
          Height = 13
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_V22: TLabel
          Left = 180
          Top = 4
          Width = 50
          Height = 13
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_V2m: TLabel
          Left = 108
          Top = 152
          Width = 70
          Height = 13
          Anchors = [akLeft, akBottom]
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCV2a: TLabel
          Left = 40
          Top = 8
          Width = 21
          Height = 13
          Caption = 'x10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCV2b: TLabel
          Left = 62
          Top = 0
          Width = 8
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Ss_CV21: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_GE211: TPointSeries
          Marks.ArrowLength = 0
          Marks.Visible = False
          SeriesColor = clYellow
          Pointer.Brush.Color = clBlue
          Pointer.HorizSize = 2
          Pointer.InflateMargins = False
          Pointer.Pen.Color = clBlue
          Pointer.Style = psRectangle
          Pointer.VertSize = 1
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_GE212: TPointSeries
          Marks.ArrowLength = 0
          Marks.Visible = False
          SeriesColor = clGray
          Pointer.Brush.Color = clBlue
          Pointer.HorizSize = 2
          Pointer.InflateMargins = False
          Pointer.Pen.Color = clBlue
          Pointer.Style = psRectangle
          Pointer.VertSize = 1
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CV22: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_GE221: TPointSeries
          Marks.ArrowLength = 0
          Marks.Visible = False
          SeriesColor = clFuchsia
          Pointer.Brush.Color = clGreen
          Pointer.HorizSize = 2
          Pointer.InflateMargins = False
          Pointer.Pen.Color = clGreen
          Pointer.Style = psRectangle
          Pointer.VertSize = 1
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_GE222: TPointSeries
          Marks.ArrowLength = 0
          Marks.Visible = False
          SeriesColor = clTeal
          Pointer.Brush.Color = clGreen
          Pointer.HorizSize = 2
          Pointer.InflateMargins = False
          Pointer.Pen.Color = clGreen
          Pointer.Style = psRectangle
          Pointer.VertSize = 1
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CV2m: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          LinePen.Visible = False
          Pointer.HorizSize = 1
          Pointer.InflateMargins = False
          Pointer.Style = psCross
          Pointer.VertSize = 400
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CV2p: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Ss_CV2p'
          LinePen.Color = clRed
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object Ch_CV3: TChart
        Left = 2
        Top = 348
        Width = 726
        Height = 168
        AllowPanning = pmNone
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 2
        MarginLeft = 1
        MarginRight = 2
        MarginTop = 0
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          '__________')
        BottomAxis.Axis.Width = 3
        BottomAxis.ExactDateTime = False
        BottomAxis.Increment = 0.100000000000000000
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        BottomAxis.LabelsSeparation = 50
        BottomAxis.MinorTickCount = 9
        BottomAxis.Title.Caption = #1063#1072#1089#1090#1086#1090#1072', '#1043#1094
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.Axis.Width = 3
        LeftAxis.LabelsAngle = 90
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.LabelsSeparation = 50
        LeftAxis.Title.Caption = '__________'
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Visible = False
        View3D = False
        Color = clWhite
        TabOrder = 2
        Anchors = [akLeft, akTop, akRight, akBottom]
        OnMouseDown = Ch_CVMouseDown
        OnMouseUp = Ch_CVMouseUp
        DesignSize = (
          726
          168)
        object Lb_V31: TLabel
          Left = 96
          Top = 4
          Width = 50
          Height = 13
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_V32: TLabel
          Left = 180
          Top = 4
          Width = 50
          Height = 13
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_V3m: TLabel
          Left = 108
          Top = 152
          Width = 70
          Height = 13
          Anchors = [akLeft, akBottom]
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCV3a: TLabel
          Left = 40
          Top = 8
          Width = 21
          Height = 13
          Caption = 'x10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCV3b: TLabel
          Left = 62
          Top = 0
          Width = 8
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Ss_CV31: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          LinePen.Color = clBlue
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_GE311: TPointSeries
          Marks.ArrowLength = 0
          Marks.Visible = False
          SeriesColor = clYellow
          Pointer.Brush.Color = clBlue
          Pointer.HorizSize = 2
          Pointer.InflateMargins = False
          Pointer.Pen.Color = clBlue
          Pointer.Style = psRectangle
          Pointer.VertSize = 1
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_GE312: TPointSeries
          Marks.ArrowLength = 0
          Marks.Visible = False
          SeriesColor = clGray
          Pointer.Brush.Color = clBlue
          Pointer.HorizSize = 2
          Pointer.InflateMargins = False
          Pointer.Pen.Color = clBlue
          Pointer.Style = psRectangle
          Pointer.VertSize = 1
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CV32: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          LinePen.Color = clGreen
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_GE321: TPointSeries
          Marks.ArrowLength = 0
          Marks.Visible = False
          SeriesColor = clFuchsia
          Pointer.Brush.Color = clGreen
          Pointer.HorizSize = 2
          Pointer.InflateMargins = False
          Pointer.Pen.Color = clGreen
          Pointer.Style = psRectangle
          Pointer.VertSize = 1
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_GE322: TPointSeries
          Marks.ArrowLength = 0
          Marks.Visible = False
          SeriesColor = clTeal
          Pointer.Brush.Color = clGreen
          Pointer.HorizSize = 1
          Pointer.InflateMargins = False
          Pointer.Pen.Color = clGreen
          Pointer.Style = psRectangle
          Pointer.VertSize = 1
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CV3m: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          LinePen.Color = clRed
          LinePen.Visible = False
          Pointer.HorizSize = 1
          Pointer.InflateMargins = False
          Pointer.Style = psCross
          Pointer.VertSize = 400
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CV3p: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Ss_CV3p'
          LinePen.Color = clRed
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object LB_VMean1: TListBox
        Left = 736
        Top = 2
        Width = 157
        Height = 69
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 16
        Items.Strings = (
          '')
        ParentFont = False
        TabOrder = 3
        Visible = False
      end
      object LB_VMean2: TListBox
        Left = 736
        Top = 76
        Width = 157
        Height = 69
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 4
        Visible = False
      end
      object LB_VMean3: TListBox
        Left = 736
        Top = 150
        Width = 157
        Height = 73
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 5
        Visible = False
      end
    end
    object TS_CW: TTabSheet
      Caption = #1054#1082#1086#1085#1085#1099#1081' '#1060#1091#1088#1100#1077'-'#1072#1085#1072#1083#1080#1079
      ImageIndex = 3
      DesignSize = (
        895
        517)
      object Ch_CW1: TChart
        Left = 2
        Top = 2
        Width = 726
        Height = 168
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 2
        MarginLeft = 1
        MarginRight = 2
        MarginTop = 0
        Title.Alignment = taRightJustify
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          #1063#1072#1089#1090#1086#1090#1085#1072#1103' '#1075#1072#1088#1084#1086#1085#1080#1082#1072)
        BottomAxis.Axis.Width = 3
        BottomAxis.AxisValuesFormat = '###0.###'
        BottomAxis.ExactDateTime = False
        BottomAxis.Increment = 5.000000000000000000
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        BottomAxis.MinorTickCount = 4
        BottomAxis.Title.Caption = #1042#1088#1077#1084#1103', '#1089#1077#1082
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.Axis.Width = 3
        LeftAxis.ExactDateTime = False
        LeftAxis.LabelsAngle = 90
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.LabelsSeparation = 50
        LeftAxis.MinorTickCount = 4
        LeftAxis.TickOnLabelsOnly = False
        LeftAxis.Title.Caption = '__________'
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Visible = False
        TopAxis.Title.Font.Charset = DEFAULT_CHARSET
        TopAxis.Title.Font.Color = clBlack
        TopAxis.Title.Font.Height = -13
        TopAxis.Title.Font.Name = 'Arial'
        TopAxis.Title.Font.Style = []
        View3D = False
        Color = clWhite
        TabOrder = 0
        Anchors = [akLeft, akTop, akRight, akBottom]
        OnMouseDown = Ch_CWMouseDown
        DesignSize = (
          726
          168)
        object Lb_CW11: TLabel
          Left = 80
          Top = 4
          Width = 46
          Height = 13
          AutoSize = False
          Caption = '____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_CW12: TLabel
          Left = 132
          Top = 4
          Width = 46
          Height = 13
          AutoSize = False
          Caption = '____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_CW13: TLabel
          Left = 184
          Top = 4
          Width = 46
          Height = 13
          AutoSize = False
          Caption = '____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_CW14: TLabel
          Left = 236
          Top = 4
          Width = 46
          Height = 13
          AutoSize = False
          Caption = '____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clAqua
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_CW15: TLabel
          Left = 288
          Top = 4
          Width = 46
          Height = 13
          AutoSize = False
          Caption = '____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clFuchsia
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_CW1m: TLabel
          Left = 140
          Top = 152
          Width = 40
          Height = 13
          Anchors = [akLeft, akBottom]
          AutoSize = False
          Caption = '____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCW1a: TLabel
          Left = 40
          Top = 8
          Width = 21
          Height = 13
          Caption = 'x10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCW1b: TLabel
          Left = 62
          Top = 0
          Width = 8
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Ss_CW11: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          Title = 'Series_FrCF1'
          ValueFormat = '###0.###'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CW12: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'SeriesFrCF2'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CW13: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'SeriesFrCF3'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CW14: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clAqua
          Title = 'Series_FrCF4'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CW15: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clFuchsia
          Title = 'Series_FrCF5'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CW1m: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Series_FrCFm'
          Pointer.HorizSize = 1
          Pointer.InflateMargins = False
          Pointer.Style = psCross
          Pointer.VertSize = 600
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object Ch_CW2: TChart
        Left = 2
        Top = 175
        Width = 726
        Height = 168
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 2
        MarginLeft = 1
        MarginRight = 2
        MarginTop = 0
        Title.Alignment = taRightJustify
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          #1063#1072#1089#1090#1086#1090#1085#1072#1103' '#1075#1072#1088#1084#1086#1085#1080#1082#1072)
        BottomAxis.Axis.Width = 3
        BottomAxis.ExactDateTime = False
        BottomAxis.Increment = 5.000000000000000000
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        BottomAxis.MinorTickCount = 4
        BottomAxis.Title.Caption = #1042#1088#1077#1084#1103', '#1089#1077#1082
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.Axis.Width = 3
        LeftAxis.ExactDateTime = False
        LeftAxis.LabelsAngle = 90
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.LabelsSeparation = 50
        LeftAxis.MinorTickCount = 4
        LeftAxis.TickOnLabelsOnly = False
        LeftAxis.Title.Caption = '__________'
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Visible = False
        TopAxis.Title.Font.Charset = DEFAULT_CHARSET
        TopAxis.Title.Font.Color = clBlack
        TopAxis.Title.Font.Height = -13
        TopAxis.Title.Font.Name = 'Arial'
        TopAxis.Title.Font.Style = []
        View3D = False
        Color = clWhite
        TabOrder = 1
        Anchors = [akLeft, akTop, akRight, akBottom]
        OnMouseDown = Ch_CWMouseDown
        DesignSize = (
          726
          168)
        object Lb_CW21: TLabel
          Left = 80
          Top = 4
          Width = 46
          Height = 13
          AutoSize = False
          Caption = '____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_CW22: TLabel
          Left = 132
          Top = 4
          Width = 46
          Height = 13
          AutoSize = False
          Caption = '____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_CW23: TLabel
          Left = 184
          Top = 4
          Width = 46
          Height = 13
          AutoSize = False
          Caption = '____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_CW24: TLabel
          Left = 236
          Top = 4
          Width = 46
          Height = 13
          AutoSize = False
          Caption = '____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clAqua
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_CW25: TLabel
          Left = 288
          Top = 4
          Width = 46
          Height = 13
          AutoSize = False
          Caption = '____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clFuchsia
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_CW2m: TLabel
          Left = 140
          Top = 152
          Width = 40
          Height = 13
          Anchors = [akLeft, akBottom]
          AutoSize = False
          Caption = '____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCW2a: TLabel
          Left = 40
          Top = 8
          Width = 21
          Height = 13
          Caption = 'x10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCW2b: TLabel
          Left = 62
          Top = 0
          Width = 8
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Ss_CW21: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          Title = 'Series_FrCS1'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CW22: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'Series_FrCS2'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CW23: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Series_FrCS3'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CW24: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clAqua
          Title = 'Series_FrCS4'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CW25: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clFuchsia
          Title = 'Series_FrCS5'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CW2m: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Series_FrCSm'
          Pointer.HorizSize = 1
          Pointer.InflateMargins = False
          Pointer.Style = psCross
          Pointer.VertSize = 600
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object GB_OutStab: TGroupBox
        Left = 740
        Top = 220
        Width = 152
        Height = 45
        Anchors = [akTop, akRight]
        Caption = #1055#1088#1086#1073#1072
        TabOrder = 2
        DesignSize = (
          152
          45)
        object RB_bSelPr1: TRadioButton
          Left = 8
          Top = 20
          Width = 41
          Height = 17
          Caption = '1'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnMouseUp = RB_bOutStMouseUp
        end
        object RB_bSelPr2: TRadioButton
          Left = 71
          Top = 20
          Width = 41
          Height = 17
          Anchors = [akTop, akRight]
          Caption = '2'
          TabOrder = 1
          OnMouseUp = RB_bOutStMouseUp
        end
      end
      object GB_Window_Frequency: TGroupBox
        Left = 740
        Top = 12
        Width = 152
        Height = 205
        Anchors = [akTop, akRight]
        Caption = #1063#1072#1089#1090#1086#1090#1072', '#1043#1094
        TabOrder = 3
        object Lb_F1: TLabel
          Left = 68
          Top = 56
          Width = 81
          Height = 16
          Caption = #1043#1072#1088#1084#1086#1085#1080#1082#1072' 1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Lb_F2: TLabel
          Left = 68
          Top = 86
          Width = 81
          Height = 16
          Caption = #1043#1072#1088#1084#1086#1085#1080#1082#1072' 2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Lb_F3: TLabel
          Left = 68
          Top = 116
          Width = 81
          Height = 16
          Caption = #1043#1072#1088#1084#1086#1085#1080#1082#1072' 3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Lb_F4: TLabel
          Left = 68
          Top = 146
          Width = 81
          Height = 16
          Caption = #1043#1072#1088#1084#1086#1085#1080#1082#1072' 4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clAqua
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Lb_F5: TLabel
          Left = 68
          Top = 176
          Width = 81
          Height = 16
          Caption = #1043#1072#1088#1084#1086#1085#1080#1082#1072' 5'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clFuchsia
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Ed_F1: TEdit
          Left = 9
          Top = 52
          Width = 44
          Height = 24
          TabOrder = 0
          Text = '0'
          OnChange = Ed_FChange
          OnKeyPress = Ed_KeyPress_Real
        end
        object UD_F1: TUpDown
          Left = 52
          Top = 52
          Width = 13
          Height = 21
          Max = 250
          TabOrder = 1
          OnMouseDown = UpD_SetFreq
        end
        object Ed_F2: TEdit
          Left = 9
          Top = 82
          Width = 44
          Height = 24
          TabOrder = 2
          Text = '0'
          OnChange = Ed_FChange
          OnKeyPress = Ed_KeyPress_Real
        end
        object UD_F2: TUpDown
          Left = 52
          Top = 82
          Width = 13
          Height = 21
          Max = 250
          TabOrder = 3
          OnMouseDown = UpD_SetFreq
        end
        object Ed_F3: TEdit
          Left = 9
          Top = 112
          Width = 44
          Height = 24
          TabOrder = 4
          Text = '0'
          OnChange = Ed_FChange
          OnKeyPress = Ed_KeyPress_Real
        end
        object UD_F3: TUpDown
          Left = 52
          Top = 112
          Width = 13
          Height = 21
          Max = 250
          TabOrder = 5
          OnMouseDown = UpD_SetFreq
        end
        object Ed_F4: TEdit
          Left = 9
          Top = 142
          Width = 44
          Height = 24
          TabOrder = 6
          Text = '0'
          OnChange = Ed_FChange
          OnKeyPress = Ed_KeyPress_Real
        end
        object UD_F4: TUpDown
          Left = 52
          Top = 142
          Width = 13
          Height = 21
          Max = 250
          TabOrder = 7
          OnMouseDown = UpD_SetFreq
        end
        object Ed_F5: TEdit
          Left = 9
          Top = 172
          Width = 44
          Height = 24
          TabOrder = 8
          Text = '0'
          OnChange = Ed_FChange
          OnKeyPress = Ed_KeyPress_Real
        end
        object UD_F5: TUpDown
          Left = 53
          Top = 172
          Width = 12
          Height = 21
          Max = 250
          TabOrder = 9
          OnMouseDown = UpD_SetFreq
        end
        object Bt_GApply: TButton
          Left = 8
          Top = 20
          Width = 81
          Height = 25
          Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
          TabOrder = 10
          OnMouseUp = Bt_GApplyMouseUp
        end
      end
      object Ch_CW3: TChart
        Left = 2
        Top = 348
        Width = 726
        Height = 168
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 2
        MarginLeft = 1
        MarginRight = 2
        MarginTop = 0
        Title.Alignment = taRightJustify
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          #1063#1072#1089#1090#1086#1090#1085#1072#1103' '#1075#1072#1088#1084#1086#1085#1080#1082#1072)
        BottomAxis.Axis.Width = 3
        BottomAxis.ExactDateTime = False
        BottomAxis.Increment = 5.000000000000000000
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        BottomAxis.MinorTickCount = 4
        BottomAxis.Title.Caption = #1042#1088#1077#1084#1103', '#1089#1077#1082
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.Axis.Width = 3
        LeftAxis.LabelsAngle = 90
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.LabelsSeparation = 50
        LeftAxis.Title.Caption = '__________'
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Visible = False
        View3D = False
        Color = clWhite
        TabOrder = 4
        Anchors = [akLeft, akTop, akRight, akBottom]
        OnMouseDown = Ch_CWMouseDown
        object Lb_CW31: TLabel
          Left = 80
          Top = 4
          Width = 46
          Height = 13
          AutoSize = False
          Caption = '____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_CW32: TLabel
          Left = 132
          Top = 4
          Width = 46
          Height = 13
          AutoSize = False
          Caption = '____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_CW33: TLabel
          Left = 184
          Top = 4
          Width = 46
          Height = 13
          AutoSize = False
          Caption = '____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_CW34: TLabel
          Left = 236
          Top = 4
          Width = 46
          Height = 13
          AutoSize = False
          Caption = '____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clAqua
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_CW35: TLabel
          Left = 288
          Top = 4
          Width = 46
          Height = 13
          AutoSize = False
          Caption = '____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clFuchsia
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_CW3m: TLabel
          Left = 140
          Top = 152
          Width = 40
          Height = 13
          AutoSize = False
          Caption = '____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCW3a: TLabel
          Left = 40
          Top = 8
          Width = 21
          Height = 13
          Caption = 'x10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCW3b: TLabel
          Left = 62
          Top = 0
          Width = 8
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Ss_CW31: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          LinePen.Color = clBlue
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CW32: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          LinePen.Color = clRed
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CW33: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          LinePen.Color = clGreen
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CW34: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clAqua
          LinePen.Color = clAqua
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CW35: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clFuchsia
          LinePen.Color = clFuchsia
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_CW3m: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          LinePen.Color = clRed
          LinePen.Visible = False
          Pointer.HorizSize = 1
          Pointer.InflateMargins = False
          Pointer.Style = psCross
          Pointer.VertSize = 600
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
    end
    object TS_CS: TTabSheet
      Caption = #1057#1087#1077#1082#1090#1088#1086#1075#1088#1072#1084#1084#1072
      ImageIndex = 4
      DesignSize = (
        895
        517)
      object Lb_SGPalName: TLabel
        Left = 733
        Top = 12
        Width = 63
        Height = 16
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        AutoSize = False
        Caption = '_________'
      end
      object Ch_CS12: TChart
        Left = 367
        Top = 7
        Width = 360
        Height = 168
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 0
        MarginLeft = 0
        MarginTop = 0
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          '__________')
        BottomAxis.ExactDateTime = False
        BottomAxis.Increment = 5.000000000000000000
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        BottomAxis.MinorTickCount = 4
        BottomAxis.Title.Caption = #1042#1088#1077#1084#1103', '#1089#1077#1082
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.ExactDateTime = False
        LeftAxis.LabelsAngle = 90
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.LabelsSize = 15
        LeftAxis.MinorTickCount = 4
        LeftAxis.MinorTickLength = 3
        LeftAxis.Title.Caption = #1063#1072#1089#1090#1086#1090#1072', '#1043#1094
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Visible = False
        View3D = False
        TabOrder = 0
        Anchors = []
        DesignSize = (
          360
          168)
        object Im_CS12: TImage
          Left = 37
          Top = 21
          Width = 313
          Height = 112
          Anchors = [akLeft, akTop, akRight, akBottom]
          OnMouseDown = Im_CSMouseDown
        end
        object Lb_MultCS12a: TLabel
          Left = 33
          Top = 8
          Width = 21
          Height = 13
          Caption = 'x10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCS12b: TLabel
          Left = 55
          Top = 2
          Width = 8
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Ss_CS12: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          LinePen.Visible = False
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object Ch_CS22: TChart
        Left = 367
        Top = 178
        Width = 360
        Height = 168
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 0
        MarginLeft = 0
        MarginTop = 0
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          '__________')
        BottomAxis.ExactDateTime = False
        BottomAxis.Increment = 5.000000000000000000
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        BottomAxis.MinorTickCount = 4
        BottomAxis.Title.Caption = #1042#1088#1077#1084#1103', '#1089#1077#1082
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.ExactDateTime = False
        LeftAxis.LabelsAngle = 90
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.LabelsSize = 15
        LeftAxis.MinorTickCount = 4
        LeftAxis.MinorTickLength = 3
        LeftAxis.Title.Caption = #1063#1072#1089#1090#1086#1090#1072', '#1043#1094
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Visible = False
        View3D = False
        TabOrder = 1
        Anchors = []
        DesignSize = (
          360
          168)
        object Im_CS22: TImage
          Left = 37
          Top = 21
          Width = 313
          Height = 112
          Anchors = [akLeft, akTop, akRight, akBottom]
          OnMouseDown = Im_CSMouseDown
        end
        object Lb_MultCS22a: TLabel
          Left = 33
          Top = 8
          Width = 21
          Height = 13
          Caption = 'x10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCS22b: TLabel
          Left = 55
          Top = 2
          Width = 8
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Ss_CS22: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          LinePen.Visible = False
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object GB_SGColScale: TGroupBox
        Left = 740
        Top = 60
        Width = 56
        Height = 73
        Anchors = [akTop, akRight]
        Caption = #1064#1082#1072#1083#1072
        TabOrder = 2
        object RB_SGScaleAbs: TRadioButton
          Left = 4
          Top = 24
          Width = 49
          Height = 17
          Caption = #1040#1073#1089'.'
          TabOrder = 0
          OnMouseUp = RB_SGScaleMouseUp
        end
        object RB_SGScaleRlt: TRadioButton
          Left = 4
          Top = 48
          Width = 49
          Height = 17
          Caption = #1054#1090#1085'.'
          Checked = True
          TabOrder = 1
          TabStop = True
          OnMouseUp = RB_SGScaleMouseUp
        end
      end
      object Ch_CS32: TChart
        Left = 367
        Top = 349
        Width = 360
        Height = 168
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 0
        MarginLeft = 0
        MarginTop = 0
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          '__________')
        BottomAxis.ExactDateTime = False
        BottomAxis.Increment = 5.000000000000000000
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        BottomAxis.MinorTickCount = 4
        BottomAxis.Title.Caption = #1042#1088#1077#1084#1103', '#1089#1077#1082
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.LabelsAngle = 90
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.Title.Caption = #1063#1072#1089#1090#1086#1090#1072', '#1043#1094
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Visible = False
        View3D = False
        TabOrder = 3
        Anchors = []
        DesignSize = (
          360
          168)
        object Im_CS32: TImage
          Left = 36
          Top = 21
          Width = 314
          Height = 112
          Anchors = [akLeft, akTop, akRight, akBottom]
          OnMouseDown = Im_CSMouseDown
        end
        object Lb_MultCS32a: TLabel
          Left = 33
          Top = 8
          Width = 21
          Height = 13
          Caption = 'x10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCS32b: TLabel
          Left = 55
          Top = 2
          Width = 8
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Ss_CS32: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          LinePen.Visible = False
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object Ch_CS11: TChart
        Left = 1
        Top = 7
        Width = 360
        Height = 168
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 0
        MarginLeft = 0
        MarginTop = 0
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          '__________  ')
        BottomAxis.ExactDateTime = False
        BottomAxis.Increment = 5.000000000000000000
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        BottomAxis.MinorTickCount = 4
        BottomAxis.Title.Caption = #1042#1088#1077#1084#1103', '#1089#1077#1082
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.AxisValuesFormat = '0.##'
        LeftAxis.ExactDateTime = False
        LeftAxis.LabelsAngle = 90
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.LabelsSize = 15
        LeftAxis.MinorTickCount = 4
        LeftAxis.MinorTickLength = 3
        LeftAxis.Title.Caption = #1063#1072#1089#1090#1086#1090#1072', '#1043#1094
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Visible = False
        View3D = False
        TabOrder = 4
        Anchors = []
        DesignSize = (
          360
          168)
        object Im_CS11: TImage
          Left = 37
          Top = 21
          Width = 313
          Height = 112
          Anchors = [akLeft, akTop, akRight, akBottom]
          OnMouseDown = Im_CSMouseDown
        end
        object Lb_MultCS11a: TLabel
          Left = 33
          Top = 7
          Width = 21
          Height = 13
          Caption = 'x10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCS11b: TLabel
          Left = 55
          Top = 1
          Width = 8
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Ss_CS11: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          LinePen.Visible = False
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object Ch_CS21: TChart
        Left = 1
        Top = 178
        Width = 360
        Height = 168
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 0
        MarginLeft = 0
        MarginTop = 0
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          '__________')
        BottomAxis.ExactDateTime = False
        BottomAxis.Increment = 5.000000000000000000
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        BottomAxis.MinorTickCount = 4
        BottomAxis.Title.Caption = #1042#1088#1077#1084#1103', '#1089#1077#1082
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.ExactDateTime = False
        LeftAxis.LabelsAngle = 90
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.LabelsSize = 15
        LeftAxis.MinorTickCount = 4
        LeftAxis.MinorTickLength = 3
        LeftAxis.Title.Caption = #1063#1072#1089#1090#1086#1090#1072', '#1043#1094
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Visible = False
        View3D = False
        TabOrder = 5
        Anchors = []
        DesignSize = (
          360
          168)
        object Im_CS21: TImage
          Left = 37
          Top = 21
          Width = 313
          Height = 112
          Anchors = [akLeft, akTop, akRight, akBottom]
          OnMouseDown = Im_CSMouseDown
        end
        object Lb_MultCS21a: TLabel
          Left = 33
          Top = 7
          Width = 21
          Height = 13
          Caption = 'x10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCS21b: TLabel
          Left = 55
          Top = 1
          Width = 8
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Ss_CS21: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Dark3D = False
          LinePen.Visible = False
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object Ch_CS31: TChart
        Left = 1
        Top = 349
        Width = 360
        Height = 168
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 0
        MarginLeft = 0
        MarginTop = 0
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          '__________')
        BottomAxis.ExactDateTime = False
        BottomAxis.Increment = 5.000000000000000000
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        BottomAxis.MinorTickCount = 4
        BottomAxis.Title.Caption = #1042#1088#1077#1084#1103', '#1089#1077#1082
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.ExactDateTime = False
        LeftAxis.LabelsAngle = 90
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.MinorTickCount = 4
        LeftAxis.MinorTickLength = 3
        LeftAxis.Title.Caption = #1063#1072#1089#1090#1086#1090#1072', '#1043#1094
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Visible = False
        View3D = False
        TabOrder = 6
        Anchors = []
        DesignSize = (
          360
          168)
        object Im_CS31: TImage
          Left = 36
          Top = 21
          Width = 314
          Height = 112
          Anchors = [akLeft, akTop, akRight, akBottom]
          OnMouseDown = Im_CSMouseDown
        end
        object Lb_MultCS31a: TLabel
          Left = 33
          Top = 7
          Width = 21
          Height = 13
          Caption = 'x10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCS31b: TLabel
          Left = 55
          Top = 1
          Width = 8
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Ss_CS31: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          LinePen.Visible = False
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object Pl_SGColPal: TPanel
        Left = 802
        Top = 6
        Width = 89
        Height = 309
        Anchors = [akTop, akRight]
        BevelOuter = bvLowered
        TabOrder = 7
        DesignSize = (
          89
          309)
        object Im_SGColPal: TImage
          Left = 8
          Top = 8
          Width = 41
          Height = 300
          Anchors = [akTop, akRight]
        end
        object Lb_SGCol10: TLabel
          Left = 57
          Top = 2
          Width = 24
          Height = 16
          Anchors = [akTop, akRight]
          Caption = '1.00'
        end
        object Lb_SGCol09: TLabel
          Left = 57
          Top = 32
          Width = 24
          Height = 16
          Anchors = [akTop, akRight]
          Caption = '0.90'
        end
        object Lb_SGCol08: TLabel
          Left = 57
          Top = 62
          Width = 24
          Height = 16
          Anchors = [akTop, akRight]
          Caption = '0.80'
        end
        object Lb_SGCol07: TLabel
          Left = 57
          Top = 92
          Width = 24
          Height = 16
          Anchors = [akTop, akRight]
          Caption = '0.70'
        end
        object Lb_SGCol06: TLabel
          Left = 57
          Top = 122
          Width = 24
          Height = 16
          Anchors = [akTop, akRight]
          Caption = '0.60'
        end
        object Lb_SGCol05: TLabel
          Left = 57
          Top = 152
          Width = 24
          Height = 16
          Anchors = [akTop, akRight]
          Caption = '0.50'
        end
        object Lb_SGCol04: TLabel
          Left = 57
          Top = 182
          Width = 24
          Height = 16
          Anchors = [akTop, akRight]
          Caption = '0.40'
        end
        object Lb_SGCol03: TLabel
          Left = 57
          Top = 212
          Width = 24
          Height = 16
          Anchors = [akTop, akRight]
          Caption = '0.30'
        end
        object Lb_SGCol02: TLabel
          Left = 57
          Top = 242
          Width = 24
          Height = 16
          Anchors = [akTop, akRight]
          Caption = '0.20'
        end
        object Lb_SGCol01: TLabel
          Left = 57
          Top = 272
          Width = 24
          Height = 16
          Anchors = [akTop, akRight]
          Caption = '0.10'
        end
        object Lb_SGCol00: TLabel
          Left = 57
          Top = 295
          Width = 24
          Height = 16
          Anchors = [akTop, akRight]
          Caption = '0.00'
        end
      end
    end
    object TS_CL: TTabSheet
      Caption = #1042#1077#1081#1074#1083#1077#1090'-'#1072#1085#1072#1083#1080#1079
      ImageIndex = 5
      DesignSize = (
        895
        517)
      object Lb_WLPalName: TLabel
        Left = 734
        Top = 12
        Width = 61
        Height = 16
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        AutoSize = False
        Caption = '_________'
      end
      object Ch_CL11: TChart
        Left = 1
        Top = 7
        Width = 360
        Height = 168
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 0
        MarginLeft = 0
        MarginTop = 0
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          #1054#1089#1100' X')
        BottomAxis.ExactDateTime = False
        BottomAxis.Increment = 5.000000000000000000
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        BottomAxis.MinorTickCount = 4
        BottomAxis.Title.Caption = '__________'
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.LabelsAngle = 90
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.MinorTickCount = 4
        LeftAxis.Title.Caption = '_____'
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Visible = False
        View3D = False
        TabOrder = 0
        Anchors = []
        DesignSize = (
          360
          168)
        object Im_CL11: TImage
          Left = 36
          Top = 21
          Width = 314
          Height = 112
          Anchors = [akLeft, akTop, akRight, akBottom]
          OnMouseUp = Im_WLMouseUp
        end
        object Lb_MultCL11a: TLabel
          Left = 33
          Top = 8
          Width = 21
          Height = 13
          Caption = 'x10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCL11b: TLabel
          Left = 55
          Top = 2
          Width = 8
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Ss_CL11: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          LinePen.Visible = False
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object Ch_CL12: TChart
        Left = 366
        Top = 7
        Width = 360
        Height = 168
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 0
        MarginLeft = 0
        MarginTop = 0
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          #1054#1089#1100' X')
        BottomAxis.ExactDateTime = False
        BottomAxis.Increment = 5.000000000000000000
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        BottomAxis.MinorTickCount = 4
        BottomAxis.Title.Caption = '__________'
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.LabelsAngle = 90
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.MinorTickCount = 4
        LeftAxis.Title.Caption = '_____'
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Visible = False
        View3D = False
        TabOrder = 1
        Anchors = []
        DesignSize = (
          360
          168)
        object Im_CL12: TImage
          Left = 36
          Top = 21
          Width = 314
          Height = 112
          Anchors = [akLeft, akTop, akRight, akBottom]
          OnMouseUp = Im_WLMouseUp
        end
        object Lb_MultCL12a: TLabel
          Left = 33
          Top = 8
          Width = 21
          Height = 13
          Caption = 'x10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCL12b: TLabel
          Left = 55
          Top = 2
          Width = 8
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Ss_CL12: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          LinePen.Visible = False
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object Ch_CL21: TChart
        Left = 1
        Top = 177
        Width = 360
        Height = 168
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 0
        MarginLeft = 0
        MarginTop = 0
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          #1054#1089#1100' Y')
        BottomAxis.ExactDateTime = False
        BottomAxis.Increment = 5.000000000000000000
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        BottomAxis.MinorTickCount = 4
        BottomAxis.Title.Caption = '_________'
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.LabelsAngle = 90
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.MinorTickCount = 4
        LeftAxis.Title.Caption = '_____'
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Visible = False
        View3D = False
        TabOrder = 2
        Anchors = []
        DesignSize = (
          360
          168)
        object Im_CL21: TImage
          Left = 36
          Top = 21
          Width = 314
          Height = 112
          Anchors = [akLeft, akTop, akRight, akBottom]
          OnMouseUp = Im_WLMouseUp
        end
        object Lb_MultCL21a: TLabel
          Left = 33
          Top = 8
          Width = 21
          Height = 13
          Caption = 'x10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCL21b: TLabel
          Left = 55
          Top = 2
          Width = 8
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Ss_CL21: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          LinePen.Visible = False
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object Ch_CL22: TChart
        Left = 366
        Top = 177
        Width = 360
        Height = 168
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 0
        MarginLeft = 0
        MarginTop = 0
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          #1054#1089#1100' Y')
        BottomAxis.ExactDateTime = False
        BottomAxis.Increment = 5.000000000000000000
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        BottomAxis.MinorTickCount = 4
        BottomAxis.Title.Caption = '__________'
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.LabelsAngle = 90
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.MinorTickCount = 4
        LeftAxis.Title.Caption = '_____'
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Visible = False
        View3D = False
        TabOrder = 3
        Anchors = []
        DesignSize = (
          360
          168)
        object Im_CL22: TImage
          Left = 36
          Top = 21
          Width = 314
          Height = 112
          Anchors = [akLeft, akTop, akRight, akBottom]
          OnMouseUp = Im_WLMouseUp
        end
        object Lb_MultCL22a: TLabel
          Left = 33
          Top = 8
          Width = 21
          Height = 13
          Caption = 'x10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCL22b: TLabel
          Left = 55
          Top = 2
          Width = 8
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Ss_CL22: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          LinePen.Visible = False
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object GB_DaubechLevel: TGroupBox
        Left = 740
        Top = 317
        Width = 153
        Height = 116
        Anchors = [akTop, akRight]
        Caption = #1059#1088#1086#1074#1077#1085#1100
        TabOrder = 4
        object Lb_DaubechLevel2: TLabel
          Left = 64
          Top = 24
          Width = 55
          Height = 16
          Caption = #1042#1077#1088#1093#1085#1080#1081
        end
        object Lb_DaubechLevel1: TLabel
          Left = 64
          Top = 52
          Width = 51
          Height = 16
          Caption = #1053#1080#1078#1085#1080#1081
        end
        object Ed_DaubechLevel2: TEdit
          Left = 8
          Top = 20
          Width = 37
          Height = 24
          ReadOnly = True
          TabOrder = 0
          Text = '1'
        end
        object UD_DaubechLevel2: TUpDown
          Left = 45
          Top = 20
          Width = 15
          Height = 24
          Associate = Ed_DaubechLevel2
          Min = 1
          Position = 1
          TabOrder = 1
        end
        object UD_DaubechLevel1: TUpDown
          Left = 45
          Top = 48
          Width = 15
          Height = 24
          Associate = Ed_DaubechLevel1
          Position = 1
          TabOrder = 2
        end
        object Ed_DaubechLevel1: TEdit
          Left = 8
          Top = 48
          Width = 37
          Height = 24
          ReadOnly = True
          TabOrder = 3
          Text = '1'
        end
        object Ed_DaubechLevel: TEdit
          Left = 8
          Top = 36
          Width = 37
          Height = 24
          ReadOnly = True
          TabOrder = 4
          Text = '1'
        end
        object UD_DaubechLevel: TUpDown
          Left = 45
          Top = 36
          Width = 15
          Height = 24
          Associate = Ed_DaubechLevel
          Position = 1
          TabOrder = 5
        end
        object Bt_LApply: TButton
          Left = 8
          Top = 80
          Width = 81
          Height = 25
          Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
          TabOrder = 6
          OnMouseUp = Bt_LApplyMouseUp
        end
      end
      object Ch_CL1g: TChart
        Left = 2
        Top = 42
        Width = 273
        Height = 79
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 1
        MarginLeft = 0
        MarginRight = 2
        MarginTop = 1
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          #1054#1089#1100' X')
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        BottomAxis.MinorTickCount = 4
        BottomAxis.Title.Caption = #1054#1090#1089#1095#1077#1090#1099
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.LabelsAngle = 90
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.Title.Caption = #1040#1084#1087#1083#1080#1090#1091#1076#1072
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Visible = False
        View3D = False
        Color = clWhite
        TabOrder = 5
        Anchors = [akLeft, akTop, akRight, akBottom]
        object Ss_WLXY11: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          Dark3D = False
          LinePen.Color = clBlue
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          Stairs = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_WLXY12: TLineSeries
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clGreen
          Dark3D = False
          LinePen.Color = clGreen
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          Stairs = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_WLXY10: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlack
          Dark3D = False
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object GB_WLDisplay: TGroupBox
        Left = 740
        Top = 437
        Width = 153
        Height = 61
        Anchors = [akTop, akRight]
        Caption = #1055#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1077
        TabOrder = 6
        object RB_bWLDiagr: TRadioButton
          Left = 8
          Top = 20
          Width = 113
          Height = 17
          Caption = #1044#1080#1072#1075#1088#1072#1084#1084#1072
          Checked = True
          TabOrder = 0
          TabStop = True
          OnMouseUp = RB_WLMouseUp
        end
        object RB_bWLGraph: TRadioButton
          Left = 8
          Top = 40
          Width = 113
          Height = 17
          Caption = #1043#1088#1072#1092#1080#1082
          TabOrder = 1
          OnMouseUp = RB_WLMouseUp
        end
      end
      object GB_WLColScale: TGroupBox
        Left = 740
        Top = 60
        Width = 56
        Height = 73
        Anchors = [akTop, akRight]
        Caption = #1064#1082#1072#1083#1072
        TabOrder = 7
        object RB_WLScaleAbs: TRadioButton
          Left = 4
          Top = 24
          Width = 49
          Height = 17
          Caption = #1040#1073#1089'.'
          TabOrder = 0
          OnMouseUp = RB_WLScaleMouseUp
        end
        object RB_WLScaleRlt: TRadioButton
          Left = 4
          Top = 48
          Width = 49
          Height = 17
          Caption = #1054#1090#1085'.'
          Checked = True
          TabOrder = 1
          TabStop = True
          OnMouseUp = RB_WLScaleMouseUp
        end
      end
      object Ch_CL31: TChart
        Left = 1
        Top = 347
        Width = 360
        Height = 168
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 0
        MarginLeft = 0
        MarginTop = 0
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          #1054#1089#1100' Z')
        BottomAxis.ExactDateTime = False
        BottomAxis.Increment = 5.000000000000000000
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        BottomAxis.MinorTickCount = 4
        BottomAxis.Title.Caption = '_________'
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.LabelsAngle = 90
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.MinorTickCount = 4
        LeftAxis.Title.Caption = '_____'
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Visible = False
        View3D = False
        TabOrder = 8
        Anchors = []
        DesignSize = (
          360
          168)
        object Im_CL31: TImage
          Left = 36
          Top = 21
          Width = 314
          Height = 112
          Anchors = [akLeft, akTop, akRight, akBottom]
          OnMouseUp = Im_WLMouseUp
        end
        object Lb_MultCL31a: TLabel
          Left = 33
          Top = 8
          Width = 21
          Height = 13
          Caption = 'x10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCL31b: TLabel
          Left = 55
          Top = 2
          Width = 8
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Ss_CL31: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          LinePen.Visible = False
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object Ch_CL32: TChart
        Left = 366
        Top = 347
        Width = 360
        Height = 168
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 0
        MarginLeft = 0
        MarginTop = 0
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          #1054#1089#1100' Z')
        BottomAxis.ExactDateTime = False
        BottomAxis.Increment = 5.000000000000000000
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        BottomAxis.MinorTickCount = 4
        BottomAxis.Title.Caption = '_________'
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.LabelsAngle = 90
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.MinorTickCount = 4
        LeftAxis.Title.Caption = '_____'
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Visible = False
        View3D = False
        TabOrder = 9
        Anchors = []
        DesignSize = (
          360
          168)
        object Im_CL32: TImage
          Left = 36
          Top = 21
          Width = 314
          Height = 112
          Anchors = [akLeft, akTop, akRight, akBottom]
          OnMouseUp = Im_WLMouseUp
        end
        object Lb_MultCL32a: TLabel
          Left = 33
          Top = 8
          Width = 21
          Height = 13
          Caption = 'x10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lb_MultCL32b: TLabel
          Left = 55
          Top = 2
          Width = 8
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Ss_CL32: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          LinePen.Visible = False
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object Ch_CL2g: TChart
        Left = 2
        Top = 215
        Width = 273
        Height = 74
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 1
        MarginLeft = 0
        MarginRight = 2
        MarginTop = 1
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          #1054#1089#1100' Y')
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        BottomAxis.MinorTickCount = 4
        BottomAxis.Title.Caption = #1054#1090#1089#1095#1077#1090#1099
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.LabelsAngle = 90
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.Title.Caption = #1040#1084#1087#1083#1080#1090#1091#1076#1072
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Visible = False
        View3D = False
        Color = clWhite
        TabOrder = 10
        Anchors = [akLeft, akTop, akRight, akBottom]
        object Ss_WLXY21: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          Dark3D = False
          LinePen.Color = clBlue
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          Stairs = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_WLXY22: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Dark3D = False
          LinePen.Color = clGreen
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          Stairs = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_WLXY20: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlack
          Dark3D = False
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object Ch_CL3g: TChart
        Left = 2
        Top = 379
        Width = 271
        Height = 86
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 1
        MarginLeft = 0
        MarginRight = 2
        MarginTop = 1
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          #1054#1089#1100' Z')
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = [fsBold]
        BottomAxis.MinorTickCount = 4
        BottomAxis.Title.Caption = #1054#1090#1089#1095#1077#1090#1099
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.LabelsAngle = 90
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = [fsBold]
        LeftAxis.Title.Caption = #1040#1084#1087#1083#1080#1090#1091#1076#1072
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Visible = False
        View3D = False
        Color = clWhite
        TabOrder = 11
        Anchors = [akLeft, akTop, akRight, akBottom]
        object Ss_WLXY31: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          Dark3D = False
          LinePen.Color = clBlue
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          Stairs = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_WLXY32: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Dark3D = False
          LinePen.Color = clGreen
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          Stairs = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Ss_WLXY30: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlack
          Dark3D = False
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object Pl_WLColPal: TPanel
        Left = 802
        Top = 6
        Width = 89
        Height = 313
        Anchors = [akTop, akRight]
        BevelOuter = bvLowered
        TabOrder = 12
        DesignSize = (
          89
          313)
        object Im_WLColPal: TImage
          Left = 8
          Top = 8
          Width = 41
          Height = 300
          Anchors = [akTop, akRight]
        end
        object Lb_WLCol10: TLabel
          Left = 57
          Top = 2
          Width = 24
          Height = 16
          Anchors = [akTop, akRight]
          Caption = '1.00'
        end
        object Lb_WLCol09: TLabel
          Left = 57
          Top = 32
          Width = 24
          Height = 16
          Anchors = [akTop, akRight]
          Caption = '0.90'
        end
        object Lb_WLCol08: TLabel
          Left = 57
          Top = 62
          Width = 24
          Height = 16
          Anchors = [akTop, akRight]
          Caption = '0.80'
        end
        object Lb_WLCol07: TLabel
          Left = 57
          Top = 92
          Width = 24
          Height = 16
          Anchors = [akTop, akRight]
          Caption = '0.70'
        end
        object Lb_WLCol06: TLabel
          Left = 57
          Top = 122
          Width = 24
          Height = 16
          Anchors = [akTop, akRight]
          Caption = '0.60'
        end
        object Lb_WLCol05: TLabel
          Left = 57
          Top = 152
          Width = 24
          Height = 16
          Anchors = [akTop, akRight]
          Caption = '0.50'
        end
        object Lb_WLCol04: TLabel
          Left = 57
          Top = 182
          Width = 24
          Height = 16
          Anchors = [akTop, akRight]
          Caption = '0.40'
        end
        object Lb_WLCol03: TLabel
          Left = 57
          Top = 212
          Width = 24
          Height = 16
          Anchors = [akTop, akRight]
          Caption = '0.30'
        end
        object Lb_WLCol02: TLabel
          Left = 57
          Top = 242
          Width = 24
          Height = 16
          Anchors = [akTop, akRight]
          Caption = '0.20'
        end
        object Lb_WLCol01: TLabel
          Left = 57
          Top = 272
          Width = 24
          Height = 16
          Anchors = [akTop, akRight]
          Caption = '0.10'
        end
        object Lb_WLCol00: TLabel
          Left = 57
          Top = 295
          Width = 24
          Height = 16
          Anchors = [akTop, akRight]
          Caption = '0.00'
        end
      end
    end
    object TS_DataExport: TTabSheet
      Caption = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077
      ImageIndex = 6
      DesignSize = (
        895
        517)
      object Pl_SaveResult: TPanel
        Left = 2
        Top = 4
        Width = 890
        Height = 157
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          890
          157)
        object GB_Save1: TGroupBox
          Left = 12
          Top = 4
          Width = 181
          Height = 145
          Caption = #1057#1086#1093#1088#1072#1085#1103#1077#1084#1099#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099
          Enabled = False
          TabOrder = 0
          object CB_bStabGrammSave: TCheckBox
            Left = 8
            Top = 20
            Width = 133
            Height = 17
            Caption = #1055#1088#1086#1073#1072
            TabOrder = 0
          end
          object CB_bFourierSave: TCheckBox
            Left = 8
            Top = 40
            Width = 133
            Height = 17
            Caption = #1060#1091#1088#1100#1077'-'#1072#1085#1072#1083#1080#1079
            TabOrder = 1
          end
          object CB_bSpecGrammSave: TCheckBox
            Left = 8
            Top = 100
            Width = 133
            Height = 17
            Caption = #1057#1087#1077#1082#1090#1088#1086#1075#1088#1072#1084#1084#1072
            TabOrder = 2
          end
          object CB_bWinFourierSave: TCheckBox
            Left = 8
            Top = 80
            Width = 133
            Height = 17
            Caption = #1054#1082#1086#1085#1085#1099#1081
            TabOrder = 3
          end
          object CB_bWaveLetSave: TCheckBox
            Left = 8
            Top = 120
            Width = 133
            Height = 17
            Caption = #1042#1077#1081#1074#1083#1077#1090'-'#1072#1085#1072#1083#1080#1079
            TabOrder = 4
          end
          object CB_bValchSave: TCheckBox
            Left = 8
            Top = 60
            Width = 133
            Height = 17
            Caption = #1042#1077#1083#1095'-'#1072#1085#1072#1083#1080#1079
            TabOrder = 5
          end
        end
        object GB_Save2: TGroupBox
          Left = 204
          Top = 4
          Width = 678
          Height = 145
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
          TabOrder = 1
          DesignSize = (
            678
            145)
          object Bt_SaveResult: TButton
            Left = 280
            Top = 115
            Width = 83
            Height = 25
            Caption = #1044#1072
            TabOrder = 0
            OnClick = Bt_SaveResultClick
          end
          object CB_bSave2: TCheckBox
            Left = 8
            Top = 56
            Width = 73
            Height = 17
            Caption = #1055#1088#1086#1073#1072' 2'
            Enabled = False
            TabOrder = 1
          end
          object CB_bSave1: TCheckBox
            Left = 8
            Top = 24
            Width = 73
            Height = 17
            Caption = #1055#1088#1086#1073#1072' 1'
            Enabled = False
            TabOrder = 2
          end
          object Ed_ExportDir2: TEdit
            Left = 104
            Top = 52
            Width = 562
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            Enabled = False
            ReadOnly = True
            TabOrder = 4
          end
          object Ed_ExportDir1: TEdit
            Left = 104
            Top = 20
            Width = 562
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            Enabled = False
            ReadOnly = True
            TabOrder = 3
          end
          object CB_bSave3: TCheckBox
            Left = 8
            Top = 88
            Width = 97
            Height = 17
            Caption = #1055#1088#1086#1073#1072' 1+2'
            Enabled = False
            TabOrder = 5
          end
          object Ed_ExportDir3: TEdit
            Left = 104
            Top = 84
            Width = 562
            Height = 24
            ReadOnly = True
            TabOrder = 6
          end
        end
      end
      object DBGrid1: TDBGrid
        Left = 2
        Top = 164
        Width = 890
        Height = 297
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        OnMouseUp = DBGrid1MouseUp
      end
      object DBNavigator1: TDBNavigator
        Left = 392
        Top = 484
        Width = 216
        Height = 25
        DataSource = DataSource1
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbCancel, nbRefresh]
        Anchors = [akLeft, akBottom]
        Hints.Strings = (
          #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
          #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
          #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
          #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100
          #1042#1089#1090#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
          #1059#1085#1080#1095#1090#1086#1078#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
          #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1100
          #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
          #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
          #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077)
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object GB_Filter: TGroupBox
        Left = 4
        Top = 468
        Width = 353
        Height = 41
        Anchors = [akLeft, akBottom]
        Caption = #1060#1080#1083#1100#1090#1088
        TabOrder = 3
        object CB_bName: TCheckBox
          Left = 8
          Top = 20
          Width = 81
          Height = 17
          Caption = #1060#1072#1084#1080#1083#1080#1103
          TabOrder = 0
          OnClick = CB_bFilterClick
        end
        object CB_bAdge: TCheckBox
          Left = 104
          Top = 20
          Width = 157
          Height = 17
          Caption = #1042#1086#1079#1088#1072#1089#1090#1085#1072#1103' '#1075#1088#1091#1087#1087#1072
          TabOrder = 1
          OnClick = CB_bFilterClick
        end
        object CB_bDiag: TCheckBox
          Left = 268
          Top = 20
          Width = 81
          Height = 17
          Caption = #1044#1080#1072#1075#1085#1086#1079
          TabOrder = 2
          OnClick = CB_bFilterClick
        end
      end
      object Pl_Adge: TPanel
        Left = 72
        Top = 272
        Width = 285
        Height = 173
        TabOrder = 4
        Visible = False
        object Lb_AdgeGroup: TLabel
          Left = 32
          Top = 13
          Width = 127
          Height = 16
          Caption = #1042#1086#1079#1088#1072#1089#1090#1085#1072#1103' '#1075#1088#1091#1087#1087#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object CB_Adge: TComboBox
          Left = 8
          Top = 65
          Width = 169
          Height = 24
          ItemHeight = 0
          TabOrder = 0
        end
        object Bt_AdgeAdd: TButton
          Left = 192
          Top = 16
          Width = 75
          Height = 25
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          TabOrder = 1
          OnMouseUp = Bt_AdgeMouseUp
        end
        object Bt_AdgeDel: TButton
          Left = 192
          Top = 56
          Width = 75
          Height = 25
          Caption = #1059#1076#1072#1083#1080#1090#1100
          TabOrder = 2
          OnMouseUp = Bt_AdgeMouseUp
        end
        object Bt_AdgeOk: TButton
          Left = 192
          Top = 96
          Width = 75
          Height = 25
          Caption = #1044#1072
          TabOrder = 3
          OnMouseUp = Bt_AdgeMouseUp
        end
        object Bt_AdgeCencel: TButton
          Left = 192
          Top = 136
          Width = 75
          Height = 25
          Caption = #1047#1072#1082#1088#1099#1090#1100
          TabOrder = 4
          OnMouseUp = Bt_AdgeMouseUp
        end
      end
      object Pl_Diag: TPanel
        Left = 368
        Top = 272
        Width = 285
        Height = 173
        TabOrder = 5
        Visible = False
        object Lb_Diagnose: TLabel
          Left = 84
          Top = 13
          Width = 55
          Height = 16
          Caption = #1044#1080#1072#1075#1085#1086#1079
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object CB_Diag: TComboBox
          Left = 8
          Top = 65
          Width = 169
          Height = 24
          ItemHeight = 0
          TabOrder = 0
        end
        object Bt_DiagAdd: TButton
          Left = 196
          Top = 12
          Width = 75
          Height = 25
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          TabOrder = 1
          OnMouseUp = Bt_DiagMouseUp
        end
        object Bt_DiagDel: TButton
          Left = 196
          Top = 56
          Width = 75
          Height = 25
          Caption = #1059#1076#1072#1083#1080#1090#1100
          TabOrder = 2
          OnMouseUp = Bt_DiagMouseUp
        end
        object Bt_DiagOk: TButton
          Left = 192
          Top = 96
          Width = 75
          Height = 25
          Caption = #1044#1072
          TabOrder = 3
          OnMouseUp = Bt_DiagMouseUp
        end
        object Bt_DiagCencel: TButton
          Left = 196
          Top = 136
          Width = 75
          Height = 25
          Caption = #1047#1072#1082#1088#1099#1090#1100
          TabOrder = 4
          OnMouseUp = Bt_DiagMouseUp
        end
      end
      object Button2: TButton
        Left = 608
        Top = 484
        Width = 29
        Height = 25
        Hint = #1054#1090#1082#1088#1099#1090#1100' '#1087#1072#1087#1082#1091' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074
        Anchors = [akLeft, akBottom]
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = Button2Click
      end
      object CB_RecordDelete: TCheckBox
        Left = 506
        Top = 464
        Width = 23
        Height = 17
        TabOrder = 7
      end
    end
  end
  object Ed_ProbeName1: TEdit
    Left = 60
    Top = 4
    Width = 846
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Ed_ProbeName2: TEdit
    Left = 60
    Top = 32
    Width = 846
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object GB_Amplitude: TGroupBox
    Left = 746
    Top = 524
    Width = 153
    Height = 77
    Anchors = [akTop, akRight]
    Caption = #1047#1085#1072#1095#1077#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object RB_bRemvl: TRadioButton
      Left = 8
      Top = 16
      Width = 129
      Height = 17
      Caption = #1040#1084#1087#1083#1080#1090#1091#1076#1072
      TabOrder = 0
      OnMouseUp = SetAmplitude
    end
    object RB_bPower: TRadioButton
      Left = 8
      Top = 36
      Width = 133
      Height = 17
      Caption = #1052#1086#1097#1085#1086#1089#1090#1100
      TabOrder = 1
      OnMouseUp = SetAmplitude
    end
    object RB_bLog10: TRadioButton
      Left = 8
      Top = 56
      Width = 129
      Height = 17
      Caption = #1052#1086#1097#1085#1086#1089#1090#1100', '#1076#1041
      TabOrder = 2
      OnMouseUp = SetAmplitude
    end
  end
  object GB_Frequency: TGroupBox
    Left = 746
    Top = 408
    Width = 153
    Height = 113
    Anchors = [akTop, akRight]
    Caption = #1063#1072#1089#1090#1086#1090#1072', '#1043#1094
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object Lb_HMax: TLabel
      Left = 72
      Top = 23
      Width = 67
      Height = 16
      Caption = #1052#1072#1082#1089#1080#1084#1091#1084
      WordWrap = True
    end
    object Lb_HMin: TLabel
      Left = 72
      Top = 51
      Width = 61
      Height = 16
      Caption = #1052#1080#1085#1080#1084#1091#1084
      WordWrap = True
    end
    object Ed_H2: TEdit
      Left = 8
      Top = 20
      Width = 41
      Height = 24
      TabOrder = 0
      Text = '1'
      OnChange = Ed_H2Change
      OnKeyPress = Ed_KeyPress_Real
    end
    object UD_H2: TUpDown
      Left = 49
      Top = 20
      Width = 16
      Height = 24
      Min = 1
      Max = 30000
      Position = 1
      TabOrder = 1
      OnMouseUp = UD_H2MouseUp
    end
    object Ed_H1: TEdit
      Left = 8
      Top = 48
      Width = 41
      Height = 24
      TabOrder = 2
      Text = '0'
      OnChange = Ed_H1Change
      OnKeyPress = Ed_KeyPress_Real
    end
    object UD_H1: TUpDown
      Left = 49
      Top = 48
      Width = 16
      Height = 24
      Max = 30000
      TabOrder = 3
      OnMouseUp = UD_H1MouseUp
    end
    object Bt_HApply: TButton
      Left = 8
      Top = 80
      Width = 81
      Height = 25
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      TabOrder = 4
      OnMouseUp = Bt_HApplyMouseUp
    end
  end
  object GB_GraphParam2: TGroupBox
    Left = 746
    Top = 320
    Width = 153
    Height = 85
    Anchors = [akTop, akRight]
    Caption = #1058#1080#1087' '#1075#1088#1072#1092#1080#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    object RB_bSpec: TRadioButton
      Left = 8
      Top = 20
      Width = 141
      Height = 17
      Caption = #1063#1072#1089#1090#1086#1090#1085#1099#1081' '#1089#1087#1077#1082#1090#1088
      Checked = True
      TabOrder = 0
      TabStop = True
      OnMouseUp = SetSpecType
    end
    object RB_bDiff: TRadioButton
      Left = 8
      Top = 60
      Width = 129
      Height = 17
      Caption = #1055#1088#1086#1073#1072' 1 - '#1055#1088#1086#1073#1072' 2'
      TabOrder = 1
      OnMouseUp = SetSpecType
    end
    object RB_bRltn: TRadioButton
      Left = 8
      Top = 40
      Width = 137
      Height = 17
      Caption = #1055#1088#1086#1073#1072' 1 / '#1055#1088#1086#1073#1072' 2'
      TabOrder = 2
      OnMouseUp = SetSpecType
    end
  end
  object Ed_Status: TEdit
    Left = 4
    Top = 611
    Width = 277
    Height = 24
    Anchors = [akLeft, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object Pl_SetTitle: TPanel
    Left = 228
    Top = -168
    Width = 701
    Height = 217
    Caption = 'Pl_SetTitle'
    TabOrder = 9
    Visible = False
    object Lb_SetTitle1: TLabel
      Left = 160
      Top = 4
      Width = 116
      Height = 16
      Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1055#1088#1086#1073#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Lb_SetTitle2: TLabel
      Left = 284
      Top = 4
      Width = 7
      Height = 16
      Caption = '_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object SG_SetTitle: TStringGrid
      Left = 8
      Top = 24
      Width = 705
      Height = 154
      ColCount = 2
      DefaultColWidth = 350
      RowCount = 6
      FixedRows = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ParentFont = False
      TabOrder = 0
      RowHeights = (
        24
        24
        24
        24
        24
        24)
    end
    object Bt_SetTitleYes: TButton
      Left = 64
      Top = 184
      Width = 75
      Height = 25
      Caption = #1044#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnMouseUp = Bt_SetTitleYesMouseUp
    end
    object Bt_SetTitleNo: TButton
      Left = 576
      Top = 184
      Width = 75
      Height = 25
      Caption = #1053#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnMouseUp = Bt_SetTitleNoMouseUp
    end
  end
  object Pl_TreeV: TPanel
    Left = 152
    Top = -392
    Width = 441
    Height = 429
    TabOrder = 10
    Visible = False
    object TreeV: TTreeView
      Left = 4
      Top = 12
      Width = 433
      Height = 365
      Color = clActiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Indent = 19
      MultiSelect = True
      MultiSelectStyle = [msControlSelect, msShiftSelect, msVisibleOnly, msSiblingOnly]
      ParentFont = False
      TabOrder = 0
      OnChange = TreeVChange
    end
    object Bt_NoTreeV: TButton
      Left = 340
      Top = 390
      Width = 75
      Height = 25
      Caption = #1053#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Bt_NoTreeVClick
    end
    object Bt_OpenTreeV: TButton
      Left = 28
      Top = 390
      Width = 75
      Height = 25
      Caption = #1054#1090#1082#1088#1099#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnMouseUp = Bt_OpenTreeVMouseUp
    end
    object GB_VectorSelect: TGroupBox
      Left = 112
      Top = 380
      Width = 137
      Height = 41
      Caption = #1042#1077#1082#1090#1086#1088
      TabOrder = 3
      object RB_bVectorForce: TRadioButton
        Left = 8
        Top = 16
        Width = 49
        Height = 17
        Caption = #1057#1080#1083
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RB_bVectorMoment: TRadioButton
        Left = 56
        Top = 16
        Width = 73
        Height = 17
        Caption = #1052#1086#1084#1077#1085#1090#1086#1074
        TabOrder = 1
      end
    end
  end
  object Ed_Status2: TEdit
    Left = 288
    Top = 611
    Width = 610
    Height = 24
    Anchors = [akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
  end
  object P_Option: TPanel
    Left = 105
    Top = -432
    Width = 365
    Height = 465
    Caption = 'P_Option'
    TabOrder = 5
    Visible = False
    object PC_Option: TPageControl
      Left = 8
      Top = 8
      Width = 349
      Height = 409
      ActivePage = TS_Option_Probe
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MultiLine = True
      ParentFont = False
      TabOrder = 0
      object TS_Option_Probe: TTabSheet
        Caption = #1055#1088#1086#1073#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        object GB_NumberWindow: TGroupBox
          Left = 4
          Top = 244
          Width = 333
          Height = 105
          Caption = #1063#1080#1089#1083#1086#1074#1086#1081' '#1092#1080#1083#1100#1090#1088
          TabOrder = 0
          object RB_bHanning: TRadioButton
            Left = 8
            Top = 40
            Width = 130
            Height = 17
            Caption = 'Hanning'
            TabOrder = 0
            OnMouseUp = OptionMouseUp
          end
          object RB_bBlackman: TRadioButton
            Left = 8
            Top = 20
            Width = 130
            Height = 17
            Caption = 'Blackman'
            TabOrder = 1
            OnMouseUp = OptionMouseUp
          end
          object RB_bHamming: TRadioButton
            Left = 8
            Top = 60
            Width = 130
            Height = 17
            Caption = 'Hamming'
            TabOrder = 2
            OnMouseUp = OptionMouseUp
          end
          object RB_bBlackmanHarris: TRadioButton
            Left = 8
            Top = 80
            Width = 130
            Height = 17
            Caption = 'Blackman Harris'
            TabOrder = 3
            OnMouseUp = OptionMouseUp
          end
          object RB_bExactBlackman: TRadioButton
            Left = 168
            Top = 20
            Width = 130
            Height = 17
            Caption = 'Exact Blackman'
            TabOrder = 4
            OnMouseUp = OptionMouseUp
          end
          object RB_bTriangle: TRadioButton
            Left = 168
            Top = 60
            Width = 130
            Height = 17
            Caption = 'Triangle'
            TabOrder = 5
            OnMouseUp = OptionMouseUp
          end
          object RB_bFlatTop: TRadioButton
            Left = 168
            Top = 40
            Width = 130
            Height = 17
            Caption = 'Flat Top'
            TabOrder = 6
            OnMouseUp = OptionMouseUp
          end
          object RB_bNoFilter: TRadioButton
            Left = 168
            Top = 80
            Width = 113
            Height = 17
            Caption = #1054#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
            TabOrder = 7
            OnMouseUp = OptionMouseUp
          end
        end
        object GB_ProbeInput: TGroupBox
          Left = 4
          Top = 4
          Width = 333
          Height = 85
          Caption = #1058#1080#1087' '#1079#1072#1075#1088#1091#1079#1082#1080' '#1087#1088#1086#1073#1099
          TabOrder = 1
          object RB_bTextFile: TRadioButton
            Left = 8
            Top = 20
            Width = 169
            Height = 17
            Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
            TabOrder = 0
          end
          object RB_bImportFile: TRadioButton
            Left = 8
            Top = 60
            Width = 169
            Height = 17
            Caption = #1048#1084#1087#1086#1088#1090' '#1080#1079' StabMed'
            TabOrder = 1
          end
          object RB_bBinFile: TRadioButton
            Left = 8
            Top = 40
            Width = 169
            Height = 17
            Caption = #1041#1080#1085#1072#1088#1085#1099#1081' '#1092#1072#1081#1083
            TabOrder = 2
          end
        end
        object GB_RecordLength: TGroupBox
          Left = 4
          Top = 90
          Width = 333
          Height = 151
          Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1086#1073#1088#1072#1073#1086#1090#1082#1080' '#1087#1088#1086#1073#1099
          TabOrder = 2
          object Lb_tProbInter: TLabel
            Left = 76
            Top = 88
            Width = 231
            Height = 16
            Caption = #1048#1085#1090#1077#1088#1074#1072#1083' '#1086#1073#1088#1072#1073#1086#1090#1082#1080', '#1089#1077#1082'   (10 - 600 )'
          end
          object Lb_tProbStart: TLabel
            Left = 76
            Top = 24
            Width = 205
            Height = 16
            Caption = #1055#1088#1086#1073#1072' 1    '#1053#1072#1095#1072#1083#1086', '#1089#1077#1082' (1 - 30001)'
          end
          object Label3: TLabel
            Left = 76
            Top = 56
            Width = 205
            Height = 16
            Caption = #1055#1088#1086#1073#1072' 2    '#1053#1072#1095#1072#1083#1086', '#1089#1077#1082' (1 - 30001)'
          end
          object Label2: TLabel
            Left = 76
            Top = 120
            Width = 179
            Height = 16
            Caption = #1063#1072#1089#1090#1086#1090#1072' '#1076#1080#1089#1082#1088#1077#1090#1080#1079#1072#1094#1080#1080', '#1043#1094
          end
          object Ed_tProcInter: TEdit
            Left = 8
            Top = 84
            Width = 45
            Height = 24
            TabOrder = 0
            Text = '10'
            OnEnter = Ed_EditEnter
            OnKeyPress = Ed_KeyPress_Wrd
          end
          object UD_tProcInter: TUpDown
            Left = 53
            Top = 84
            Width = 16
            Height = 24
            Associate = Ed_tProcInter
            Min = 10
            Max = 1000
            Position = 10
            TabOrder = 1
            OnMouseUp = OptionMouseUp
          end
          object Ed_tProcStart1: TEdit
            Left = 8
            Top = 20
            Width = 45
            Height = 24
            TabOrder = 2
            Text = '1'
            OnEnter = Ed_EditEnter
            OnKeyPress = Ed_KeyPress_Wrd
          end
          object UD_tProcStart1: TUpDown
            Left = 53
            Top = 20
            Width = 17
            Height = 24
            Associate = Ed_tProcStart1
            Min = 1
            Max = 30001
            Position = 1
            TabOrder = 3
            OnMouseUp = OptionMouseUp
          end
          object Ed_tProcStart2: TEdit
            Left = 8
            Top = 52
            Width = 45
            Height = 24
            TabOrder = 4
            Text = '1'
            OnEnter = Ed_EditEnter
            OnKeyPress = Ed_KeyPress_Wrd
          end
          object UD_tProcStart2: TUpDown
            Left = 53
            Top = 52
            Width = 17
            Height = 24
            Associate = Ed_tProcStart2
            Min = 1
            Max = 30001
            Position = 1
            TabOrder = 5
            OnMouseUp = OptionMouseUp
          end
          object Ed_Fdiscr: TEdit
            Left = 8
            Top = 116
            Width = 45
            Height = 24
            TabOrder = 6
            OnEnter = Ed_EditEnter
            OnKeyPress = Ed_KeyPress_Wrd
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = #1057#1087#1077#1082#1090#1088#1086#1075#1088#1072#1084#1084#1072
        ImageIndex = 2
        object GroupBox3: TGroupBox
          Left = 8
          Top = 4
          Width = 325
          Height = 69
          Caption = #1058#1080#1087' '#1089#1087#1077#1082#1090#1088#1086#1075#1088#1072#1084#1084#1099
          TabOrder = 0
          object RB_bDiscrSpG: TRadioButton
            Left = 8
            Top = 20
            Width = 113
            Height = 17
            Caption = #1044#1080#1089#1082#1088#1077#1090#1085#1072#1103
            TabOrder = 0
            OnMouseUp = OptionMouseUp
          end
          object RB_bSmoothSpG: TRadioButton
            Left = 8
            Top = 44
            Width = 113
            Height = 17
            Caption = #1057#1075#1083#1072#1078#1077#1085#1085#1072#1103
            TabOrder = 1
            OnMouseUp = OptionMouseUp
          end
        end
        object GB_SGColPal: TGroupBox
          Left = 8
          Top = 76
          Width = 325
          Height = 61
          Caption = #1062#1074#1077#1090#1086#1074#1072#1103' '#1087#1072#1083#1080#1090#1088#1072
          TabOrder = 1
          object Ed_SGPalName: TEdit
            Left = 8
            Top = 24
            Width = 269
            Height = 24
            TabOrder = 0
            OnEnter = Ed_EditEnter
          end
        end
        object Bt_SGSelPal: TButton
          Left = 296
          Top = 100
          Width = 29
          Height = 25
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnMouseUp = OptionMouseUp
        end
      end
      object TabSheet1: TTabSheet
        Caption = #1054#1082#1086#1085#1085#1099#1081
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImageIndex = 3
        ParentFont = False
        object GB_Option_Window: TGroupBox
          Left = 8
          Top = 8
          Width = 329
          Height = 49
          Caption = #1042#1080#1076' '#1087#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1103
          TabOrder = 0
          object RB_bOut1St: TRadioButton
            Left = 8
            Top = 24
            Width = 113
            Height = 17
            Caption = #1054#1076#1085#1072' '#1087#1088#1086#1073#1072
            TabOrder = 0
            OnMouseUp = OptionMouseUp
          end
          object RB_bOut2St: TRadioButton
            Left = 192
            Top = 24
            Width = 113
            Height = 17
            Caption = #1044#1074#1077' '#1087#1088#1086#1073#1099
            TabOrder = 1
            OnMouseUp = OptionMouseUp
          end
        end
        object GB_Twin: TGroupBox
          Left = 8
          Top = 64
          Width = 329
          Height = 65
          Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1086#1073#1088#1072#1073#1086#1090#1082#1080
          TabOrder = 1
          object Lb_Twin: TLabel
            Left = 72
            Top = 32
            Width = 155
            Height = 16
            Caption = #1064#1080#1088#1080#1085#1072' '#1086#1082#1085#1072', '#1089#1077#1082' (4 - 60)'
          end
          object Ed_Twin: TEdit
            Left = 8
            Top = 28
            Width = 41
            Height = 24
            TabOrder = 0
            Text = '4'
            OnEnter = Ed_EditEnter
            OnKeyPress = Ed_KeyPress_Wrd
          end
          object UD_Twin: TUpDown
            Left = 49
            Top = 28
            Width = 16
            Height = 24
            Associate = Ed_Twin
            Min = 4
            Max = 60
            Increment = 2
            Position = 4
            TabOrder = 1
            OnMouseUp = OptionMouseUp
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = #1042#1077#1081#1074#1083#1077#1090
        ImageIndex = 4
        object GB_WaveLet2: TGroupBox
          Left = 114
          Top = 4
          Width = 223
          Height = 61
          Caption = #1058#1080#1087' '#1042#1077#1081#1074#1083#1077#1090#1072
          TabOrder = 0
          object RB_bWLdb2: TRadioButton
            Left = 8
            Top = 20
            Width = 80
            Height = 17
            Caption = #1044#1086#1073#1077#1096#1080' 4'
            TabOrder = 0
            OnMouseUp = OptionMouseUp
          end
          object RB_bWLdb3: TRadioButton
            Left = 8
            Top = 40
            Width = 80
            Height = 17
            Caption = #1044#1086#1073#1077#1096#1080' 6'
            TabOrder = 1
            OnMouseUp = OptionMouseUp
          end
          object RB_bWLdb4: TRadioButton
            Left = 128
            Top = 20
            Width = 80
            Height = 17
            Caption = #1044#1086#1073#1077#1096#1080' 8'
            TabOrder = 2
            OnMouseUp = OptionMouseUp
          end
          object RB_bMorlet: TRadioButton
            Left = 128
            Top = 40
            Width = 81
            Height = 17
            Caption = #1052#1086#1088#1083#1077
            TabOrder = 3
            OnMouseUp = OptionMouseUp
          end
          object RB_bNotWL: TRadioButton
            Left = 128
            Top = 0
            Width = 49
            Height = 17
            Caption = #1053#1077#1090
            TabOrder = 4
            OnMouseUp = OptionMouseUp
          end
        end
        object GB_WaveLet4: TGroupBox
          Left = 4
          Top = 206
          Width = 333
          Height = 53
          Caption = #1062#1074#1077#1090#1086#1074#1072#1103' '#1087#1072#1083#1080#1090#1088#1072
          TabOrder = 1
          object Ed_WLPalName: TEdit
            Left = 8
            Top = 20
            Width = 281
            Height = 24
            TabOrder = 0
            OnEnter = Ed_EditEnter
          end
        end
        object Bt_WLSelPal: TButton
          Left = 300
          Top = 226
          Width = 29
          Height = 25
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnMouseUp = OptionMouseUp
        end
        object GB_WaveLet1: TGroupBox
          Left = 4
          Top = 4
          Width = 103
          Height = 61
          Caption = #1054#1089#1100' '#1072#1073#1089#1094#1080#1089#1089
          TabOrder = 3
          object RB_bWLAxisXT: TRadioButton
            Left = 8
            Top = 20
            Width = 93
            Height = 17
            Caption = #1042#1088#1077#1084#1103', '#1089#1077#1082
            Checked = True
            TabOrder = 0
            TabStop = True
            OnMouseUp = OptionMouseUp
          end
          object RB_bWLAxisXN: TRadioButton
            Left = 8
            Top = 40
            Width = 93
            Height = 17
            Caption = #1054#1090#1089#1095#1077#1090#1099
            TabOrder = 1
            OnMouseUp = OptionMouseUp
          end
        end
        object GB__WaveLet3: TGroupBox
          Left = 4
          Top = 68
          Width = 333
          Height = 133
          Caption = #1052#1086#1088#1083#1077' exp(iKt/'#1040')exp(-(t/'#1040')^2/2)'
          TabOrder = 4
          object Lb_Kmor: TLabel
            Left = 72
            Top = 28
            Width = 8
            Height = 16
            Caption = 'K'
          end
          object Ed_Kmor: TEdit
            Left = 8
            Top = 24
            Width = 41
            Height = 24
            TabOrder = 0
            Text = '1'
            OnEnter = Ed_EditEnter
            OnKeyPress = Ed_KeyPress_Wrd
          end
          object UD_Kmor: TUpDown
            Left = 49
            Top = 24
            Width = 16
            Height = 24
            Associate = Ed_Kmor
            Min = 1
            Position = 1
            TabOrder = 1
            OnMouseUp = OptionMouseUp
          end
          object CB_bCorrectMor: TCheckBox
            Left = 8
            Top = 100
            Width = 125
            Height = 17
            Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072
            TabOrder = 2
          end
        end
        object Ch_Morlet: TChart
          Left = 144
          Top = 92
          Width = 185
          Height = 101
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          MarginBottom = 0
          MarginLeft = 0
          MarginRight = 5
          MarginTop = 5
          Title.Text.Strings = (
            'TChart')
          Title.Visible = False
          BottomAxis.Labels = False
          LeftAxis.Labels = False
          Legend.Visible = False
          View3D = False
          TabOrder = 5
          object Lb_MorletRe: TLabel
            Left = 124
            Top = 7
            Width = 18
            Height = 16
            Caption = 'Re'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Lb_MorletIm: TLabel
            Left = 124
            Top = 22
            Width = 14
            Height = 16
            Caption = 'Im'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Ss_MorRe: TLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            SeriesColor = clRed
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
          object Ss_MorIm: TLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            SeriesColor = clGreen
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
          object Ss_Mor0: TLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            SeriesColor = clBlack
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
        end
      end
      object TabSheet7: TTabSheet
        Caption = #1042#1077#1083#1095
        ImageIndex = 5
        object GB_CV1: TGroupBox
          Left = 8
          Top = 8
          Width = 329
          Height = 97
          Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1086#1073#1088#1072#1073#1086#1090#1082#1080
          TabOrder = 0
          object Lb_Tvel: TLabel
            Left = 76
            Top = 28
            Width = 155
            Height = 16
            Caption = #1064#1080#1088#1080#1085#1072' '#1086#1082#1085#1072', '#1089#1077#1082' (4 - 60)'
          end
          object Lb_Svel: TLabel
            Left = 76
            Top = 64
            Width = 206
            Height = 16
            Caption = #1064#1072#1075' '#1089#1084#1077#1097#1077#1085#1080#1103' '#1086#1082#1085#1072', '#1089#1077#1082' (0.2 - 60)'
          end
          object Ed_Svel: TEdit
            Left = 8
            Top = 60
            Width = 45
            Height = 24
            TabOrder = 0
            Text = '1'
            OnEnter = Ed_EditEnter
            OnKeyPress = Ed_KeyPress_Real
          end
          object UD_Svel: TUpDown
            Left = 53
            Top = 60
            Width = 16
            Height = 24
            Min = 1
            Max = 300
            Position = 1
            TabOrder = 1
            OnMouseUp = OptionMouseUp
          end
          object UD_Tvel: TUpDown
            Left = 53
            Top = 24
            Width = 16
            Height = 24
            Min = 20
            Max = 300
            Position = 20
            TabOrder = 2
            OnMouseUp = OptionMouseUp
          end
          object Ed_Tvel: TEdit
            Left = 8
            Top = 24
            Width = 45
            Height = 24
            TabOrder = 3
            Text = '4'
            OnEnter = Ed_EditEnter
            OnKeyPress = Ed_KeyPress_Real
          end
        end
        object GB_CV2: TGroupBox
          Left = 8
          Top = 108
          Width = 329
          Height = 49
          Caption = #1042#1099#1074#1086#1076' '#1087#1086#1075#1088#1077#1096#1085#1086#1089#1090#1080
          TabOrder = 1
          object CB_bError: TCheckBox
            Left = 8
            Top = 24
            Width = 97
            Height = 17
            Caption = #1044#1072' / '#1053#1077#1090
            TabOrder = 0
            OnMouseUp = OptionMouseUp
          end
        end
      end
      object TabSheet5: TTabSheet
        Caption = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077
        ImageIndex = 6
        object GB_DBase: TGroupBox
          Left = 4
          Top = 12
          Width = 329
          Height = 97
          Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
          TabOrder = 0
          object Lb_NewBD: TLabel
            Left = 92
            Top = 64
            Width = 194
            Height = 16
            Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1085#1086#1074#1077#1081' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
          end
          object Bt_DBaseSelect: TButton
            Left = 292
            Top = 20
            Width = 29
            Height = 25
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -27
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnMouseUp = OptionMouseUp
          end
          object Ed_DataExportDir: TEdit
            Left = 8
            Top = 20
            Width = 273
            Height = 24
            TabOrder = 1
            OnEnter = Ed_EditEnter
          end
          object Bt_NewBD: TButton
            Left = 8
            Top = 60
            Width = 75
            Height = 25
            Caption = #1053#1086#1074#1072#1103' BD'
            TabOrder = 2
            OnClick = Bt_NewBDClick
          end
        end
      end
      object TS_Graph: TTabSheet
        Caption = #1043#1088#1072#1092#1080#1082#1080
        ImageIndex = 7
        object GB_Graph1: TGroupBox
          Left = 4
          Top = 4
          Width = 333
          Height = 57
          Caption = #1042#1099#1074#1086#1076' '#1075#1088#1072#1092#1080#1082#1086#1074' '#1085#1072' '#1101#1082#1088#1072#1085
          TabOrder = 0
          object Lb_nAxis: TLabel
            Left = 248
            Top = 28
            Width = 74
            Height = 16
            Caption = #1063#1080#1089#1083#1086' '#1086#1089#1077#1081
          end
          object Lb_nProb: TLabel
            Left = 80
            Top = 28
            Width = 75
            Height = 16
            Caption = #1063#1080#1089#1083#1086' '#1087#1088#1086#1073
          end
          object Ed_nAxis: TEdit
            Left = 176
            Top = 24
            Width = 49
            Height = 24
            TabOrder = 0
            Text = '1'
            OnEnter = Ed_EditEnter
            OnKeyPress = Ed_KeyPress_Wrd
          end
          object UD_nAxis: TUpDown
            Left = 225
            Top = 24
            Width = 16
            Height = 24
            Associate = Ed_nAxis
            Min = 1
            Max = 3
            Position = 1
            TabOrder = 1
            OnMouseUp = OptionMouseUp
          end
          object Ed_nProb: TEdit
            Left = 8
            Top = 24
            Width = 49
            Height = 24
            TabOrder = 2
            Text = '1'
            OnEnter = Ed_EditEnter
            OnKeyPress = Ed_KeyPress_Wrd
          end
          object UD_nProb: TUpDown
            Left = 57
            Top = 24
            Width = 16
            Height = 24
            Associate = Ed_nProb
            Min = 1
            Max = 2
            Position = 1
            TabOrder = 3
            OnMouseUp = OptionMouseUp
          end
        end
        object GB_Graph5: TGroupBox
          Left = 148
          Top = 64
          Width = 189
          Height = 105
          Caption = '  '#1040#1084#1087#1083'.         '#1052#1086#1097#1085'.       '#1052#1086#1097#1085'.'
          TabOrder = 1
          object Lb_Dim1: TLabel
            Left = 8
            Top = 20
            Width = 164
            Height = 16
            Caption = '    '#1084#1084'         '#1084#1084'^2/'#1043#1094'             '#1076#1041
          end
          object Lb_Dim2: TLabel
            Left = 8
            Top = 40
            Width = 165
            Height = 16
            Caption = '     '#1082#1043'           '#1082#1043'^2/'#1043#1094'             '#1076#1041
          end
          object Lb_Dim3: TLabel
            Left = 8
            Top = 60
            Width = 163
            Height = 16
            Caption = '  '#1053'*'#1084'     ('#1053'*'#1084')^2/'#1043#1094'            '#1076#1041
          end
          object Lb_Dim4: TLabel
            Left = 8
            Top = 80
            Width = 163
            Height = 16
            Caption = '     '#1091#1077'          '#1091#1077'^2/'#1043#1094'            '#1076#1041
          end
        end
        object GB_Graph2: TGroupBox
          Left = 4
          Top = 64
          Width = 44
          Height = 105
          Caption = #1054#1089#1100'1'
          TabOrder = 2
          object RB_bDim11: TRadioButton
            Left = 12
            Top = 20
            Width = 17
            Height = 17
            TabOrder = 0
          end
          object RB_bDim12: TRadioButton
            Left = 12
            Top = 40
            Width = 17
            Height = 17
            TabOrder = 1
          end
          object RB_bDim13: TRadioButton
            Left = 12
            Top = 60
            Width = 17
            Height = 17
            TabOrder = 2
          end
          object RB_bDim14: TRadioButton
            Left = 12
            Top = 80
            Width = 17
            Height = 17
            TabOrder = 3
          end
        end
        object GB_Graph3: TGroupBox
          Left = 50
          Top = 64
          Width = 44
          Height = 105
          Caption = #1054#1089#1100'2'
          TabOrder = 3
          object RB_bDim21: TRadioButton
            Tag = 1
            Left = 12
            Top = 20
            Width = 17
            Height = 17
            TabOrder = 0
          end
          object RB_bDim22: TRadioButton
            Tag = 1
            Left = 12
            Top = 40
            Width = 17
            Height = 17
            TabOrder = 1
          end
          object RB_bDim23: TRadioButton
            Tag = 1
            Left = 12
            Top = 60
            Width = 17
            Height = 17
            TabOrder = 2
          end
          object RB_bDim24: TRadioButton
            Tag = 1
            Left = 12
            Top = 80
            Width = 17
            Height = 17
            TabOrder = 3
          end
        end
        object GB_Graph4: TGroupBox
          Left = 96
          Top = 64
          Width = 44
          Height = 105
          Caption = #1054#1089#1100'3'
          TabOrder = 4
          object RB_bDim31: TRadioButton
            Tag = 2
            Left = 12
            Top = 20
            Width = 17
            Height = 17
            TabOrder = 0
          end
          object RB_bDim32: TRadioButton
            Tag = 2
            Left = 12
            Top = 40
            Width = 17
            Height = 17
            TabOrder = 1
          end
          object RB_bDim33: TRadioButton
            Tag = 2
            Left = 12
            Top = 60
            Width = 17
            Height = 17
            TabOrder = 2
          end
          object RB_bDim34: TRadioButton
            Tag = 2
            Left = 12
            Top = 80
            Width = 17
            Height = 17
            TabOrder = 3
          end
        end
        object GB_Graph6: TGroupBox
          Left = 4
          Top = 172
          Width = 333
          Height = 89
          Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1087#1086#1083#1077#1081' '#1075#1088#1072#1092#1080#1095#1077#1089#1082#1080#1093' '#1086#1082#1086#1085
          TabOrder = 5
          object Lb_dLeftG: TLabel
            Left = 64
            Top = 28
            Width = 41
            Height = 16
            Caption = #1057#1083#1077#1074#1072
          end
          object Lb_dRightG: TLabel
            Left = 64
            Top = 60
            Width = 49
            Height = 16
            Caption = #1057#1087#1088#1072#1074#1072
          end
          object Lb_TopG: TLabel
            Left = 176
            Top = 28
            Width = 47
            Height = 16
            Caption = #1057#1074#1077#1088#1093#1091
          end
          object Lb_dBottomG: TLabel
            Left = 176
            Top = 60
            Width = 41
            Height = 16
            Caption = #1057#1085#1080#1079#1091
          end
          object Ed_dLeftG: TEdit
            Left = 8
            Top = 24
            Width = 33
            Height = 24
            TabOrder = 0
            Text = '0'
            OnEnter = Ed_EditEnter
            OnKeyPress = Ed_KeyPress_Int
          end
          object Ed_dRightG: TEdit
            Left = 8
            Top = 56
            Width = 33
            Height = 24
            TabOrder = 1
            Text = '0'
            OnEnter = Ed_EditEnter
            OnKeyPress = Ed_KeyPress_Int
          end
          object Ed_dTopG: TEdit
            Left = 120
            Top = 24
            Width = 33
            Height = 24
            TabOrder = 2
            Text = '0'
            OnEnter = Ed_EditEnter
            OnKeyPress = Ed_KeyPress_Int
          end
          object Ed_dBottomG: TEdit
            Left = 120
            Top = 56
            Width = 33
            Height = 24
            TabOrder = 3
            Text = '0'
            OnEnter = Ed_EditEnter
            OnKeyPress = Ed_KeyPress_Int
          end
          object UD_dLeftG: TUpDown
            Left = 41
            Top = 24
            Width = 17
            Height = 24
            Associate = Ed_dLeftG
            Min = -100
            TabOrder = 4
          end
          object UD_dRightG: TUpDown
            Left = 41
            Top = 56
            Width = 17
            Height = 24
            Associate = Ed_dRightG
            Min = -100
            TabOrder = 5
          end
          object UD_dTopG: TUpDown
            Left = 153
            Top = 24
            Width = 17
            Height = 24
            Associate = Ed_dTopG
            Min = -100
            TabOrder = 6
          end
          object UD_dBottomG: TUpDown
            Left = 153
            Top = 56
            Width = 17
            Height = 24
            Associate = Ed_dBottomG
            Min = -100
            TabOrder = 7
          end
          object Bt_GraphCorr: TButton
            Left = 240
            Top = 56
            Width = 85
            Height = 25
            Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
            TabOrder = 8
            OnClick = Bt_GraphCorrClick
          end
        end
        object GroupBox1: TGroupBox
          Left = 4
          Top = 264
          Width = 333
          Height = 89
          Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1087#1086#1083#1077#1081' '#1076#1080#1072#1075#1088#1072#1084#1084
          TabOrder = 6
          object Lb_dLeftD: TLabel
            Left = 64
            Top = 28
            Width = 41
            Height = 16
            Caption = #1057#1083#1077#1074#1072
          end
          object Lb_dRightD: TLabel
            Left = 64
            Top = 60
            Width = 49
            Height = 16
            Caption = #1057#1087#1088#1072#1074#1072
          end
          object Lb_dTopD: TLabel
            Left = 176
            Top = 28
            Width = 47
            Height = 16
            Caption = #1057#1074#1077#1088#1093#1091
          end
          object Lb_dBottomD: TLabel
            Left = 176
            Top = 60
            Width = 41
            Height = 16
            Caption = #1057#1085#1080#1079#1091
          end
          object Ed_dLeftD: TEdit
            Left = 8
            Top = 24
            Width = 33
            Height = 24
            TabOrder = 0
            Text = '0'
            OnEnter = Ed_EditEnter
            OnKeyPress = Ed_KeyPress_Int
          end
          object Ed_dRightD: TEdit
            Left = 8
            Top = 56
            Width = 33
            Height = 24
            TabOrder = 1
            Text = '0'
            OnEnter = Ed_EditEnter
            OnKeyPress = Ed_KeyPress_Int
          end
          object Ed_dTopD: TEdit
            Left = 120
            Top = 24
            Width = 33
            Height = 24
            TabOrder = 2
            Text = '0'
            OnEnter = Ed_EditEnter
            OnKeyPress = Ed_KeyPress_Int
          end
          object Ed_dBottomD: TEdit
            Left = 120
            Top = 56
            Width = 33
            Height = 24
            TabOrder = 3
            Text = '0'
            OnEnter = Ed_EditEnter
            OnKeyPress = Ed_KeyPress_Int
          end
          object UD_dLeftD: TUpDown
            Left = 41
            Top = 24
            Width = 17
            Height = 24
            Associate = Ed_dLeftD
            Min = -100
            TabOrder = 4
          end
          object UD_dRightD: TUpDown
            Left = 41
            Top = 56
            Width = 17
            Height = 24
            Associate = Ed_dRightD
            Min = -100
            TabOrder = 5
          end
          object UD_dTopD: TUpDown
            Left = 153
            Top = 24
            Width = 17
            Height = 24
            Associate = Ed_dTopD
            Min = -100
            TabOrder = 6
          end
          object UD_dBottomD: TUpDown
            Left = 153
            Top = 56
            Width = 17
            Height = 24
            Associate = Ed_dBottomD
            Min = -100
            TabOrder = 7
          end
          object Button1: TButton
            Left = 240
            Top = 56
            Width = 85
            Height = 25
            Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
            TabOrder = 8
            OnClick = Bt_GraphCorrClick
          end
        end
      end
    end
    object Bt_OptionOk: TButton
      Left = 16
      Top = 430
      Width = 75
      Height = 25
      Caption = #1044#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Bt_OptionOkClick
    end
    object Bt_OptionCancel: TButton
      Left = 272
      Top = 430
      Width = 75
      Height = 25
      Caption = #1053#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnMouseUp = OptionMouseUp
    end
    object Bt_OptionApply: TButton
      Left = 112
      Top = 430
      Width = 89
      Height = 25
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnMouseUp = Bt_OptionApplyMouseUp
    end
  end
  object P_Test: TPanel
    Left = 548
    Top = -192
    Width = 353
    Height = 241
    Caption = 'P_Test'
    TabOrder = 6
    Visible = False
    object Bt_TestOk: TButton
      Left = 40
      Top = 204
      Width = 75
      Height = 25
      Caption = #1044#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Bt_TestOkClick
    end
    object Bt_TestCancel: TButton
      Left = 232
      Top = 204
      Width = 75
      Height = 25
      Caption = #1053#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Bt_TestCancelClick
    end
    object GB_Test: TGroupBox
      Left = 8
      Top = 4
      Width = 337
      Height = 189
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1090#1072#1073#1080#1083#1086#1075#1088#1072#1084#1084#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Lb_Test1: TLabel
        Left = 12
        Top = 28
        Width = 56
        Height = 32
        AutoSize = False
        Caption = #1053#1072#1095#1072#1083#1086',      '#1090#1072#1082#1090
        WordWrap = True
      end
      object Lb_Test2: TLabel
        Left = 88
        Top = 28
        Width = 49
        Height = 32
        AutoSize = False
        Caption = #1050#1086#1085#1077#1094',      '#1090#1072#1082#1090
        WordWrap = True
      end
      object Lb_Test3: TLabel
        Left = 164
        Top = 28
        Width = 61
        Height = 32
        AutoSize = False
        Caption = #1063#1072#1089#1090#1086#1090#1072',         '#1043#1094
        WordWrap = True
      end
      object Label1: TLabel
        Left = 240
        Top = 28
        Width = 73
        Height = 16
        Caption = #1040#1084#1087#1083#1080#1090#1091#1076#1072
      end
      object Ed_TestSt1: TEdit
        Left = 12
        Top = 60
        Width = 57
        Height = 24
        TabOrder = 0
      end
      object Ed_TestSt2: TEdit
        Left = 12
        Top = 92
        Width = 57
        Height = 24
        TabOrder = 1
      end
      object Ed_TestSt3: TEdit
        Left = 12
        Top = 124
        Width = 57
        Height = 24
        TabOrder = 2
      end
      object Ed_TestSt4: TEdit
        Left = 12
        Top = 156
        Width = 57
        Height = 24
        TabOrder = 3
      end
      object Ed_TestFn1: TEdit
        Left = 88
        Top = 60
        Width = 57
        Height = 24
        TabOrder = 4
      end
      object Ed_TestFn2: TEdit
        Left = 88
        Top = 92
        Width = 57
        Height = 24
        TabOrder = 5
      end
      object Ed_TestFn3: TEdit
        Left = 88
        Top = 124
        Width = 57
        Height = 24
        TabOrder = 6
      end
      object Ed_TestFn4: TEdit
        Left = 88
        Top = 156
        Width = 57
        Height = 24
        TabOrder = 7
      end
      object Ed_TestHz1: TEdit
        Left = 164
        Top = 60
        Width = 57
        Height = 24
        TabOrder = 8
      end
      object Ed_TestHz2: TEdit
        Left = 164
        Top = 92
        Width = 57
        Height = 24
        TabOrder = 9
      end
      object Ed_TestHz3: TEdit
        Left = 164
        Top = 124
        Width = 57
        Height = 24
        TabOrder = 10
      end
      object Ed_TestHz4: TEdit
        Left = 164
        Top = 156
        Width = 57
        Height = 24
        TabOrder = 11
      end
      object CB_bTest1: TCheckBox
        Left = 308
        Top = 62
        Width = 20
        Height = 17
        TabOrder = 12
      end
      object CB_bTest2: TCheckBox
        Left = 308
        Top = 94
        Width = 20
        Height = 17
        TabOrder = 13
      end
      object CB_bTest3: TCheckBox
        Left = 308
        Top = 126
        Width = 20
        Height = 17
        TabOrder = 14
      end
      object CB_bTest4: TCheckBox
        Left = 308
        Top = 158
        Width = 20
        Height = 17
        TabOrder = 15
      end
      object Ed_TestAm1: TEdit
        Left = 240
        Top = 60
        Width = 57
        Height = 24
        TabOrder = 16
      end
      object Ed_TestAm3: TEdit
        Left = 240
        Top = 124
        Width = 57
        Height = 24
        TabOrder = 17
      end
      object Ed_TestAm4: TEdit
        Left = 240
        Top = 156
        Width = 57
        Height = 24
        TabOrder = 18
      end
      object Ed_TestAm2: TEdit
        Left = 240
        Top = 92
        Width = 57
        Height = 24
        TabOrder = 19
      end
    end
  end
  object OpenD1: TOpenDialog
    OptionsEx = [ofExNoPlacesBar]
    Left = 764
    Top = 56
  end
  object MainMenu1: TMainMenu
    Left = 952
    Top = 56
    object MM_File: TMenuItem
      Caption = #1060#1072#1081#1083
      object MM_File_Prob1: TMenuItem
        Caption = #1055#1088#1086#1073#1072' 1'
        OnClick = ProbeLoadClick
      end
      object MM_File_Prob2: TMenuItem
        Caption = #1055#1088#1086#1073#1072' 2'
        Enabled = False
        OnClick = ProbeLoadClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object MM_File_Exit: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = MM_File_ExitClick
      end
    end
    object MM_Option: TMenuItem
      Caption = #1054#1087#1094#1080#1080
      OnClick = MM_OptionClick
    end
    object MM_Test: TMenuItem
      Caption = 'Test'
      OnClick = MM_TestClick
    end
  end
  object TableA: TTable
    BeforeDelete = TableABeforeDelete
    Left = 920
    Top = 55
    object TableAName: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'Name'
      Required = True
      Size = 30
    end
    object TableABDate: TDateField
      DisplayLabel = #1044'. '#1088#1086#1078#1076#1077#1085#1080#1103
      FieldName = 'BDate'
    end
    object TableAGroup: TStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      FieldName = 'Group'
      Size = 30
    end
    object TableAAdgeGroup: TStringField
      DisplayLabel = #1042#1086#1079#1088#1072#1089#1090#1085#1072#1103' '#1075#1088'.'
      FieldName = 'AdgeGroup'
      Size = 15
    end
    object TableADiagnose: TStringField
      DisplayLabel = #1044#1080#1072#1075#1085#1086#1079
      FieldName = 'Diagnose'
      Size = 15
    end
    object TableAInsDate: TStringField
      DisplayLabel = #1044'. '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
      FieldName = 'InsDate'
    end
    object TableATest: TStringField
      DisplayLabel = #1058#1077#1089#1090
      FieldName = 'Test'
      Size = 30
    end
    object TableASample: TStringField
      DisplayLabel = #1055#1088#1086#1073#1072
      FieldName = 'Sample'
      Size = 30
    end
    object TableAAnalDate: TStringField
      DisplayLabel = #1044'. '#1072#1085#1072#1083#1080#1079#1072
      FieldName = 'AnalDate'
    end
    object TableAResult: TStringField
      DisplayLabel = #1055#1072#1087#1082#1072' '#1089' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1072#1084#1080' '#1086#1073#1088#1072#1073#1086#1090#1082#1080
      FieldName = 'Result'
      Size = 100
    end
  end
  object DataSource1: TDataSource
    DataSet = TableA
    Left = 888
    Top = 55
  end
  object OpenD_Palette: TOpenDialog
    Left = 792
    Top = 56
  end
  object PopupMenu1: TPopupMenu
    Left = 856
    Top = 54
  end
  object SaveD: TSaveDialog
    Left = 824
    Top = 56
  end
end
