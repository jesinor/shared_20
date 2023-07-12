unit consBanded_2016;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGridExportLink,
  cxControls, Data.DB, cxLocalization, Datasnap.Provider,
  Datasnap.DBClient, System.Actions, Vcl.ActnList, JvAppStorage, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, dxRibbonSkins, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxClasses,
  Vcl.Menus, Vcl.DBActns, JvAppIniStorage, JvComponentBase, JvFormPlacement,
  Vcl.ImgList, dxBar, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxStatusBar, dxRibbonStatusBar,
  dxRibbon, dmres, dxRibbonCustomizationForm, cxGridBandedTableView,
  cxGridDBBandedTableView;

resourcestring
  rtExportado = 'Consulta exportada con exito';

type
  TFConsBanded_2016 = class(TForm)
    mgr: TdxBarManager;
    ctInfo: TdxRibbonTab;
    cinta: TdxRibbon;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    jvForm: TJvFormStorage;
    jvIni: TJvAppIniFileStorage;
    Aclst: TActionList;
    mSalir: TAction;
    mAyuda: TAction;
    mImprimir: TAction;
    mVisPre: TAction;
    mCamFec: TAction;
    mExportar_xls: TAction;
    mgrInfo: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    mgrExpo: TdxBar;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    mgrAyu: TdxBar;
    dxBarLargeButton8: TdxBarLargeButton;
    Base: TcxGridLevel;
    grilla: TcxGrid;
    Ds: TDataSource;
    mgrFin: TdxBar;
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
    mgrNav: TdxBar;
    dxBarLargeButton18: TdxBarLargeButton;
    dxBarLargeButton19: TdxBarLargeButton;
    dxBarLargeButton21: TdxBarLargeButton;
    dxBarLargeButton23: TdxBarLargeButton;
    DatasetFirst1: TDataSetFirst;
    DatasetPrior1: TDataSetPrior;
    DatasetNext1: TDataSetNext;
    DatasetLast1: TDataSetLast;
    mgrSel: TdxBar;
    acSel: TAction;
    dxBarLargeButton14: TdxBarLargeButton;
    vista: TcxGridDBBandedTableView;
    cds: TClientDataSet;
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
    procedure acSelExecute(Sender: TObject);
    procedure vistaCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
    FAbrir_auto: Boolean;
    FURL: string;
    FPage: string;
    FClave: string;

    procedure insertar_campos;
    function getArchivo( var nombre: string; idx: integer ): Boolean;
    procedure SetAbrir_auto(const Value: Boolean);
    procedure SetPage(const Value: string);
    procedure SetURL(const Value: string);
    procedure SetClave(const Value: string);
  protected
    FIni, FFin: TDateTime;
    archivo: string;
  public
    { Public declarations }
//  cxLocal: TcxLocalizer;
    FCodigo: string;
    FData: TDataSet;
    FInforme: string;

    procedure requeryConsulta; virtual;
    procedure imprima( vista: boolean = true );
    constructor create( AOwner: TComponent ); overload; override;

    property URL: string read FURL write SetURL;
    property Page: string read FPage write SetPage;

    property Abrir_auto: Boolean read FAbrir_auto write SetAbrir_auto;
    property Clave: string read FClave write SetClave;
  end;

var
  FConsBanded_2016: TFConsBanded_2016;

implementation
uses
  browse, SelFechas, informes;
{$R *.dfm}

procedure TFConsBanded_2016.acSelExecute(Sender: TObject);
begin
     modalresult := mrOK;
     if FClave <> '' then
        FCodigo := ds.dataset.FieldByName( FClave ).Value;
end;

constructor TFConsBanded_2016.create(AOwner: TComponent);
begin
    FIni := Date;
    FFin := Date;
    Abrir_auto := true;
    FURL := 'http://www.sisnob.com.ar/';
    FPage := 'index.php';

    inherited create( AOwner );
    cxLocal.FileName := ExtractFilePath(Application.ExeName) + 'Ini\castellano.ini';
    cxLocal.Active := True;
    cxLocal.Locale := $2c0a;
end;

procedure TFConsBanded_2016.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    vista.StoreToRegistry('Software\SISNOB\consBanda', false, [], self.Name );
end;

procedure TFConsBanded_2016.FormCreate(Sender: TObject);
var
  ini: integer;
begin
    ini := gettickcount;
    if ( FAbrir_auto ) and not ( ds.dataset.Active ) then
      requeryConsulta;

    insertar_campos;
    vista.RestoreFromRegistry('Software\SISNOB\consBanda', true, false, [], self.Name );
    OutputDebugString(PChar('tiempo: ' + inttostr( gettickcount-ini) + ' milisegundos' ));
end;

function TFConsBanded_2016.getArchivo(var nombre: string; idx: Integer ): Boolean;
begin
  grabar.FilterIndex := idx;
  if ( grabar.Execute ) then
  begin
    nombre := grabar.FileName;
    result := true;
  end;
end;

procedure TFConsBanded_2016.imprima(vista: boolean);
begin
  // verinforme...
  if (FInforme<>'') then
  begin
    ds.dataset.DisableControls;
    verInforme( FInforme, ds.dataset, nil, nil, nil, true );
    ds.dataset.enablecontrols;
  end;
end;

procedure TFConsBanded_2016.insertar_campos;
var
  i: integer;
begin
  with vista do
  try
    vista.ClearItems;
    datacontroller.CreateAllItems;
    for I := 0 to ItemCount-1 do
    begin
      TcxGridColumn(vista.items[i]).HeaderAlignmentHorz := taCenter;
    end;
  finally

  end;
end;

procedure TFConsBanded_2016.mAyudaExecute(Sender: TObject);
begin
  BrowseURL( FUrl + FPage );
end;

procedure TFConsBanded_2016.mCamFecExecute(Sender: TObject);
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

procedure TFConsBanded_2016.mExportar_htmlExecute(Sender: TObject);
begin
    screen.Cursor := crHourGlass;
     if getArchivo( archivo, 3 ) then
     begin
      ExportGridToHTML( archivo, grilla, True, False );
      showmessage( rtExportado );
     end;
    screen.Cursor := crDefault;
end;

procedure TFConsBanded_2016.mExportar_txtExecute(Sender: TObject);
begin
    screen.Cursor := crHourGlass;
     if getArchivo( archivo, 2 ) then
     begin
      ExportGridToText( archivo, grilla, True, False );
      showmessage( rtExportado );
     end;
    screen.Cursor := crDefault;

end;

procedure TFConsBanded_2016.mExportar_xlsExecute(Sender: TObject);
begin
    screen.Cursor := crHourGlass;
     if getArchivo( archivo, 1 ) then
     begin
      ExportGridToExcel( archivo, grilla, True, False );
      showmessage( rtExportado );
     end;
    screen.Cursor := crDefault;
end;

procedure TFConsBanded_2016.mExportar_xmlExecute(Sender: TObject);
begin
    screen.Cursor := crHourGlass;
     if getArchivo( archivo, 4 ) then
     begin
      ExportGridToXML( archivo, grilla, True, False );
      showmessage( rtExportado );
     end;
    screen.Cursor := crDefault;
end;

procedure TFConsBanded_2016.mImprimirExecute(Sender: TObject);
begin
  imprima( false );
end;

procedure TFConsBanded_2016.mSalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFConsBanded_2016.mVisPreExecute(Sender: TObject);
begin
     imprima( true );
end;

procedure TFConsBanded_2016.requeryConsulta;
begin
    if not ( ds.dataset.Active ) then
      ds.dataset.Open;
    outputdebugstring( PChar('registros: ' + inttostr(ds.dataset.RecordCount)));
end;

procedure TFConsBanded_2016.SetAbrir_auto(const Value: Boolean);
begin
  FAbrir_auto := Value;
end;

procedure TFConsBanded_2016.SetClave(const Value: string);
begin
  FClave := Value;
end;

procedure TFConsBanded_2016.SetPage(const Value: string);
begin
  FPage := Value;
end;

procedure TFConsBanded_2016.SetURL(const Value: string);
begin
  FURL := Value;
end;

procedure TFConsBanded_2016.vistaCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
      acSelExecute( Sender );
      AHandled := true;
end;

end.
