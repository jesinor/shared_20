unit alta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList, generics.collections,
  Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.StdCtrls, Data.DB, Vcl.DBCtrls,
  cons_2015, consform, tipos, JvFormPlacement, JvComponentBase, JvAppStorage,
  JvAppIniStorage, cxClasses, cxLookAndFeels,
  Vcl.Buttons,
  constantes,
  ayuda,
  mensaje,
  FireDac.comp.Dataset,
  FireDac.Stan.ExprFuncs, dxSkinsForm, dxSkinsCore, dxSkinCoffee,
  dxSkinGlassOceans, dxSkinLondonLiquidSky, dxSkinStardust, dxSkinTheBezier,
  Vcl.ComCtrls, Vcl.DBActns;

resourcestring
  rsAnuleEdicion = 'Antes de navegar primero finalice con la edicion';

type
  TFAlta = class(TForm)
    img: TImageList;
    pnlHead: TPanel;
    pnlBottom: TPanel;
    pnlBody: TPanel;
    Ac: TActionList;
    acGrabar: TAction;
    acNext: TAction;
    acAnular: TAction;
    Ds: TDataSource;
    acInsertar: TAction;
    acBuscar: TAction;
    acConsultar: TAction;
    lblTit: TLabel;
    DBNavega: TDBNavigator;
    acImportar: TAction;
    jvIni: TJvAppIniFileStorage;
    jvForm: TJvFormStorage;
    dxSkin: TdxSkinController;
    btnBus: TBitBtn;
    btnImpo: TBitBtn;
    btnAnu: TBitBtn;
    btnNext: TBitBtn;
    btnInsert: TBitBtn;
    btnPost: TBitBtn;
    btnAct: TBitBtn;
    btnUpd: TAction;
    cbCampos: TComboBox;
    edBuscar: TEdit;
    sbBuscar: TSpeedButton;
    lblResultado: TLabel;
    acFiltrar: TAction;
    acLimpiarFiltro: TAction;
    spFiltro: TSpeedButton;
    SpeedButton2: TSpeedButton;
    btnAyuda: TBitBtn;
    acAyuda: TAction;
    sb: TStatusBar;
    DatasetFirst1: TDataSetFirst;
    DatasetPrior1: TDataSetPrior;
    DatasetNext1: TDataSetNext;
    DatasetLast1: TDataSetLast;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DsStateChange(Sender: TObject);
    procedure acGrabarExecute(Sender: TObject);
    procedure acBuscarExecute(Sender: TObject);
    procedure acInsertarExecute(Sender: TObject);
    procedure acAnularExecute(Sender: TObject);
    procedure acNextExecute(Sender: TObject);
    procedure acConsultarExecute(Sender: TObject);
    procedure btnImpoClick(Sender: TObject);
    procedure acImportarExecute(Sender: TObject);
    procedure btnUpdExecute(Sender: TObject);
    procedure edBuscarEnter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure acFiltrarExecute(Sender: TObject);
    procedure acLimpiarFiltroExecute(Sender: TObject);
    procedure acAyudaExecute(Sender: TObject);
    function FormHelp(Command: Word; Data: NativeInt;
      var CallHelp: Boolean): Boolean;
  private
    { Private declarations }
    FControlActivo: TWinControl;
    FIdx: string;
    FInforme: string;
    options: TFDDatasetLocateOptions;
    FAyuda: string;

    procedure grabar;
    procedure insertar;
    procedure anular;
    procedure checarEdicion;

    procedure setearBtn( ins: boolean );
    function getPrimerControl: TWinControl;
    procedure SetControlActivo(const Value: TWinControl);
    procedure SetIdx(const Value: string);
    procedure SetInforme(const Value: string);
    procedure abrirTabla;
    procedure cerrarTabla;
    procedure SetAyuda(const Value: string);
  protected
    FListaCampoDataSource: TListaCampoDataSource;
    procedure setRelacionCampoDataSource; virtual;
  public
    { Public declarations }
    ClaseConsulta: TFConsClass;
    FAccionConsulta: Procedure of object;
    FAccionRefresh: Procedure of object;

    class procedure New; virtual;

    procedure importarDatos; virtual;
    function getLookupDs( const campo: string ): TDataSource;

    property ControlActivo: TWinControl read FControlActivo write SetControlActivo;
    property Idx: string read FIdx write SetIdx;
    property Informe: string read FInforme write SetInforme;
    property Ayuda: string read FAyuda write SetAyuda;
  end;

var
  FAlta: TFAlta;

implementation

{$R *.dfm}

procedure TFAlta.abrirTabla;
begin
  if not ( ds.DataSet.Active ) then
  begin
    ds.DataSet.open;
  end;
end;

procedure TFAlta.acAnularExecute(Sender: TObject);
begin
    ds.DataSet.cancel;
end;

procedure TFAlta.acAyudaExecute(Sender: TObject);
begin
    TAyuda.mostrar_ayuda( sistema_sisnob, FAyuda );
end;

procedure TFAlta.acBuscarExecute(Sender: TObject);
var
  campo, buscar: string;
begin
  if cbCampos.ItemIndex > -1 then
  begin
    campo := cbCampos.Items[cbCampos.ItemIndex];
    buscar := edBuscar.Text;
    if not  ( TFDDataSet( ds.DataSet ).LocateEx(campo, buscar, options )) then
    begin
      lblResultado.Caption := rsNoEncontrado;
      options := options - [lxoFromCurrent];
    end
    else
    begin
      lblResultado.Caption := 'Encontrado ' + ds.DataSet.FieldByName( campo ).AsString;
      options := options + [lxoFromCurrent];
    end;
  end;
end;

procedure TFAlta.acConsultarExecute(Sender: TObject);
begin
    if Assigned(FAccionConsulta) then
      FAccionConsulta;
end;

procedure TFAlta.acFiltrarExecute(Sender: TObject);
var
  buscar, cad, campo: string;
begin
  if cbCampos.ItemIndex > -1 then
  begin
    campo := cbCampos.Items[cbCampos.ItemIndex];
    cad := '%' + edBuscar.Text + '%';
    buscar  := campo + ' LIKE ' + quotedstr( cad );
    TFDDataSet( ds.DataSet ).FilterOptions := [focaseInsensitive ];
    TFDDataSet( ds.DataSet ).Filter :=  buscar;
    TFDDataSet( ds.DataSet ).filtered := true;
    if TFDDataSet( ds.DataSet ).IsEmpty then
    begin
      TFDDataSet( ds.DataSet ).filtered := false;
      lblResultado.Caption := rsNoEncontrado;
    end
    else
      lblResultado.Caption := 'Encontrado ' + ds.DataSet.FieldByName( campo ).AsString;
  end;
end;

procedure TFAlta.acGrabarExecute(Sender: TObject);
begin
  grabar;
end;

procedure TFAlta.acImportarExecute(Sender: TObject);
begin
     importarDatos;
end;

procedure TFAlta.acInsertarExecute(Sender: TObject);
begin
  insertar;
end;

procedure TFAlta.acLimpiarFiltroExecute(Sender: TObject);
begin
    TFDDataSet( ds.DataSet ).filtered := false;
end;

procedure TFAlta.acNextExecute(Sender: TObject);
begin
  grabar;
  insertar;
end;

procedure TFAlta.anular;
begin
  ds.DataSet.Cancel;
end;

procedure TFAlta.btnImpoClick(Sender: TObject);
begin
  checarEdicion;
  importarDatos;
end;

procedure TFAlta.btnUpdExecute(Sender: TObject);
begin
  screen.Cursor := crHourglass;
  try
    if Assigned( FAccionRefresh ) then
    begin
      cerrarTabla;
      FAccionRefresh;
      abrirTabla;
      ds.DataSet.last;
    end;
  finally
    screen.Cursor := crDefault;
  end;
end;

procedure TFAlta.cerrarTabla;
begin
  try
    ds.DataSet.close;
  except
  end;
end;

procedure TFAlta.checarEdicion;
begin
  // Por ahora queda anulado ya que no estoy decidido si es una buena opcion.
  if (ds.State in [dsEdit, dsInsert]) then
    raise Exception.Create(rsAnuleEdicion);
end;

procedure TFAlta.DsStateChange(Sender: TObject);
begin
  screen.Cursor := crHourglass;
  if (ds.State in [dsinsert, dsedit]) then
  begin
    setearbtn( true );
    if (ds.State in [dsInsert]) then
      ActiveControl := FControlActivo;
  end
  else
    setearbtn( false );
  screen.Cursor := crDefault;
end;

procedure TFAlta.edBuscarEnter(Sender: TObject);
begin
  edBuscar.SelectAll;
end;

procedure TFAlta.FormActivate(Sender: TObject);
begin
     if cbCampos.ItemIndex = -1 then
        cbCampos.ItemIndex := 0;
end;

procedure TFAlta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    cerrarTabla;
end;

procedure TFAlta.FormCreate(Sender: TObject);
begin
  try
    ClaseConsulta := TFCons_2015;
    abrirTabla;
    Options := [ lxoCaseInsensitive, lxoPartialKey{, lxoFromCurrent} ];
    FAyuda := ctIndice;
  except
    on e:exception do
      showmessage( e.message );
  end;
end;

function TFAlta.FormHelp(Command: Word; Data: NativeInt;
  var CallHelp: Boolean): Boolean;
begin
    TAyuda.mostrar_ayuda( sistema_sisnob, 'indice' );
end;

function TFAlta.getLookupDs(const campo: string): TDataSource;
begin
  try
      if assigned(FListaCampoDataSource) then
        FListaCampoDataSource.TryGetValue(campo, Result);
  except
        Result := nil;
  end;
end;

function TFAlta.getPrimerControl: TWinControl;
begin
  Result := nil;
end;

procedure TFAlta.grabar;
begin
  try
    ds.DataSet.Post;
  finally
    sb.Panels[1].Text := Mensaje.TFMensaje.leer_mensaje;
  end;

end;

procedure TFAlta.importarDatos;
begin
  // a ser llamada por descendente
end;

procedure TFAlta.insertar;
begin
    ds.DataSet.Append;
    ActiveControl := FControlActivo;
end;

class procedure TFAlta.New;
var
  FABM: TFAlta;
begin
  FABM := Self.Create(application);
  try
    FABM.ShowModal;
  finally
    FABM.free;
  end;
end;

procedure TFAlta.SetAyuda(const Value: string);
begin
  FAyuda := Value;
end;

procedure TFAlta.SetControlActivo(const Value: TWinControl);
begin
  FControlActivo := Value;
end;

procedure TFAlta.setearBtn(ins: boolean);
begin
  acGrabar.Enabled := ins;
  acNext.Enabled := ins;
  acAnular.Enabled := ins;
  acInsertar.Enabled := not ins;

  acBuscar.Enabled := acInsertar.Enabled;
  cbCampos.Enabled := acInsertar.Enabled;
end;

procedure TFAlta.SetIdx(const Value: string);
begin
  FIdx := Value;
end;

procedure TFAlta.SetInforme(const Value: string);
begin
  FInforme := Value;
end;

procedure TFAlta.setRelacionCampoDataSource;
begin
  // completar pares <campo, ds>
  if not Assigned(FListaCampoDataSource) then
    FListaCampoDataSource := TListaCampoDataSource.create;
end;

end.
