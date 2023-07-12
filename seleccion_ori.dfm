object FSeleccion: TFSeleccion
  Left = 0
  Top = 0
  ActiveControl = grilla
  Caption = 'Seleccion de elemento'
  ClientHeight = 493
  ClientWidth = 766
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object cinta: TdxRibbon
    Left = 0
    Top = 0
    Width = 766
    Height = 126
    Hint = 'doble clic minimiza la barra'
    BarManager = mgr
    ColorSchemeName = 'Silver'
    Contexts = <>
    TabOrder = 1
    TabStop = False
    object ctInfo: TdxRibbonTab
      Caption = 'Informe'
      Groups = <
        item
          ToolbarName = 'mgrBar5'
        end>
      KeyTip = 'I'
      Index = 0
    end
    object ctAcc: TdxRibbonTab
      Active = True
      Caption = 'Acciones'
      Groups = <
        item
          ToolbarName = 'mgrBar1'
        end
        item
          ToolbarName = 'mgrBar2'
        end>
      KeyTip = 'A'
      Index = 1
    end
    object ctAyu: TdxRibbonTab
      Caption = 'Ayuda'
      Groups = <
        item
          ToolbarName = 'mgrBar4'
        end>
      KeyTip = 'Y'
      Index = 2
    end
  end
  object dxRibbonStatusBar1: TdxRibbonStatusBar
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
    Top = 126
    Width = 766
    Height = 344
    Align = alClient
    TabOrder = 6
    object vista: TcxGridDBTableView
      OnDblClick = vistaDblClick
      OnKeyPress = vistaKeyPress
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = Ds
      DataController.Filter.Active = True
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Filtering.ColumnFilteredItemsList = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsView.NoDataToDisplayInfoText = '<SIN DATOS>'
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      Styles.ContentEven = cxalter
      Styles.Selection = cxSel
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
    ImageOptions.HotImages = DataRes.imgseleccion
    ImageOptions.Images = DataRes.imgseleccion
    ImageOptions.LargeImages = DataRes.imgseleccion
    PopupMenuLinks = <>
    ShowFullMenusAfterDelay = False
    UseSystemFont = True
    Left = 576
    Top = 64
    DockControlHeights = (
      0
      0
      0
      0)
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
    object mgrBar5: TdxBar
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
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object mgrBar1: TdxBar
      Caption = 'acciones'
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
          ItemName = 'dxBarLargeButton10'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton11'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object mgrBar2: TdxBar
      Caption = 'navegar'
      CaptionButtons = <>
      DockedLeft = 136
      DockedTop = 0
      FloatLeft = 800
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarLargeButton12'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton14'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton15'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton13'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'Vista Previa'
      Category = 0
      Hint = 'Vista Previa '
      Visible = ivAlways
      LargeImageIndex = 1
      ShortCut = 16470
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Caption = 'Imprimir'
      Category = 0
      Hint = 'Imprimir '
      Visible = ivAlways
      LargeImageIndex = 6
      ShortCut = 16457
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Caption = 'Exportar Excel'
      Category = 0
      Hint = 'Exportar datos formato excel'
      Visible = ivAlways
      LargeImageIndex = 7
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Caption = 'exportar HTML'
      Category = 0
      Visible = ivAlways
      LargeImageIndex = 8
    end
    object dxBarLargeButton5: TdxBarLargeButton
      Caption = 'Exportar texto'
      Category = 0
      Visible = ivAlways
      LargeImageIndex = 9
    end
    object dxBarLargeButton6: TdxBarLargeButton
      Caption = 'Exportar xml'
      Category = 0
      Visible = ivAlways
      LargeImageIndex = 10
    end
    object dxBarLargeButton7: TdxBarLargeButton
      Caption = 'seleccionar fechas'
      Category = 0
      Hint = 'Cambio de Fechas'
      Visible = ivAlways
      LargeImageIndex = 12
      ShortCut = 16454
    end
    object dxBarLargeButton8: TdxBarLargeButton
      Action = mAyuda
      Category = 0
    end
    object dxBarLargeButton9: TdxBarLargeButton
      Action = mSalir
      Category = 0
    end
    object dxBarLargeButton10: TdxBarLargeButton
      Action = acSeleccion
      Category = 0
    end
    object dxBarLargeButton11: TdxBarLargeButton
      Action = acAnular
      Category = 0
    end
    object dxBarLargeButton12: TdxBarLargeButton
      Action = DataSetFirst1
      Category = 0
    end
    object dxBarLargeButton13: TdxBarLargeButton
      Action = DataSetLast1
      Category = 0
    end
    object dxBarLargeButton14: TdxBarLargeButton
      Action = DataSetPrior1
      Category = 0
    end
    object dxBarLargeButton15: TdxBarLargeButton
      Action = DataSetNext1
      Category = 0
    end
  end
  object jvForm: TJvFormStorage
    AppStorage = jvIni
    AppStoragePath = 'SelecItem\'
    StoredValues = <>
    Left = 402
    Top = 328
  end
  object jvIni: TJvAppIniFileStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    FileName = 'datoscons.ini'
    Location = flUserFolder
    DefaultSection = 'general'
    SubStorages = <>
    Left = 452
    Top = 326
  end
  object Aclst: TActionList
    Images = DataRes.imgseleccion
    Left = 616
    Top = 328
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
    object DataSetFirst1: TDataSetFirst
      Category = 'Dataset'
      Caption = '&Primero'
      Hint = 'Inicio'
      ImageIndex = 3
      ShortCut = 113
      DataSource = Ds
    end
    object DataSetPrior1: TDataSetPrior
      Category = 'Dataset'
      Caption = '&Anterior'
      Hint = 'Anterior'
      ImageIndex = 2
      ShortCut = 114
      DataSource = Ds
    end
    object DataSetNext1: TDataSetNext
      Category = 'Dataset'
      Caption = '&Proximo'
      Hint = 'Proximo'
      ImageIndex = 5
      ShortCut = 115
      DataSource = Ds
    end
    object DataSetLast1: TDataSetLast
      Category = 'Dataset'
      Caption = '&Ultimo'
      Hint = 'Ultimo'
      ImageIndex = 4
      ShortCut = 116
      DataSource = Ds
    end
    object acSeleccion: TAction
      Caption = '&Seleccionar'
      Hint = 'CTRL+S'
      ImageIndex = 15
      ShortCut = 16467
      OnExecute = acSeleccionExecute
    end
    object acAnular: TAction
      Caption = '&Anular'
      ImageIndex = 14
      ShortCut = 27
      OnExecute = acAnularExecute
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
    Top = 344
  end
  object cxLocal: TcxLocalizer
    FileName = 'C:\clientes\SQL-NOB-XE3\Unidades\Ini\castellano.ini'
    Left = 80
    Top = 352
  end
  object cxEstilos: TcxStyleRepository
    Left = 136
    Top = 168
    PixelsPerInch = 96
    object cxSel: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxalter: TcxStyle
      AssignedValues = [svColor]
      Color = clMoneyGreen
    end
  end
end
