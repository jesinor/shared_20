object FIngViaGrilla: TFIngViaGrilla
  Left = 0
  Top = 0
  Caption = 'INGRESO DE DATOS'
  ClientHeight = 359
  ClientWidth = 749
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grilla: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 59
    Width = 743
    Height = 297
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 0
    ExplicitTop = 128
    ExplicitWidth = 749
    ExplicitHeight = 231
    object vista: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Visible = True
      DataController.DataSource = Ds
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.AlwaysShowEditor = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsData.Appending = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      OptionsView.Indicator = True
    end
    object level: TcxGridLevel
      GridView = vista
    end
  end
  object pnlTop: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 743
    Height = 50
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 749
    object tbMain: TToolBar
      AlignWithMargins = True
      Left = 6
      Top = 4
      Width = 733
      Height = 38
      Margins.Left = 5
      AutoSize = True
      ButtonHeight = 38
      ButtonWidth = 118
      EdgeBorders = [ebLeft]
      Images = DataRes.ImageList1
      List = True
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      ExplicitWidth = 739
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = acSalir
      end
      object ToolButton2: TToolButton
        Left = 118
        Top = 0
        Action = acAplicaCambios
        ImageIndex = 1
      end
      object ToolButton3: TToolButton
        Left = 236
        Top = 0
        Action = acAnulaCambios
        ImageIndex = 2
      end
    end
  end
  object jvForm: TJvFormStorage
    AppStorage = jvIni
    AppStoragePath = 'ingdatosgri\'
    StoredValues = <>
    Left = 410
    Top = 144
  end
  object jvIni: TJvAppIniFileStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    FileName = 'conf/gridatos.ini'
    Location = flCustom
    DefaultSection = 'general'
    SubStorages = <>
    Left = 452
    Top = 150
  end
  object Ac: TActionList
    Images = DataRes.ImageList1
    Left = 216
    Top = 104
    object acSalir: TAction
      Caption = '&Salir'
      Hint = 'Salir sin seleccionar'
      ImageIndex = 0
      OnExecute = acSalirExecute
    end
    object acAplicaCambios: TAction
      Caption = '&Aplicar Cambios'
      Hint = 'aplica cambios'
      ImageIndex = 34
      OnExecute = acAplicarCambiosExecute
    end
    object acAnulaCambios: TAction
      Caption = 'A&nula cambios'
      ImageIndex = 70
      OnExecute = acAnularCambiosExecute
    end
  end
  object Ds: TDataSource
    Left = 40
    Top = 64
  end
  object cxLocal: TcxLocalizer
    FileName = 'C:\clientes\SISNOB-LIGHT\Unidades\Ini\castellano.ini'
    Left = 80
    Top = 176
  end
  object repositorio: TcxStyleRepository
    Left = 24
    Top = 176
    PixelsPerInch = 96
    object even: TcxStyle
      AssignedValues = [svColor]
      Color = clInfoBk
    end
    object odd: TcxStyle
      AssignedValues = [svColor]
      Color = clMoneyGreen
    end
    object group: TcxStyle
      AssignedValues = [svColor]
      Color = 14474426
    end
    object footer: TcxStyle
      AssignedValues = [svColor]
      Color = clMoneyGreen
    end
    object cxSel: TcxStyle
      AssignedValues = [svColor]
      Color = clOlive
    end
  end
end
