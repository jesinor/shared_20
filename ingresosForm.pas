unit ingresosForm;

interface

uses Forms, SysUtils, classes, ingresos, Data.DB, tipos, dialogs;

type
 TIngresosForm_Class = class of TFIngresos;

 IIngresos = interface
['{FA532A93-68BD-473A-A9F8-BFC14A4ADD1C}']
    function getForm: TFIngresos;
    procedure mostrarForm;
    procedure nuevo;
    procedure anular;
    procedure operar;
 end;

 TIngresosForm = class(TInterfacedObject, IIngresos)
 private
   ContainedForm: TFIngresos;
   Terminal: string;

 public
   constructor Create(AFormClass : TIngresosForm_Class );
   destructor destroy; override;

   function getForm: TFIngresos;
   procedure mostrarForm;
   procedure nuevo;
   procedure anular;
   procedure operar;
   procedure setTerminal( const FTerminal: string );
 end;

implementation

procedure TIngresosForm.anular;
begin
  ContainedForm.anular;
end;

constructor TIngresosForm.Create(AFormClass: TIngresosForm_Class );
begin
    ContainedForm := AFormClass.Create(nil);
    if (ContainedForm.Informe = '') then
      ContainedForm.Informe := ContainedForm.Name;
end;

destructor TIngresosForm.destroy;
begin
  if Assigned(ContainedForm) then
   FreeAndNil(ContainedForm);
  inherited;
end;

function TIngresosForm.getForm: TFIngresos;
begin
  result := ContainedForm;
end;


procedure TIngresosForm.mostrarForm;
begin
  ContainedForm.Showmodal;
end;

procedure TIngresosForm.nuevo;
begin
  ContainedForm.nuevo;
end;

procedure TIngresosForm.operar;
begin
  ContainedForm.nuevo;
  ContainedForm.Showmodal;
end;

procedure TIngresosForm.setTerminal(const FTerminal: string);
begin
  Terminal := FTerminal;

end;

end.
