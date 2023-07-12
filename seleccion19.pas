unit seleccion19;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, cxControls,  DB, cxLocalization, Provider,
  ActnList, JvAppStorage, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxClasses, Vcl.DBActns,
  System.Actions, JvAppIniStorage, JvComponentBase, JvFormPlacement,
  Vcl.ImgList, dxBar, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxStatusBar, dxRibbonStatusBar,
  dxRibbon, System.ImageList, cxDataControllerConditionalFormattingRulesManagerDialog,
  dxRibbonSkins, dxSkinsCore,
  dxRibbonCustomizationForm,
  constantes,
  ayuda, dxSkinCoffee, dxSkinGlassOceans, dxSkinLondonLiquidSky, dxSkinStardust,
  dxSkinTheBezier;

type
  TPar = array of variant;

  TFSeleccion19 = class(TForm)
    mgr: TdxBarManager;
    cinta: TdxRibbon;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    jvForm: TJvFormStorage;
    jvIni: TJvAppIniFileStorage;
    Aclst: TActionList;
    mSalir: TAction;
    mAyuda: TAction;
    ctAcc: TdxRibbonTab;
    vista: TcxGridDBTableView;
    Base: TcxGridLevel;
    grilla: TcxGrid;
    Ds: TDataSource;
    grabar: TSaveDialog;
    cxLocal: TcxLocalizer;
    mgrBar1: TdxBar;
    dxBarLargeButton10: TdxBarLargeButton;
    dxBarLargeButton11: TdxBarLargeButton;
    DataSetFirst1: TDataSetFirst;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetLast1: TDataSetLast;
    acSeleccion: TAction;
    acAnular: TAction;
    cxEstilos: TcxStyleRepository;
    cxSel: TcxStyle;
    cxalter: TcxStyle;
    imgseleccion: TImageList;
    mgrBar2: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    AcSelecTodos: TAction;
    acDeselec: TAction;
    acPanelBusqueda: TAction;
    procedure mSalirExecute(Sender: TObject);
    procedure acSeleccionExecute(Sender: TObject);
    procedure acAnularExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure vistaDblClick(Sender: TObject);
    procedure vistaKeyPress(Sender: TObject; var Key: Char);
    procedure mgrHelpButtonClick(Sender: TObject);
    procedure acPanelBusquedaExecute(Sender: TObject);
    procedure acDeselecExecute(Sender: TObject);
    procedure AcSelecTodosExecute(Sender: TObject);
  private
    { Private declarations }
    FAbrir_auto: Boolean;
    FURL: string;
    FPage: string;
    FCampo: string;
    FResultado: variant;
    FDescripcion: Variant;
    FLookup: string;

    procedure SetAbrir_auto(const Value: Boolean);
    procedure SetPage(const Value: string);
    procedure SetURL(const Value: string);
    procedure SetCampo(const Value: string);
    procedure SetResultado(const Value: variant);
    procedure SetDescripcion(const Value: Variant);
    procedure SetLookup(const Value: string);
  protected
    archivo: string;
    FPars: TPar;
  public
    { Public declarations }
//  cxLocal: TcxLocalizer;
    procedure getResultado; virtual;

    procedure requeryConsulta; virtual;
    constructor create( AOwner: TComponent ); overload; override;
    constructor create( AOwner: TComponent; abrir: boolean ); overload;
    constructor create( AOwner: TComponent; const AParams: array of variant); overload;
    constructor create( AOwner: TComponent; const codigo: string); overload;

    procedure setPars( const aPars: TPar );

    property URL: string read FURL write SetURL;
    property Page: string read FPage write SetPage;

    property Campo: string read FCampo write SetCampo;
    property Lookup: string read FLookup write SetLookup;

    property Resultado: variant read FResultado write SetResultado;
    property Descripcion: Variant read FDescripcion write SetDescripcion;
    property abrir_auto: boolean read Fabrir_auto write Setabrir_auto;
  end;

  function seleccionar_codigo( Owner: TComponent) : variant;

var
  FSeleccion19: TFSeleccion19;

implementation
{$R *.dfm}

function seleccionar_codigo( Owner: TComponent): variant;
begin
    with TFSeleccion19.Create( owner ) do
    try
        showmodal;
        if ( modalResult = mrOK ) then
          result := resultado;
    finally
        free;
    end;
end;

procedure TFSeleccion19.acAnularExecute(Sender: TObject);
begin
     modalResult := mrCancel;
     FResultado := null;
     FDescripcion := null;
end;

procedure TFSeleccion19.acDeselecExecute(Sender: TObject);
begin
  vista.Controller.ClearSelection;
end;

procedure TFSeleccion19.acPanelBusquedaExecute(Sender: TObject);
begin
  vista.Controller.ShowFindPanel;
end;

procedure TFSeleccion19.acSeleccionExecute(Sender: TObject);
begin
     if vista.Datacontroller.FocusedRecordIndex > -1 then
     try
        modalResult := mrOK;
        FResultado := ds.DataSet.FieldByName(FCampo).Value;
        if (FLookup <> '' ) then
          FDescripcion := ds.DataSet.FieldByName(FLookup).Value;
        getResultado;
     except
           FResultado := null;
     end;
end;

procedure TFSeleccion19.AcSelecTodosExecute(Sender: TObject);
begin
  vista.Controller.SelectAll;
end;

constructor TFSeleccion19.create(AOwner: TComponent; const codigo: string);
begin
  inherited create( AOwner );
  FPars := varArrayOf( [codigo] );
  FCampo := codigo;
end;

constructor TFSeleccion19.create(AOwner: TComponent;
  const AParams: array of variant);
begin
  inherited create( AOwner );
  FPars := varArrayOf( AParams );
end;

constructor TFSeleccion19.create(AOwner: TComponent; abrir: boolean);
begin
  FAbrir_auto := abrir;
  create( AOwner );
end;

constructor TFSeleccion19.create(AOwner: TComponent);
begin
    FURL := 'http://www.sisnob.com.ar/';
    FPage := 'index.php';

    FAbrir_auto := true;
    inherited create( AOwner );
    cxLocal.FileName := ExtractFilePath(Application.ExeName) + 'Ini\castellano.ini';
    cxLocal.Active := True;
    cxLocal.Locale := $2c0a;

end;

procedure TFSeleccion19.FormCreate(Sender: TObject);
begin
    if abrir_auto then
      requeryConsulta;
end;

procedure TFSeleccion19.getResultado;
begin
  //
end;

procedure TFSeleccion19.mgrHelpButtonClick(Sender: TObject);
begin
  TAyuda.mostrar_ayuda(modulo_general, 'inicio');
end;

procedure TFSeleccion19.mSalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFSeleccion19.requeryConsulta;
begin
    if assigned(ds.DataSet) then
      if not (ds.DataSet.Active) then
        ds.DataSet.Open;
end;

procedure TFSeleccion19.SetAbrir_auto(const Value: Boolean);
begin
  FAbrir_auto := Value;
end;

procedure TFSeleccion19.SetCampo(const Value: string);
begin
  FCampo := Value;
end;

procedure TFSeleccion19.SetDescripcion(const Value: Variant);
begin
  FDescripcion := Value;
end;

procedure TFSeleccion19.SetLookup(const Value: string);
begin
  FLookup := Value;
end;

procedure TFSeleccion19.SetPage(const Value: string);
begin
  FPage := Value;
end;

procedure TFSeleccion19.setPars(const aPars: TPar);
begin
  FPars := aPars;
end;

procedure TFSeleccion19.SetResultado(const Value: variant);
begin
  FResultado := Value;
end;

procedure TFSeleccion19.SetURL(const Value: string);
begin
  FURL := Value;
end;

procedure TFSeleccion19.vistaDblClick(Sender: TObject);
begin
     acSeleccionExecute(sender);
end;

procedure TFSeleccion19.vistaKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
        acSeleccionExecute(sender);
end;

end.
