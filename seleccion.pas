unit seleccion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics,
  Vcl.ImgList, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinCoffee, dxSkinGlassOceans, dxSkinLondonLiquidSky,
  dxSkinStardust, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, System.ImageList,
  System.Actions, Vcl.ActnList, JvAppStorage, JvAppIniStorage, JvComponentBase,
  JvFormPlacement, cxLocalization, cxClasses, Vcl.ComCtrls, Vcl.ToolWin,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFSeleccion = class(TForm)
    Ds: TDataSource;
    grilla: TcxGrid;
    vista: TcxGridDBTableView;
    Base: TcxGridLevel;
    repositorio: TcxStyleRepository;
    even: TcxStyle;
    odd: TcxStyle;
    group: TcxStyle;
    footer: TcxStyle;
    cxSel: TcxStyle;
    cxLocal: TcxLocalizer;
    jvForm: TJvFormStorage;
    jvIni: TJvAppIniFileStorage;
    tbMain: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Ac: TActionList;
    acSalir: TAction;
    acSelTodos: TAction;
    acSel: TAction;
    img: TImageList;
    procedure acSalirExecute(Sender: TObject);
    procedure acSelTodosExecute(Sender: TObject);
    procedure acSelExecute(Sender: TObject);
    procedure vistaCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FResultado: variant;
    FCampo: string;

    procedure seleccionar;
    procedure SetResultado(const Value: variant);
  public
    { Public declarations }
    procedure RequeryConsulta; virtual;
    constructor create( AOwner: TComponent; campo: string ); overload;
    function getCampo( const campo: string ): string;

    property Resultado: variant read FResultado write SetResultado;
  end;

var
  FSeleccion: TFSeleccion;

implementation
{$R *.dfm}

{ TFSeleccion }

procedure TFSeleccion.acSalirExecute(Sender: TObject);
begin
  modalResult := mrCancel;
end;

procedure TFSeleccion.acSelTodosExecute(Sender: TObject);
begin
     vista.controller.SelectAll;
     modalResult := mrOK;
end;

constructor TFSeleccion.create(AOwner: TComponent; campo: string);
begin
  FCampo := campo;
  FResultado := null;
  inherited create( AOwner );
end;

procedure TFSeleccion.FormCreate(Sender: TObject);
begin
    requeryConsulta;
    FResultado := null;
end;

function TFSeleccion.getCampo(const campo: string): string;
begin
  if ( ds.DataSet.active ) then
    Result := ds.DataSet.FieldByName(Campo).Value
  else
    Result := 'error. tabla cerrada';
end;

procedure TFSeleccion.acSelExecute(Sender: TObject);
begin
     vista.controller.focusedRecord.Selected := true;
     seleccionar;
end;

procedure TFSeleccion.RequeryConsulta;
begin
    if assigned(ds.DataSet) then
      if not (ds.DataSet.Active) then
        ds.DataSet.Open;
end;

procedure TFSeleccion.seleccionar;
var
  Item: TcxCustomGridTableItem;
begin
    if vista.Datacontroller.FocusedRecordIndex > -1 then
    begin
      vista.controller.focusedRecord.Selected := true;
      if ( FCampo<>'' ) then
        Resultado := ds.DataSet.FieldByName(FCampo).Value
      else
        Resultado := ds.DataSet.FieldByName(ds.DataSet.Fields[0].fieldName).Value;
      modalResult := mrOK;
    end
    else
       showmessage( 'Seleccione un registro primero' );
end;

procedure TFSeleccion.SetResultado(const Value: variant);
begin
  FResultado := Value;
end;

procedure TFSeleccion.vistaCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
    seleccionar;
end;

end.
