unit abmForm;

interface

uses Forms, SysUtils, classes, Alta, Data.DB, tipos, consform, dialogs;

type
 TABMFormClass = class of TFAlta;
 TDataModuleClass = class of TDataModule;

 IABMForm = interface
 ['{2D983D42-ED7C-40B7-9920-78DC94450D67}']
    procedure setCamposLookup( const campo: string; listSource: TDataSource; const KeyField, ListField: string );
    procedure mostrarConsulta;
    function getForm: TFAlta;
    procedure mostrarForm;
 end;

 TIForm = class(TInterfacedObject, IABMForm)
 private
   DataModulo: TDataModule;
   ContainedForm: TFAlta;
   Terminal: string;

   FLookupCampos: TrLookupCampos;
 public
   constructor Create(AFormClass : TABMFormClass; a: array of TDataModuleClass);
   constructor soloCrear(AFormClass : TABMFormClass; a: array of TDataModuleClass);
   destructor destroy; override;

   function getForm: TFAlta;
   procedure setCamposLookup( const campo: string; listSource: TDataSource; const KeyField, ListField: string );
   procedure mostrarConsulta;
   procedure mostrarForm;
   procedure setTerminal( const FTerminal: string );
 end;

implementation

{ TIForm }
constructor TIForm.Create(AFormClass: TABMFormClass; a: array of TDataModuleClass);
var
  I: Integer;
begin
    for I := 0 to High(a) do
      if a[i]<>nil then
        a[i].create(nil);

    ContainedForm := AFormClass.Create(nil);
    if (not assigned( ContainedForm.FAccionConsulta)) then
      ContainedForm.FAccionConsulta := mostrarConsulta;
    if (ContainedForm.Informe = '') then
      ContainedForm.Informe := ContainedForm.Name;

    ContainedForm.Showmodal;
end;

destructor TIForm.destroy;
begin
  if Assigned( FLookupcampos ) then
    FLookupCampos.free;
  if Assigned(ContainedForm) then
   FreeAndNil(ContainedForm);
  inherited;
end;

function TIForm.getForm: TFAlta;
begin
  result := ContainedForm;
end;

procedure TIForm.mostrarConsulta;
var
  F: IConsForm;
begin
  F := TIConsForm.Create( ContainedForm.ClaseConsulta, [] );
  F.setDataSet(ContainedForm.Ds.DataSet);
  F.setOrden( ContainedForm.Idx );
  F.setCamposLookup( FLookupCampos );
  F.setInforme( ContainedForm.Informe );
  F.generarColumnas;
  F.mostrar;
end;

procedure TIForm.mostrarForm;
begin
  ContainedForm.Showmodal;
end;

procedure TIForm.setCamposLookup(const campo: string; listSource: TDataSource;
  const KeyField, ListField: string);
var
  r: rLookupCampos;
begin
  if not Assigned( FLookupcampos ) then
    FLookupCampos := TrLookupCampos.create;

  r.Campo := campo;
  r.Tabla := listSource;
  r.Idx := KeyField;
  r.Listcampos := ListField;

  FLookupCampos.add(r);
end;

procedure TIForm.setTerminal(const FTerminal: string);
begin
  Terminal := FTerminal;
end;

constructor TIForm.soloCrear(AFormClass: TABMFormClass;
  a: array of TDataModuleClass);
var
  I: Integer;
begin
  for I := 0 to High(a) do
    if a[i]<>nil then
        a[i].create(nil);
  ContainedForm := AFormClass.Create(nil);
  ContainedForm.FAccionConsulta := mostrarConsulta;
end;

end.
