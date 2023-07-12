unit ayuda;

interface

uses
    Windows, Messages, SysUtils, Classes, Controls, Dialogs, Forms, ShellAPI;

type
  TAyuda = class
    constructor create;
    destructor destroy; override;
    class procedure mostrar_ayuda(const modulo, seccion: string );
  end;

var
  FAyuda: TAyuda;

implementation

{ TAyuda }

constructor TAyuda.create;
begin
  if (FAyuda = nil) then
    FAyuda := TAyuda.create;
end;

destructor TAyuda.destroy;
begin
  FAyuda := nil;
  inherited;
end;

class procedure TAyuda.mostrar_ayuda(const modulo, seccion: string);
var
  url: string;
begin

  url := 'http://www.sisnob.com.ar/ayuda/getayuda/' + modulo + '/' + seccion;
  url := 'http://www.sisnob.com.ar';
  ShellExecute(HInstance, 'open', PChar(url), nil, nil, SW_NORMAL);
end;

end.
