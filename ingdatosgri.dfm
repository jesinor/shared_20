object FIngDatosGri: TFIngDatosGri
  Left = 0
  Top = 0
  Caption = 'INGRESO DE DATOS'
  ClientHeight = 349
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object tbMain: TToolBar
    AlignWithMargins = True
    Left = 5
    Top = 3
    Width = 614
    Height = 22
    Margins.Left = 5
    AutoSize = True
    ButtonWidth = 47
    EdgeBorders = [ebLeft]
    Images = FDMSrd.img16_Main
    List = True
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Action = acSalir
    end
  end
  object grilla: TcxGrid
    Left = 0
    Top = 28
    Width = 622
    Height = 321
    Align = alClient
    TabOrder = 1
    ExplicitTop = 25
    ExplicitHeight = 324
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
    Images = FDMSrd.img16_Main
    Left = 216
    Top = 104
    object acSalir: TAction
      Caption = '&Salir'
      Hint = 'Salir sin seleccionar'
      ImageIndex = 0
      OnExecute = acSalirExecute
    end
  end
  object Ds: TDataSource
    DataSet = FDMem
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
  object FDMem: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 96
    Top = 64
  end
end
