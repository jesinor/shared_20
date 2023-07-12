object FConsMd_2014: TFConsMd_2014
  Left = 0
  Top = 0
  ActiveControl = grilla
  Caption = 'Consultas master detail'
  ClientHeight = 493
  ClientWidth = 766
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 16
  object cinta: TdxRibbon
    Left = 0
    Top = 0
    Width = 766
    Height = 122
    Hint = 'doble clic minimiza la barra'
    BarManager = mgr
    Style = rs2013
    ColorSchemeAccent = rcsaGreen
    ColorSchemeName = 'LightGray'
    Contexts = <>
    TabOrder = 1
    TabStop = False
    object ctInfo: TdxRibbonTab
      Caption = 'Informe'
      Groups = <
        item
          ToolbarName = 'mgrBar5'
        end
        item
          ToolbarName = 'mgrBar1'
        end>
      Index = 0
    end
    object ctAcc: TdxRibbonTab
      Active = True
      Caption = 'Acciones'
      Groups = <
        item
          ToolbarName = 'mgrBar2'
        end
        item
          ToolbarName = 'mgrBar3'
        end
        item
          ToolbarName = 'mgrBar7'
        end>
      Index = 1
    end
    object ctAyu: TdxRibbonTab
      Caption = 'Ayuda'
      Groups = <
        item
          ToolbarName = 'mgrBar4'
        end>
      Index = 2
    end
  end
  object sb: TdxRibbonStatusBar
    Left = 0
    Top = 470
    Width = 766
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
    Top = 245
    Width = 766
    Height = 225
    Align = alClient
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
      DataController.DataSource = Ds
      DataController.Filter.Active = True
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
    end
    object Base: TcxGridLevel
      Caption = 'Consulta'
      GridView = vista
    end
  end
  object JvCaptionPanel1: TPanel
    Left = 0
    Top = 122
    Width = 766
    Height = 123
    Align = alTop
    BorderStyle = bsSingle
    TabOrder = 3
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
    PopupMenuLinks = <>
    ShowFullMenusAfterDelay = False
    UseSystemFont = True
    Left = 680
    Top = 72
    PixelsPerInch = 96
    object mgrBar1: TdxBar
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
    object mgrBar2: TdxBar
      Caption = 'exportar'
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
    object mgrBar3: TdxBar
      Caption = 'periodo de consulta'
      CaptionButtons = <>
      DockedLeft = 249
      DockedTop = 0
      FloatLeft = 800
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarLargeButton7'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object mgrBar4: TdxBar
      Caption = 'indice'
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
          ItemName = 'dxBarLargeButton8'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object mgrBar7: TdxBar
      Caption = 'navegar'
      CaptionButtons = <>
      DockedLeft = 363
      DockedTop = 0
      FloatLeft = 800
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarLargeButton16'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton18'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton19'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton17'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object mgrBar5: TdxBar
      Caption = 'salir'
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
          ItemName = 'dxBarLargeButton20'
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
    object dxBarLargeButton8: TdxBarLargeButton
      Action = mAyuda
      Category = 0
    end
    object dxBarLargeButton9: TdxBarLargeButton
      Action = mSalir
      Category = 0
    end
    object dxBarLargeButton16: TdxBarLargeButton
      Action = DatasetFirst2
      Category = 0
    end
    object dxBarLargeButton17: TdxBarLargeButton
      Action = DatasetLast2
      Category = 0
    end
    object dxBarLargeButton18: TdxBarLargeButton
      Action = DatasetPrior2
      Category = 0
    end
    object dxBarLargeButton19: TdxBarLargeButton
      Action = DatasetNext2
      Category = 0
    end
    object dxBarLargeButton20: TdxBarLargeButton
      Action = mSalir
      Category = 0
    end
  end
  object jvForm: TJvFormStorage
    AppStorage = jvIni
    AppStoragePath = 'FConsMd2013\'
    StoredValues = <>
    Left = 490
    Top = 88
  end
  object jvIni: TJvAppIniFileStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    FileName = 'datoscons.ini'
    Location = flUserFolder
    DefaultSection = 'general'
    SubStorages = <>
    Left = 532
    Top = 86
  end
  object Aclst: TActionList
    Images = DataRes.imagenes
    Left = 616
    Top = 160
    object mSalir: TAction
      Category = 'Consulta'
      Caption = 'Salir'
      Hint = 'Salir'
      ImageIndex = 0
      OnExecute = mSalirExecute
    end
    object mAyuda: TAction
      Category = 'Ayuda'
      Caption = 'Ayuda'
      Hint = 'Ayuda'
      ImageIndex = 11
      OnExecute = mAyudaExecute
    end
    object mImprimir: TAction
      Category = 'Consulta'
      Caption = 'Imprimir'
      Hint = 'Imprimir '
      ImageIndex = 6
      ShortCut = 16457
      OnExecute = mImprimirExecute
    end
    object mVisPre: TAction
      Category = 'Consulta'
      Caption = 'Vista Previa'
      Hint = 'Vista Previa '
      ImageIndex = 1
      ShortCut = 16470
      OnExecute = mVisPreExecute
    end
    object mCamFec: TAction
      Category = 'Acciones'
      Caption = 'seleccionar fechas'
      Hint = 'Cambio de Fechas'
      ImageIndex = 12
      ShortCut = 16454
      OnExecute = mCamFecExecute
    end
    object mExportar_xls: TAction
      Category = 'Acciones'
      Caption = 'Exportar Excel'
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
      DataSource = DsFicha
    end
    object DatasetPrior2: TDataSetPrior
      Category = 'Dataset'
      Caption = 'Anterior'
      Hint = 'Anterior'
      ImageIndex = 2
      DataSource = DsFicha
    end
    object DatasetNext2: TDataSetNext
      Category = 'Dataset'
      Caption = 'Siguiente'
      Hint = 'Siguiente'
      ImageIndex = 5
      DataSource = DsFicha
    end
    object DatasetLast2: TDataSetLast
      Category = 'Dataset'
      Caption = 'Ultimo'
      Hint = 'Ultimo'
      ImageIndex = 4
      DataSource = DsFicha
    end
  end
  object Ds: TDataSource
    DataSet = cds
    Left = 216
    Top = 296
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 272
    Top = 304
  end
  object dsp: TDataSetProvider
    Left = 320
    Top = 312
  end
  object grabar: TSaveDialog
    FileName = 'consulta'
    Filter = 'excel|*.xls|texto|*.txt|html|*.html|xml|*.xml|todos|*.*'
    Left = 192
    Top = 176
  end
  object cxLocal: TcxLocalizer
    FileName = 'C:\clientes\SQL-NOB-XE3\Unidades\Ini\castellano.ini'
    Left = 80
    Top = 184
  end
  object DsFicha: TDataSource
    DataSet = cdsFicha
    Left = 288
    Top = 160
  end
  object cdsFicha: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspFicha'
    AfterScroll = cdsFichaAfterScroll
    Left = 344
    Top = 160
  end
  object DspFicha: TDataSetProvider
    Left = 400
    Top = 160
  end
end
