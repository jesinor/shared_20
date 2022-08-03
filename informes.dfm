object FInformes: TFInformes
  Left = 188
  Top = 140
  Caption = 'Informes'
  ClientHeight = 339
  ClientWidth = 280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ppR: TppReport
    AutoStop = False
    DataPipeline = ppMaster
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Listado de Deudores'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 15240
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 12700
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\clientes\nob19cli\Win32\Release\informes\listado_clientes.rtm'
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = 'Nomina de Deudores'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    ThumbnailSettings.PageHighlight.Width = 3
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.AllowExtract = True
    PDFSettings.EncryptSettings.AllowAssemble = True
    PDFSettings.EncryptSettings.AllowQualityPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.EncryptSettings.EncryptionType = etRC4
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PDFSettings.PDFAFormat = pafNone
    PreviewFormSettings.PageBorder.mmPadding = 0
    PreviewFormSettings.SinglePageOnly = True
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zsPageWidth
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = 'Nomina de Deudores'
    TextSearchSettings.DefaultString = '<EncontrarTexto>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    Left = 24
    Top = 8
    Version = '19.03'
    mmColumnWidth = 0
    DataPipelineName = 'ppMaster'
    object ppReport1TitleBand1: TppTitleBand
      Save = True
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 15081
      mmPrintPosition = 0
      object Empresa: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Empresa'
        HyperlinkEnabled = False
        SaveOrder = 0
        Save = True
        Border.mmPadding = 0
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 5821
        mmLeft = 1588
        mmTop = 529
        mmWidth = 20902
        BandType = 1
        LayerName = Foreground
      end
      object ppRLabel7: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'ppRLabel7'
        HyperlinkEnabled = False
        SaveOrder = 1
        Save = True
        Border.mmPadding = 0
        Caption = 'LISTADO de DEUDORES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4233
        mmLeft = 82286
        mmTop = 8467
        mmWidth = 40217
        BandType = 1
        LayerName = Foreground
      end
      object ppReport1Calc1: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'Report1Calc1'
        HyperlinkEnabled = False
        SaveOrder = 2
        Save = True
        Border.mmPadding = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 164307
        mmTop = 1323
        mmWidth = 13229
        BandType = 1
        LayerName = Foreground
      end
    end
    object ppReport1HeaderBand1: TppHeaderBand
      Save = True
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 10319
      mmPrintPosition = 0
      object ppRLine2: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'ppRLine2'
        Border.mmPadding = 0
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.500000000000000000
        mmHeight = 9525
        mmLeft = 0
        mmTop = 265
        mmWidth = 203200
        BandType = 0
        LayerName = Foreground
      end
      object ppShape1: TppShape
        DesignLayer = ppDesignLayer1
        UserName = 'Shape1'
        Brush.Color = 16380153
        ParentHeight = True
        ParentWidth = True
        mmHeight = 10319
        mmLeft = 0
        mmTop = 0
        mmWidth = 203200
        BandType = 0
        LayerName = Foreground
      end
      object ppReport1Label4: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'ppReport1Label4'
        HyperlinkEnabled = False
        SaveOrder = 0
        Save = True
        Border.mmPadding = 0
        Caption = 'NOMBRE o DENOMINACION de EMPRESA'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsUnderline]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 1058
        mmWidth = 63500
        BandType = 0
        LayerName = Foreground
      end
      object ppReport1Label5: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'ppReport1Label5'
        HyperlinkEnabled = False
        SaveOrder = 4
        Save = True
        Border.mmPadding = 0
        Caption = 'DIRECCION'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsUnderline]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3704
        mmLeft = 114300
        mmTop = 1058
        mmWidth = 17463
        BandType = 0
        LayerName = Foreground
      end
      object ppRLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'ppRLabel1'
        HyperlinkEnabled = False
        SaveOrder = 1
        Save = True
        Border.mmPadding = 0
        Caption = 'LOCALIDAD'
        Color = clAqua
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsUnderline]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4498
        mmLeft = 5027
        mmTop = 5556
        mmWidth = 18256
        BandType = 0
        LayerName = Foreground
      end
      object ppRLabel2: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'ppRLabel2'
        HyperlinkEnabled = False
        SaveOrder = 2
        Save = True
        Border.mmPadding = 0
        Caption = 'CPOS. PCIA '
        Color = clAqua
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsUnderline]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3704
        mmLeft = 57944
        mmTop = 5821
        mmWidth = 19050
        BandType = 0
        LayerName = Foreground
      end
      object ppRLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'ppRLabel3'
        HyperlinkEnabled = False
        SaveOrder = 3
        Save = True
        Border.mmPadding = 0
        Caption = 'CUIT'
        Color = clAqua
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsUnderline]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3704
        mmLeft = 191823
        mmTop = 1058
        mmWidth = 7408
        BandType = 0
        LayerName = Foreground
      end
      object ppRLabel4: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'ppRLabel4'
        HyperlinkEnabled = False
        SaveOrder = 6
        Save = True
        Border.mmPadding = 0
        Caption = 'TELEFONO'
        Color = clAqua
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsUnderline]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3704
        mmLeft = 90488
        mmTop = 5821
        mmWidth = 17198
        BandType = 0
        LayerName = Foreground
      end
      object ppRLabel6: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'ppRLabel6'
        HyperlinkEnabled = False
        SaveOrder = 5
        Save = True
        Border.mmPadding = 0
        Caption = 'IVA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsUnderline]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3704
        mmLeft = 170127
        mmTop = 1058
        mmWidth = 5027
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = 'LISTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsUnderline]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3810
        mmLeft = 132821
        mmTop = 5821
        mmWidth = 8890
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label2'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = 'VEND.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsUnderline]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3810
        mmLeft = 148961
        mmTop = 5821
        mmWidth = 9694
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppReport1DetailBand1: TppDetailBand
      Save = True
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 11642
      mmPrintPosition = 0
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Border.mmPadding = 0
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 10054
        mmWidth = 203200
        BandType = 4
        LayerName = Foreground
      end
      object ppReport1DBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'ppReport1DBText2'
        HyperlinkEnabled = False
        SaveOrder = 0
        Save = True
        Border.mmPadding = 0
        Color = clRed
        DataField = 'DENOMINA'
        DataPipeline = ppMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppMaster'
        mmHeight = 3387
        mmLeft = 5008
        mmTop = 529
        mmWidth = 95250
        BandType = 4
        LayerName = Foreground
      end
      object ppReport1DBText3: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'ppReport1DBText3'
        HyperlinkEnabled = False
        SaveOrder = 2
        Save = True
        Border.mmPadding = 0
        Color = clAqua
        DataField = 'LOCALIDAD'
        DataPipeline = ppMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppMaster'
        mmHeight = 4233
        mmLeft = 5008
        mmTop = 5027
        mmWidth = 39158
        BandType = 4
        LayerName = Foreground
      end
      object ppReport1DBText5: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'ppReport1DBText5'
        HyperlinkEnabled = False
        SaveOrder = 1
        Save = True
        Border.mmPadding = 0
        Color = clRed
        DataField = 'DIRECCION'
        DataPipeline = ppMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppMaster'
        mmHeight = 3175
        mmLeft = 112977
        mmTop = 529
        mmWidth = 51594
        BandType = 4
        LayerName = Foreground
      end
      object ppReport1DBText6: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'ppReport1DBText6'
        HyperlinkEnabled = False
        SaveOrder = 4
        Save = True
        AutoSize = True
        Border.mmPadding = 0
        Color = clAqua
        DataField = 'CUIT'
        DataPipeline = ppMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppMaster'
        mmHeight = 3704
        mmLeft = 180711
        mmTop = 529
        mmWidth = 18521
        BandType = 4
        LayerName = Foreground
      end
      object ppReport1DBText8: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'ppReport1DBText8'
        HyperlinkEnabled = False
        SaveOrder = 5
        Save = True
        Border.mmPadding = 0
        Color = clAqua
        DataField = 'TELEFONO'
        DataPipeline = ppMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppMaster'
        mmHeight = 4233
        mmLeft = 90488
        mmTop = 5027
        mmWidth = 32544
        BandType = 4
        LayerName = Foreground
      end
      object ppReport1DBText9: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'ppReport1DBText9'
        HyperlinkEnabled = False
        SaveOrder = 3
        Save = True
        Border.mmPadding = 0
        Color = clAqua
        DataField = 'PCIA'
        DataPipeline = ppMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppMaster'
        mmHeight = 4233
        mmLeft = 66940
        mmTop = 5027
        mmWidth = 8467
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'IVA'
        DataPipeline = ppMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppMaster'
        mmHeight = 3175
        mmLeft = 169069
        mmTop = 529
        mmWidth = 9790
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        HyperlinkEnabled = False
        AutoSize = True
        Border.mmPadding = 0
        DataField = 'cpos'
        DataPipeline = ppMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppMaster'
        mmHeight = 3704
        mmLeft = 57944
        mmTop = 5027
        mmWidth = 7144
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText3'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'lista'
        DataPipeline = ppMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppMaster'
        mmHeight = 3175
        mmLeft = 133086
        mmTop = 5027
        mmWidth = 11113
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText4'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'VENDEDOR'
        DataPipeline = ppMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppMaster'
        mmHeight = 3704
        mmLeft = 148961
        mmTop = 5027
        mmWidth = 9790
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppRSummaryBand1: TppSummaryBand
      Save = True
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppRLabel16: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'ppRLabel16'
        HyperlinkEnabled = False
        SaveOrder = 1
        Save = True
        Border.mmPadding = 0
        Caption = 'Cantidad de Deudores listados: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3704
        mmLeft = 9260
        mmTop = 1323
        mmWidth = 45508
        BandType = 7
        LayerName = Foreground
      end
      object ppRDBCalc1: TppDBCalc
        DesignLayer = ppDesignLayer1
        UserName = 'ppRDBCalc1'
        HyperlinkEnabled = False
        SaveOrder = 0
        Save = True
        Border.mmPadding = 0
        DataPipeline = ppMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppMaster'
        mmHeight = 3969
        mmLeft = 73554
        mmTop = 1323
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground
      end
    end
    object raCodeModule1: TraCodeModule
      object raProgramInfo1: TraProgramInfo
        raClassName = 'TraEventHandler'
        raProgram.ProgramName = 'EmpresaOnPrint'
        raProgram.Source = 
          'procedure EmpresaOnPrint;'#13#10'begin'#13#10#9'Empresa.Caption := NombreEmpr' +
          'esa;'#9#13#10'end;'#13#10
        raProgram.ComponentName = 'Empresa'
        raProgram.EventName = 'OnPrint'
        raProgram.EventID = 32
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppMaster: TppDBPipeline
    DataSource = DMaster
    UserName = 'Master'
    Left = 32
    Top = 60
    object ppMasterppField1: TppField
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 4
      DisplayWidth = 4
      Position = 0
    end
    object ppMasterppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppMasterppField3: TppField
      FieldAlias = 'FECHA'
      FieldName = 'FECHA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 2
    end
    object ppMasterppField4: TppField
      FieldAlias = 'VENCIMIENTO'
      FieldName = 'VENCIMIENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object ppMasterppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMPORTE'
      FieldName = 'IMPORTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppMasterppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'Vendedor'
      FieldName = 'Vendedor'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object ppMasterppField7: TppField
      FieldAlias = 'BENEFICIARIO'
      FieldName = 'BENEFICIARIO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object ppMasterppField8: TppField
      FieldAlias = 'direccion'
      FieldName = 'direccion'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object ppMasterppField9: TppField
      FieldAlias = 'localidad'
      FieldName = 'localidad'
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
    object ppMasterppField10: TppField
      FieldAlias = 'provincia'
      FieldName = 'provincia'
      FieldLength = 3
      DisplayWidth = 3
      Position = 9
    end
    object ppMasterppField11: TppField
      FieldAlias = 'codpos'
      FieldName = 'codpos'
      FieldLength = 8
      DisplayWidth = 8
      Position = 10
    end
    object ppMasterppField12: TppField
      FieldAlias = 'CAE'
      FieldName = 'CAE'
      FieldLength = 14
      DisplayWidth = 14
      Position = 11
    end
    object ppMasterppField13: TppField
      FieldAlias = 'CAE_VTO'
      FieldName = 'CAE_VTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 12
    end
    object ppMasterppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'tipodocto'
      FieldName = 'tipodocto'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 13
    end
    object ppMasterppField15: TppField
      FieldAlias = 'documento'
      FieldName = 'documento'
      FieldLength = 13
      DisplayWidth = 13
      Position = 14
    end
    object ppMasterppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'iva'
      FieldName = 'iva'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppMasterppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'subtotal'
      FieldName = 'subtotal'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppMasterppField18: TppField
      FieldAlias = 'condiciones'
      FieldName = 'condiciones'
      FieldLength = 3
      DisplayWidth = 3
      Position = 17
    end
    object ppMasterppField19: TppField
      FieldAlias = 'DENOMINA'
      FieldName = 'DENOMINA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 18
    end
    object ppMasterppField20: TppField
      FieldAlias = 'NOMVENDE'
      FieldName = 'NOMVENDE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 19
    end
    object ppMasterppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUCURSAL'
      FieldName = 'SUCURSAL'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 20
    end
    object ppMasterppField22: TppField
      FieldAlias = 'CODIGOAFIP'
      FieldName = 'CODIGOAFIP'
      FieldLength = 10
      DisplayWidth = 10
      Position = 21
    end
    object ppMasterppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 22
    end
    object ppMasterppField24: TppField
      FieldAlias = 'LETRA'
      FieldName = 'LETRA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 23
    end
    object ppMasterppField25: TppField
      FieldAlias = 'DENOCON'
      FieldName = 'DENOCON'
      FieldLength = 40
      DisplayWidth = 40
      Position = 24
    end
    object ppMasterppField26: TppField
      FieldAlias = 'email'
      FieldName = 'email'
      FieldLength = 50
      DisplayWidth = 50
      Position = 25
    end
    object ppMasterppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMINT'
      FieldName = 'NUMINT'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 26
    end
    object ppMasterppField28: TppField
      FieldAlias = 'FchServDesde'
      FieldName = 'FchServDesde'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 27
    end
    object ppMasterppField29: TppField
      FieldAlias = 'FchservHasta'
      FieldName = 'FchservHasta'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 28
    end
    object ppMasterppField30: TppField
      FieldAlias = 'FCD'
      FieldName = 'FCD'
      FieldLength = 10
      DisplayWidth = 10
      Position = 29
    end
    object ppMasterppField31: TppField
      FieldAlias = 'OBSERVA'
      FieldName = 'OBSERVA'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppMasterppField32: TppField
      FieldAlias = 'descripcion'
      FieldName = 'descripcion'
      FieldLength = 50
      DisplayWidth = 50
      Position = 31
    end
    object ppMasterppField33: TppField
      FieldAlias = 'cteasociado'
      FieldName = 'cteasociado'
      FieldLength = 20
      DisplayWidth = 20
      Position = 32
    end
    object ppMasterppField34: TppField
      FieldAlias = 'ELECTRONICA'
      FieldName = 'ELECTRONICA'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 33
    end
    object ppMasterppField35: TppField
      FieldAlias = 'incoterms'
      FieldName = 'incoterms'
      FieldLength = 3
      DisplayWidth = 3
      Position = 34
    end
    object ppMasterppField36: TppField
      FieldAlias = 'moneda'
      FieldName = 'moneda'
      FieldLength = 6
      DisplayWidth = 6
      Position = 35
    end
    object ppMasterppField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'divisas'
      FieldName = 'divisas'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 36
    end
    object ppMasterppField38: TppField
      Alignment = taRightJustify
      FieldAlias = 'cambio'
      FieldName = 'cambio'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 37
    end
    object ppMasterppField39: TppField
      FieldAlias = 'idimpositivo'
      FieldName = 'idimpositivo'
      FieldLength = 40
      DisplayWidth = 40
      Position = 38
    end
    object ppMasterppField40: TppField
      FieldAlias = 'pais'
      FieldName = 'pais'
      FieldLength = 30
      DisplayWidth = 30
      Position = 39
    end
    object ppMasterppField41: TppField
      FieldAlias = 'NOMBREPAIS'
      FieldName = 'NOMBREPAIS'
      FieldLength = 80
      DisplayWidth = 80
      Position = 40
    end
    object ppMasterppField42: TppField
      FieldAlias = 'dsincoterms'
      FieldName = 'dsincoterms'
      FieldLength = 30
      DisplayWidth = 30
      Position = 41
    end
    object ppMasterppField43: TppField
      FieldAlias = 'CODPAIS'
      FieldName = 'CODPAIS'
      FieldLength = 3
      DisplayWidth = 3
      Position = 42
    end
    object ppMasterppField44: TppField
      FieldAlias = 'dsmoneda'
      FieldName = 'dsmoneda'
      FieldLength = 30
      DisplayWidth = 30
      Position = 43
    end
  end
  object ppDetail: TppDBPipeline
    DataSource = DDet
    UserName = 'Detail1'
    Left = 32
    Top = 108
    object ppDetailppField1: TppField
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 13
      DisplayWidth = 13
      Position = 0
    end
    object ppDetailppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'CANTIDAD'
      FieldName = 'CANTIDAD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppDetailppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMPORTE'
      FieldName = 'IMPORTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppDetailppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'TASAIVA'
      FieldName = 'TASAIVA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppDetailppField5: TppField
      FieldAlias = 'OBSERVA'
      FieldName = 'OBSERVA'
      FieldLength = 240
      DisplayWidth = 240
      Position = 4
    end
    object ppDetailppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'PORCENDESTO'
      FieldName = 'PORCENDESTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppDetailppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESCUENTO'
      FieldName = 'DESCUENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppDetailppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTASAIVA'
      FieldName = 'IDTASAIVA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object ppDetailppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'remito'
      FieldName = 'remito'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 8
    end
    object ppDetailppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'pedido'
      FieldName = 'pedido'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 9
    end
    object ppDetailppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUBTOTAL'
      FieldName = 'SUBTOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppDetailppField12: TppField
      FieldAlias = 'NOMART'
      FieldName = 'NOMART'
      FieldLength = 60
      DisplayWidth = 60
      Position = 11
    end
    object ppDetailppField13: TppField
      FieldAlias = 'UNITARIO'
      FieldName = 'UNITARIO'
      FieldLength = 6
      DisplayWidth = 6
      Position = 12
    end
    object ppDetailppField14: TppField
      FieldAlias = 'NOMBRE'
      FieldName = 'NOMBRE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 13
    end
    object ppDetailppField15: TppField
      FieldAlias = 'DESPACHO'
      FieldName = 'DESPACHO'
      FieldLength = 16
      DisplayWidth = 16
      Position = 14
    end
    object ppDetailppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIVISAS'
      FieldName = 'DIVISAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppDetailppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODIGOAFIP'
      FieldName = 'CODIGOAFIP'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 16
    end
  end
  object ppRes: TppDBPipeline
    DataSource = DRes
    UserName = 'Res'
    Left = 32
    Top = 168
  end
  object DMaster: TDataSource
    DataSet = FDMVentas.impheadFacExpo
    Left = 88
    Top = 58
  end
  object DDet: TDataSource
    DataSet = FDMVentas.impdetFacExpo
    Left = 84
    Top = 116
  end
  object DRes: TDataSource
    Left = 96
    Top = 160
  end
  object ppGestor: TppDesigner
    Caption = 'Gestor de Informe'
    DataSettings.SessionType = 'FireDACSession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctANSI
    DataSettings.DatabaseType = dtMSSQLServer
    DataSettings.GuidCollationType = gcMSSQLServer
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqSQL1
    Position = poScreenCenter
    Report = ppR
    IniStorageType = 'IniFile'
    IniStorageName = '($LocalAppData)\RBuilder\RBuilder.ini'
    WindowHeight = 480
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 640
    WindowState = wsMaximized
    Left = 152
    Top = 20
  end
  object ActionList1: TActionList
    Left = 204
    Top = 20
    object Datos: TAction
      Caption = 'Origen de Datos'
    end
  end
  object ppOtro: TppDBPipeline
    DataSource = DOtro
    UserName = 'Otro'
    Left = 34
    Top = 216
  end
  object DOtro: TDataSource
    Left = 100
    Top = 216
  end
  object dsAdicional: TDataSource
    Left = 92
    Top = 280
  end
  object ppAdicional: TppDBPipeline
    DataSource = dsAdicional
    UserName = 'Adicional'
    Left = 32
    Top = 272
  end
end
