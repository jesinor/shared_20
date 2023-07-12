unit cons_2013;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  cxControls, Data.DB, cxLocalization, Datasnap.Provider,
  Datasnap.DBClient, System.Actions, Vcl.ActnList, JvAppStorage, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, dxRibbonSkins, cxStyles,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxClasses,
  Vcl.Menus, Vcl.DBActns, JvAppIniStorage, JvComponentBase, JvFormPlacement,
  dxBar, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxStatusBar, dxRibbonStatusBar,
  dxRibbon, dmres, dxRibbonCustomizationForm, registry, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSFillPatterns, dxPSEdgePatterns,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPSCore, dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPSdxSpreadSheetLnk,
  dxPScxCommon, dxCore, cxCustomData, cxFilter, cxData, dxPSCompsProvider,
  dxPSPDFExportCore, dxPSPDFExport, dxSkinsCore, cxGridExportLink,
  ayuda, constantes, cxDataControllerConditionalFormattingRulesManagerDialog;

resourcestring
  rtExportado = 'Consulta exportada con exito';
  ctRegConsulta = 'Software\SISNOB19\consultas\';

type
  TFCons_2013 = class(TForm)
    mgr: TdxBarManager;
    ctInfo: TdxRibbonTab;
    cinta: TdxRibbon;
    sb: TdxRibbonStatusBar;
    jvForm: TJvFormStorage;
    jvIni: TJvAppIniFileStorage;
    Aclst: TActionList;
    mSalir: TAction;
    mAyuda: TAction;
    mImprimir: TAction;
    mVisPre: TAction;
    mCamFec: TAction;
    mExportar_xls: TAction;
    barInfo: TdxBar;
    btnVistaprevia: TdxBarLargeButton;
    btnImprimir: TdxBarLargeButton;
    barExpo: TdxBar;
    barFecha: TdxBar;
    btnHTML: TdxBarLargeButton;
    btnTexto: TdxBarLargeButton;
    btnXML: TdxBarLargeButton;
    btnSelFec: TdxBarLargeButton;
    vista: TcxGridDBTableView;
    Base: TcxGridLevel;
    grilla: TcxGrid;
    Ds: TDataSource;
    cds: TClientDataSet;
    dsp: TDataSetProvider;
    BarFin: TdxBar;
    btnSalir: TdxBarLargeButton;
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
    acFlushReg: TAction;
    acExpo_pdf: TAction;
    dxPrintGrid: TdxComponentPrinter;
    btnExpoPDF: TdxBarLargeButton;
    gridlink: TdxGridReportLink;
    btnPanelBusqueda: TdxBarLargeButton;
    acPanelBusqueda: TAction;
    dxExpoXls: TdxBarLargeButton;
    procedure mSalirExecute(Sender: TObject);
    procedure mCamFecExecute(Sender: TObject);
    procedure mVisPreExecute(Sender: TObject);
    procedure mImprimirExecute(Sender: TObject);
    procedure mExportar_xlsExecute(Sender: TObject);
    procedure mExportar_htmlExecute(Sender: TObject);
    procedure mExportar_txtExecute(Sender: TObject);
    procedure mExportar_xmlExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mAyudaExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acFlushRegExecute(Sender: TObject);
    procedure vistaDataControllerSortingChanged(Sender: TObject);
    procedure acExpo_pdfExecute(Sender: TObject);
    procedure cintaHelpButtonClick(Sender: TdxCustomRibbon);
    procedure mgrHelpButtonClick(Sender: TObject);
    procedure acPanelBusquedaExecute(Sender: TObject);
  private
    { Private declarations }
    FAbrir_auto: Boolean;
    FURL: string;
    FPage: string;
    FNombreRegistro: string;

    function getArchivo( var nombre: string; idx: integer ): Boolean;
    procedure SetAbrir_auto(const Value: Boolean);
    procedure SetPage(const Value: string);
    procedure SetURL(const Value: string);
    procedure SetNombreRegistro(const Value: string);
  protected
    FIni, FFin: TDateTime;
  public
    { Public declarations }
//  cxLocal: TcxLocalizer;
    noActualizarRegistro: boolean;
    FExpoDetalles: boolean;
    archivo: string;

    procedure requeryConsulta; virtual;
    procedure imprima( vista: boolean = true ); virtual;
    constructor create( AOwner: TComponent ); overload;

    property URL: string read FURL write SetURL;
    property Page: string read FPage write SetPage;

    property Abrir_auto: Boolean read FAbrir_auto write SetAbrir_auto;
    property NombreRegistro: string read FNombreRegistro write SetNombreRegistro;
  end;

var
  FCons_2013: TFCons_2013;

implementation
uses
  browse, SelFechas;
{$R *.dfm}

procedure TFCons_2013.acExpo_pdfExecute(Sender: TObject);
begin
  // dxPrintGrid.Preview;
  dxPrintGrid.Print(true, nil );
end;

procedure TFCons_2013.acFlushRegExecute(Sender: TObject);
var
  reg        : TRegistry;
  openResult : Boolean;
  today      : TDateTime;
begin
  reg := TRegistry.Create;
  reg.Access := KEY_WOW64_64KEY + KEY_ALL_ACCESS;
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

procedure TFCons_2013.acPanelBusquedaExecute(Sender: TObject);
begin
  vista.Controller.ShowFindPanel;
end;

procedure TFCons_2013.cintaHelpButtonClick(Sender: TdxCustomRibbon);
begin
 // BrowseURL( FUrl + FPage );
  TAyuda.mostrar_ayuda(modulo_general, 'inicio');
end;

constructor TFCons_2013.create(AOwner: TComponent);
begin
    FIni := Date;
    FFin := Date;
    Abrir_auto := true;
    FURL := 'http://www.sisnob.com.ar/';
    FPage := 'index.php';
    FNombreRegistro := self.name;
    FExpoDetalles := true;
    archivo := 'Consulta';

    inherited create( AOwner );
    cxLocal.FileName := ExtractFilePath(Application.ExeName) + 'Ini\castellano.ini';
    cxLocal.Active := True;
    cxLocal.Locale := $2c0a;
end;

procedure TFCons_2013.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if not noActualizarRegistro then
      vista.StoreToRegistry(ctRegconsulta, false, [], FNombreRegistro );
      // vista.StoreToRegistry('Software\SISNOB15\consultas', false, [], self.Name );
end;

procedure TFCons_2013.FormCreate(Sender: TObject);
var
  ini: integer;
begin
    ini := gettickcount;
    if FNombreregistro = '' then
      FNombreregistro := self.name;

    if ( FAbrir_auto ) and not ( cds.Active ) then
      requeryConsulta;

    if not noActualizarRegistro then
      vista.RestoreFromRegistry(ctRegconsulta, true, false, [], FNombreRegistro  );
      // vista.RestoreFromRegistry('Software\SISNOB15\consultas', true, false, [], self.Name );
    OutputDebugString(PChar('tiempo: ' + inttostr( gettickcount-ini) + ' milisegundos' ));
end;

function TFCons_2013.getArchivo(var nombre: string; idx: Integer ): Boolean;
begin
  grabar.FileName := nombre;
  grabar.FilterIndex := idx;
  if ( grabar.Execute ) then
  begin
    nombre := grabar.FileName;
    result := true;
  end;
end;

procedure TFCons_2013.imprima(vista: boolean);
begin
  // verinforme...
end;

procedure TFCons_2013.mAyudaExecute(Sender: TObject);
begin
  TAyuda.mostrar_ayuda(modulo_general, 'inicio');
end;

procedure TFCons_2013.mCamFecExecute(Sender: TObject);
begin
     with TSelFechasDlg.create( application ) do
     try
        FecIni.date := FIni;
        FecFin.date := FFin;
        ShowModal;
        if ModalResult = mrOK then
        begin
             FIni := FecIni.date;
             FFin := FecFin.date;
             RequeryConsulta;
        end;
     finally
            free;
     end;
end;

procedure TFCons_2013.mExportar_htmlExecute(Sender: TObject);
begin
    screen.Cursor := crHourGlass;
     if getArchivo( archivo, 3 ) then
     begin
      ExportGridToHTML( archivo, grilla, True, False );
      showmessage( rtExportado );
     end;
    screen.Cursor := crDefault;
end;

procedure TFCons_2013.mExportar_txtExecute(Sender: TObject);
begin
    screen.Cursor := crHourGlass;
     if getArchivo( archivo, 2 ) then
     begin
      ExportGridToText( archivo, grilla, True, False );
      showmessage( rtExportado );
     end;
    screen.Cursor := crDefault;

end;

procedure TFCons_2013.mExportar_xlsExecute(Sender: TObject);
begin
    screen.Cursor := crHourGlass;
     if getArchivo( archivo, 1 ) then
     begin
      ExportGridToExcel( archivo, grilla, FExpoDetalles, False );
      showmessage( rtExportado );
     end;
    screen.Cursor := crDefault;
end;

procedure TFCons_2013.mExportar_xmlExecute(Sender: TObject);
begin
    screen.Cursor := crHourGlass;
     if getArchivo( archivo, 4 ) then
     begin
      ExportGridToXML( archivo, grilla, True, False );
      showmessage( rtExportado );
     end;
    screen.Cursor := crDefault;
end;

procedure TFCons_2013.mgrHelpButtonClick(Sender: TObject);
begin
  TAyuda.mostrar_ayuda( 'general', 'inicio' );
end;

procedure TFCons_2013.mImprimirExecute(Sender: TObject);
begin
  imprima( false );
end;

procedure TFCons_2013.mSalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFCons_2013.mVisPreExecute(Sender: TObject);
begin
     imprima( true );
end;

procedure TFCons_2013.requeryConsulta;
begin
    if not (cds.Active) and ( dsp.DataSet <> nil ) then
      cds.Open;
    sb.panels[1].text := 'fechas: ' + datetostr( FIni ) + ' al ' + datetostr( FFin );
end;

procedure TFCons_2013.SetAbrir_auto(const Value: Boolean);
begin
  FAbrir_auto := Value;
end;

procedure TFCons_2013.SetNombreRegistro(const Value: string);
begin
  FNombreRegistro := Value;
  vista.RestoreFromRegistry(ctRegconsulta, true, false, [], FNombreRegistro  );
end;

procedure TFCons_2013.SetPage(const Value: string);
begin
  FPage := Value;
end;

procedure TFCons_2013.SetURL(const Value: string);
begin
  FURL := Value;
end;

procedure TFCons_2013.vistaDataControllerSortingChanged(Sender: TObject);
var
 i, ID: Integer;
 Several: Boolean;
 SQLOrderSt: string;
begin
  inherited;
  if vista.DataController.DataModeController.GridMode then
  begin
    cds.DisableControls;
    try
      cds.Close;
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
      OutputDebugString( Pchar( SQLOrderSt));
      cds.IndexFieldNames := SQLOrderSt;
      cds.Open;
    finally
      cds.EnableControls;
    end;
  end;
end;

end.
