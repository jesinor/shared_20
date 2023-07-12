unit seleccion_mul;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, cxControls,  DB, cxLocalization, Provider,
  DBClient, ActnList, JvAppStorage,
  JvAppIniStorage, JvComponentBase, JvFormPlacement, ImgList, dxBar,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxStatusBar, dxRibbonStatusBar,
  dxRibbon, DBActns,
  cxGraphics, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, cxDBData, System.Actions, cxLookAndFeels,
  cxLookAndFeelPainters, dxRibbonSkins, cxStyles, dxRibbonCustomizationForm,
  System.ImageList;

type
  TFSeleccionMul = class(TForm)
    mgr: TdxBarManager;
    ctInfo: TdxRibbonTab;
    cinta: TdxRibbon;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    imagenes: TImageList;
    jvForm: TJvFormStorage;
    jvIni: TJvAppIniFileStorage;
    Aclst: TActionList;
    mSalir: TAction;
    mAyuda: TAction;
    ctAcc: TdxRibbonTab;
    ctAyu: TdxRibbonTab;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    mgrBar4: TdxBar;
    dxBarLargeButton8: TdxBarLargeButton;
    vista: TcxGridDBTableView;
    Base: TcxGridLevel;
    grilla: TcxGrid;
    Ds: TDataSource;
    cds: TClientDataSet;
    dsp: TDataSetProvider;
    mgrBar5: TdxBar;
    dxBarLargeButton9: TdxBarLargeButton;
    grabar: TSaveDialog;
    cxLocal: TcxLocalizer;
    mgrBar1: TdxBar;
    dxBarLargeButton10: TdxBarLargeButton;
    dxBarLargeButton11: TdxBarLargeButton;
    mgrBar2: TdxBar;
    dxBarLargeButton12: TdxBarLargeButton;
    dxBarLargeButton13: TdxBarLargeButton;
    dxBarLargeButton14: TdxBarLargeButton;
    dxBarLargeButton15: TdxBarLargeButton;
    DataSetFirst1: TDataSetFirst;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetLast1: TDataSetLast;
    acSeleccion: TAction;
    acAnular: TAction;
    dxBarLargeButton16: TdxBarLargeButton;
    acSelTodos: TAction;
    cxStyleRepository1: TcxStyleRepository;
    cxSel: TcxStyle;
    procedure mSalirExecute(Sender: TObject);
    procedure mAyudaExecute(Sender: TObject);
    procedure acSeleccionExecute(Sender: TObject);
    procedure acAnularExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure vistaDblClick(Sender: TObject);
    procedure vistaKeyPress(Sender: TObject; var Key: Char);
    procedure acSelTodosExecute(Sender: TObject);
    procedure vistaCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
    FAbrir_auto: Boolean;
    FURL: string;
    FPage: string;
    FCampo: string;
    FResultado: variant;
    FDescripcion: Variant;
    FLookup: string;
    FNoabrir: boolean;

    procedure SetAbrir_auto(const Value: Boolean);
    procedure SetPage(const Value: string);
    procedure SetURL(const Value: string);
    procedure SetCampo(const Value: string);
    procedure SetResultado(const Value: variant);
    procedure SetDescripcion(const Value: Variant);
    procedure SetLookup(const Value: string);
    procedure SetNoabrir(const Value: boolean);
  protected
    archivo: string;
  public
    { Public declarations }
//  cxLocal: TcxLocalizer;
    procedure requeryConsulta; virtual;
    constructor create( AOwner: TComponent ); overload; override;

    property URL: string read FURL write SetURL;
    property Page: string read FPage write SetPage;

    property Campo: string read FCampo write SetCampo;
    property Lookup: string read FLookup write SetLookup;

    property Resultado: variant read FResultado write SetResultado;
    property Descripcion: Variant read FDescripcion write SetDescripcion;
    property Noabrir: boolean read FNoabrir write SetNoabrir;
  end;

  function seleccionar_codigo( Owner: TComponent) : variant;

var
  FSeleccionMul: TFSeleccionMul;

implementation
uses
  browse;
{$R *.dfm}

function seleccionar_codigo( Owner: TComponent): variant;
begin
    with TFSeleccionMul.Create( owner ) do
    try
        showmodal;
        if ( modalResult = mrOK ) then
          result := resultado;
    finally
        free;
    end;
end;

procedure TFSeleccionMul.acAnularExecute(Sender: TObject);
begin
     modalResult := mrCancel;
     FResultado := null;
     FDescripcion := null;
end;

procedure TFSeleccionMul.acSeleccionExecute(Sender: TObject);
begin
     modalResult := mrOK;
     try
        FResultado := cds.FieldByName(FCampo).Value;
        if (FLookup <> '' ) then
          FDescripcion := cds.FieldByName(FLookup).value;
     except
           FResultado := null;
     end;
end;

procedure TFSeleccionMul.acSelTodosExecute(Sender: TObject);
begin
     // vista.DataController.SelectAll;
     vista.controller.SelectAll;
     modalResult := mrAll;
end;

constructor TFSeleccionMul.create(AOwner: TComponent);
begin
    FURL := 'http://www.jesinor.com.ar/';
    FPage := 'index.php';

    inherited create( AOwner );
    cxLocal.FileName := ExtractFilePath(Application.ExeName) + 'Ini\castellano.ini';
    cxLocal.Active := True;
    cxLocal.Locale := $2c0a;

end;

procedure TFSeleccionMul.FormCreate(Sender: TObject);
begin
     if not (FNoabrir) then
      requeryConsulta;
end;

procedure TFSeleccionMul.mAyudaExecute(Sender: TObject);
begin
  BrowseURL( FUrl + FPage );
end;

procedure TFSeleccionMul.mSalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFSeleccionMul.requeryConsulta;
begin
    if (Assigned(dsp.DataSet)) then    
      if not (cds.Active) then
        cds.Open;
end;

procedure TFSeleccionMul.SetAbrir_auto(const Value: Boolean);
begin
  FAbrir_auto := Value;
end;

procedure TFSeleccionMul.SetCampo(const Value: string);
begin
  FCampo := Value;
end;

procedure TFSeleccionMul.SetDescripcion(const Value: Variant);
begin
  FDescripcion := Value;
end;

procedure TFSeleccionMul.SetLookup(const Value: string);
begin
  FLookup := Value;
end;

procedure TFSeleccionMul.SetNoabrir(const Value: boolean);
begin
  FNoabrir := Value;
end;

procedure TFSeleccionMul.SetPage(const Value: string);
begin
  FPage := Value;
end;

procedure TFSeleccionMul.SetResultado(const Value: variant);
begin
  FResultado := Value;
end;

procedure TFSeleccionMul.SetURL(const Value: string);
begin
  FURL := Value;
end;

procedure TFSeleccionMul.vistaCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
     if AViewInfo.GridRecord.Selected then
        ACanvas.Brush.Color := clMoneyGreen;
end;

procedure TFSeleccionMul.vistaDblClick(Sender: TObject);
begin
     acSeleccionExecute(sender);
end;

procedure TFSeleccionMul.vistaKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
        acSeleccionExecute(sender);
end;

end.
