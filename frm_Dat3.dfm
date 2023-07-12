object FrmDatos3: TFrmDatos3
  Left = 0
  Top = 0
  Width = 451
  Height = 94
  Align = alTop
  AutoSize = True
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 451
    Height = 94
    AutoSize = True
    Bands = <
      item
        BorderStyle = bsSingle
        Control = PageScroller1
        ImageIndex = -1
        MinHeight = 38
        Width = 441
      end
      item
        BorderStyle = bsSingle
        Control = edCod
        ImageIndex = -1
        MinHeight = 21
        Text = 'Codigo: '
        Width = 123
      end
      item
        BorderStyle = bsSingle
        Break = False
        Control = edNom
        ImageIndex = -1
        MinHeight = 21
        Text = 'Nombre: '
        Width = 314
      end>
    BorderWidth = 1
    FixedSize = True
    FixedOrder = True
    object PageScroller1: TPageScroller
      Left = 2
      Top = 2
      Width = 441
      Height = 38
      Align = alTop
      TabOrder = 0
      TabStop = False
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 441
        Height = 36
        AutoSize = True
        ButtonHeight = 36
        ButtonWidth = 60
        Caption = 'ToolBar1'
        EdgeInner = esNone
        EdgeOuter = esNone
        Images = DataRes.img
        GradientDrawingOptions = []
        ShowCaptions = True
        TabOrder = 0
        ExplicitWidth = 429
        object ToolButton1: TToolButton
          Left = 0
          Top = 0
          Action = Salir
        end
        object ToolButton3: TToolButton
          Left = 60
          Top = 0
          Width = 8
          Caption = 'ToolButton3'
          ImageIndex = 2
          Style = tbsSeparator
        end
        object ToolButton2: TToolButton
          Left = 68
          Top = 0
          Action = DataSetFirst1
        end
        object ToolButton4: TToolButton
          Left = 128
          Top = 0
          Action = DataSetPrior1
        end
        object ToolButton5: TToolButton
          Left = 188
          Top = 0
          Action = DataSetNext1
        end
        object ToolButton6: TToolButton
          Left = 248
          Top = 0
          Action = DataSetLast1
        end
        object ToolButton9: TToolButton
          Left = 308
          Top = 0
          Width = 8
          Caption = 'ToolButton9'
          ImageIndex = 7
          Style = tbsSeparator
        end
        object tbConsulta: TToolButton
          Left = 316
          Top = 0
          Action = acConsulta
        end
      end
    end
    object edCod: TEdit
      AlignWithMargins = True
      Left = 60
      Top = 54
      Width = 60
      Height = 21
      CharCase = ecUpperCase
      Constraints.MaxWidth = 60
      Constraints.MinWidth = 60
      Enabled = False
      TabOrder = 1
    end
    object edNom: TEdit
      Left = 192
      Top = 54
      Width = 251
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 2
    end
  end
  object MainMenu1: TMainMenu
    Images = DataRes.img
    Left = 182
    Top = 6
    object Ventana1: TMenuItem
      Caption = '&Ventana'
      Hint = 'Rutina de Registro de Datos'
      object Imprimir1: TMenuItem
        Action = Imprimir
      end
      object Configurarapariencia1: TMenuItem
        Action = mConfig
        Visible = False
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Salir1: TMenuItem
        Action = Salir
      end
    end
    object Editar1: TMenuItem
      Caption = '&Editar'
      Hint = 'Edicion'
      object Copiar1: TMenuItem
        Action = EditCopy1
      end
      object Cortar1: TMenuItem
        Action = EditCut1
      end
      object Pegar1: TMenuItem
        Action = EditPaste1
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Insertar1: TMenuItem
        Action = DataSetInsert1
      end
      object Grabar1: TMenuItem
        Action = GrabarReg
      end
      object Borrar1: TMenuItem
        Action = BorrarReg
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Anular1: TMenuItem
        Action = DataSetCancel1
      end
      object Editar2: TMenuItem
        Action = DataSetEdit1
      end
    end
    object Navegar1: TMenuItem
      Caption = '&Navegar'
      Hint = 'Edicion de Datos'
      object Primero1: TMenuItem
        Action = DataSetFirst1
      end
      object Anterior1: TMenuItem
        Action = DataSetPrior1
      end
      object Siguiente1: TMenuItem
        Action = DataSetNext1
      end
      object Ultimo1: TMenuItem
        Action = DataSetLast1
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object verConsulta1: TMenuItem
        Action = acConsulta
      end
      object Actualizar1: TMenuItem
        Action = DataSetRefresh1
      end
      object VerenGrilla1: TMenuItem
        Action = Grilla
        Visible = False
      end
      object BuscarRegistro1: TMenuItem
        Action = Buscar
      end
      object CambiarOrden1: TMenuItem
        Action = Ordenar
        Visible = False
      end
    end
    object Ayuda1: TMenuItem
      Caption = '&Ayuda'
      Hint = 'Ayuda'
      object Ayuda2: TMenuItem
        Action = Ayuda
      end
    end
  end
  object ActionList1: TActionList
    Images = DataRes.img
    Left = 218
    Top = 6
    object Salir: TAction
      Caption = '&Fin'
      Hint = 'Fin de Rutina'
      ImageIndex = 0
      OnExecute = SalirExecute
    end
    object Imprimir: TAction
      Caption = '&Imprimir'
      Hint = 'Imprimir'
      ImageIndex = 1
      OnExecute = ImprimirExecute
    end
    object DataSetCancel1: TDataSetCancel
      Category = 'Dataset'
      Caption = 'Anular'
      Hint = 'Anular'
      ImageIndex = 2
    end
    object BorrarReg: TDataSetDelete
      Category = 'Dataset'
      Caption = 'Borrar Registro'
      Hint = 'Borrar'
      ImageIndex = 3
    end
    object DataSetEdit1: TDataSetEdit
      Category = 'Dataset'
      Caption = 'Editar'
      Hint = 'Editar'
      ImageIndex = 4
    end
    object DataSetFirst1: TDataSetFirst
      Category = 'Dataset'
      Caption = 'Primero'
      Hint = 'Primero'
      ImageIndex = 5
      ShortCut = 113
    end
    object DataSetInsert1: TDataSetInsert
      Category = 'Dataset'
      Caption = 'Insertar'
      Hint = 'Insertar'
      ImageIndex = 6
      ShortCut = 16457
    end
    object DataSetLast1: TDataSetLast
      Category = 'Dataset'
      Caption = 'Ultimo'
      Hint = 'Ultimo'
      ImageIndex = 7
      ShortCut = 116
    end
    object DataSetNext1: TDataSetNext
      Category = 'Dataset'
      Caption = 'Siguiente'
      Hint = 'Siguiente'
      ImageIndex = 8
      ShortCut = 115
    end
    object GrabarReg: TDataSetPost
      Category = 'Dataset'
      Caption = 'Grabar'
      Hint = 'Grabar'
      ImageIndex = 9
      ShortCut = 16455
    end
    object DataSetPrior1: TDataSetPrior
      Category = 'Dataset'
      Caption = 'Anterior'
      Hint = 'Anterior'
      ImageIndex = 10
      ShortCut = 114
    end
    object DataSetRefresh1: TDataSetRefresh
      Category = 'Dataset'
      Caption = 'Actualizar'
      Hint = 'Actualizar'
      ImageIndex = 11
    end
    object EditCopy1: TEditCopy
      Category = 'Edit'
      Caption = '&Copiar'
      Hint = 'Copiar'
      ImageIndex = 12
      ShortCut = 16451
    end
    object EditCut1: TEditCut
      Category = 'Edit'
      Caption = 'Cor&tar'
      Hint = 'Cortar'
      ImageIndex = 13
      ShortCut = 16472
    end
    object EditPaste1: TEditPaste
      Category = 'Edit'
      Caption = '&Pegar'
      Hint = 'Pegar'
      ImageIndex = 14
      ShortCut = 16470
    end
    object Ayuda: TAction
      Caption = '&Ayuda'
      Hint = 'Ayuda'
      ImageIndex = 15
      OnExecute = AyudaExecute
    end
    object Buscar: TAction
      Caption = 'Buscar Registro'
      Hint = 'Buscar Valor'
      ImageIndex = 16
      ShortCut = 16450
      OnExecute = BuscarExecute
    end
    object Grilla: TAction
      Caption = 'Ver en Grilla'
      Hint = 'Ver en grilla'
      OnExecute = GrillaExecute
    end
    object Ordenar: TAction
      Caption = 'Cambiar Orden'
      Hint = 'Ordenar archivo'
      OnExecute = OrdenarExecute
    end
    object mConfig: TAction
      Caption = 'Configurar apariencia'
      Hint = 'Configurar apariencia de controles'
      ImageIndex = 17
      OnExecute = mConfigExecute
    end
    object acConsulta: TAction
      Category = 'Dataset'
      Caption = 'Consulta'
      ImageIndex = 16
      OnExecute = acConsultaExecute
    end
  end
end
