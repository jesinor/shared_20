unit consForm;

interface

uses Forms, SysUtils, classes, Cons_2015, Data.DB, generics.collections,
cxGridDBTableView, tipos, dialogs, cxDropDownEdit,
cxDBLookupComboBox, cxEdit;

type
  TFConsClass = class of TFCons_2015;
  TDataModuleClass = class of TDataModule;

  IConsForm = interface
    ['{CD866576-9C35-4551-86F0-A57230DA9F17}']
      procedure setOrden( idx: string );
      procedure setDataSet( Data: TDataSet );
      procedure setRangoFechas( FIni, FFin: TDateTime);
      procedure setCamposLookup( F: TrLookupCampos );
      procedure setInforme( informe: string );
      procedure generarColumnas;
      procedure mostrar;
      procedure habilitarSeleccion;
      function haySeleccion: boolean;
      function getValorSeleccionado: variant;
      function getForm: TFConsClass;
      procedure getFechas( var FIni, FFin: TDateTime );
      function getFechaInicio: TDateTime;
      function getFechaFinal: TDateTime;
      procedure free;
  end;

  TIConsForm = class (TInterfacedObject, IConsForm )
   ContainedForm : TFCons_2015;
  private
    FLookupCampos: TrLookupCampos;
    procedure setPropiedades( Sender: TObject );
  public
    procedure setOrden( idx: string );
    procedure setDataSet( Data: TDataSet );
    procedure setRangoFechas( FIni, FFin: TDateTime);
    procedure setCamposLookup( F: TrLookupCampos );
    procedure setInforme( informe: string );
    procedure generarColumnas;
    procedure mostrar;
    procedure habilitarSeleccion;
    function haySeleccion: boolean;
    function getValorSeleccionado: variant;
    function getForm: TFConsClass;
    procedure getFechas( var FIni, FFin: TDateTime );
    function getFechaInicio: TDateTime;
    function getFechaFinal: TDateTime;
    procedure free;

    constructor Create(AFormClass : TFConsClass; a: array of TDataModuleClass);
    destructor destroy; override;

  end;

implementation

{ TConsForm }

procedure TIConsForm.generarColumnas;
begin
  Containedform.FCrearColumnas := true;
end;

constructor TIConsForm.Create(AFormClass : TFConsClass; a: array of TDataModuleClass);
var
  I: Integer;
begin
    for I := 0 to High(a) do
      if a[i]<>nil then
        a[i].create(nil);
    ContainedForm := AFormClass.Create(nil);
end;

destructor TIConsForm.destroy;
begin
  {if Assigned( FLookupcampos ) then
    FreeAndNil( FLookupCampos );
  }
  if Assigned(ContainedForm) then
   FreeAndNil(ContainedForm);
  inherited;
end;

procedure TIConsForm.free;
begin
  if Assigned(ContainedForm) then
   FreeAndNil(ContainedForm);
end;

function TIConsForm.getFechaFinal: TDateTime;
begin
  Result := ContainedForm.Fin;
end;

function TIConsForm.getFechaInicio: TDateTime;
begin
  Result := ContainedForm.Ini;
end;

procedure TIConsForm.getFechas(var FIni, FFin: TDateTime);
begin
  FIni := ContainedForm.Ini;
  FFin := ContainedForm.Fin;
end;

function TIConsForm.getForm: TFConsClass;
begin
  Result := TFConsClass( ContainedForm );
end;

function TIConsForm.getValorSeleccionado: variant;
begin
  Result := ContainedForm.IdSeleccionado;
end;

procedure TIConsForm.habilitarSeleccion;
begin
  if Assigned(ContainedForm) then
    ContainedForm.HabilitarSeleccion := true;
end;

function TIConsForm.haySeleccion: boolean;
begin
  if Assigned(ContainedForm) then
    Result := ContainedForm.HaySeleccion;
end;

procedure TIConsForm.mostrar;
begin
  if Assigned(ContainedForm) then
  begin
      ContainedForm.Nocerrar := true;
      ContainedForm.requeryConsulta;
      ContainedForm.Showmodal;
  end;
end;


procedure TIConsForm.setCamposLookup(F: TrLookupCampos);
begin
  {if not Assigned( FLookupcampos ) then
    FLookupCampos := TrLookupCampos.create;}
  FLookupCampos := F;
  ContainedForm.FPropiedades := setPropiedades;
end;

procedure TIConsForm.setDataSet(Data: TDataSet);
begin
  if Assigned(ContainedForm) then
    ContainedForm.ds.DataSet := data;
end;

procedure TIConsForm.setInforme(informe: string);
begin
  Containedform.Informe := informe;
end;

procedure TIConsForm.setOrden(idx: string);
begin
  if Assigned(ContainedForm) then
    ContainedForm.configurar( idx );
end;

procedure TIConsForm.setPropiedades(Sender: TObject);
var
  r: rLookupCampos;
  v: TcxGridDBTableView;
  i: TcxLookupComboBox;
  c: tcxGridDbcolumn;
  ri: TcxCustomEditProperties;
begin
  // aca cargamos los campos en la vista de la grilla
  // v := TcxGridDBTableView( Sender );
  if Assigned( FLookupCampos ) then
    for r in FLookupCampos do
    begin
      c := TcxGridDBTableView( Sender ).GetColumnByFieldName(r.Campo);
      c.PropertiesClass := TcxLookupComboBoxProperties;
      TcxLookupComboBoxProperties( c.Properties).ListSource := r.Tabla;
      TcxLookupComboBoxProperties( c.Properties).ListFieldNames := r.Listcampos;
      TcxLookupComboBoxProperties( c.Properties).KeyFieldNames := r.Idx;
    end;
end;

procedure TIConsForm.setRangoFechas(FIni, FFin: TDateTime);
begin
  if Assigned(ContainedForm) then
  begin
    ContainedForm.Ini := trunc( FIni );
    ContainedForm.Fin := trunc( FFin );
  end;
end;

end.
