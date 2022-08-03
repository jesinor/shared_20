unit ingresos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinCoffee,
  dxSkinGlassOceans, dxSkinLondonLiquidSky, dxSkinStardust, dxSkinTheBezier,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxDBLookupComboBox, cxCalc, cxCurrencyEdit, cxButtonEdit, Vcl.StdCtrls,
  Vcl.Buttons, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxMemo, cxDBEdit,
  cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit, cxSpinEdit, Vcl.ExtCtrls,
  JvFormPlacement, JvComponentBase, JvAppStorage, JvAppIniStorage,
  System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  constantes;

type
  TAccionGetNumero = function( const codigo: string): integer of object;
  TAccionGrabar = function( const head, deta: TFDMemTable): integer of object;

  TFIngresos = class(TForm)
    head: TFDMemTable;
    DsHead: TDataSource;
    Dsdet: TDataSource;
    deta: TFDMemTable;
    Ac: TActionList;
    acGrabar: TAction;
    acSalir: TAction;
    acanular: TAction;
    imglst: TImageList;
    jvIni: TJvAppIniFileStorage;
    jvForm: TJvFormStorage;
    pnlHead: TPanel;
    pnlBody: TPanel;
    grilla: TcxGrid;
    vista: TcxGridDBTableView;
    nivel: TcxGridLevel;
    pnlFoot: TPanel;
    btnGrabar: TBitBtn;
    btnAnular: TBitBtn;
    btnSalir: TBitBtn;
    procedure detaAfterDelete(DataSet: TDataSet);
    procedure detaAfterPost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure grillaEnter(Sender: TObject);
    procedure acGrabarExecute(Sender: TObject);
    procedure acSalirExecute(Sender: TObject);
    procedure acanularExecute(Sender: TObject);
    procedure detaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FCodigo: string;
    FInforme: string;
    Ftexto: string;
    FNumero: integer;
    FMensaje: string;

    procedure vaciar_datos;

    function validar_operacion: boolean;

    procedure SetInforme(const Value: string);
    procedure Settexto(const Value: string);
    procedure SetCodigo(const Value: string);
    procedure SetNumero(const Value: integer);
  protected
    circular: boolean;
    FGenero, FTerminal: string;

  public
    { Public declarations }
    FAccionConsulta: Procedure of object;
    FAcciongetAuxiliares: Procedure of object;

    FAcciongetNumero: TAccionGetNumero;
    FAccionGrabar: TAccionGrabar;

    class procedure New; virtual;

    procedure nuevo; virtual;
    procedure anular; virtual;

    procedure abrir_archivos; virtual;
    procedure cerrar_archivos; virtual;

    procedure calcular_totales; virtual;
    function esFechaCorrecta( f: TDateTime ): boolean; virtual;

    function grabar_operacion: integer; virtual;
    procedure imprimir( numero: integer ); virtual;

    function validar: boolean; virtual;

    property Informe: string read FInforme write SetInforme;
    property texto: string read Ftexto write Settexto;
    property Codigo: string read FCodigo write SetCodigo;
    property Numero: integer read FNumero write SetNumero;
  end;

var
  FIngresos: TFIngresos;

implementation
uses
  DMventas, ClientModuleUnit;
{$R *.dfm}

{ TFIngAsiento }

procedure TFIngresos.abrir_archivos;
begin
  if assigned( FAcciongetAuxiliares ) then
    FAcciongetAuxiliares;

  head.Open;
  deta.Open;
end;

procedure TFIngresos.acanularExecute(Sender: TObject);
begin
  anular;
end;

procedure TFIngresos.acGrabarExecute(Sender: TObject);
begin
  grabar_operacion;
end;

procedure TFIngresos.acSalirExecute(Sender: TObject);
begin
     close;
end;

procedure TFIngresos.anular;
begin
  if TaskMessageDlg(rsConfirma, format( rsConfirmaAnulacion, [ FTexto ]), mtWarning, mbYesNo, 0 ) = mrYes then
  begin
      vaciar_datos;
      nuevo;
  end;
end;

procedure TFIngresos.calcular_totales;
begin

end;

procedure TFIngresos.cerrar_archivos;
begin
  head.close;
  deta.close;
end;

procedure TFIngresos.detaAfterDelete(DataSet: TDataSet);
begin
  calcular_totales;
end;

procedure TFIngresos.detaAfterPost(DataSet: TDataSet);
begin
  calcular_totales;
end;

procedure TFIngresos.detaBeforePost(DataSet: TDataSet);
begin
  validar;
end;

function TFIngresos.esFechaCorrecta(f: TDateTime): boolean;
begin
  result := true; // despues vemos...
end;

procedure TFIngresos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cerrar_archivos;
end;

procedure TFIngresos.FormCreate(Sender: TObject);
begin
  FTexto := 'Operacion';
  abrir_archivos;
  FCodigo := '';
end;

function TFIngresos.grabar_operacion: integer;
begin
     if validar_operacion then
       if TaskMessageDlg(rsConfirma, format( rsConfirmaGrabacion, [ FTexto ]), mtconfirmation, mbYesNo, 0 ) = mrYes then
       begin
         if assigned ( FAccionGrabar ) then
         begin
          FNumero := FAccionGrabar( head, deta );
          if ( FNumero = 0) then
              raise Exception.Create(rsErrorOperacion);
         end
         else
          raise Exception.Create(rsCompelteAccionGrabar);
         try
            imprimir(FNumero);
         finally
            nuevo;
         end;
       end;
end;

procedure TFIngresos.grillaEnter(Sender: TObject);
begin
  if deta.RecordCount=0 then
    deta.Append;
end;

procedure TFIngresos.imprimir(numero: integer);
begin

end;

class procedure TFIngresos.New;
var
  FABM: TFIngresos;
begin
  FABM := Self.Create(application);
  try
    FABM.ShowModal;
  finally
    FABM.free;
  end;
end;

procedure TFIngresos.nuevo;
begin
  deta.EmptyDataSet;
  head.EmptyDataSet;

  head.Append;

  if assigned( FAccionConsulta ) then
    FAccionConsulta;

  if assigned( FAccionGetNumero ) then
    FNumero := FAccionGetNumero( FCodigo ) + 1;
  // completar asignacion
end;

procedure TFIngresos.SetCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TFIngresos.SetInforme(const Value: string);
begin
  FInforme := Value;
end;

procedure TFIngresos.SetNumero(const Value: integer);
begin
  FNumero := Value;
end;

procedure TFIngresos.Settexto(const Value: string);
begin
  Ftexto := Value;
end;

procedure TFIngresos.vaciar_datos;
begin
  head.EmptyDataSet;
  deta.EmptyDataSet;
end;

function TFIngresos.validar_operacion: boolean;
begin
  result := (validar);
end;

function TFIngresos.validar: boolean;
begin
    result := true;
end;


end.
