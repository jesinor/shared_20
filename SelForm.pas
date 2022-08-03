unit SelForm;

interface

uses Forms, SysUtils, classes, Seleccion, Data.DB, generics.collections,
tipos, dialogs, controls, variants;

type
  TFSelClass = class of TFSeleccion;
  TDataModuleClass = class of TDataModule;

  ISelForm = interface
    ['{9B0811FA-C0EF-45E7-A18C-D5F61B06960C}']

      procedure setDataSet( Data: TDataSet );
      function mostrar: boolean;
      function getResultado: boolean;
      function getForm: TFSelClass;
  end;

  TISelForm = class (TInterfacedObject, ISelForm )
   ContainedForm : TFSeleccion;
  private
    FResultado: boolean;
    FValorDevuelto: variant;
  public
    procedure setDataSet( Data: TDataSet );
    function mostrar: boolean;
    function getResultado: boolean;
    function getForm: TFSelClass;

    constructor Create(AFormClass : TFSelClass); overload;
    constructor Create(AFormClass : TFSelClass; var resultado: variant; const campo: string); overload;
    destructor destroy; override;
  end;

implementation

{ TConsForm }

constructor TISelForm.Create(AFormClass : TFSelClass);
begin
    ContainedForm := AFormClass.Create(nil);
end;

constructor TISelForm.Create(AFormClass: TFSelClass; var resultado: variant; const campo: string);
begin
  ContainedForm := AFormClass.Create( nil, campo );
  ContainedForm.showmodal;
  if ContainedForm.ModalResult = mrOK then
    resultado := ContainedForm.Resultado;
end;

destructor TISelForm.destroy;
begin
  if Assigned(ContainedForm) then
   FreeAndNil(ContainedForm);
  inherited;
end;

function TISelForm.getForm: TFSelClass;
begin
  Result := TFSelClass( ContainedForm );
end;

function TISelForm.getResultado: boolean;
begin
  Result := FResultado;
end;

function TISelForm.mostrar: boolean;
begin
  if Assigned(ContainedForm) then
  begin
      ContainedForm.requeryConsulta;
      ContainedForm.Showmodal;
      Result := ( ContainedForm.ModalResult = mrOK );
  end;
end;

procedure TISelForm.setDataSet(Data: TDataSet);
begin
  if Assigned(ContainedForm) then
    ContainedForm.ds.DataSet := data;
end;

end.
