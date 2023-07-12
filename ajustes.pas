unit ajustes;

interface

uses
  data.DB, DBClient;

procedure cerrarDataset( cds: TClientDataSet );

implementation

procedure cerrarDataset( cds: TClientDataSet );
var
  i: Integer;
  Field: TAggregateField;
begin
  if cds.Active then
  begin
    cds.IndexFieldNames := '';
    cds.AggregatesActive := False;
    cds.Filtered := False;
    cds.EmptyDataSet;

    for I := 0 to cds.AggFields.Count - 1 do
    begin
      Field := cds.AggFields[I] as TAggregateField;
      if Field.Handle <> nil then
        Field.Handle := nil;
    end;
    cds.Active := False;
    cds.AggregatesActive := true;
  end;

end;

end.
