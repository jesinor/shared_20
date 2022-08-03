unit alta_md;

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

  TFAlta_md = class(TForm)
    head: TFDMemTable;
    headCODIGO: TStringField;
    headNUMERO: TIntegerField;
    headFECHA: TDateTimeField;
    headLEYENDA: TStringField;
    headGENERO: TStringField;
    headOBSERVACIONES: TMemoField;
    headTOTAL: TCurrencyField;
    DsHead: TDataSource;
    Dsdet: TDataSource;
    deta: TFDMemTable;
    detaCODIGO: TStringField;
    detaDESCRIPCION: TStringField;
    detaOBSERVACIONES: TStringField;
    Ac: TActionList;
    acGrabar: TAction;
    acSalir: TAction;
    acanular: TAction;
    imglst: TImageList;
    jvIni: TJvAppIniFileStorage;
    jvForm: TJvFormStorage;
    pnlHead: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cxNumero: TcxDBSpinEdit;
    cxFecha: TcxDBDateEdit;
    cxGenero: TcxDBTextEdit;
    cxDBMemo1: TcxDBMemo;
    cxbenef: TcxDBTextEdit;
    pnlBody: TPanel;
    grilla: TcxGrid;
    vista: TcxGridDBTableView;
    vistaCODIGO: TcxGridDBColumn;
    vistaDESCRIPCION: TcxGridDBColumn;
    vistaOBSERVACIONES: TcxGridDBColumn;
    nivel: TcxGridLevel;
    pnlFoot: TPanel;
    btnGrabar: TBitBtn;
    btnAnular: TBitBtn;
    btnSalir: TBitBtn;
    Label4: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    detaDEBE: TFloatField;
    detaHABER: TFloatField;
    detaTOTDEBE: TAggregateField;
    detaTOTHABER: TAggregateField;
    vistaDEBE: TcxGridDBColumn;
    vistaHABER: TcxGridDBColumn;
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
    FAyuda: string;

    procedure vaciar_datos;

    function validar_operacion: boolean;

    procedure SetInforme(const Value: string);
    procedure Settexto(const Value: string);
    procedure SetCodigo(const Value: string);
    procedure SetNumero(const Value: integer);
    procedure SetAyuda(const Value: string);
  protected
    circular: boolean;
    FGenero, FTerminal: string;

  public
    { Public declarations }
    FAccionConsulta: Procedure of object;
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

    function validar_head: boolean; virtual;
    function validar_items: boolean; virtual;

    property Informe: string read FInforme write SetInforme;
    property texto: string read Ftexto write Settexto;
    property Codigo: string read FCodigo write SetCodigo;
    property Numero: integer read FNumero write SetNumero;
    property Ayuda: string read FAyuda write SetAyuda;
  end;

var
  FAlta_md: TFAlta_md;

implementation
{$R *.dfm}

{ TFIngAsiento }

procedure TFAlta_md.abrir_archivos;
begin
  head.Open;
  deta.Open;

  if assigned( FAccionConsulta ) then
    FAccionConsulta;
end;

procedure TFAlta_md.acanularExecute(Sender: TObject);
begin
  anular;
end;

procedure TFAlta_md.acGrabarExecute(Sender: TObject);
begin
  grabar_operacion;
end;

procedure TFAlta_md.acSalirExecute(Sender: TObject);
begin
     close;
end;

procedure TFAlta_md.anular;
begin
  if TaskMessageDlg(rsConfirma, format( rsConfirmaAnulacion, [ FTexto ]), mtWarning, mbYesNo, 0 ) = mrYes then
  begin
      vaciar_datos;
      nuevo;
  end;
end;

procedure TFAlta_md.calcular_totales;
begin
  headTOTAL.Value := 0;
  if (detaTOTDEBE.Value<>null) then
    headTOTAL.Value := detaTOTDEBE.Value;
  if (detaTOTHABER.Value<>null) then
    headTOTAL.Value := headTOTAL.Value - detaTOTHABER.Value;
end;

procedure TFAlta_md.cerrar_archivos;
begin
  head.close;
  deta.close;
end;

procedure TFAlta_md.detaAfterDelete(DataSet: TDataSet);
begin
  calcular_totales;
end;

procedure TFAlta_md.detaAfterPost(DataSet: TDataSet);
begin
  calcular_totales;
end;

procedure TFAlta_md.detaBeforePost(DataSet: TDataSet);
begin
  validar_items;
end;

function TFAlta_md.esFechaCorrecta(f: TDateTime): boolean;
begin
  result := true; // despues vemos...
end;

procedure TFAlta_md.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cerrar_archivos;
end;

procedure TFAlta_md.FormCreate(Sender: TObject);
begin
  FTexto := 'Operacion';
  abrir_archivos;
  FCodigo := 'ASTO';
  FAyuda := ctIndice;
end;

function TFAlta_md.grabar_operacion: integer;
begin
     if validar_operacion then
       if TaskMessageDlg(rsConfirma, format( rsConfirmaGrabacion, [ FTexto ]), mtconfirmation, mbYesNo, 0 ) = mrYes then
       begin
         FNumero := FAccionGrabar( head, deta );
         if ( FNumero = 0) then
            raise Exception.Create(rsErrorOperacion);
         try
            imprimir(FNumero);
         finally
            nuevo;
         end;
       end;
end;

procedure TFAlta_md.grillaEnter(Sender: TObject);
begin
  if deta.RecordCount=0 then
    deta.Append;
end;

procedure TFAlta_md.imprimir(numero: integer);
begin

end;

class procedure TFAlta_md.New;
var
  FABM: TFAlta_md;
begin
  FABM := Self.Create(application);
  try
    FABM.ShowModal;
  finally
    FABM.free;
  end;
end;

procedure TFAlta_md.nuevo;
begin
  deta.EmptyDataSet;
  head.EmptyDataSet;

  head.Append;

  if assigned( FAccionGetNumero ) then
    FNumero := FAccionGetNumero( FCodigo ) + 1;
  headNumero.Value := FNumero;
  headCODIGO.Value := FCodigo;
end;

procedure TFAlta_md.SetAyuda(const Value: string);
begin
  FAyuda := Value;
end;

procedure TFAlta_md.SetCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TFAlta_md.SetInforme(const Value: string);
begin
  FInforme := Value;
end;

procedure TFAlta_md.SetNumero(const Value: integer);
begin
  FNumero := Value;
end;

procedure TFAlta_md.Settexto(const Value: string);
begin
  Ftexto := Value;
end;

procedure TFAlta_md.vaciar_datos;
begin
  head.EmptyDataSet;
  deta.EmptyDataSet;
end;

function TFAlta_md.validar_operacion: boolean;
begin
  result := (validar_head) and (validar_items);
end;

function TFAlta_md.validar_head: boolean;
begin
  result := true;
end;

function TFAlta_md.validar_items: boolean;
begin
  result := true;
end;

end.
