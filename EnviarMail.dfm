object enviarMailDlg: TenviarMailDlg
  Left = 316
  Top = 140
  ActiveControl = ToEdit
  Caption = 'Envio de mail'
  ClientHeight = 479
  ClientWidth = 550
  Color = clBtnFace
  Constraints.MinHeight = 350
  Constraints.MinWidth = 400
  DefaultMonitor = dmDesktop
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  OnCreate = FormCreate
  DesignSize = (
    550
    479)
  PixelsPerInch = 96
  TextHeight = 13
  object ClientLabel: TLabel
    Left = 449
    Top = 8
    Width = 73
    Height = 33
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = 'etiqueta cliente seleccionado'
    WordWrap = True
    ExplicitLeft = 465
  end
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 42
    Height = 13
    Caption = '&Enviar a:'
    FocusControl = ToEdit
  end
  object Label2: TLabel
    Left = 8
    Top = 76
    Width = 33
    Height = 13
    Caption = 'A&sunto'
    FocusControl = SubjectEdit
  end
  object Label3: TLabel
    Left = 8
    Top = 184
    Width = 96
    Height = 13
    Caption = 'Cuerpo del &mensaje '
    FocusControl = BodyEdit
  end
  object Label4: TLabel
    Left = 8
    Top = 96
    Width = 84
    Height = 13
    Caption = 'Archivos adjuntos'
  end
  object Label5: TLabel
    Left = 32
    Top = 43
    Width = 17
    Height = 13
    Caption = '&CC:'
    FocusControl = CcEdit
  end
  object ClientsListView: TListView
    Left = 104
    Top = 358
    Width = 435
    Height = 89
    Anchors = [akLeft, akRight, akBottom]
    Columns = <
      item
        Caption = 'Clave'
        Width = 80
      end
      item
        Caption = 'Cliente'
        Width = 80
      end
      item
        Caption = 'Ruta'
        Width = 240
      end>
    ColumnClick = False
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 9
    ViewStyle = vsReport
    OnCustomDrawItem = ClientsListViewCustomDrawItem
    OnSelectItem = ClientsListViewSelectItem
  end
  object DownloadsListView: TListView
    Left = 104
    Top = 358
    Width = 435
    Height = 89
    Anchors = [akLeft, akRight, akBottom]
    Columns = <
      item
        Caption = 'Asunto'
        Width = 300
      end
      item
        Caption = 'Desde'
        Width = 80
      end
      item
        Caption = 'Fecha'
        Width = 240
      end>
    ColumnClick = False
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 10
    ViewStyle = vsReport
  end
  object ClientTypeGroupBox: TGroupBox
    Left = 8
    Top = 354
    Width = 94
    Height = 93
    Anchors = [akLeft, akBottom]
    Caption = '&Tipo de cliente'
    TabOrder = 8
    object AutomaticRadioBtn: TRadioButton
      Left = 8
      Top = 16
      Width = 81
      Height = 17
      Caption = '&Automatico'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = AutomaticRadioBtnClick
    end
    object MapiRadioBtn: TRadioButton
      Left = 8
      Top = 40
      Width = 70
      Height = 17
      Caption = '&MAPI'
      TabOrder = 1
      OnClick = AutomaticRadioBtnClick
    end
    object DirectRadioBtn: TRadioButton
      Left = 8
      Top = 64
      Width = 70
      Height = 17
      Caption = '&Directo'
      TabOrder = 2
      OnClick = AutomaticRadioBtnClick
    end
  end
  object SubjectEdit: TEdit
    Left = 56
    Top = 72
    Width = 370
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
  end
  object BodyEdit: TRichEdit
    Left = 8
    Top = 200
    Width = 530
    Height = 144
    Anchors = [akLeft, akTop, akRight, akBottom]
    HideScrollBars = False
    PlainText = True
    ScrollBars = ssBoth
    TabOrder = 4
  end
  object SendBtn: TButton
    Left = 449
    Top = 72
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'En&viar'
    TabOrder = 5
    OnClick = SendBtnClick
  end
  object AttachmentMemo: TMemo
    Left = 8
    Top = 112
    Width = 426
    Height = 65
    Anchors = [akLeft, akTop, akRight]
    ScrollBars = ssBoth
    TabOrder = 3
    WordWrap = False
  end
  object AttachBtn: TButton
    Left = 449
    Top = 112
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'A&djuntar'
    TabOrder = 6
    OnClick = AttachBtnClick
  end
  object CcEdit: TEdit
    Left = 56
    Top = 40
    Width = 370
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
  end
  object DownloadBtn: TButton
    Left = 449
    Top = 152
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Descargar'
    TabOrder = 7
    OnClick = DownloadBtnClick
  end
  object ToEdit: TJvComboBox
    Left = 56
    Top = 8
    Width = 385
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object JvMail1: TJvMail
    BlindCopy = <>
    CarbonCopy = <>
    Recipient = <>
    Left = 224
    Top = 372
  end
  object JvOpenDialog1: TJvOpenDialog
    Filter = 'Todos (*.*)|*.*'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    ActiveControl = acListView
    ActiveStyle = asReport
    DefBtnCaption = 'Agregar'
    Height = 264
    Width = 426
    Left = 156
    Top = 372
  end
end
