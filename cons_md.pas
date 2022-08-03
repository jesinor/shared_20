unit cons_md;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxDBLookupComboBox, cxContainer, cxEdit, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  JvAppStorage, JvAppIniStorage, JvComponentBase, JvFormPlacement,
  cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, cxDropDownEdit, cxCalc, cxDBEdit,
  cxTextEdit, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, Vcl.StdCtrls,
  Vcl.ExtCtrls, cxClasses, cxLocalization, dxBar, cxBarEditItem, Vcl.DBActns,
  System.Actions, Vcl.ActnList, dxRibbon, dmSrd, cxLookAndFeelPainters,
  dxRibbonSkins, dxSkinsCore, dxSkinCoffee, dxSkinGlassOceans, cxGridExportLink,
  dxSkinLondonLiquidSky, dxSkinStardust, dxSkinsdxRibbonPainter,
  dxRibbonCustomizationForm, dxSkinsdxBarPainter, constantes, cxSpinEdit,
  dxSkinTheBezier, cxDataControllerConditionalFormattingRulesManagerDialog,
  registry,
  ayuda;

type
  TAccionGetDatos = procedure( const codigo: string; const fini, ffin: TDateTime ) of object;
  TAccionGetLookup = procedure of object;

  TFConsMD = class(TForm)
    cinta: TdxRibbon;
    ctInfo: TdxRibbonTab;
    ctAcc: TdxRibbonTab;
    cintaTab1: TdxRibbonTab;
    ctAyu: TdxRibbonTab;
    Aclst: TActionList;
    mSalir: TAction;
    mAyuda: TAction;
    mImprimir: TAction;
    mVisPre: TAction;
    mCamFec: TAction;
    mExportar_xls: TAction;
    mExportar_html: TAction;
    mExportar_txt: TAction;
    mExportar_xml: TAction;
    DatasetFirst2: TDataSetFirst;
    DatasetPrior2: TDataSetPrior;
    DatasetNext2: TDataSetNext;
    DatasetLast2: TDataSetLast;
    acSelCodigo: TAction;
    mgr: TdxBarManager;
    mgrBar2: TdxBar;
    mgrBar3: TdxBar;
    acciones: TdxBar;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton23: TdxBarLargeButton;
    dxBarLargeButton24: TdxBarLargeButton;
    dxBarLargeButton25: TdxBarLargeButton;
    cxLocal: TcxLocalizer;
    repositorio: TcxStyleRepository;
    even: TcxStyle;
    odd: TcxStyle;
    group: TcxStyle;
    footer: TcxStyle;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    stPieGrilla: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    ctHeadGrilla: TcxStyle;
    GridTableViewStyleSheetSpruce: TcxGridTableViewStyleSheet;
    Panel1: TPanel;
    Label14: TLabel;
    cxLookCod: TcxLookupComboBox;
    JvCaptionPanel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label13: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    grilla: TcxGrid;
    vista: TcxGridDBTableView;
    Base: TcxGridLevel;
    Ds: TDataSource;
    DsFicha: TDataSource;
    DsCod: TDataSource;
    jvForm: TJvFormStorage;
    jvIni: TJvAppIniFileStorage;
    grabar: TSaveDialog;
    dxBarLargeButton2: TdxBarLargeButton;
    procedure FormCreate(Sender: TObject);
    procedure mSalirExecute(Sender: TObject);
    procedure mCamFecExecute(Sender: TObject);
    procedure mExportar_xlsExecute(Sender: TObject);
    procedure mExportar_htmlExecute(Sender: TObject);
    procedure mExportar_txtExecute(Sender: TObject);
    procedure mExportar_xmlExecute(Sender: TObject);
    procedure acSelCodigoExecute(Sender: TObject);
    procedure mVisPreExecute(Sender: TObject);
    procedure mImprimirExecute(Sender: TObject);
    procedure cxLookCodPropertiesEditValueChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acFlushExecute(Sender: TObject);
  private
    { Private declarations }
    FIni, FFin: TDateTime;
    FCuenta: string;
    EnInicio: boolean;
    archivo: string;
    FNoCerrar: boolean;
    FInforme: string;
    FCampoBusqueda: string;
    noActualizarRegistro: boolean;

    function getArchivo( var nombre: string; idx: integer ): Boolean;
    procedure buscar;
    procedure requeryDetalle; virtual;
    procedure SetFin(const Value: TDateTime);
    procedure SetInforme(const Value: string);
    procedure SetIni(const Value: TDateTime);
    procedure SetNoCerrar(const Value: boolean);
    procedure SetCampoBusqueda(const Value: string);
  public
    { Public declarations }
    FAcciongetDatos: TAccionGetDatos;
    FAccionLookUp: TAccionGetLookup;

    procedure setDataset( data: TDataSet );

    procedure abrir(const cuenta: string);
    procedure requeryConsulta; virtual;
    procedure imprima( vista: boolean = true ); virtual;
    constructor create( AOwner: TComponent ); overload; override;

    property Ini: TDateTime read FIni write SetIni;
    property Fin: TDateTime read FFin write SetFin;
    property NoCerrar: boolean read FNoCerrar write SetNoCerrar;
    property Informe: string read FInforme write SetInforme;
    property CampoBusqueda: string read FCampoBusqueda write SetCampoBusqueda;
  end;

var
  FConsMD: TFConsMD;

implementation
uses
  informes, funcsrb, SelFechas, consFormMD, SelForm19, SelCodigo;
{$R *.dfm}


procedure TFConsMD.abrir(const cuenta: string);
begin
  FCuenta := cuenta;
  buscar;
end;

procedure TFConsMD.acSelCodigoExecute(Sender: TObject);
var
  ISelBus: ISelForm19;
  Resultado: variant;
begin
    ISElBus := TISelForm19.create( TFSelCodigo, Resultado, FCampoBusqueda );
    if ( resultado <> null ) and ( resultado <> Unassigned ) then
    begin
      FCuenta := resultado;
      buscar;
    end;
end;

procedure TFConsMD.acFlushExecute(Sender: TObject);
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

procedure TFConsMD.buscar;
begin
    EnInicio := true;
    requeryConsulta;
    EnInicio := false;
end;


constructor TFConsMD.create(AOwner: TComponent);
begin
  inherited;
  FIni := date;
  FFin := date;

  cxLocal.FileName := ExtractFilePath(Application.ExeName) + 'ini\castellano.ini';
  cxLocal.Active := True;
  cxLocal.Locale := $2c0a;
  if not noActualizarRegistro then
      vista.RestoreFromRegistry(ctRegconsulta, true, false, [], self.Name  );
end;

procedure TFConsMD.cxLookCodPropertiesEditValueChanged(Sender: TObject);
var
  cuenta: string;
begin
  if (cxLookCod.EditValue <> null) then
  begin
      cuenta := cxLookCod.EditValue;
      if Cuenta <> '' then
      begin
        FCuenta := Cuenta;
        buscar;
      end;
  end;
  inherited;
end;

procedure TFConsMD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if not noActualizarRegistro then
      vista.StoreToRegistry(ctRegconsulta, false, [], self.Name );
end;

procedure TFConsMD.FormCreate(Sender: TObject);
begin
  FIni := date-365;
  FFin := date;
  if assigned( FAccionLookUp ) then
    FAccionLookUp;
end;

function TFConsMD.getArchivo(var nombre: string; idx: integer): Boolean;
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

procedure TFConsMD.imprima(vista: boolean);
begin
  try
    DsFicha.DataSet.disablecontrols;
    Ds.DataSet.disableControls;
    verInforme( FInforme, DsFicha.DataSet, Ds.DataSet, nil, vista )
  finally
    DsFicha.DataSet.enablecontrols;
    Ds.DataSet.enablecontrols;
  end;
end;

procedure TFConsMD.mCamFecExecute(Sender: TObject);
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
             RequeryConsulta; // esto reemplaza a requery detalle puesto que es una sola llamada remota a header/detail
        end;
     finally
            free;
     end;
end;

procedure TFConsMD.mExportar_htmlExecute(Sender: TObject);
begin
    screen.Cursor := crHourGlass;
     if getArchivo( archivo, 3 ) then
     begin
      ExportGridToHTML( archivo, grilla, True, False );
      showmessage( rsExportado );
     end;
    screen.Cursor := crDefault;
end;

procedure TFConsMD.mExportar_txtExecute(Sender: TObject);
begin
    screen.Cursor := crHourGlass;
     if getArchivo( archivo, 2 ) then
     begin
      ExportGridToText( archivo, grilla, True, False );
      showmessage( rsExportado );
     end;
    screen.Cursor := crDefault;
end;

procedure TFConsMD.mExportar_xlsExecute(Sender: TObject);
begin
    screen.Cursor := crHourGlass;
     if getArchivo( archivo, 1 ) then
     begin
      ExportGridToExcel( archivo, grilla, True, False );
      showmessage( rsExportado );
     end;
    screen.Cursor := crDefault;
end;

procedure TFConsMD.mExportar_xmlExecute(Sender: TObject);
begin
    screen.Cursor := crHourGlass;
     if getArchivo( archivo, 4 ) then
     begin
      ExportGridToXML( archivo, grilla, True, False );
      showmessage( rsExportado );
     end;
    screen.Cursor := crDefault;
end;

procedure TFConsMD.mImprimirExecute(Sender: TObject);
begin
  imprima( false );
end;

procedure TFConsMD.mSalirExecute(Sender: TObject);
begin
  close;
end;

procedure TFConsMD.mVisPreExecute(Sender: TObject);
begin
  imprima( true );
end;

procedure TFConsMD.requeryConsulta;
begin
  if assigned( FAccionGetDatos ) then
    FAccionGetDatos( FCuenta, FIni, FFin );
end;

procedure TFConsMD.requeryDetalle;
begin
  // con un solo llamado a requeryConsulta se obtiene getmaster y getdetalle
  //
end;

procedure TFConsMD.setDataset(data: TDataSet);
begin
  ds.DataSet := data;
end;

procedure TFConsMD.SetCampoBusqueda(const Value: string);
begin
  FCampoBusqueda := Value;
end;

procedure TFConsMD.SetFin(const Value: TDateTime);
begin
  FFin := Value;
end;

procedure TFConsMD.SetInforme(const Value: string);
begin
  FInforme := Value;
end;

procedure TFConsMD.SetIni(const Value: TDateTime);
begin
  FIni := Value;
end;

procedure TFConsMD.SetNoCerrar(const Value: boolean);
begin
  FNoCerrar := Value;
end;

end.
