object FCons_2016: TFCons_2016
  Left = 0
  Top = 0
  ActiveControl = grilla
  Caption = 'Consultas'
  ClientHeight = 493
  ClientWidth = 927
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
    Width = 927
    Height = 122
    Hint = 'doble clic minimiza la barra'
    BarManager = mgr
    Style = rs2013
    ColorSchemeAccent = rcsaPurple
    ColorSchemeName = 'LightGray'
    EnableTabAero = False
    Contexts = <>
    TabOrder = 1
    TabStop = False
    object ctInfo: TdxRibbonTab
      Active = True
      Caption = 'Informe'
      Groups = <
        item
          ToolbarName = 'mgrFin'
        end
        item
          ToolbarName = 'mgrInfo'
        end
        item
          ToolbarName = 'mgrSel'
        end
        item
          ToolbarName = 'mgrExpo'
        end>
      KeyTip = 'I'
      Index = 0
    end
  end
  object dxRibbonStatusBar1: TdxRibbonStatusBar
    Left = 0
    Top = 470
    Width = 927
    Height = 23
    Panels = <>
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
    Width = 927
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
      OnCellDblClick = vistaCellDblClick
      DataController.DataSource = Ds
      DataController.Filter.Active = True
      DataController.Filter.AutoDataSetFilter = True
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
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
    AutoAlignBars = True
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
    ImageOptions.LargeIcons = True
    ImageOptions.SmoothGlyphs = True
    ImageOptions.UseLargeImagesForLargeIcons = True
    LookAndFeel.Kind = lfStandard
    PopupMenuLinks = <>
    ShowCloseButton = True
    ShowFullMenusAfterDelay = False
    ShowHelpButton = True
    UseSystemFont = True
    OnHelpButtonClick = mgrHelpButtonClick
    Left = 576
    Top = 64
    PixelsPerInch = 96
    object mgrInfo: TdxBar
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
          ItemName = 'dxBarLargeButton1'
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
    object mgrExpo: TdxBar
      Caption = 'exportar'
      CaptionButtons = <>
      DockedLeft = 255
      DockedTop = 0
      FloatLeft = 1093
      FloatTop = 253
      FloatClientWidth = 95
      FloatClientHeight = 216
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
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton6'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object mgrFin: TdxBar
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
          ItemName = 'dxBarLargeButton9'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object mgrSel: TdxBar
      Caption = 'Seleccionar'
      CaptionButtons = <>
      DockedLeft = 170
      DockedTop = 0
      FloatLeft = 961
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarLargeButton14'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Action = mVisPre
      Category = 0
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = mImprimir
      Category = 0
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Action = mExportar_xls
      Category = 0
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Action = mExportar_html
      Category = 0
    end
    object dxBarLargeButton5: TdxBarLargeButton
      Action = mExportar_txt
      Category = 0
    end
    object dxBarLargeButton6: TdxBarLargeButton
      Action = mExportar_xml
      Category = 0
    end
    object dxBarLargeButton7: TdxBarLargeButton
      Action = mCamFec
      Category = 0
    end
    object dxBarLargeButton9: TdxBarLargeButton
      Action = mSalir
      Category = 0
    end
    object dxBarLargeButton14: TdxBarLargeButton
      Action = acSel
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
    object acSel: TAction
      Caption = 'Seleccionar'
      ImageIndex = 14
      ShortCut = 16467
      OnExecute = acSelExecute
    end
  end
  object Ds: TDataSource
    Left = 216
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
end
