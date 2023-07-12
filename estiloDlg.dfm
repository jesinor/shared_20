inherited selEstiloVisual: TselEstiloVisual
  Caption = 'Seleccionar estilo visual'
  ClientHeight = 181
  ClientWidth = 449
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 455
  ExplicitHeight = 209
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 286
    ExplicitWidth = 286
  end
  inherited OKBtn: TButton
    Width = 141
    Caption = 'Cambiar Estilo'
    ModalResult = 0
    OnClick = OKBtnClick
    ExplicitWidth = 141
  end
  inherited CancelBtn: TButton
    Width = 141
    Caption = 'Finalizar'
    ExplicitWidth = 141
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
