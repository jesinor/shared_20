unit altaForm_md;

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
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, constantes;

type
  TFABMForm_md = class(TForm)
    head: TFDMemTable;
    headCODIGO: TStringField;
    headNUMERO: TIntegerField;
    headFECHA: TDateTimeField;
    headDENOMINA: TStringField;
    headGENERO: TStringField;
    headOBSERVACIONES: TMemoField;
    headSUBTOTAL: TCurrencyField;
    headDEPOSITO: TWideStringField;
    headTOTAL: TCurrencyField;
    DsHead: TDataSource;
    Dsdet: TDataSource;
    deta: TFDMemTable;
    detaCODIGO: TStringField;
    detaDESCRIPCION: TStringField;
    detaCANTIDAD: TFloatField;
    detaPRECIO: TCurrencyField;
    detaOBSERVACIONES: TStringField;
    detaSUBTOTAL: TCurrencyField;
    detaTOTCANT: TAggregateField;
    detaTOTSUB: TAggregateField;
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
    vistaCANTIDAD: TcxGridDBColumn;
    vistaPRECIO: TcxGridDBColumn;
    vistaSUBTOTAL: TcxGridDBColumn;
    vistaOBSERVACIONES: TcxGridDBColumn;
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
    procedure headCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    circular: boolean;
    FGenero, FTerminal: string;
    FCodAsto: string;
    FNumero: integer;
    FInforme: string;

    procedure abrir_archivos;
    procedure cerrar_archivos;

    procedure vaciar_datos;
    procedure calcular_totales;

    function grabar_asiento: integer;
    procedure imprimir( numero: integer );

    function validar_operacion: boolean;
    function esFechaCorrecta( f: TDateTime ): boolean;

    procedure SetInforme(const Value: string);
  public
    { Public declarations }
    procedure nuevo;
    procedure anular;

    function validar_head: boolean; virtual;
    function validar_items: boolean; virtual;
    class procedure New; virtual;
    property Informe: string read FInforme write SetInforme;

  end;

var
  FABMForm_md: TFABMForm_md;

implementation
uses
  DMventas, ClientModuleUnit;
{$R *.dfm}

{ TFIngAsiento }

procedure TFABMForm_md.abrir_archivos;
begin
  head.Open;
  deta.Open;

  FDMVentas.getAuxAsientos;
end;

procedure TFABMForm_md.anular;
begin
  if TaskMessageDlg(rsConfirma, format( rsConfirmaAnulacion, [ 'Asiento contable' ]), mtWarning, mbYesNo, 0 ) = mrYes then
  begin
      vaciar_datos;
      nuevo;
  end;
end;

procedure TFABMForm_md.calcular_totales;
begin
  if (detaTOTSUB.Value<>null) then
    headSUBTOTAL.Value := detaTOTSUB.Value;
end;

procedure TFABMForm_md.cerrar_archivos;
begin
  with FDMVentas do
  try
    lookCuentas.Close;
    MConfiguracion.Close;
  finally

  end;

  head.close;
  deta.close;

end;

procedure TFABMForm_md.detaAfterDelete(DataSet: TDataSet);
begin
  calcular_totales;
end;

procedure TFABMForm_md.detaAfterPost(DataSet: TDataSet);
begin
  calcular_totales;
end;

function TFABMForm_md.esFechaCorrecta(f: TDateTime): boolean;
begin
  result := true; // despues vemos...
end;

procedure TFABMForm_md.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cerrar_archivos;
end;

procedure TFABMForm_md.FormCreate(Sender: TObject);
begin
  abrir_archivos;
  FCodAsto := 'ASTO';//FDMVentas.getConfiguracion
end;

function TFABMForm_md.grabar_asiento: integer;
begin
     if validar_asiento then
       if TaskMessageDlg(rsConfirma, format( rsConfirmaGrabacion, [ 'Asiento contable' ]), mtconfirmation, mbYesNo, 0 ) = mrYes then
       begin
         FNumero := grabar_asiento;
         if ( FNumero = 0) then
            raise Exception.Create(rsErrorasiento);
         try
            // imprimir(FNumero);
         finally
            nuevo;
         end;
       end;
end;

procedure TFABMForm_md.grillaEnter(Sender: TObject);
begin
  if deta.RecordCount=0 then
    deta.Append;
end;

procedure TFABMForm_md.headCalcFields(DataSet: TDataSet);
begin
  headTOTAL.Value := headSUBTOTAL.Value;
end;

procedure TFABMForm_md.imprimir(numero: integer);
begin

end;

class procedure TFABMForm_md.New;
var
  FABM: TFABMForm_md;
begin
  FABM := Self.Create(application);
  try
    FABM.ShowModal;
  finally
    FABM.free;
  end;
end;

procedure TFABMForm_md.nuevo;
begin
  deta.EmptyDataSet;
  head.EmptyDataSet;

  head.Append;
  FNumero := ClientModule.ServerMetodosClient.getUltinumero( FCodAsto ) + 1;
  headNumero.Value := FNumero;
  headCODIGO.Value := FCodAsto;
end;

procedure TFABMForm_md.SetInforme(const Value: string);
begin
  FInforme := Value;
end;

procedure TFABMForm_md.vaciar_datos;
begin
  head.EmptyDataSet;
  deta.EmptyDataSet;
end;

function TFABMForm_md.validar_operacion: boolean;
begin
  result := (validar_head) and (validar_items)
end;

function TFABMForm_md.validar_head: boolean;
begin
  result := false;
end;

function TFABMForm_md.validar_items: boolean;
begin
  result := false;
end;

end.
