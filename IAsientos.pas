unit IAsientos;

interface

uses
  SysUtils, classes;

type

IDetalleAsiento = interface
  ['{6CED8236-8641-460B-B57B-488FFEF65DFE}']
  procedure setCuenta( const value: string );
  procedure setImporte( const value: double );
  procedure setSubley( const value: string );

  property cuenta: string write setCuenta;
  property importe: double write setImporte;
  property subley: string write setSubley;
end;

IHeadAsiento = interface
  ['{07FD0D53-9499-4FC7-9EEC-8D6E2270F00B}']
  function getAsiento: integer;

  procedure setCodigo( const value: integer );
  procedure setFecha( const value: TDateTime );
  procedure setLeyenda( const value: string );
  procedure setOperador( const value: string );

  property asiento: integer read getAsiento;
  property codigo: integer write setCodigo;
  property fecha: TDateTime write setFecha;
  property leyenda: string write setLeyenda;
  property operador: string write setOperador;

end;


implementation


end.