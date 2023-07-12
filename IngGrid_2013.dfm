object FIngGrid_2013: TFIngGrid_2013
  Left = 160
  Top = 119
  Hint = 'Buscar Registro'
  Caption = 'Ingreso de datos'
  ClientHeight = 366
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  GlassFrame.Enabled = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object pnlMain: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 736
    Height = 341
    Align = alClient
    TabOrder = 0
    object cBar: TCoolBar
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 728
      Height = 57
      AutoSize = True
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          MinHeight = 53
          Width = 722
        end>
      DockSite = True
      FixedSize = True
      FixedOrder = True
      Images = DataRes.imgInggrid
      object ToolBar1: TToolBar
        Left = 2
        Top = 0
        Width = 481
        Height = 53
        Align = alNone
        AutoSize = True
        ButtonHeight = 53
        ButtonWidth = 51
        Caption = 'Barra'
        Images = DataRes.imgInggrid
        Indent = 2
        ShowCaptions = True
        TabOrder = 0
        Transparent = True
        Wrapable = False
        object ToolButton7: TToolButton
          Left = 2
          Top = 0
          Action = Salir
        end
        object ToolButton12: TToolButton
          Left = 53
          Top = 0
          Width = 8
          Caption = 'ToolButton12'
          ImageIndex = 18
          Style = tbsSeparator
        end
        object ToolButton1: TToolButton
          Left = 61
          Top = 0
          Action = First1
        end
        object ToolButton2: TToolButton
          Left = 112
          Top = 0
          Action = Prior1
        end
        object ToolButton3: TToolButton
          Left = 163
          Top = 0
          Action = Next1
        end
        object ToolButton4: TToolButton
          Left = 214
          Top = 0
          Action = Last1
        end
        object ToolButton11: TToolButton
          Left = 265
          Top = 0
          Width = 5
          Caption = 'ToolButton11'
          ImageIndex = 2
          Style = tbsSeparator
        end
        object ToolButton5: TToolButton
          Left = 270
          Top = 0
          Action = Insert1
        end
        object ToolButton9: TToolButton
          Left = 321
          Top = 0
          Action = Post1
        end
        object ToolButton10: TToolButton
          Left = 372
          Top = 0
          Width = 7
          Caption = 'ToolButton10'
          ImageIndex = 2
          Style = tbsSeparator
        end
        object ToolButton8: TToolButton
          Left = 379
          Top = 0
          Action = Cancel1
        end
        object ToolButton6: TToolButton
          Left = 430
          Top = 0
          Action = Delete1
        end
      end
    end
    object grilla: TcxGrid
      Left = 1
      Top = 64
      Width = 734
      Height = 276
      Align = alClient
      TabOrder = 1
      object vista: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        DataController.DataSource = Ds
        DataController.Options = [dcoAnsiSort, dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NewItemRow.InfoText = 'clic para insertar registro'
        OptionsBehavior.AlwaysShowEditor = True
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.PullFocusing = True
        OptionsView.DataRowHeight = 20
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 30
      end
      object nivel: TcxGridLevel
        Caption = 'Ingreso de datos'
        GridView = vista
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 347
    Width = 742
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object MainMenu1: TMainMenu
    Left = 112
    Top = 120
    object Ventana1: TMenuItem
      Caption = '&Ventana'
      object Salir1: TMenuItem
        Action = Salir
      end
    end
    object Editar2: TMenuItem
      Caption = '&Editar'
      Hint = 'Editar'
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
      object Eliminar1: TMenuItem
        Action = EditDelete1
      end
      object Deshacer1: TMenuItem
        Action = EditUndo1
      end
    end
    object Editar1: TMenuItem
      Caption = '&Navegar'
      Hint = 'Navegar por archivo'
      object Primero1: TMenuItem
        Action = First1
      end
      object Anterior1: TMenuItem
        Action = Prior1
      end
      object Siguiente1: TMenuItem
        Action = Next1
      end
      object Ultimo1: TMenuItem
        Action = Last1
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Agregar1: TMenuItem
        Action = Insert1
      end
      object Anular3: TMenuItem
        Action = Cancel1
      end
      object Grabar1: TMenuItem
        Action = Post1
      end
      object Borrar1: TMenuItem
        Action = Delete1
      end
    end
    object Ayuda1: TMenuItem
      Caption = '&Ayuda'
      Hint = 'Ayuda'
      object Informacion1: TMenuItem
        Caption = '&Informacion'
        Hint = 'Informacion'
      end
    end
  end
  object sctlst: TActionList
    Images = DataRes.imgInggrid
    Left = 224
    Top = 184
    object Cancel1: TDataSetCancel
      Category = 'Dataset'
      Caption = 'Anular'
      Hint = 'Anular'
      ImageIndex = 31
      DataSource = Ds
    end
    object Delete1: TDataSetDelete
      Category = 'Dataset'
      Caption = 'Borrar'
      Hint = 'Borrar'
      ImageIndex = 17
      DataSource = Ds
    end
    object Edit1: TDataSetEdit
      Category = 'Dataset'
      Caption = 'Editar'
      Hint = 'Editar'
      ImageIndex = 51
      DataSource = Ds
    end
    object First1: TDataSetFirst
      Category = 'Dataset'
      Caption = 'Primero'
      Hint = 'Primero'
      ImageIndex = 37
      DataSource = Ds
    end
    object Insert1: TDataSetInsert
      Category = 'Dataset'
      Caption = 'Insertar'
      Hint = 'Agregar'
      ImageIndex = 33
      ShortCut = 16457
      DataSource = Ds
    end
    object Last1: TDataSetLast
      Category = 'Dataset'
      Caption = 'Ultimo'
      Hint = 'Ultimo'
      ImageIndex = 38
      ShortCut = 16469
      DataSource = Ds
    end
    object Next1: TDataSetNext
      Category = 'Dataset'
      Caption = 'Siguiente'
      Hint = 'Siguiente'
      ImageIndex = 39
      ShortCut = 16467
      DataSource = Ds
    end
    object Post1: TDataSetPost
      Category = 'Dataset'
      Caption = 'Grabar'
      Hint = 'Grabar'
      ImageIndex = 50
      ShortCut = 16455
      DataSource = Ds
    end
    object Prior1: TDataSetPrior
      Category = 'Dataset'
      Caption = 'Anterior'
      Hint = 'Anterior'
      ImageIndex = 48
      ShortCut = 16449
      DataSource = Ds
    end
    object Refresh1: TDataSetRefresh
      Category = 'Dataset'
      Caption = 'Actualiza'
      Hint = 'Actualiza'
      ImageIndex = 34
      DataSource = Ds
    end
    object Salir: TAction
      Caption = 'Salir'
      Hint = 'Cerrar ventana'
      ImageIndex = 6
      OnExecute = SalirExecute
    end
    object Buscar: TAction
      Caption = 'Buscar Registro'
      Hint = 'Buscar Registro'
      ImageIndex = 15
      ShortCut = 16450
    end
    object EditCopy1: TEditCopy
      Category = 'Edit'
      Caption = '&Copiar'
      Hint = 'Copiar'
      ImageIndex = 1
      ShortCut = 16451
    end
    object EditCut1: TEditCut
      Category = 'Edit'
      Caption = 'Cortar'
      Hint = 'Cortar'
      ImageIndex = 2
      ShortCut = 16472
    end
    object EditDelete1: TEditDelete
      Category = 'Edit'
      Caption = '&Eliminar'
      Hint = 'Eliminar'
      ImageIndex = 3
      ShortCut = 46
    end
    object EditPaste1: TEditPaste
      Category = 'Edit'
      Caption = '&Pegar'
      Hint = 'Pegar'
      ImageIndex = 4
      ShortCut = 16470
    end
    object EditUndo1: TEditUndo
      Category = 'Edit'
      Caption = 'Deshacer'
      Hint = 'Deshacer'
      ImageIndex = 5
      ShortCut = 32776
    end
    object mBorrarFiltro: TAction
      Caption = 'Borrar filtro'
      Hint = 'blanquear  filtro'
      ImageIndex = 30
    end
    object mAyuda: TAction
      Category = 'Dataset'
      Caption = 'Ayuda'
      ImageIndex = 8
      OnExecute = mAyudaExecute
    end
  end
  object Ds: TDataSource
    OnUpdateData = DsUpdateData
    Left = 264
    Top = 96
  end
  object jvIni: TJvAppIniFileStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    AutoFlush = True
    AutoReload = True
    FileName = 'conf\datosform.ini'
    Location = flCustom
    DefaultSection = 'general'
    SubStorages = <>
    Left = 332
    Top = 126
  end
  object jvForm: TJvFormStorage
    AppStorage = jvIni
    AppStoragePath = 'FCons\'
    StoredValues = <>
    Left = 290
    Top = 136
  end
  object cxLocal: TcxLocalizer
    FileName = 'C:\clientes\SQL-NOB-XE3\Unidades\Ini\castellano.ini'
    Left = 48
    Top = 144
  end
end
