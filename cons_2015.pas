unit cons_2015;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.Actions, Vcl.ActnList, JvAppStorage, cxGridExportLink,
  Vcl.Menus, Vcl.DBActns, JvAppIniStorage, JvComponentBase, JvFormPlacement,
  Vcl.ImgList, dxRibbonCustomizationForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxClasses,
  cxLocalization, dxBar, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxStatusBar, dxRibbonStatusBar,
  dxRibbon, System.ImageList, dxPrnDev, dxPrnDlg, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPSCore, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxCommon, dxcore, registry,
  Data.DB,
  FireDAC.Comp.DataSet,
  cxDataControllerConditionalFormattingRulesManagerDialog,
  ayuda,
  constantes, dxRibbonSkins, dxSkinsCore, dxSkinCoffee, dxSkinGlassOceans,
  dxSkinLondonLiquidSky, dxSkinStardust, dxSkinTheBezier;

resourcestring
  rtExportado = 'Consulta exportada con exito';

type
  TFCons_2015 = class(TForm)
    mgr: TdxBarManager;
    ctInfo: TdxRibbonTab;
    cinta: TdxRibbon;
    dxrb: TdxRibbonStatusBar;
    jvForm: TJvFormStorage;
    jvIni: TJvAppIniFileStorage;
    ac: TActionList;
    mSalir: TAction;
    mAyuda: TAction;
    mImprimir: TAction;
    mVisPre: TAction;
    mCamFec: TAction;
    mExportar_xls: TAction;
    mgrBar1: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    vista: TcxGridDBTableView;
    Base: TcxGridLevel;
    grilla: TcxGrid;
    Ds: TDataSource;
    mgrBar5: TdxBar;
    dxBarLargeButton9: TdxBarLargeButton;
    mExportar_html: TAction;
    mExportar_txt: TAction;
    mExportar_xml: TAction;
    grabar: TSaveDialog;
    cxLocal: TcxLocalizer;
    pop: TPopupMenu;
    seleccionarfechas1: TMenuItem;
    VistaPrevia1: TMenuItem;
    repositorio: TcxStyleRepository;
    even: TcxStyle;
    odd: TcxStyle;
    group: TcxStyle;
    footer: TcxStyle;
    mgrBar2: TdxBar;
    mgrBar3: TdxBar;
    imagenes: TImageList;
    dxBarLargeButton14: TdxBarLargeButton;
    dxBarLargeButton15: TdxBarLargeButton;
    dxComp: TdxComponentPrinter;
    dxPDFLink: TdxGridReportLink;
    mExpoPDF: TAction;
    cxSel: TcxStyle;
    dxBarLargeButton20: TdxBarLargeButton;
    acSeleccion: TAction;
    dxBarLargeButton22: TdxBarLargeButton;
    acFlush: TAction;
    acActualizar: TAction;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    acEliminar: TAction;
    procedure mSalirExecute(Sender: TObject);
    procedure mCamFecExecute(Sender: TObject);
    procedure mVisPreExecute(Sender: TObject);
    procedure mImprimirExecute(Sender: TObject);
    procedure mExportar_xlsExecute(Sender: TObject);
    procedure mExportar_htmlExecute(Sender: TObject);
    procedure mExportar_txtExecute(Sender: TObject);
    procedure mExportar_xmlExecute(Sender: TObject);
    procedure mExpoPDFExecute(Sender: TObject);
    procedure mgrHelpButtonClick(Sender: TObject);
    procedure acSeleccionExecute(Sender: TObject);
    procedure vistaCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure acFlushExecute(Sender: TObject);
    procedure vistaDataControllerSortingChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acActualizarExecute(Sender: TObject);
    procedure acEliminarExecute(Sender: TObject);
    procedure cintaHelpButtonClick(Sender: TdxCustomRibbon);
  private
    { Private declarations }
    Columnas_creadas, FNoCerrar: Boolean;
    FURL: string;
    FPage: string;
    Orden: string;
    FInforme: string;
    FHaySeleccion: boolean;
    FHabilitarSeleccion: boolean;
    FIDSeleccionado: variant;
    FAyuda: string;

    procedure crearColumnas;

    procedure setPanel;
    function getArchivo( var nombre: string; idx: integer ): Boolean;
    procedure SetPage(const Value: string);
    procedure SetURL(const Value: string);
    procedure SetFin(const Value: TDateTime);
    procedure SetIni(const Value: TDateTime);
    procedure SetNoCerrar(const Value: boolean);
    procedure SetInforme(const Value: string);
    procedure SetHaySeleccion(const Value: boolean);
    procedure SetHabilitarSeleccion(const Value: boolean);
    procedure SetIDSeleccionado(const Value: variant);
    procedure SetAyuda(const Value: string);
  protected
    FIni, FFin: TDateTime;
    archivo: string;
  public
    { Public declarations }
    noActualizarRegistro: boolean;
    FPropiedades: TNotifyEvent;
    FCrearColumnas: boolean;

    procedure configurar( const idx: string );
    procedure AbriryMostrar;

    procedure requeryConsulta; virtual;
    procedure imprima( vista: boolean = true ); virtual;
    constructor create( AOwner: TComponent ); overload;

    property URL: string read FURL write SetURL;
    property Page: string read FPage write SetPage;

    procedure setDataset( data: TDataSet );

    property Ini: TDateTime read FIni write SetIni;
    property Fin: TDateTime read FFin write SetFin;
    property NoCerrar: boolean read FNoCerrar write SetNoCerrar;
    property Informe: string read FInforme write SetInforme;
    property HabilitarSeleccion: boolean read FHabilitarSeleccion write SetHabilitarSeleccion;

    property HaySeleccion: boolean read FHaySeleccion write SetHaySeleccion;
    property IDSeleccionado: variant read FIDSeleccionado write SetIDSeleccionado;
    property Ayuda: string read FAyuda write SetAyuda;
  end;

var
  FCons_2015: TFCons_2015;

implementation
uses
  SelFechas, informes;
{$R *.dfm}

procedure TFCons_2015.acActualizarExecute(Sender: TObject);
begin
  requeryConsulta;
end;

procedure TFCons_2015.acEliminarExecute(Sender: TObject);
begin
     if TaskMessageDlg(rsConfirmaEliminar, rsEstaSeguro, mtConfirmation, mbYesNo, 0 ) <> mrYes then
      abort;
end;

procedure TFCons_2015.acFlushExecute(Sender: TObject);
var
  reg        : TRegistry;
  openResult : Boolean;
  today      : TDateTime;
begin
  reg := TRegistry.Create(KEY_READ);
  reg.RootKey := HKEY_CURRENT_USER;

  if (reg.KeyExists(ctRegConsulta + self.Name )) then
  begin
      if not ( reg.DeleteKey( ctRegConsulta + self.Name )) then
        showmessage( 'Clave de registro no pudo eliminarse' )
      else
        showmessage( 'Datos de Registro han sido limpiados' );
      reg.CloseKey;
      noActualizarRegistro := true;
  end
  else
    showmessage( 'Clave de registro no encontrada' );
end;

procedure TFCons_2015.acSeleccionExecute(Sender: TObject);
begin
    if acSeleccion.Enabled then
    begin
        HaySeleccion := true;
        modalResult := mrOK;
    end;
end;

procedure TFCons_2015.cintaHelpButtonClick(Sender: TdxCustomRibbon);
begin
    TAyuda.mostrar_ayuda( sistema_sisnob, FAyuda );
end;

procedure TFCons_2015.configurar(const idx: string);
begin
  Orden := idx;
end;

procedure TFCons_2015.crearColumnas;
var
  i: integer;
begin
  if ( vista.ItemCount>0 ) and not ( FCrearColumnas ) then
    Columnas_creadas := true;

  if not (Columnas_creadas) then
  begin
    vista.ClearItems;
    vista.DataController.CreateAllItems();

    for I := 0 to vista.ItemCount-1 do
    begin
      vista.Columns[i].HeaderAlignmentHorz := taCenter;
      vista.Items[i].Caption := ds.DataSet.Fields[i].DisplayLabel;
    end;

    if assigned( FPropiedades ) then
      FPropiedades( vista ); // establece propiedades de campos individualmente (lookups y otros)

    vista.applyBestFit;

    if (Orden <> '') then
    begin
      vista.DataController.ClearSorting(true);
      vista.GetColumnByFieldName(Orden).SortOrder := soAscending;

      vista.ViewData.Records[0].Focused := True;
      vista.ViewData.Records[0].Selected := True;

      vista.Controller.ClearCellSelection;
      vista.GetColumnByFieldName(Orden).Selected := true;
      vista.GetColumnByFieldName(Orden).Focused := true;
    end
    else
      vista.DataController.FocusedRecordIndex := 0;
    columnas_creadas := true;
  end;
end;

constructor TFCons_2015.create(AOwner: TComponent);
begin
    FIni := Date;
    FFin := Date;
    FNoCerrar := false;
    HaySeleccion := false;

    inherited create( AOwner );

    FAyuda := ctIndice;
    cxLocal.FileName := ExtractFilePath(Application.ExeName) + 'ini\castellano.ini';
    cxLocal.Active := True;
    cxLocal.Locale := $2c0a;
    if not noActualizarRegistro then
      vista.RestoreFromRegistry(ctRegconsulta, true, false, [], self.Name  );
end;

procedure TFCons_2015.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if not noActualizarRegistro then
      vista.StoreToRegistry(ctRegconsulta, false, [], self.Name );
end;

function TFCons_2015.getArchivo(var nombre: string; idx: Integer ): Boolean;
begin
  grabar.FilterIndex := idx;
  if (grabar.Execute) then
  begin
    nombre := grabar.FileName;
    if nombre='' then
        result := false
    else
      result := true;
  end
  else
    result := false;
end;

procedure TFCons_2015.imprima(vista: boolean);
begin
  // verinforme...
  if (FileExists( extractFilePath( application.ExeName ) + 'informes\' + FInforme )) then
  try
    ds.DataSet.DisableControls;
    verInforme( FInforme, ds.DataSet, nil, nil, vista )
  finally
    ds.DataSet.EnableControls;
  end
  else
  begin
    crearInforme( FInforme, ds.DataSet );
  end;
end;

procedure TFCons_2015.mCamFecExecute(Sender: TObject);
begin
     if seleccionarRangoFechas( FIni, FFin ) then
        RequeryConsulta;
end;

procedure TFCons_2015.mExpoPDFExecute(Sender: TObject);
var
  ASettings: TdxPSPDFReportExportOptions;
  nombre: string;
begin
  ASettings := TdxPSPDFReportExportOptions.Create;
  try
    nombre := extractfilepath( application.ExeName ) + 'salidas\' + self.Caption + '.pdf';
    ASettings.Subject := 'Informe';
    ASettings.Title := self.Caption;
    ASettings.DefaultFileName := nombre;
    ASettings.OpenDocumentAfterExport := true;

    dxComp.ExportToPDF(nombre, true, ASettings );

//    dxComp.ExportToPDF(nombre, true, ASettings, dxPDFLink );
//    dxcomp.ExportToPDF;
  finally
    ASettings.Free;
  end;
end;

procedure TFCons_2015.mExportar_htmlExecute(Sender: TObject);
begin
    screen.Cursor := crHourGlass;
     if getArchivo( archivo, 3 ) then
     begin
      ExportGridToHTML( archivo, grilla, True, False );
      // ExportGridToFile( 'PDF',
      showmessage( rtExportado );
     end;
    screen.Cursor := crDefault;
end;

procedure TFCons_2015.mExportar_txtExecute(Sender: TObject);
begin
    screen.Cursor := crHourGlass;
     if getArchivo( archivo, 2 ) then
     begin
      ExportGridToText( archivo, grilla, True, False );
      showmessage( rtExportado );
     end;
    screen.Cursor := crDefault;
end;

procedure TFCons_2015.mExportar_xlsExecute(Sender: TObject);
begin
    screen.Cursor := crHourGlass;
     if getArchivo( archivo, 1 ) then
     begin
      ExportGridToExcel( archivo, grilla, True, False );
      showmessage( rtExportado );
     end;
    screen.Cursor := crDefault;
end;

procedure TFCons_2015.mExportar_xmlExecute(Sender: TObject);
begin
    screen.Cursor := crHourGlass;
     if getArchivo( archivo, 4 ) then
     begin
      ExportGridToXML( archivo, grilla, True, False );
      showmessage( rtExportado );
     end;
    screen.Cursor := crDefault;
end;

procedure TFCons_2015.mgrHelpButtonClick(Sender: TObject);
begin
      TAyuda.mostrar_ayuda('general', 'general');
end;

procedure TFCons_2015.mImprimirExecute(Sender: TObject);
begin
  imprima( false );
end;

procedure TFCons_2015.AbriryMostrar;
begin
  requeryConsulta;
  showmodal;
end;

procedure TFCons_2015.mSalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFCons_2015.mVisPreExecute(Sender: TObject);
begin
  imprima( true );
end;

procedure TFCons_2015.requeryConsulta;
begin
  if ( ds.DataSet <> nil ) then
  begin
    if not (ds.DataSet.Active) then
      ds.DataSet.Open;
    crearColumnas;
    setPanel;
    ActiveControl := grilla;
    vista.DataController.GotoFirst;
  end;
end;


procedure TFCons_2015.SetAyuda(const Value: string);
begin
  FAyuda := Value;
end;

procedure TFCons_2015.setDataset(data: TDataSet);
begin
  ds.DataSet := data;
end;

procedure TFCons_2015.SetFin(const Value: TDateTime);
begin
  FFin := Value;
end;

procedure TFCons_2015.SetHabilitarSeleccion(const Value: boolean);
begin
  FhabilitarSeleccion := Value;
  acSeleccion.Enabled := value;
  acSeleccion.Visible := value;
end;

procedure TFCons_2015.SetHaySeleccion(const Value: boolean);
begin
  FHaySeleccion := Value;
end;

procedure TFCons_2015.SetIDSeleccionado(const Value: variant);
begin
  FIDSeleccionado := Value;
end;

procedure TFCons_2015.SetInforme(const Value: string);
begin
  FInforme := Value;
end;

procedure TFCons_2015.SetIni(const Value: TDateTime);
begin
  FIni := Value;
end;

procedure TFCons_2015.SetNoCerrar(const Value: boolean);
begin
  FNoCerrar := Value;
end;

procedure TFCons_2015.SetPage(const Value: string);
begin
  FPage := Value;
end;

procedure TFCons_2015.setPanel;
begin
  dxRb.Panels[1].Text := 'Fechas : ' + datetostr( FIni ) + ' y ' + datetostr( FFin );
end;

procedure TFCons_2015.SetURL(const Value: string);
begin
  FURL := Value;
end;

procedure TFCons_2015.vistaCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  acSeleccionExecute(sender);
  AHandled := true;
end;


procedure TFCons_2015.vistaDataControllerSortingChanged(Sender: TObject);
var
 i, ID: Integer;
 Several: Boolean;
 SQLOrderSt: string;
begin
  inherited;
  if vista.DataController.DataModeController.GridMode then
  begin
    ds.dataset.DisableControls;
    try
      ds.dataset.Close;
      SQLOrderSt := '';
      Several := False;
      for i := 0 to vista.SortedItemCount - 1 do
      begin
          if Several then
            SQLOrderSt := SQLOrderSt + ';';
          SQLOrderSt := SQLOrderSt + TcxGridDBColumn(vista.SortedItems[I]).DataBinding.FieldName;
          // if Vista.SortedItems[i].SortOrder = soDescending then
           // SQLOrderSt := SQLOrderSt + ' DESC';
          Several := True;
      end;
      TFDDataSet( ds.dataset ).IndexFieldNames := SQLOrderSt;
      ds.dataset.Open;
    finally
      ds.dataset.EnableControls;
    end;
  end;

end;

end.
