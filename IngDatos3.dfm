object FIngDatos3: TFIngDatos3
  Left = 182
  Top = 155
  AlphaBlendValue = 0
  Caption = 'Ingreso de Datos'
  ClientHeight = 321
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  GlassFrame.Enabled = True
  GlassFrame.Left = 5
  GlassFrame.Top = 5
  GlassFrame.Right = 5
  GlassFrame.Bottom = 5
  KeyPreview = True
  Menu = FrmDatos1.MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnMouseWheelDown = FormMouseWheelDown
  OnMouseWheelUp = FormMouseWheelUp
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TJvCaptionPanel
    Left = 0
    Top = 128
    Width = 554
    Height = 130
    Align = alClient
    Buttons = []
    Caption = 'DATOS'
    CaptionColor = clWindowText
    CaptionFont.Charset = ANSI_CHARSET
    CaptionFont.Color = clWhite
    CaptionFont.Height = -24
    CaptionFont.Name = 'Lucida Sans'
    CaptionFont.Style = [fsBold]
    CaptionHeight = 30
    OutlookLook = True
    Resizable = False
    TabOrder = 1
    object wall: TJvFormWallpaper
      Left = 31
      Top = 1
      Width = 516
      Height = 122
      ExplicitLeft = 112
      ExplicitTop = 40
      ExplicitWidth = 100
      ExplicitHeight = 41
    end
  end
  inline FrmDatos1: TFrmDatos3
    Left = 0
    Top = 0
    Width = 554
    Height = 100
    Align = alTop
    AutoSize = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    ExplicitWidth = 554
    ExplicitHeight = 100
    inherited CoolBar1: TCoolBar
      Width = 554
      Height = 100
      BandBorderStyle = bsNone
      Bands = <
        item
          BorderStyle = bsSingle
          Control = FrmDatos1.PageScroller1
          ImageIndex = -1
          MinHeight = 42
          Width = 544
        end
        item
          BorderStyle = bsSingle
          Control = FrmDatos1.edCod
          ImageIndex = -1
          MinHeight = 21
          Text = 'Codigo: '
          Width = 123
        end
        item
          BorderStyle = bsSingle
          Break = False
          Control = FrmDatos1.edNom
          ImageIndex = -1
          MinHeight = 20
          Text = 'Nombre: '
          Width = 419
        end>
      ExplicitWidth = 554
      ExplicitHeight = 100
      inherited PageScroller1: TPageScroller
        AlignWithMargins = True
        Width = 544
        Height = 42
        ExplicitWidth = 544
        ExplicitHeight = 42
        inherited ToolBar1: TToolBar
          Width = 532
          ExplicitWidth = 532
        end
      end
      inherited edCod: TEdit
        Top = 58
        Color = clWhite
        OnChange = FrmDatos1edCodChange
        ExplicitTop = 58
      end
      inherited edNom: TEdit
        Left = 190
        Top = 59
        Width = 356
        Height = 20
        Color = clWhite
        OnChange = FrmDatos1edNomChange
        ExplicitLeft = 190
        ExplicitTop = 59
        ExplicitWidth = 356
        ExplicitHeight = 20
      end
    end
    inherited MainMenu1: TMainMenu
      Left = 166
      Top = 46
      inherited Ventana1: TMenuItem
        inherited Configurarapariencia1: TMenuItem
          Enabled = False
        end
      end
    end
    inherited ActionList1: TActionList
      Left = 434
      inherited Salir: TAction
        OnExecute = FrmDatos1SalirExecute
      end
      inherited Imprimir: TAction
        OnExecute = FrmDatos1ImprimirExecute
      end
      inherited DataSetCancel1: TDataSetCancel
        DataSource = DIng
      end
      inherited BorrarReg: TDataSetDelete
        OnExecute = FrmDatos1BorrarRegExecute
        DataSource = DIng
      end
      inherited DataSetEdit1: TDataSetEdit
        OnUpdate = FrmDatos1DataSetEdit1Update
        DataSource = DIng
      end
      inherited DataSetFirst1: TDataSetFirst
        OnUpdate = FrmDatos1DataSetEdit1Update
        DataSource = DIng
      end
      inherited DataSetInsert1: TDataSetInsert
        OnUpdate = FrmDatos1DataSetEdit1Update
        DataSource = DIng
      end
      inherited DataSetLast1: TDataSetLast
        OnUpdate = FrmDatos1DataSetEdit1Update
        DataSource = DIng
      end
      inherited DataSetNext1: TDataSetNext
        OnUpdate = FrmDatos1DataSetEdit1Update
        DataSource = DIng
      end
      inherited GrabarReg: TDataSetPost
        OnExecute = FrmDatos1GrabarRegExecute
        DataSource = DIng
      end
      inherited DataSetPrior1: TDataSetPrior
        OnUpdate = FrmDatos1DataSetEdit1Update
        DataSource = DIng
      end
      inherited DataSetRefresh1: TDataSetRefresh
        OnUpdate = FrmDatos1DataSetEdit1Update
        DataSource = DIng
      end
      inherited EditCopy1: TEditCopy
        ImageIndex = 14
      end
      inherited Ayuda: TAction
        ShortCut = 112
        OnExecute = FrmDatos1AyudaExecute
      end
      inherited Buscar: TAction
        OnExecute = FrmDatos1BuscarExecute
      end
      inherited Grilla: TAction
        ImageIndex = 17
        OnExecute = FrmDatos1GrillaExecute
      end
      inherited Ordenar: TAction
        OnExecute = FrmDatos1OrdenarExecute
      end
      inherited mConfig: TAction
        ImageIndex = 4
        OnExecute = FrmDatos1mConfigExecute
      end
      inherited acConsulta: TAction
        OnExecute = FrmDatos1acConsultaExecute
      end
    end
  end
  object SB: TStatusBar
    Left = 0
    Top = 302
    Width = 554
    Height = 19
    Panels = <
      item
        Width = 400
      end
      item
        Alignment = taCenter
        Text = 'NOB-2012'
        Width = 50
      end>
  end
  inline FrmBottom1: TFrmBottom
    Left = 0
    Top = 258
    Width = 554
    Height = 44
    Align = alBottom
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    ExplicitTop = 258
    ExplicitWidth = 554
    inherited Panel1: TPanel
      Width = 554
      ExplicitWidth = 554
      ExplicitHeight = 44
      inherited Bevel1: TBevel
        Width = 552
        ExplicitWidth = 562
      end
      inherited bbGrabar: TBitBtn
        Left = 161
        Top = 9
        Action = FrmDatos1.GrabarReg
        Caption = 'Grabar'
        Default = True
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        ExplicitLeft = 161
        ExplicitTop = 9
      end
      inherited bbAnular: TBitBtn
        Left = 240
        Top = 9
        Action = FrmDatos1.DataSetCancel1
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        ExplicitLeft = 240
        ExplicitTop = 9
      end
      inherited bbInsert: TBitBtn
        Left = 319
        Top = 9
        Action = FrmDatos1.DataSetInsert1
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00001C8600001C86000019780000166C0000166C0000166C0000166C000016
          6C0000166C0000166C0000166C0000135A00FF00FF00FF00FF00FF00FF000024
          AD00002AC8000029C5000026B9000025B5000024AD000024AD000024AD000024
          AD000024AD000024AD000024AD00001F940000135A00FF00FF00FF00FF00002A
          C8000030E900002EDD00002EDD00002BD000002AC8000029C5000026B9000026
          B9000026B9000029C5000029C5000025B50000166C00FF00FF00FF00FF00002B
          D0000033F4000030E900002EDD00002BD000002AC8000029C5000029C5000026
          B9000026B9000025B5000029C5000024AD0000166C00FF00FF00FF00FF00002B
          D000073BFF000033F4000030E900002FE100002EDD00FFFFFF00F7F9FF000029
          C5000026B9000026B9000026B9000024AD0000166C00FF00FF00FF00FF00002E
          DD002955FF000F41FF000034F9000030E900002EDD00FFFFFF00FFFFFF00002A
          C800002AC8000026B9000029C5000024AD0000166C00FF00FF00FF00FF00002B
          D0004F74FF001E4DFF000034F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00002AC8000029C5000025B50000166C00FF00FF00FF00FF00002B
          D0006988FF002E59FF000D3FFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00002BD000002AC8000025B50000197800FF00FF00FF00FF00002E
          DD007592FF003761FF001344FF000034F9000033F400FFFFFF00FFFFFF000030
          E900002FE100002EDD00002EDD000026B900001C8600FF00FF00FF00FF00002B
          D000819BFF00456CFF002552FF001E4DFF000D3FFF00FFFFFF00FFFFFF000033
          F4000030E9000030E600002FE100002AC800001F9400FF00FF00FF00FF00002B
          D0008FA6FF005B7DFF002E59FF002552FF001E4DFF000D3FFF000D3FFF000034
          F9000033F4000030E9000033F400002BD00000219E00FF00FF00FF00FF00002E
          DD0097ADFF008FA6FF006988FF006585FF004F74FF003761FF002955FF000D3F
          FF000034F9000033F4000033F400002FE1000024AD00FF00FF00FF00FF00002B
          D000718FFF0097ADFF009BB0FF008FA6FF007F9AFF006585FF003761FF001E4D
          FF00073BFF000034F9000034F9000030E9000026B900FF00FF00FF00FF00FF00
          FF000033F4001344FF001E4DFF001344FF001344FF000034F9000033F4000030
          E600002EDD00002EDD00002EDD00002AC800FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        ExplicitLeft = 319
        ExplicitTop = 9
      end
    end
  end
  object jvSubTit: TJvStaticText
    Left = 0
    Top = 100
    Width = 554
    Height = 28
    Align = alTop
    Alignment = taCenter
    Caption = 'INGRESO DE DATOS'
    Color = clWindowText
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    HotTrackFont.Charset = ANSI_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -21
    HotTrackFont.Name = 'Arial'
    HotTrackFont.Style = []
    Layout = tlTop
    ParentColor = False
    ParentFont = False
    TabOrder = 4
    TextMargins.X = 0
    TextMargins.Y = 0
    WordWrap = False
  end
  object DIng: TDataSource
    OnStateChange = DIngStateChange
    OnUpdateData = DIngUpdateData
    Left = 238
    Top = 51
  end
  object jvPlace: TJvFormStorage
    AppStorage = jvApp
    AppStoragePath = 'FIngDatos3\'
    StoredValues = <>
    Left = 376
    Top = 50
  end
  object jvApp: TJvAppIniFileStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    FileName = 'Gridatos.ini'
    DefaultSection = 'general'
    SubStorages = <>
    Left = 330
    Top = 48
  end
end
