unit abmForm_md;

interface

uses Forms, SysUtils, classes, alta_md, Data.DB, tipos, dialogs;

type
 TABMForm_mdClass = class of TFAlta_md;
 TDataModuleClass = class of TDataModule;

 IABMForm_md = interface
['{BD54CDC0-1FB2-4032-97BA-845BF50B48F4}']
    function getForm: TFAlta_md;
    procedure mostrarForm;
    procedure nuevo;
    procedure anular;
 end;

 TMdForm = class(TInterfacedObject, IABMForm_md)
 private
   DataModulo: TDataModule;
   ContainedForm: TFAlta_md;
   Terminal: string;

 public
   constructor Create(AFormClass : TABMForm_mdClass; const codigo: string );
   constructor soloCrear(AFormClass : TABMForm_mdClass; const codigo: string );
   destructor destroy; override;

   function getForm: TFAlta_md;
   procedure mostrarForm;
   procedure nuevo;
   procedure anular;
   procedure setTerminal( const FTerminal: string );
 end;

implementation

procedure TMdForm.anular;
begin
  ContainedForm.anular;
end;

constructor TMdForm.Create(AFormClass: TABMForm_mdClass; const codigo: string );
begin
    ContainedForm := AFormClass.Create(nil);
    if (ContainedForm.Informe = '') then
      ContainedForm.Informe := ContainedForm.Name;
    ContainedForm.codigo := codigo;
    // ContainedForm.Showmodal;
end;

destructor TMdForm.destroy;
begin
  if Assigned(ContainedForm) then
   FreeAndNil(ContainedForm);
  inherited;
end;

function TMdForm.getForm: TFAlta_md;
begin
  result := ContainedForm;
end;


procedure TMdForm.mostrarForm;
begin
  ContainedForm.Showmodal;
end;

procedure TMdForm.nuevo;
begin
  ContainedForm.nuevo;
end;

procedure TMdForm.setTerminal(const FTerminal: string);
begin
  Terminal := FTerminal;

end;

constructor TMdForm.soloCrear(AFormClass: TABMForm_mdClass; const codigo: string);
begin
  ContainedForm := AFormClass.Create(nil);
  ContainedForm.codigo := codigo;
end;

end.
