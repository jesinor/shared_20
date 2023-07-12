unit seleccion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, cxControls,  DB, cxLocalization, Provider,
  DBClient, ActnList, JvAppStorage, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxClasses, Vcl.DBActns,
  System.Actions, JvAppIniStorage, JvComponentBase, JvFormPlacement,
  Vcl.ImgList, dxBar, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxStatusBar, dxRibbonStatusBar,
  dxRibbon, dxRibbonSkins, dxRibbonCustomizationForm, dxSkinsCore,
  dxSkinCoffee, dxSkinGlassOceans, dxSkinLondonLiquidSky, dxSkinStardust,
  dxSkinsdxRibbonPainter, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  System.ImageList, cxDataControllerConditionalFormattingRulesManagerDialog,
  constantes, ayuda;

type
  TPar = array of variant;

  TFSeleccion = class(TForm)
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
    cds: TClientDataSet;
    dsp: TDataSetProvider;
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
    procedure mAyudaExecute(Sender: TObject);
    procedure acSeleccionExecute(Sender: TObject);
    procedure acAnularExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure vistaDblClick(Sender: TObject);
    procedure vistaKeyPress(Sender: TObject; var Key: Char);
    procedure mgrHelpButtonClick(Sender: TObject);
    procedure acPanelBusquedaExecute(Sender: TObject);
    procedure acDeselecExecute(Sender: TObject);
    procedure AcSelecTodosExecute(Sender: TObject);
    procedure cintaHelpButtonClick(Sender: TdxCustomRibbon);
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
  FSeleccion: TFSeleccion;

implementation
uses
  browse;
{$R *.dfm}

function seleccionar_codigo( Owner: TComponent): variant;
begin
    with TFSeleccion.Create( owner ) do
    try
        showmodal;
        if ( modalResult = mrOK ) then
          result := resultado;
    finally
        free;
    end;
end;

procedure TFSeleccion.acAnularExecute(Sender: TObject);
begin
     modalResult := mrCancel;
     FResultado := null;
     FDescripcion := null;
end;

procedure TFSeleccion.acDeselecExecute(Sender: TObject);
begin
  vista.Controller.ClearSelection;
end;

procedure TFSeleccion.acPanelBusquedaExecute(Sender: TObject);
begin
  vista.Controller.ShowFindPanel;
end;

procedure TFSeleccion.acSeleccionExecute(Sender: TObject);
begin
     modalResult := mrOK;
     try
        FResultado := cds.FieldByName(FCampo).Value;
        if (FLookup <> '' ) then
          FDescripcion := cds.FieldByName(FLookup).value;
        getResultado;
     except
           FResultado := null;
     end;
end;

procedure TFSeleccion.AcSelecTodosExecute(Sender: TObject);
begin
  vista.Controller.SelectAll;
end;

constructor TFSeleccion.create(AOwner: TComponent;
  const AParams: array of variant);
var
  I: integer;
begin
  inherited create( AOwner );
  FPars := varArrayOf( AParams );
end;

constructor TFSeleccion.create(AOwner: TComponent; abrir: boolean);
begin
  FAbrir_auto := abrir;
  create( AOwner );
end;

procedure TFSeleccion.cintaHelpButtonClick(Sender: TdxCustomRibbon);
begin
  TAyuda.mostrar_ayuda(modulo_general, 'inicio');
end;

constructor TFSeleccion.create(AOwner: TComponent);
begin
    FURL := 'http://www.sisnob.com.ar/';
    FPage := 'index.php';

    FAbrir_auto := true;
    inherited create( AOwner );
    cxLocal.FileName := ExtractFilePath(Application.ExeName) + 'Ini\castellano.ini';
    cxLocal.Active := True;
    cxLocal.Locale := $2c0a;

end;

procedure TFSeleccion.FormCreate(Sender: TObject);
begin
    if abrir_auto then
      requeryConsulta;
end;

procedure TFSeleccion.getResultado;
begin
  //
end;

procedure TFSeleccion.mAyudaExecute(Sender: TObject);
begin
  BrowseURL( FUrl + FPage );
end;

procedure TFSeleccion.mgrHelpButtonClick(Sender: TObject);
begin
  TAyuda.mostrar_ayuda(modulo_general, 'inicio');
end;

procedure TFSeleccion.mSalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFSeleccion.requeryConsulta;
var
  I: Integer;
begin
    if (Assigned(dsp.DataSet)) then
      if not (cds.Active) then
      begin
        if not ( VarIsNull( Fpars )) then
          for I := 0 to High( FPars ) do
            cds.Params[i].Value := FPars[i];
        cds.Open;
      end;
end;

procedure TFSeleccion.SetAbrir_auto(const Value: Boolean);
begin
  FAbrir_auto := Value;
end;

procedure TFSeleccion.SetCampo(const Value: string);
begin
  FCampo := Value;
end;

procedure TFSeleccion.SetDescripcion(const Value: Variant);
begin
  FDescripcion := Value;
end;

procedure TFSeleccion.SetLookup(const Value: string);
begin
  FLookup := Value;
end;

procedure TFSeleccion.SetPage(const Value: string);
begin
  FPage := Value;
end;

procedure TFSeleccion.setPars(const aPars: TPar);
begin
  FPars := aPars;
end;

procedure TFSeleccion.SetResultado(const Value: variant);
begin
  FResultado := Value;
end;

procedure TFSeleccion.SetURL(const Value: string);
begin
  FURL := Value;
end;

procedure TFSeleccion.vistaDblClick(Sender: TObject);
begin
     acSeleccionExecute(sender);
end;

procedure TFSeleccion.vistaKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
        acSeleccionExecute(sender);
end;

end.
