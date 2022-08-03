object fmIniEditor: TfmIniEditor
  Left = 0
  Top = 0
  Caption = 'Editor de confirguracion'
  ClientHeight = 343
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ScreenSnap = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 155
    Height = 13
    Caption = 'Edite los datos de configuracion '
  end
  object Config: TValueListEditor
    Left = 0
    Top = 27
    Width = 300
    Height = 316
    Align = alBottom
    DropDownRows = 12
    FixedCols = 1
    TabOrder = 0
    TitleCaptions.Strings = (
      'Clave'
      'Valor')
    OnSetEditText = ConfigSetEditText
    OnValidate = ConfigValidate
    ColWidths = (
      150
      144)
    RowHeights = (
      18
      18)
  end
end
