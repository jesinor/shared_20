object FCons_2013: TFCons_2013
  Left = 0
  Top = 0
  ActiveControl = grilla
  Caption = 'Consultas'
  ClientHeight = 493
  ClientWidth = 994
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object cinta: TdxRibbon
    Left = 0
    Top = 0
    Width = 994
    Height = 122
    Hint = 'doble clic minimiza la barra'
    BarManager = mgr
    Style = rs2016
    ColorSchemeAccent = rcsaGreen
    ColorSchemeName = 'LightGray'
    EnableTabAero = False
    HelpButton.Glyph.SourceDPI = 96
    HelpButton.Glyph.Data = {
      89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
      610000001974455874536F6674776172650041646F626520496D616765526561
      647971C9653C00000019744558745469746C6500506172616D65746572733B4F
      7074696F6E733BAF3ADB25000001F949444154785E65923D68544D14869F73EF
      DEEC2631113E3062506B9B80410B9B18D40FC14245102D2CC442528892C2462B
      2D6C5258A9886021414B4BC12216FEA1884414D142500B636321AC26BB7B67CE
      2BB80377F1C23033309C87F73C734C126696DFB8BBBC94E5F9AC10000824A56B
      B54910CAEE93F953BBFE97D46B00001966B373C7A7006A45604005BBB6B83C03
      E4000980C5E800F44A472488FA9B10FD65348B8C101C201B04101D04B8A0FDAB
      C3BDFBAF79FB6105801D539B397A689A9191268E881E8114BD4A5092FAE6E69D
      A73C7BF5999DDBB7625983976FBE716BF1052E21911260FF000084BBF8F4E507
      EB465BEC9FDD867B04135F577E52E49600B10E0865448024AE5C3CC8D5CB8779
      F7F13BEDF62A45D1E0C491692C7929CB9460D0412F49748CB1B1610C78F8E83D
      ADE1212E9CDDCBE4C4389DD229F28C10630D601E0208DC850C106C99FC8F8D13
      EBD9B4619CB55E24BA686446A8245680327D9F4B0904A74FCED02CEC6FBA1045
      7A2704D513841891207A35710BD7974070FECC3E803E581093C4FA20A1944000
      E4996166B48A8CD56E04843C2386BA44CAE8F46B4592C0FCDC1E5A4319422889
      718918EB003C3802465B0D1008E132240741AB99210717B8A73E2B00A1D3FDFD
      F8DCA507BB4525D14C890E0E586AADDB693F077A8380EEED856307806270B806
      CFEA8E52F11AC01F873A2DD1B0FC64020000000049454E44AE426082}
    Contexts = <>
    TabOrder = 1
    TabStop = False
    OnHelpButtonClick = cintaHelpButtonClick
    object ctInfo: TdxRibbonTab
      Active = True
      Caption = 'Informe'
      Groups = <
        item
          ToolbarName = 'BarFin'
        end
        item
          ToolbarName = 'barInfo'
        end
        item
          ToolbarName = 'barFecha'
        end
        item
          ToolbarName = 'barExpo'
        end>
      KeyTip = 'I'
      Index = 0
    end
  end
  object sb: TdxRibbonStatusBar
    Left = 0
    Top = 470
    Width = 994
    Height = 23
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarKeyboardStatePanelStyle'
        PanelStyle.CapsLockKeyAppearance.ActiveFontColor = clDefault
        PanelStyle.CapsLockKeyAppearance.ActiveCaption = 'CAPS'
        PanelStyle.CapsLockKeyAppearance.InactiveCaption = 'CAPS'
        PanelStyle.NumLockKeyAppearance.ActiveFontColor = clDefault
        PanelStyle.NumLockKeyAppearance.ActiveCaption = 'NUM'
        PanelStyle.NumLockKeyAppearance.InactiveCaption = 'NUM'
        PanelStyle.ScrollLockKeyAppearance.ActiveFontColor = clDefault
        PanelStyle.ScrollLockKeyAppearance.ActiveCaption = 'SCRL'
        PanelStyle.ScrollLockKeyAppearance.InactiveCaption = 'SCRL'
        PanelStyle.InsertKeyAppearance.ActiveFontColor = clDefault
        PanelStyle.InsertKeyAppearance.ActiveCaption = 'OVR'
        PanelStyle.InsertKeyAppearance.InactiveCaption = 'INS'
        Width = 127
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = 'fechas de consulta'
      end>
    Ribbon = cinta
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object grilla: TcxGrid
    Left = 0
    Top = 122
    Width = 994
    Height = 348
    Align = alClient
    PopupMenu = pop
    TabOrder = 2
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
      FindPanel.DisplayMode = fpdmManual
      FindPanel.InfoText = 'Texto a buscar...'
      FindPanel.MRUItemsListCount = 10
      DataController.DataSource = Ds
      DataController.Filter.Active = True
      DataController.Filter.AutoDataSetFilter = True
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      DataController.OnSortingChanged = vistaDataControllerSortingChanged
      Filtering.ColumnFilteredItemsList = True
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      OptionsView.HeaderHeight = 30
      Styles.ContentEven = even
      Styles.ContentOdd = odd
      Styles.Footer = footer
      Styles.GroupByBox = group
    end
    object Base: TcxGridLevel
      Caption = 'Consulta'
      GridView = vista
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
    ImageOptions.HotImages = DataRes.imagenes
    ImageOptions.Images = DataRes.imagenes
    ImageOptions.LargeImages = DataRes.imagenes
    LookAndFeel.Kind = lfStandard
    MenuAnimations = maUnfold
    PopupMenuLinks = <>
    ShowCloseButton = True
    ShowFullMenusAfterDelay = False
    ShowHelpButton = True
    UseSystemFont = True
    OnHelpButtonClick = mgrHelpButtonClick
    Left = 536
    Top = 136
    PixelsPerInch = 96
    object barInfo: TdxBar
      Caption = 'ver informes'
      CaptionButtons = <>
      DockedLeft = 51
      DockedTop = 0
      FloatLeft = 800
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnVistaprevia'
        end
        item
          Visible = True
          ItemName = 'btnImprimir'
        end>
      KeyTip = 'V'
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object barExpo: TdxBar
      Caption = 'exportar'
      CaptionButtons = <>
      DockedLeft = 322
      DockedTop = 0
      FloatLeft = 800
      FloatTop = 8
      FloatClientWidth = 95
      FloatClientHeight = 270
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnExpoPDF'
        end
        item
          Visible = True
          ItemName = 'dxExpoXls'
        end
        item
          Visible = True
          ItemName = 'btnHTML'
        end
        item
          Visible = True
          ItemName = 'btnTexto'
        end
        item
          Visible = True
          ItemName = 'btnXML'
        end>
      KeyTip = 'E'
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object barFecha: TdxBar
      Caption = 'periodo de consulta'
      CaptionButtons = <>
      DockedLeft = 170
      DockedTop = 0
      FloatLeft = 800
      FloatTop = 8
      FloatClientWidth = 112
      FloatClientHeight = 54
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnSelFec'
        end
        item
          Visible = True
          ItemName = 'btnPanelBusqueda'
        end>
      KeyTip = 'F'
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object BarFin: TdxBar
      Caption = 'fin'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 800
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnSalir'
        end>
      KeyTip = 'X'
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object btnVistaprevia: TdxBarLargeButton
      Action = mVisPre
      Category = 0
    end
    object btnImprimir: TdxBarLargeButton
      Action = mImprimir
      Category = 0
    end
    object btnHTML: TdxBarLargeButton
      Action = mExportar_html
      Category = 0
    end
    object btnTexto: TdxBarLargeButton
      Action = mExportar_txt
      Category = 0
    end
    object btnXML: TdxBarLargeButton
      Action = mExportar_xml
      Category = 0
    end
    object btnSelFec: TdxBarLargeButton
      Action = mCamFec
      Category = 0
    end
    object btnSalir: TdxBarLargeButton
      Action = mSalir
      Category = 0
    end
    object btnExpoPDF: TdxBarLargeButton
      Action = acExpo_pdf
      Category = 0
    end
    object btnPanelBusqueda: TdxBarLargeButton
      Action = acPanelBusqueda
      Category = 0
    end
    object dxExpoXls: TdxBarLargeButton
      Action = mExportar_xls
      Category = 0
    end
  end
  object jvForm: TJvFormStorage
    AppStorage = jvIni
    AppStoragePath = 'FCons2013\'
    StoredValues = <>
    Left = 402
    Top = 160
  end
  object jvIni: TJvAppIniFileStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    FileName = 'conf/gridatos.ini'
    Location = flCustom
    DefaultSection = 'general'
    SubStorages = <>
    Left = 452
    Top = 158
  end
  object Aclst: TActionList
    Images = DataRes.imagenes
    Left = 616
    Top = 160
    object mSalir: TAction
      Category = 'Consulta'
      Caption = '&Salir'
      Hint = 'Salir'
      ImageIndex = 0
      OnExecute = mSalirExecute
    end
    object mAyuda: TAction
      Category = 'Ayuda'
      Caption = 'A&yuda'
      Hint = 'Ayuda'
      ImageIndex = 11
      OnExecute = mAyudaExecute
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
      Caption = '&Vista Previa'
      Hint = 'Vista Previa '
      ImageIndex = 41
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
      Caption = 'Exportar &Excel'
      Hint = 'Exportar datos formato excel'
      ImageIndex = 7
      OnExecute = mExportar_xlsExecute
    end
    object mExportar_html: TAction
      Category = 'Acciones'
      Caption = 'exportar &HTML'
      ImageIndex = 8
      OnExecute = mExportar_htmlExecute
    end
    object mExportar_txt: TAction
      Category = 'Acciones'
      Caption = 'Exportar &texto'
      ImageIndex = 9
      OnExecute = mExportar_txtExecute
    end
    object mExportar_xml: TAction
      Category = 'Acciones'
      Caption = 'Exportar &xml'
      ImageIndex = 10
      OnExecute = mExportar_xmlExecute
    end
    object acFlushReg: TAction
      Category = 'Acciones'
      Caption = 'Limpiar registro'
      ShortCut = 49222
      OnExecute = acFlushRegExecute
    end
    object acExpo_pdf: TAction
      Category = 'Acciones'
      Caption = 'Exportar &PDF'
      ImageIndex = 48
      OnExecute = acExpo_pdfExecute
    end
    object acPanelBusqueda: TAction
      Category = 'Acciones'
      Caption = 'Panel de &Busqueda'
      ImageIndex = 1
      ShortCut = 16450
      OnExecute = acPanelBusquedaExecute
    end
  end
  object Ds: TDataSource
    DataSet = cds
    Left = 216
    Top = 248
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 288
    Top = 248
  end
  object dsp: TDataSetProvider
    Left = 352
    Top = 248
  end
  object grabar: TSaveDialog
    FileName = 'consulta'
    Filter = 'excel|*.xls|texto|*.txt|html|*.html|xml|*.xml|todos|*.*'
    Left = 192
    Top = 176
  end
  object cxLocal: TcxLocalizer
    FileName = 'C:\clientes\SISNOB-XE4\Unidades\Ini\castellano.ini'
    Left = 80
    Top = 184
  end
  object pop: TPopupMenu
    Left = 456
    Top = 264
    object seleccionarfechas1: TMenuItem
      Action = mCamFec
    end
    object VistaPrevia1: TMenuItem
      Action = mVisPre
    end
  end
  object repositorio: TcxStyleRepository
    Left = 72
    Top = 272
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
  end
  object dxPrintGrid: TdxComponentPrinter
    CurrentLink = gridlink
    PreviewOptions.EnableOptions = [peoCanChangeMargins, peoPageBackground, peoPageSetup, peoPreferences, peoPrint]
    PreviewOptions.VisibleOptions = [pvoPageBackground, pvoPageSetup, pvoPreferences, pvoPrint, pvoPrintStyles, pvoReportFileOperations, pvoPageMargins]
    PreviewOptions.Caption = 'Vista impresion'
    PrintTitle = 'Impresion de tabla'
    Version = 0
    Left = 568
    Top = 240
    PixelsPerInch = 96
    object gridlink: TdxGridReportLink
      Component = grilla
      DesignerCaption = 'Formato de informe'
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.Caption = 'IMPRESION DE CONSULTA'
      PixelsPerInch = 96
      BuiltInReportLink = True
    end
  end
end
