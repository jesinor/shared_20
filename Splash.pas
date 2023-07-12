unit Splash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, dxGDIPlusClasses;

type
  TFSplash = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
  private
    { Private declarations }
    FSalir: boolean;
    procedure SetSalir(const Value: boolean);
  public
    { Public declarations }
    property Salir: boolean read FSalir write SetSalir;
  end;

var
  FSplash: TFSplash;

implementation

{$R *.DFM}

{ TFSplash }

procedure TFSplash.SetSalir(const Value: boolean);
begin
end;

end.
