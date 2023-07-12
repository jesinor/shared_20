object FEnviareMail: TFEnviareMail
  Left = 0
  Top = 0
  Caption = 'Envio de email'
  ClientHeight = 518
  ClientWidth = 701
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dxRibbon1: TdxRibbon
    Left = 0
    Top = 0
    Width = 701
    Height = 126
    BarManager = barMgr
    ColorSchemeName = 'Blue'
    SupportNonClientDrawing = True
    Contexts = <>
    TabOrder = 0
    TabStop = False
    ExplicitWidth = 695
    object dxRibbon1Tab1: TdxRibbonTab
      Active = True
      Caption = 'Enviar'
      Groups = <
        item
          ToolbarName = 'barMgrBar2'
        end
        item
          ToolbarName = 'barMgrBar1'
        end>
      Index = 0
    end
  end
  object statusbar: TdxRibbonStatusBar
    Left = 0
    Top = 495
    Width = 701
    Height = 23
    Panels = <>
    Ribbon = dxRibbon1
    SimplePanelStyle.Active = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ExplicitWidth = 695
  end
  object cxpage: TcxPageControl
    Left = 0
    Top = 126
    Width = 701
    Height = 369
    Align = alClient
    TabOrder = 2
    Properties.ActivePage = pEnviar
    Properties.CustomButtons.Buttons = <>
    LookAndFeel.Kind = lfOffice11
    ExplicitWidth = 695
    ClientRectBottom = 365
    ClientRectLeft = 4
    ClientRectRight = 697
    ClientRectTop = 4
    object pconfig: TcxTabSheet
      AllowCloseButton = False
      Caption = 'pconfig'
      ImageIndex = 0
      TabVisible = False
      ExplicitWidth = 687
      object btnok: TBitBtn
        Left = 267
        Top = 239
        Width = 83
        Height = 38
        Caption = 'Grabar'
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FFFFFF00D2D2
          D200CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCB
          CB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CECECE00FFFFFF00FFFFFF00AE84
          5B00A5734000A3703C00A3703B00A4703C00A5703C00A4703B00A3703B00A270
          3A00A2703A00A2703A00A3703B00A5734000AA7E5000FFFFFF00FFFFFF00A573
          4000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A5734000FFFFFF00FFFFFF00A370
          3C00FFFFFF00FFFFFF00FFFFFF00A6D6CB0000886300DFEFEC00FFFFFF00FFFD
          FF00FDFCFD00FDFCFD00FEFEFF00FFFFFF00A3703C00FFFFFF00FFFFFF00A370
          3C00FFFFFF00FFFFFF0080C5B20000895E00008C6200008F6600DEECE800FFFC
          FF00FCF9F900F9F7F700F9F9FA00FFFFFF00A3703B00FFFFFF00FFFFFF00A571
          3D00FFFFFF0056B89800008E5C0000926300019463000091610001936400DCEA
          E500FFFBFD00FAF7F700F7F7F700FFFFFF00A3703B00FFFFFF00FFFFFF00A672
          3D00FFFFFF00008F560000945E000899660055B7940000945D0000945E000398
          6200A1D3C000FFF8FB00F8F5F600FEFFFF00A3703C00FFFFFF00FFFFFF00A772
          3E00FFFFFF000092510000995D00DAE7E100FFFBFF0059B99400009657000098
          5B0000945600A1D2BE00FFF6FB00FFFFFF00A4713C00FFFFFF00FFFFFF00A672
          3D00FFFFFF0000975000D0E2D900FBF1F400F7F0F100FFF4F8008FCCB2000099
          5400009B5A00009754009DD3BD00FFFFFF00A5713D00FFFFFF00FFFFFF00A571
          3C00FFFFFF00F6EEF100F2ECED00EDEAEA00ECE9E900F0EBEB00FCEFF3009ED1
          BA00009C5100009E5600009A4D00FFFFFF00A6723E00FFFFFF00FFFFFF00A471
          3C00FCFFFF00E9E7E700E8E6E500E7E6E500E7E6E500E8E6E500ECE8E800F8EB
          F0009BD1B700009F4D00009E4B00FFFFFF00A7723E00FFFFFF00FFFFFF00A471
          3C00FCFFFF00E5E3E300E5E2E100E5E3E200E5E3E200E5E3E200E6E3E200EAE4
          E500F5E8EC0095CEB000009D3E00FFFFFF00A6723D00FFFFFF00FFFFFF00A471
          3D00FEFFFF00E1E1E100E1E0E000E2E0E000E2E0E000E2E0E000E2E0E000E2E0
          E100E6E2E200ECE3E600EEE4E900FFFFFF00A5723D00FFFFFF00FFFFFF00A674
          4000FFFFFF00F5F8FE00F5F8FD00F5F8FD00F5F8FD00F5F8FD00F5F8FD00F5F8
          FD00F5F8FD00F6F8FE00F7F9FF00FFFFFF00A6744000FFFFFF00FFFFFF00BB97
          7100A6744000A4723D00A4723D00A4723D00A4723D00A4723D00A4723D00A472
          3D00A4723D00A4723D00A4723D00A6744000AD815300FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
        TabOrder = 0
        OnClick = btnokClick
      end
      object btnAnu: TBitBtn
        Left = 372
        Top = 239
        Width = 83
        Height = 38
        Caption = 'Anular'
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
          FF00FFFFFF00ECECEC00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCB
          CB00CBCBCB00ECECEC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00ECECEC009298C7002C3CC0002B3BBE002B3ABE002B3ABE002B3ABE002B3B
          BE002C3CC0009298C700ECECEC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECEC
          EC00959AC8002F3EC3005F71F900697DFF00697CFF00697CFF00697CFF00697D
          FF005F71F9002F3EC300959AC800ECECEC00FFFFFF00FFFFFF00ECECEC00959A
          C8002F3EC200586BF6005F74FF005D72FE005E72FD005E73FD005E72FD005D72
          FE005F74FF00586BF6002F3EC200959AC800ECECEC00FFFFFF009298C700303F
          C2005568F300586CFC004E64F9004D63F8005468F900576BF9005468F9004D63
          F8004E64F900586CFC005568F300303FC2009298C700FFFFFF002D3DC0005367
          F200556BFA004960F700FFFFFF00FFFFFF003E56F600475EF6003E56F600FFFF
          FF00FFFFFF004960F700556BFA005166F2002D3DC000FFFFFF002B3BBF006276
          FC004D64F6004259F400FFFFFF00FFFFFF00FFFFFF002C46F300FFFFFF00FFFF
          FF00FFFFFF004259F4004E64F6005F75FC002C3BBF00FFFFFF002A3ABF007386
          FA00495FF300435AF3006E80F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF006E80F600435AF300495FF3006E81FA002B3ABF00FFFFFF002939BF008696
          FB00425AF1004259F100354EF0005B70F200FFFFFF00FFFFFF00FFFFFF005B70
          F200354EF0004259F100435BF1007D90F9002A39BF00FFFFFF002737BF009AA8
          FB003A55EF003953EE002844ED00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF002844ED003953EE003B55EF008E9DFA002838BF00FFFFFF002637BF009FAB
          F100314CED002B47EB00FFFFFF00FFFFFF00FFFFFF005369EF00FFFFFF00FFFF
          FF00FFFFFF002C47EB00314CED009FABF1002737BF00FFFFFF002838C1009FAB
          F1008091F400213EE800FFFFFF00FFFFFF005D72EE002340E8005D72EE00FFFF
          FF00FFFFFF00213EE8008091F4009FABF1002838C100FFFFFF00B3B9E8002E3E
          C30097A5EF00778AF2005B71EE006074EE002643E6002C48E7002643E6006074
          EE005B71EE00778AF20097A5EF002E3EC300B3B9E800FFFFFF00FFFFFF00B5BA
          E9002E3EC20095A2EE007688F0001E3BE4002340E5002541E5002340E5001E3B
          E4007688F00095A2EE002E3EC200B5BAE900FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00B5BAE9002F3DC30094A0EF00ADB9F800ADB8F700ADB9F700ADB8F700ADB9
          F80094A0EF002F3DC300B5BAE900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00B3B8E800303FC4004555CE004454CD004354CD004454CD004555
          CE00303FC400B3B8E800FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
        TabOrder = 1
        OnClick = btnAnuClick
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 3
        Width = 669
        Height = 126
        Caption = 'Datos generales'
        TabOrder = 2
        object Host: TLabel
          Left = 31
          Top = 24
          Width = 22
          Height = 13
          Caption = 'Host'
        end
        object Label2: TLabel
          Left = 17
          Top = 55
          Width = 36
          Height = 13
          Caption = 'Usuario'
        end
        object Label3: TLabel
          Left = 356
          Top = 56
          Width = 27
          Height = 13
          Caption = 'Clave'
        end
        object Label4: TLabel
          Left = 40
          Top = 85
          Width = 13
          Height = 13
          Caption = 'De'
        end
        object Label5: TLabel
          Left = 346
          Top = 86
          Width = 37
          Height = 13
          Caption = 'Nombre'
        end
        object Label1: TLabel
          Left = 469
          Top = 25
          Width = 32
          Height = 13
          Caption = 'Puerto'
        end
        object edhost: TEdit
          Left = 90
          Top = 21
          Width = 231
          Height = 21
          TabOrder = 0
          Text = 'edhost'
        end
        object edusu: TEdit
          Left = 90
          Top = 52
          Width = 175
          Height = 21
          TabOrder = 1
          Text = 'edusu'
        end
        object edpass: TEdit
          Left = 420
          Top = 52
          Width = 175
          Height = 21
          PasswordChar = '*'
          TabOrder = 2
          Text = 'edpass'
        end
        object edfrom: TEdit
          Left = 90
          Top = 82
          Width = 231
          Height = 21
          TabOrder = 3
          Text = 'edfrom'
        end
        object edname: TEdit
          Left = 420
          Top = 82
          Width = 175
          Height = 21
          TabOrder = 4
          Text = 'edname'
        end
        object edport: TSpinEdit
          Left = 538
          Top = 21
          Width = 57
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 5
          Value = 0
        end
      end
      object GroupBox2: TGroupBox
        Left = 16
        Top = 135
        Width = 669
        Height = 66
        Caption = 'datos de seguridad'
        TabOrder = 3
        object Label11: TLabel
          Left = 17
          Top = 32
          Width = 42
          Height = 13
          Caption = 'Usar TLS'
        end
        object cbtls: TComboBox
          Left = 90
          Top = 28
          Width = 231
          Height = 21
          TabOrder = 0
          Text = 'cbtls'
          Items.Strings = (
            'No Usar TLS'
            'TLS explicito'
            'TLS implicito'
            'TLS requerido')
        end
        object cbLog: TCheckBox
          Left = 346
          Top = 32
          Width = 249
          Height = 17
          Caption = 'ver log de registro'
          TabOrder = 1
        end
      end
    end
    object pEnviar: TcxTabSheet
      AllowCloseButton = False
      Caption = 'pEnviar'
      ImageIndex = 1
      TabVisible = False
      ExplicitWidth = 687
      DesignSize = (
        693
        361)
      object Label6: TLabel
        Left = 14
        Top = 99
        Width = 86
        Height = 13
        Caption = 'Archivos adjuntos'
      end
      object Label7: TLabel
        Left = 14
        Top = 76
        Width = 34
        Height = 13
        Caption = 'A&sunto'
        FocusControl = SubjectEdit
      end
      object Label8: TLabel
        Left = 34
        Top = 43
        Width = 18
        Height = 13
        Caption = '&CC:'
        FocusControl = CcEdit
      end
      object Label9: TLabel
        Left = 8
        Top = 12
        Width = 43
        Height = 13
        Caption = '&Enviar a:'
        FocusControl = ToEdit
      end
      object Label10: TLabel
        Left = 14
        Top = 246
        Width = 104
        Height = 13
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Cuerpo del &mensaje '
        FocusControl = BodyEdit
        ExplicitWidth = 98
      end
      object CcEdit: TEdit
        Left = 59
        Top = 40
        Width = 495
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clCream
        TabOrder = 1
        ExplicitWidth = 489
      end
      object SubjectEdit: TEdit
        Left = 59
        Top = 72
        Width = 495
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clCream
        TabOrder = 2
        ExplicitWidth = 489
      end
      object AttachmentMemo: TMemo
        Left = 3
        Top = 115
        Width = 552
        Height = 72
        Anchors = [akLeft, akTop, akRight]
        Color = clCream
        ScrollBars = ssBoth
        TabOrder = 3
        WordWrap = False
        ExplicitWidth = 546
      end
      object SendBtn: TBitBtn
        Left = 560
        Top = 3
        Width = 127
        Height = 38
        Action = acEmail
        Anchors = [akTop, akRight]
        Caption = 'En&viar email'
        TabOrder = 4
      end
      object BodyEdit: TRichEdit
        Left = 0
        Top = 265
        Width = 693
        Height = 96
        Align = alBottom
        Color = clCream
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Lucida Sans Unicode'
        Font.Style = []
        HideScrollBars = False
        ParentFont = False
        PlainText = True
        ScrollBars = ssBoth
        TabOrder = 5
        Zoom = 100
        ExplicitWidth = 687
      end
      object ToEdit: TEdit
        Left = 59
        Top = 8
        Width = 495
        Height = 21
        Color = clCream
        TabOrder = 0
      end
      object MLog: TMemo
        Left = 3
        Top = 193
        Width = 682
        Height = 53
        Align = alCustom
        Anchors = [akLeft, akTop, akRight, akBottom]
        ScrollBars = ssVertical
        TabOrder = 6
        ExplicitWidth = 676
      end
      object btnAdj: TBitBtn
        Left = 561
        Top = 115
        Width = 124
        Height = 38
        Action = acAdjuntar
        Caption = 'Ad&juntar archivo'
        TabOrder = 7
      end
    end
  end
  object barMgr: TdxBarManager
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
    ImageOptions.Images = DataRes.Img32_Main
    ImageOptions.LargeImages = DataRes.Img32_Main
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 384
    Top = 48
    PixelsPerInch = 96
    object barMgrBar1: TdxBar
      Caption = 'Enviar'
      CaptionButtons = <>
      DockedLeft = 68
      DockedTop = 0
      FloatLeft = 674
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
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton5'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object barMgrBar2: TdxBar
      Caption = 'salir'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 674
      FloatTop = 10
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarLargeButton3'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Action = acConfig
      Category = 0
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = acEmail
      Category = 0
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Action = acFin
      Category = 0
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Action = InternetSendMail1
      Category = 0
    end
    object dxBarLargeButton5: TdxBarLargeButton
      Action = acLogver
      Caption = 'Abrir/cerrar &log'
      Category = 0
    end
  end
  object smtp: TIdSMTP
    OnStatus = smtpStatus
    IOHandler = IOHandler
    OnWork = smtpWork
    OnWorkBegin = smtpWorkBegin
    OnWorkEnd = smtpWorkEnd
    OnConnected = smtpConnected
    Port = 465
    SASLMechanisms = <>
    ValidateAuthLoginCapability = False
    OnTLSNotAvailable = smtpTLSNotAvailable
    Left = 528
    Top = 64
  end
  object idMsg: TIdMessage
    AttachmentEncoding = 'UUE'
    Body.Strings = (
      'Adjunto factura')
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
        Address = 'nob@jesinor.com.ar'
        Name = 'NOB'
        Text = 'NOB <nob@jesinor.com.ar>'
        Domain = 'jesinor.com.ar'
        User = 'nob'
      end>
    From.Address = 'nob@jesinor.com.ar'
    From.Name = 'NOB'
    From.Text = 'NOB <nob@jesinor.com.ar>'
    From.Domain = 'jesinor.com.ar'
    From.User = 'nob'
    Recipients = <>
    ReplyTo = <>
    Subject = 'Envio de factura'
    ConvertPreamble = True
    Left = 600
    Top = 64
  end
  object ac: TActionList
    Images = DataRes.Img32_Main
    Left = 456
    Top = 47
    object acConfig: TAction
      Caption = 'con&figurar'
      ImageIndex = 1
      OnExecute = acConfigExecute
    end
    object acEmail: TAction
      Caption = 'En&viar email'
      ImageIndex = 54
      OnExecute = acEmailExecute
    end
    object acFin: TAction
      Caption = 'Finalizar'
      ImageIndex = 0
      OnExecute = acFinExecute
    end
    object InternetSendMail1: TSendMail
      Category = 'Internet'
      Caption = '&Send Mail...'
      Hint = 'Send email'
      OnHint = InternetSendMail1Hint
    end
    object acLogver: TAction
      Category = 'Internet'
      Caption = 'cerrar &log'
      ImageIndex = 59
      Visible = False
      OnExecute = acLogverExecute
    end
    object acAdjuntar: TAction
      Caption = 'Ad&juntar archivo'
      ImageIndex = 34
      OnExecute = acAdjuntarExecute
    end
  end
  object IOHandler: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':465'
    MaxLineAction = maException
    Port = 465
    DefaultPort = 0
    SSLOptions.Method = sslvSSLv23
    SSLOptions.SSLVersions = [sslvSSLv3, sslvTLSv1]
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    OnStatusInfo = IOHandlerStatusInfo
    Left = 436
    Top = 170
  end
  object fopen: TOpenDialog
    DefaultExt = 'pdf'
    Filter = 'Pdf|*.pdf|todos|*.*'
    Title = 'Seleccion de archivos '
    Left = 572
    Top = 194
  end
end
