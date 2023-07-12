unit DMAsientos;

interface

uses
  SysUtils, Classes, DB, ADODB, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TFDataModulo = class(TDataModule)
    spMaesbas: TADOCommand;
    spMaestro: TADOCommand;
    QElimMaesbas: TADOCommand;
    QElimMaestro: TADOCommand;
    QUpdSaldoCta: TADOCommand;
    QSelCtas: TADODataSet;
    QSelCtasCUENTA: TStringField;
    QSelCtasIMPORTE: TFloatField;
    updUltinum: TADOCommand;
    getUltiNum: TADODataSet;
    getUltiNumNUMERO: TIntegerField;
    updCuentas: TADOCommand;

  private
    { Private declarations }
  public
    { Public declarations }
    procedure setearOficial( ado: TAdoConnection );
  end;

var
  FDataModulo: TFDataModulo;

implementation
{$R *.dfm}

procedure TFDataModulo.setearOficial( ado: TAdoConnection );
var
  x:Integer;
begin
    for x:=0 to ComponentCount-1 do
      if (Components[ x ] is TADOCommand) then
          TADOCommand(Components[ x ]).Connection := ado
      else if Components[ x ] is TADODataSet then
      begin
          if (TADODataSet(Components[ x ]).Active) then
            TADODataSet(Components[ x ]).Active := False;
          TADODataSet(Components[ x ]).Connection := ado;
      end
end;

end.
