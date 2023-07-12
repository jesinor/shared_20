unit configura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, AdoDb;

type
TConfigura = class
private
  data: TAdoDataSet;

  procedure cerrar;
  procedure abrir;
public

  function getclave( const clave: string ): Variant;
  procedure setclave( const clave: string; valor: Variant );

  constructor Create(ds: TAdoDataSet);
end;

var
  FConfigura: TConfigura;

implementation
{ TConfigura }

function TConfigura.getclave(const clave: string): variant;
begin
  try
    abrir;
    result := data.FieldByName(clave).Value;
  finally
    cerrar;
  end;
end;

procedure TConfigura.abrir;
begin
  if not data.active then
    data.open;
end;

procedure TConfigura.cerrar;
begin
     data.Close;
end;

constructor TConfigura.Create(ds: TAdoDataSet);
begin
  data := ds;
end;

procedure TConfigura.setclave(const clave: string; valor: Variant);
begin
  abrir;
  try
    data.Edit;
    data.FieldByName(clave).Value := valor;
    data.Post;
  finally
    cerrar;
  end;

end;


end.
