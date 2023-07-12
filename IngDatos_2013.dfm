object FIng: TFIng
  Left = 0
  Top = 0
  Caption = 'INGRESO de DATOS'
  ClientHeight = 374
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cinta: TdxRibbon
    Left = 0
    Top = 0
    Width = 800
    Height = 126
    Hint = 'doble clic minimiza la barra'
    BarManager = mgr
    ColorSchemeName = 'Silver'
    EnableTabAero = False
    Contexts = <>
    TabOrder = 0
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
      KeyTip = 'I'
      Index = 0
    end
    object ctOpera: TdxRibbonTab
      Active = True
      Caption = 'Operar'
      Groups = <
        item
          ToolbarName = 'mgrBar6'
        end
        item
          Caption = 'grupos'
        end
        item
          ToolbarName = 'mgrBar2'
        end>
      KeyTip = 'O'
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
  object Panel1: TPanel
    Left = 0
    Top = 126
    Width = 800
    Height = 248
    Align = alClient
    TabOrder = 5
    object cxDBNavigator1: TcxDBNavigator
      Left = 1
      Top = 222
      Width = 797
      Height = 25
      Buttons.CustomButtons = <>
      DataSource = DIng
      Align = alBottom
      TabOrder = 0
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
    ImageOptions.Images = DataRes.img16_Main
    ImageOptions.LargeImages = DataRes.imagenes
    ImageOptions.LargeIcons = True
    PopupMenuLinks = <>
    ShowFullMenusAfterDelay = False
    UseSystemFont = True
    Left = 640
    Top = 56
    DockControlHeights = (
      0
      0
      0
      0)
    object mgrBar1: TdxBar
      Caption = 'ver informes'
      CaptionButtons = <>
      DockedLeft = 51
      DockedTop = 0
      FloatLeft = 800
      FloatTop = 8
      FloatClientWidth = 76
      FloatClientHeight = 108
      ItemLinks = <
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
    object mgrBar4: TdxBar
      Caption = 'indice'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 800
      FloatTop = 8
      FloatClientWidth = 51
      FloatClientHeight = 54
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
      FloatClientWidth = 51
      FloatClientHeight = 54
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
    object mgrBar6: TdxBar
      Caption = 'accion'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 834
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
      Caption = 'buscar'
      CaptionButtons = <>
      DockedLeft = 126
      DockedTop = 0
      FloatLeft = 834
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cxCampo'
        end
        item
          Visible = True
          ItemName = 'cxBuscar'
        end
        item
          UserDefine = [udWidth]
          UserWidth = 227
          Visible = True
          ItemName = 'cxFecha'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = mImprimir
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
    object dxBarLargeButton10: TdxBarLargeButton
      Action = DatasetPost1
      Category = 0
    end
    object dxBarLargeButton11: TdxBarLargeButton
      Action = DatasetCancel1
      Caption = '&Anular cambios'
      Category = 0
    end
    object cxCampo: TdxBarCombo
      Caption = ' &Campo: '
      Category = 0
      Hint = 'Campo'
      Visible = ivAlways
      OnChange = cxCampoChange
      ImageIndex = 17
      Width = 300
      ItemIndex = -1
    end
    object cxBuscar: TdxBarEdit
      Caption = ' &Valor :   '
      Category = 0
      Hint = ' Valor :   '
      Visible = ivAlways
      OnCurChange = cxBuscarCurChange
      ImageIndex = 1
      Width = 300
    end
    object cxFecha: TdxBarDateCombo
      Caption = 'Fecha:  '
      Category = 0
      Hint = 'Fecha'
      Visible = ivNever
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD00000000000DDDDD0FFFFFFFFF0D00000F0000000F0D0FFF0FFFFFFF
        FF0D0F000FFF11FFFF0D0FFF0FFF11FFFF0D0FF10FFFF11FFF0D0FF10FFFFF11
        FF0D0FF10FF11111FF0D0FF10FFFFFFFFF0D0FF104444444440D0FFF04444444
        440D044400000000000D04444444440DDDDD00000000000DDDDD}
      Width = 200
    end
  end
  object Aclst: TActionList
    Images = DataRes.imagenes
    Left = 624
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
    object DatasetPost1: TDataSetPost
      Category = 'Dataset'
      Caption = '&Grabar registro'
      Hint = 'Post'
      ImageIndex = 13
    end
    object DatasetCancel1: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Anular'
      Hint = 'Cancel'
      ImageIndex = 14
    end
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
  object jvForm: TJvFormStorage
    AppStorage = jvIni
    AppStoragePath = 'ingdatos\'
    StoredValues = <>
    Left = 402
    Top = 160
  end
  object cxLocal: TcxLocalizer
    FileName = 'C:\clientes\SISNOB-XE4\Unidades\Ini\castellano.ini'
    Left = 64
    Top = 168
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
      Color = clCream
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
  object DIng: TDataSource
    Left = 254
    Top = 147
  end
end
