unit mensaje;

interface

uses SysUtils, classes, dialogs;

type

IMensaje = Interface
  ['{3F0F229E-15E2-4006-93BF-8EE57211FD41}']
  procedure setMensaje( const mje: string );
  function getMensaje( const blanquear: boolean = true ): string;

End;

TFMensaje = class( TInterfacedObject, IMensaje )

private
  FMje: string;
  FLimpiar: boolean;
public
  procedure setMensaje( const mje: string );
  function getMensaje( const blanquear: boolean = true ): string;

  class procedure crearObjeto;
  constructor create( AOwner: TComponent );
  destructor Destroy;

  class function leer_mensaje: string;
  class procedure set_mensaje( const mensaje: string );
end;

var FMensaje: TFMensaje;

implementation

{ TMensaje }

constructor TFMensaje.create(AOwner: TComponent);
begin
  FMje := '';
  FLimpiar := true;
end;

destructor TFMensaje.Destroy;
begin
  FMensaje.free;
end;

function TFMensaje.getMensaje(const blanquear: boolean): string;
begin
     Result := FMje;
     if blanquear then
      FMje := '';
end;

procedure TFMensaje.setMensaje(const mje: string);
begin
    set_mensaje( mje );
end;


// proc de clase

class function TFMensaje.leer_mensaje: string;
begin
  if not ( assigned( FMensaje )) then
    FMensaje := TFMensaje.create( nil );

  Result := FMensaje.getMensaje;
end;

class procedure TFMensaje.set_mensaje(const mensaje: string);
begin
  crearObjeto;
  FMensaje.FMje := mensaje;
end;

class procedure TFMensaje.crearObjeto;
begin
  if not ( assigned( FMensaje )) then
    FMensaje := TFMensaje.create( nil );

end;



end.
