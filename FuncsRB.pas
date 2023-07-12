unit FuncsRB;

interface
uses
  Forms, raFunc, ppRTTI, Dialogs, SysUtils, AdoDb;

type
  TDatos = class ( TraStringFunction )
  public
        procedure ExecuteFunction(aParams: TraParamList); override;
        class function GetSignature: String; override;
        class function HasParams: Boolean; override;
  end;
  TNumeroDeCUIT = class ( TraStringFunction )
  public
        procedure ExecuteFunction(aParams: TraParamList); override;
        class function GetSignature: String; override;
        class function HasParams: Boolean; override;
  end;
  TNumeroEntero = class( TraMathFunction )
  public
     procedure ExecuteFunction( aParams: TraParamList ); override;
     class function GetSignature: String; override;
     class function HasParams: Boolean; override;
  end;
  TDatoIVA = class( TraStringfunction )
  public
        procedure ExecuteFunction(aParams: TraParamList); override;
        class function GetSignature: String; override;
        class function HasParams: Boolean; override;
  end;
  TCadena = class( TraStringfunction )
  public
        procedure ExecuteFunction(aParams: TraParamList); override;
        class function GetSignature: String; override;
        class function HasParams: Boolean; override;
  end;
  TPesos = class( TraStringfunction )
  public
        procedure ExecuteFunction(aParams: TraParamList); override;
        class function GetSignature: String; override;
        class function HasParams: Boolean; override;
  end;
  TTexto = class( TraStringfunction )
  public
        procedure ExecuteFunction(aParams: TraParamList); override;
        class function GetSignature: String; override;
        class function HasParams: Boolean; override;
  end;
  TTextoMemo = class( TraStringfunction )
  public
        procedure ExecuteFunction(aParams: TraParamList); override;
        class function GetSignature: String; override;
        class function HasParams: Boolean; override;
  end;
  TEmailSend = class( TraStringfunction )
  public
        procedure ExecuteFunction(aParams: TraParamList); override;
        class function GetSignature: String; override;
        class function HasParams: Boolean; override;
  end;
  TNombreArchivo = class( TraStringfunction )
  public
        procedure ExecuteFunction(aParams: TraParamList); override;
        class function GetSignature: String; override;
        class function HasParams: Boolean; override;
  end;
  function GetNumeroRb: integer;
  procedure SetNumeroRb( Numero: integer );
  function GetCadenaRb: string;
  procedure SetCadenaRb( const Cadena: string );
  function GetTextoRb: string;
  procedure SetTextoRb( const Cadena: string );
  function GetTextoMemoRb: string;
  procedure SetTextoMemoRb( const Cadena: string );
  function GetSendEmailRb: string;
  procedure SetSendEmailRb( const Cadena: string );
  function GetNombreArchivoRb: string;
  procedure SetNombreArchivoRb( const Cadena: string );

  procedure SetPesosEnLetrasRb( Importe: double );
  procedure setTablaDatos( FTabla: TAdoTable );

  var
     FNumero: integer;
     FCad, FTexto, FTextoMemo, FEmail, FNombreArchivo: string;
     FPesosEnLetras: string;
     FTablaDatos: TAdoTable;


implementation
uses
     ImpEnLet;

procedure setTablaDatos( FTabla: TAdoTable );
begin
  FTablaDatos := FTabla;
end;

function GetNumeroRb: integer;
begin
     Result := FNumero;
end;

procedure SetNumeroRb( Numero: integer );
begin
     FNumero := Numero;
end;

function GetCadenaRb: string;
begin
     Result := FCad;
end;

procedure SetTextoRb( const Cadena: string );
begin
     FTexto := Cadena;
end;

function GetTextoRb: string;
begin
     Result := FTexto;
end;

procedure SetTextoMemoRb( const Cadena: string );
begin
     FTextoMemo := Cadena;
end;

function GetTextoMemoRb: string;
begin
     Result := FTextoMemo;
end;

procedure SetCadenaRb( const Cadena: string );
begin
     FCad := Cadena;
end;

procedure SetPesosEnLetrasRb( Importe: double );
begin
     FPesosEnLetras := ImpEnLetras( Abs( Importe ));
end;

function GetSendEmailRb: string;
begin
    Result := FEmail;
end;

procedure SetSendEmailRb( const Cadena: string );
begin
  FEmail := Cadena;
end;

function GetNombreArchivoRb: string;
begin
  result := FNombreArchivo;
end;

procedure SetNombreArchivoRb( const Cadena: string );
begin
    FNombreArchivo := Cadena;
end;

{ TDatos }

procedure TDatos.ExecuteFunction(aParams: TraParamList);
var
     Datos: string;
begin
  // inherited;
  if Assigned( FTablaDatos ) then
  try
    FTablaDatos.Open;    
    Datos := FTablaDatos[ 'DENOMINA' ];
  except
    Datos := 'Archivo no ha sido abierto: Datos';
  end
  else
    Datos := 'Archivo no ha sido asignado';
  SetParamValue( 0, Datos );
end;

class function TDatos.GetSignature: String;
begin
     Result := 'function NombreEmpresa: string;';
end;

class function TDatos.HasParams: Boolean;
begin
        Result := false;
end;

{ TNumeroEntero }

procedure TNumeroEntero.ExecuteFunction(aParams: TraParamList);
var
     Num: integer;
begin
     Num := GetNumeroRb;
     SetParamValue( 0, Num );
end;

class function TNumeroEntero.GetSignature: String;
begin
     Result := 'function Numero: integer;';
end;

class function TNumeroEntero.HasParams: Boolean;
begin
        Result := false;
end;

{ TNumeroDeCUIT }

procedure TNumeroDeCUIT.ExecuteFunction(aParams: TraParamList);
var
     Datos: string;
begin
  // inherited;
  if Assigned( FTablaDatos ) then
  try
    FTablaDatos.Open;
    Datos := FTablaDatos[ 'CUIT' ];
  except
    Datos := 'Archivo no ha sido abierto: Datos';
  end
  else
    Datos := 'Archivo no ha sido asignado';

  SetParamValue( 0, Datos );
end;

class function TNumeroDeCUIT.GetSignature: String;
begin
     Result := 'function NumeroDeCUIT: string;';
end;

class function TNumeroDeCUIT.HasParams: Boolean;
begin
     Result := false;
end;

{ TDatoIVA }

procedure TDatoIVA.ExecuteFunction(aParams: TraParamList);
var
     FIVA: string;
begin
  // inherited;
  if Assigned( FTablaDatos ) then
  try
    FTablaDatos.Open;
    if FTablaDatos.fieldbyname('CONDICIVA').value = 'RI' then
      FIVA := 'Responsable Inscripto'
    else if FTablaDatos.fieldbyname('CONDICIVA').value = 'NI' then
     FIVA := 'Responsable No Inscripto';
  except
    FIVA := 'Archivo no ha sido abierto: Datos';
  end
  else
    FIVA := 'Archivo no ha sido asignado';
  SetParamValue( 0, FIVA );
end;

class function TDatoIVA.GetSignature: String;
begin
     Result := 'function CondicionIVA: string;';
end;

class function TDatoIVA.HasParams: Boolean;
begin
     Result := false;
end;

{ TCadena }

procedure TCadena.ExecuteFunction(aParams: TraParamList);
var
     FCad: string;
begin
  // inherited;
     FCad := GetCadenaRb;
     SetParamValue( 0, FCad );
end;

class function TCadena.GetSignature: String;
begin
     Result := 'function Cadena: string;';
end;

class function TCadena.HasParams: Boolean;
begin
     Result := false;
end;

{ TPesos }

procedure TPesos.ExecuteFunction(aParams: TraParamList);
begin
     SetParamValue( 0, FPesosEnLetras );
end;

class function TPesos.GetSignature: String;
begin
     Result := 'function PesosEnLetras: string;';
end;

class function TPesos.HasParams: Boolean;
begin
     Result := false;
end;

{ TTexto }

procedure TTexto.ExecuteFunction(aParams: TraParamList);
var
     FCad: string;
begin
  // inherited;
     FCad := GetTextoRb;
     SetParamValue( 0, FCad );
end;

class function TTexto.GetSignature: String;
begin
     Result := 'function Texto: string;';
end;

class function TTexto.HasParams: Boolean;
begin
     Result := false;
end;

procedure TTextoMemo.ExecuteFunction(aParams: TraParamList);
var
     FCad: string;
begin
  // inherited;
     FCad := GetTextoMemoRb;
     SetParamValue( 0, FCad );
end;

class function TTextoMemo.GetSignature: String;
begin
  result := 'function TextoMemo: string;';
end;

class function TTextoMemo.HasParams: Boolean;
begin
  result := false;
end;


{ TEmailSend }

procedure TEmailSend.ExecuteFunction(aParams: TraParamList);
var
     FCad: string;
begin
  // inherited;
     FCad := GetSendEmailRb;
     SetParamValue( 0, FCad );
end;

class function TEmailSend.GetSignature: String;
begin
  result := 'function SendEmail: string;';
end;

class function TEmailSend.HasParams: Boolean;
begin
  Result := False;
end;

{ TNombreArchivo }

procedure TNombreArchivo.ExecuteFunction(aParams: TraParamList);
var
     FCad: string;
begin
  // inherited;
     FCad := GetNombreArchivoRb;
     SetParamValue( 0, FCad );
end;

class function TNombreArchivo.GetSignature: String;
begin
  result := 'function nombreArchivo: string;';
end;

class function TNombreArchivo.HasParams: Boolean;
begin
  Result := False;
end;

initialization
        raRegisterFunction( 'NombreEmpresa', TDatos );
        raRegisterFunction( 'NumeroDeCUIT', TNumeroDeCUIT );
        raRegisterFunction( 'Numero', TNumeroEntero );
        raRegisterFunction( 'CondicionIVA', TDatoIVA );
        raRegisterFunction( 'Cadena', TCadena );
        raRegisterFunction( 'Texto', TTexto );
        raRegisterFunction( 'PesosEnLetras', TPesos );
        raRegisterFunction( 'TextoMemo', TTextoMemo );
        raRegisterFunction( 'SendEmail', TEmailSend );
        raRegisterFunction( 'nombreArchivo', TNombreArchivo );

{finalization
        raUnRegisterFunction( 'NombreEmpresa' );}

end.
