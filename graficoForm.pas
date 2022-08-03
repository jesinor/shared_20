unit graficoForm;

interface

uses Forms, SysUtils, classes, graficoBase, Data.DB, tipos, consform, dialogs;

type
 TGraficoFormClass = class of TFGraficoBase;

 IGraficoForm = interface
 ['{2D983D42-ED7C-40B7-9920-78DC94450D67}']
    procedure mostrarForm;
    procedure activar;
    function getForm: TFGraficoBase;
    procedure setRangoFechas( FIni, FFin: TDateTime);
    procedure setInforme( informe: string );
 end;

 TIGraficoForm = class(TInterfacedObject, IGraficoForm)
 private
   DataModulo: TDataModule;
   ContainedForm: TFGraficoBase;
   Terminal: string;

 public
   constructor Create(AFormClass : TGraficoFormClass);
   constructor soloCrear(AFormClass : TGraficoFormClass);
   destructor destroy; override;

   function getForm: TFGraficoBase;
   procedure mostrarForm;
   procedure activar;
   procedure setTerminal( const FTerminal: string );
   procedure setRangoFechas( FIni, FFin: TDateTime);
   procedure setInforme( informe: string );

 end;

implementation

{ TIForm }
procedure TIGraficoForm.activar;
begin
  ContainedForm.abrirConsulta;
  ContainedForm.Showmodal;
end;

constructor TIGraficoForm.Create(AFormClass: TGraficoFormClass);
begin
    ContainedForm := AFormClass.Create(nil);
    if (not assigned( ContainedForm.FAccionConsulta)) then
      ContainedForm.FAccionConsulta := nil;
    if (ContainedForm.Informe = '') then
      ContainedForm.Informe := ContainedForm.Name;

    // ContainedForm.Showmodal;
end;

destructor TIGraficoForm.destroy;
begin
  if Assigned(ContainedForm) then
   FreeAndNil(ContainedForm);
  inherited;
end;

function TIGraficoForm.getForm: TFGraficoBase;
begin
  result := ContainedForm;
end;

procedure TIGraficoForm.mostrarForm;
begin
  ContainedForm.Showmodal;
end;

procedure TIGraficoForm.setInforme(informe: string);
begin
  Containedform.Informe := informe;
end;

procedure TIGraficoForm.setRangoFechas(FIni, FFin: TDateTime);
begin
  if Assigned(ContainedForm) then
  begin
    ContainedForm.Ini := trunc( FIni );
    ContainedForm.Fin := trunc( FFin );
  end;
end;

procedure TIGraficoForm.setTerminal(const FTerminal: string);
begin
  Terminal := FTerminal;
end;

constructor TIGraficoForm.soloCrear(AFormClass: TGraficoFormClass);
begin
  ContainedForm := AFormClass.Create(nil);
end;

end.
