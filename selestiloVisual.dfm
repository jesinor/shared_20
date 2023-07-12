object FSelEstiloVisual: TFSelEstiloVisual
  Left = 0
  Top = 0
  Caption = 'Seleccionar tema'
  ClientHeight = 184
  ClientWidth = 484
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
  object OKBtn: TButton
    Left = 316
    Top = 8
    Width = 141
    Height = 35
    Caption = 'Cambiar Estilo'
    Default = True
    TabOrder = 0
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 316
    Top = 54
    Width = 141
    Height = 35
    Cancel = True
    Caption = 'Finalizar'
    ModalResult = 2
    TabOrder = 1
  end
  object lista: TListBox
    Left = 8
    Top = 8
    Width = 286
    Height = 164
    ItemHeight = 13
    TabOrder = 2
  end
end
