unit tipos;

interface

uses Data.DB, classes, generics.collections;

type
  rLookupCampos = record
    Campo: string;
    Tabla: TDataSource;
    Idx: string;
    Listcampos: string;
  end;
  TrLookupCampos = TList<rLookupCampos>;
  TListaCampoDataSource = TDictionary<string, TDataSource>;

  rDatosCte = record
    PuntoDeVenta: integer;
    Numero: integer;
    Letra: string;
    codigoAfip: string;
    electronica: boolean;
  end;

  bdatos = record
    nombre, servidor, Usuario, password : string;
    puerto: integer;
  end;

  rconec = record
    servidor, Usuario, password : string;
    puerto: integer;
  end;

implementation

end.
