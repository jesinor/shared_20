unit SelForm19;

interface

uses Forms, SysUtils, classes, Seleccion19, Data.DB, generics.collections,
tipos, dialogs, controls, variants;

type
  TFSelClass = class of TFSeleccion19;
  TDataModuleClass = class of TDataModule;

  ISelForm19 = interface
    ['{A3E56770-F570-4F9C-9202-4150723B4219}']
      procedure setDataSet( Data: TDataSet );
      function mostrar: boolean;
      function getResultado: boolean;
      function getForm: TFSelClass;
  end;

  TISelForm19 = class (TInterfacedObject, ISelForm19 )
   ContainedForm : TFSeleccion19;
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

constructor TISelForm19.Create(AFormClass : TFSelClass);
begin
    ContainedForm := AFormClass.Create(nil);
end;

constructor TISelForm19.Create(AFormClass: TFSelClass; var resultado: variant; const campo: string);
begin
  ContainedForm := AFormClass.Create( nil, campo );
  ContainedForm.showmodal;
  if ContainedForm.ModalResult = mrOK then
    resultado := ContainedForm.Resultado;
end;

destructor TISelForm19.destroy;
begin
  if Assigned(ContainedForm) then
   FreeAndNil(ContainedForm);
  inherited;
end;

function TISelForm19.getForm: TFSelClass;
begin
  Result := TFSelClass( ContainedForm );
end;

function TISelForm19.getResultado: boolean;
begin
  Result := FResultado;
end;

function TISelForm19.mostrar: boolean;
begin
  if Assigned(ContainedForm) then
  begin
      ContainedForm.requeryConsulta;
      ContainedForm.Showmodal;
      Result := ( ContainedForm.ModalResult = mrOK );
  end;
end;

procedure TISelForm19.setDataSet(Data: TDataSet);
begin
  if Assigned(ContainedForm) then
    ContainedForm.ds.DataSet := data;
end;

end.
