object FConsMD: TFConsMD
  Left = 0
  Top = 0
  ActiveControl = cxLookCod
  Caption = 'CONSULTAS MAESTRO DETALLE'
  ClientHeight = 552
  ClientWidth = 949
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cinta: TdxRibbon
    Left = 0
    Top = 0
    Width = 949
    Height = 122
    Hint = 'doble clic minimiza la barra'
    BarManager = mgr
    Style = rs2013
    ColorSchemeAccent = rcsaGreen
    ColorSchemeName = 'LightGray'
    Contexts = <>
    TabOrder = 0
    TabStop = False
    object ctInfo: TdxRibbonTab
      Caption = 'Acciones'
      Groups = <>
      Visible = False
      Index = 0
    end
    object ctAcc: TdxRibbonTab
      Active = True
      Caption = 'Acciones'
      Groups = <
        item
          ToolbarName = 'acciones'
        end
        item
          ToolbarName = 'mgrBar3'
        end>
      Index = 1
    end
    object cintaTab1: TdxRibbonTab
      Caption = 'Varios'
      Groups = <
        item
          ToolbarName = 'mgrBar2'
        end>
      Index = 2
    end
    object ctAyu: TdxRibbonTab
      Caption = 'Ayuda'
      Groups = <>
      Visible = False
      Index = 3
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 122
    Width = 949
    Height = 33
    Align = alTop
    ParentBackground = False
    TabOrder = 1
    object Label14: TLabel
      Left = 18
      Top = 11
      Width = 121
      Height = 13
      Caption = 'SELECCIONAR CODIGO: '
    end
    object cxLookCod: TcxLookupComboBox
      Left = 159
      Top = 6
      Properties.DropDownAutoSize = True
      Properties.DropDownRows = 12
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.ListColumns = <>
      Properties.ListSource = DsCod
      Properties.OnEditValueChanged = cxLookCodPropertiesEditValueChanged
      TabOrder = 0
      Width = 770
    end
  end
  object JvCaptionPanel1: TPanel
    Left = 0
    Top = 155
    Width = 949
    Height = 62
    Align = alTop
    BorderStyle = bsSingle
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 5
      Width = 40
      Height = 16
      Caption = 'CODIGO'
      FocusControl = cxDBTextEdit1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 73
      Top = 4
      Width = 67
      Height = 16
      Caption = 'DESCRIPCION'
      FocusControl = cxDBTextEdit2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 496
      Top = 147
      Width = 3
      Height = 16
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 8
      Top = 21
      TabStop = False
      DataBinding.DataField = 'CODIGO'
      DataBinding.DataSource = DsFicha
      ParentFont = False
      Properties.ReadOnly = True
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Trebuchet MS'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      Width = 40
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 69
      Top = 21
      TabStop = False
      DataBinding.DataField = 'DENOMINA'
      DataBinding.DataSource = DsFicha
      ParentFont = False
      Properties.ReadOnly = True
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Trebuchet MS'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 1
      Width = 508
    end
  end
  object grilla: TcxGrid
    Left = 0
    Top = 217
    Width = 949
    Height = 335
    Align = alClient
    TabOrder = 3
    object vista: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Insert.Enabled = False
      Navigator.Buttons.Append.Enabled = False
      Navigator.Buttons.Delete.Enabled = False
      Navigator.Buttons.Edit.Enabled = False
      Navigator.Buttons.Post.Enabled = False
      Navigator.Buttons.Cancel.Enabled = False
      Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      DataController.DataSource = Ds
      DataController.Filter.Active = True
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
        end
        item
          Kind = skSum
        end
        item
          Kind = skSum
        end
        item
          Kind = skSum
        end
        item
          Kind = skSum
        end>
      DataController.Summary.SummaryGroups = <>
      Filtering.ColumnFilteredItemsList = True
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      OptionsView.HeaderHeight = 30
      Styles.Background = even
      Styles.ContentEven = even
      Styles.ContentOdd = odd
      Styles.Footer = stPieGrilla
      Styles.Group = ctHeadGrilla
      Styles.GroupByBox = ctHeadGrilla
      Styles.Header = cxStyle1
    end
    object Base: TcxGridLevel
      Caption = 'Consulta'
      GridView = vista
    end
  end
  object Aclst: TActionList
    Images = FDMSrd.imgcons
    Left = 584
    Top = 72
    object mSalir: TAction
      Category = 'Consulta'
      Caption = 'Sa&lir'
      Hint = 'Salir'
      ImageIndex = 0
      OnExecute = mSalirExecute
    end
    object mAyuda: TAction
      Category = 'Ayuda'
      Caption = 'Ayuda'
      Hint = 'Ayuda'
      ImageIndex = 11
    end
    object mImprimir: TAction
      Category = 'Consulta'
      Caption = '&Imprimir'
      Hint = 'Imprimir '
      ImageIndex = 6
      ShortCut = 16457
      OnExecute = mImprimirExecute
    end
    object mVisPre: TAction
      Category = 'Consulta'
      Caption = 'V&ista Previa'
      Hint = 'Vista Previa '
      ImageIndex = 1
      ShortCut = 16470
      OnExecute = mVisPreExecute
    end
    object mCamFec: TAction
      Category = 'Acciones'
      Caption = 'seleccionar &fechas'
      Hint = 'Cambio de Fechas'
      ImageIndex = 12
      ShortCut = 16454
      OnExecute = mCamFecExecute
    end
    object mExportar_xls: TAction
      Category = 'Acciones'
      Caption = 'Exportar E&xcel'
      Hint = 'Exportar datos formato excel'
      ImageIndex = 7
      OnExecute = mExportar_xlsExecute
    end
    object mExportar_html: TAction
      Category = 'Acciones'
      Caption = 'exportar HTML'
      ImageIndex = 8
      OnExecute = mExportar_htmlExecute
    end
    object mExportar_txt: TAction
      Category = 'Acciones'
      Caption = 'Exportar texto'
      ImageIndex = 9
      OnExecute = mExportar_txtExecute
    end
    object mExportar_xml: TAction
      Category = 'Acciones'
      Caption = 'Exportar xml'
      ImageIndex = 10
      OnExecute = mExportar_xmlExecute
    end
    object DatasetFirst2: TDataSetFirst
      Category = 'Dataset'
      Caption = '&Primero'
      Hint = 'Primero'
      ImageIndex = 3
    end
    object DatasetPrior2: TDataSetPrior
      Category = 'Dataset'
      Caption = 'Anterior'
      Hint = 'Anterior'
      ImageIndex = 2
    end
    object DatasetNext2: TDataSetNext
      Category = 'Dataset'
      Caption = 'Siguiente'
      Hint = 'Siguiente'
      ImageIndex = 5
    end
    object DatasetLast2: TDataSetLast
      Category = 'Dataset'
      Caption = 'Ultimo'
      Hint = 'Ultimo'
      ImageIndex = 4
    end
    object acSelCodigo: TAction
      Caption = '&Seleccionar Codigo'
      ImageIndex = 36
      ShortCut = 16467
      OnExecute = acSelCodigoExecute
    end
    object acFlush: TAction
      Caption = 'Acualizar Registro'
      ShortCut = 49222
      OnExecute = acFlushExecute
    end
  end
  object mgr: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.DisabledImages = FDMSrd.imgcons
    ImageOptions.DisabledLargeImages = FDMSrd.imgcons
    ImageOptions.Images = FDMSrd.imgcons
    ImageOptions.LargeImages = FDMSrd.imgcons
    LookAndFeel.Kind = lfStandard
    PopupMenuLinks = <>
    ShowFullMenusAfterDelay = False
    UseSystemFont = True
    Left = 752
    Top = 48
    PixelsPerInch = 96
    object mgrBar2: TdxBar
      Caption = 'exportar'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 800
      FloatTop = 8
      FloatClientWidth = 95
      FloatClientHeight = 126
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarLargeButton3'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton4'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton5'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object mgrBar3: TdxBar
      Caption = 'periodo de consulta'
      CaptionButtons = <>
      DockedLeft = 161
      DockedTop = 0
      FloatLeft = 800
      FloatTop = 8
      FloatClientWidth = 116
      FloatClientHeight = 132
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarLargeButton7'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton2'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object acciones: TdxBar
      Caption = 'Acciones'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 967
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarLargeButton23'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton24'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton25'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Action = mExportar_xls
      Category = 0
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Action = mExportar_html
      Caption = 'exportar &HTML'
      Category = 0
    end
    object dxBarLargeButton5: TdxBarLargeButton
      Action = mExportar_txt
      Caption = 'Exportar &texto'
      Category = 0
    end
    object dxBarLargeButton7: TdxBarLargeButton
      Action = mCamFec
      Category = 0
    end
    object dxBarLargeButton23: TdxBarLargeButton
      Action = mSalir
      Category = 0
    end
    object dxBarLargeButton24: TdxBarLargeButton
      Action = mVisPre
      Category = 0
    end
    object dxBarLargeButton25: TdxBarLargeButton
      Action = mImprimir
      Category = 0
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = acSelCodigo
      Category = 0
    end
  end
  object cxLocal: TcxLocalizer
    FileName = 'C:\clientes\nob19cli\Win32\Debug\ini\castellano.ini'
    Left = 48
    Top = 88
  end
  object repositorio: TcxStyleRepository
    Left = 816
    Top = 51
    PixelsPerInch = 96
    object even: TcxStyle
      AssignedValues = [svColor]
      Color = 16777200
    end
    object odd: TcxStyle
      AssignedValues = [svColor]
      Color = 13434811
    end
    object group: TcxStyle
      AssignedValues = [svColor]
      Color = 14474426
    end
    object footer: TcxStyle
      AssignedValues = [svColor]
      Color = clMoneyGreen
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Carlito'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Carlito'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Carlito'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Carlito'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Carlito'
      Font.Style = []
      TextColor = 13886416
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Carlito'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Carlito'
      Font.Style = []
      TextColor = clBlack
    end
    object stPieGrilla: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Carlito'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Carlito'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Carlito'
      Font.Style = []
      TextColor = 6592345
    end
    object ctHeadGrilla: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6592345
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Carlito'
      Font.Style = []
      TextColor = clWhite
    end
    object GridTableViewStyleSheetSpruce: TcxGridTableViewStyleSheet
      Caption = 'Spruce'
      Styles.Content = cxStyle1
      Styles.ContentEven = cxStyle2
      Styles.ContentOdd = cxStyle3
      Styles.Footer = cxStyle4
      Styles.Group = cxStyle5
      Styles.GroupByBox = cxStyle6
      Styles.Header = cxStyle7
      Styles.Inactive = stPieGrilla
      Styles.Indicator = cxStyle9
      Styles.Preview = cxStyle10
      Styles.Selection = ctHeadGrilla
      BuiltIn = True
    end
  end
  object Ds: TDataSource
    Left = 256
    Top = 416
  end
  object DsFicha: TDataSource
    Left = 424
    Top = 168
  end
  object DsCod: TDataSource
    Left = 272
    Top = 119
  end
  object jvForm: TJvFormStorage
    AppStorage = jvIni
    AppStoragePath = 'Detallectacte\'
    StoredValues = <>
    Left = 370
    Top = 8
  end
  object jvIni: TJvAppIniFileStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    FileName = 'datoscons.ini'
    Location = flUserFolder
    DefaultSection = 'general'
    SubStorages = <>
    Left = 412
    Top = 6
  end
  object grabar: TSaveDialog
    FileName = 'consulta'
    Filter = 'excel|*.xls|texto|*.txt|html|*.html|xml|*.xml|todos|*.*'
    Left = 96
    Top = 80
  end
end
