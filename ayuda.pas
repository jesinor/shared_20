unit ayuda;

interface

uses
  System.SysUtils, System.Classes, ShellAPI, windows;

type

TAyuda = class
  private
    web: string;
    ruta: string;
    raiz: string;
    destino: string;

    procedure BrowseURL( const URL: string );
  public
    constructor create( const site: string = 'http://www.sisnob.com.ar'; const path: string = 'ayuda/getayuda' );
    procedure ver( const raiz, destino: string );
    destructor destroy;

    class procedure mostrar_ayuda( const raiz, destino: string );
end;

var
  FAyuda: TAyuda;

implementation

class procedure TAyuda.mostrar_ayuda( const raiz, destino: string );
begin
    if not Assigned( FAyuda ) then
      FAyuda := TAyuda.create;
    FAyuda.ver( raiz, destino );
end;

{ TAyuda }

constructor TAyuda.create(const site, path: string);
begin
  web := site;
  ruta := path;
end;

destructor TAyuda.destroy;
begin
  freeAndNil( FAyuda );
end;

procedure TAyuda.ver(const raiz, destino: string);
var
  url: string;
begin
  url := web + '/' + ruta + '/' + raiz + '/' + destino;
  BrowseURL( url );
end;

procedure TAyuda.BrowseURL( const URL: string );
var
   Browser: string;
begin
   ShellExecute(0, 'OPEN', PChar(URL), '', '', SW_SHOWNORMAL);
end;


end.
