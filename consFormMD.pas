unit consFormMD;

interface

uses Forms, SysUtils, classes, Cons_md, Data.DB, generics.collections,
cxGridDBTableView, tipos, dialogs, cxDropDownEdit,
cxDBLookupComboBox, cxEdit;

type
  TFConsMDClass = class of TFConsMD;

  IConsFormMD = interface
    ['{C29CC04B-031C-48E5-87CA-302F2B69BB35}']
      procedure setDataSet( Data: TDataSet );
      procedure setRangoFechas( FIni, FFin: TDateTime);
      procedure setInforme( informe: string );
      procedure mostrar;
      function getForm: TFConsMDClass;
      procedure getFechas( var FIni, FFin: TDateTime );
      function getFechaInicio: TDateTime;
      function getFechaFinal: TDateTime;
  end;

  TIConsFormMD = class (TInterfacedObject, IConsFormMD )
   ContainedForm : TFConsMD;
  public
    procedure setDataSet( Data: TDataSet );
    procedure setRangoFechas( FIni, FFin: TDateTime);
    procedure setInforme( informe: string );
    procedure mostrar;
    function getForm: TFConsMDClass;
    procedure getFechas( var FIni, FFin: TDateTime );
    function getFechaInicio: TDateTime;
    function getFechaFinal: TDateTime;

    constructor Create(AFormClass : TFConsMDClass);
    destructor destroy; override;

  end;

implementation

{ TConsForm }

constructor TIConsFormMD.Create(AFormClass : TFConsMDClass);
begin
    ContainedForm := AFormClass.Create(nil);
end;

destructor TIConsFormMD.destroy;
begin
  if Assigned(ContainedForm) then
   FreeAndNil(ContainedForm);
  inherited;
end;

function TIConsFormMD.getFechaFinal: TDateTime;
begin
  Result := ContainedForm.Fin;
end;

function TIConsFormMD.getFechaInicio: TDateTime;
begin
  Result := ContainedForm.Ini;
end;

procedure TIConsFormMD.getFechas(var FIni, FFin: TDateTime);
begin
  FIni := ContainedForm.Ini;
  FFin := ContainedForm.Fin;
end;

function TIConsFormMD.getForm: TFConsMDClass;
begin
  Result := TFConsMDClass( ContainedForm );
end;

procedure TIConsFormMD.mostrar;
begin
  if Assigned(ContainedForm) then
      ContainedForm.Showmodal;
end;

procedure TIConsFormMD.setDataSet(Data: TDataSet);
begin
  if Assigned(ContainedForm) then
    ContainedForm.ds.DataSet := data;
end;

procedure TIConsFormMD.setInforme(informe: string);
begin
  Containedform.Informe := informe;
end;

procedure TIConsFormMD.setRangoFechas(FIni, FFin: TDateTime);
begin
  if Assigned(ContainedForm) then
  begin
    ContainedForm.Ini := trunc( FIni );
    ContainedForm.Fin := trunc( FFin );
  end;
end;

end.
