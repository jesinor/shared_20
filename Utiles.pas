unit Utiles;

interface

uses
    Windows, Messages, SysUtils, Classes, Controls, Dialogs, Forms, IniFiles,
    DateUtils, DbClient, Db, Adodb, System.RegularExpressions;

// devuelve fechas de consulta de sistema
// corresponde a ultima consulta hecha por usuario
function GetFechaIni( ds:TAdoDataSet): TDatetime;
function GetFechaFin( ds:TAdoDataSet): TDatetime;
procedure cerrarDataset( cds: TClientDataset );

{: Returns a string with all occurrences of a given Character removed }
function StripChar (const S: string; Ch: Char): string;
{: Returns the substring consisting of the first N characters of S.
	If N > Length (S) then the substring = S. }
function LeftStr (const S : string; const N : Integer): string;

// establece fechas de consulta
procedure SetFechas( ds:TAdoDataSet; fecIni, FecFin: TDateTime );
function getAppVersion: string;
function VerificaCUIT( const sValor: string ): boolean;
function validaEmail( const email: string): boolean;
function validarAlfaNumerico( const texto: string): boolean;

var
  fs: TformatSettings;
  DecimalSeparator, DateSeparator: char;

implementation

function VerificaCUIT( const sValor: string ): boolean;
const
     Tabla: array[ 1..11 ] of integer = ( 5,4,3,2,7,6,5,4,3,2,1 );
var
   Acumulado, x: integer;
begin
     Result := false;

     // RUTINA DE VERIFICACION DE NUMERO DE CUIT */
     // Maxima cantidad de digitos en el nro.de cuit */

     // Tabla de pesos para el calculo del cuit */
     // static char tbl_peso[]={5,4,3,2,7,6,5,4,3,2,1};

     if Length( sValor ) < 11 then
        exit;

     Acumulado := 0;
     for x:=1 to 11 do
         Acumulado := Acumulado + (( Ord( sValor[ x ])-48 ) * Tabla[ x ] );
     if ( Acumulado mod 11 ) = 0 then
        Result := true;
end;

function validaEmail( const email: string): boolean;
const
  EMAIL_REGEX = '^((?>[a-zA-Z\d!#$%&''*+\-/=?^_`{|}~]+\x20*|"((?=[\x01-\x7f])'
             +'[^"\\]|\\[\x01-\x7f])*"\x20*)*(?<angle><))?((?!\.)'
             +'(?>\.?[a-zA-Z\d!#$%&''*+\-/=?^_`{|}~]+)+|"((?=[\x01-\x7f])'
             +'[^"\\]|\\[\x01-\x7f])*")@(((?!-)[a-zA-Z\d\-]+(?<!-)\.)+[a-zA-Z]'
             +'{2,}|\[(((?(?<!\[)\.)(25[0-5]|2[0-4]\d|[01]?\d?\d))'
             +'{4}|[a-zA-Z\d\-]*[a-zA-Z\d]:((?=[\x01-\x7f])[^\\\[\]]|\\'
             +'[\x01-\x7f])+)\])(?(angle)>)$';
begin
  Result := TRegEx.IsMatch(email, EMAIL_REGEX);
end;

function GetFechaIni( ds:TAdoDataSet): TDatetime;
begin
    try
      ds.open;
      result := Date - ds.fieldByName( 'fecini' ).value;
    finally
      ds.Close;
    end;
end;

function GetFechaFin( ds:TAdoDataSet): TDatetime;
begin
    try
      ds.open;
      result := Date + ds.fieldByName( 'fecfin' ).value;
    finally
      ds.Close;
    end;
end;


procedure cerrarDataset( cds: TClientDataset );
var
  i: Integer;
  Field: TAggregateField;
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
end;

procedure SetFechas( ds:TAdoDataSet; FecIni, FecFin: TDateTime );
begin
    try
      ds.open;
      ds.Edit;
      ds.fieldByName( 'fecini' ).value := DaysBetween(date, fecini);
      ds.fieldByName( 'fecfin' ).value := DaysBetween(date, fecfin);
    finally
      ds.Close;
    end;
end;

function StripChar (const S: string; Ch: Char): string;
var
	P: Integer;
begin
	Result := S;
	repeat
		P := Pos (Ch, Result);
		if P > 0 then
			Result := LeftStr (Result, P - 1) + Copy (Result, P + 1,
				Length (Result) - P);
	until P = 0;
end;

function LeftStr (const S : string; const N : Integer): string;
begin
	Result := Copy (S, 1, N);
end;

function getAppVersion: string;
var
  Size, Size2: DWord;
  Pt, Pt2: Pointer;
begin
     Size := GetFileVersionInfoSize(PChar (ParamStr (0)), Size2);
     if Size > 0 then
     begin
       GetMem (Pt, Size);
       try
          GetFileVersionInfo (PChar (ParamStr (0)), 0, Size, Pt);
          VerQueryValue (Pt, '\', Pt2, Size2);
          with TVSFixedFileInfo (Pt2^) do
          begin
            Result:= ' Ver '+
                     IntToStr (HiWord (dwFileVersionMS)) + '.' +
                     IntToStr (LoWord (dwFileVersionMS)) + '.' +
                     IntToStr (HiWord (dwFileVersionLS)) + '.' +
                     IntToStr (LoWord (dwFileVersionLS));
         end;
       finally
         FreeMem (Pt);
       end;
    end;
end;

function validarAlfaNumerico( const texto: string): boolean;
const
  CHARS = ['0'..'9', 'a'..'z', 'A'..'Z'];
var
  i: integer;
  temp: string;
begin
  Result := false;
  temp := texto.Trim;

  for I := 1 to length(temp ) do
    if not (Temp[i] in CHARS ) then
      exit;
  Result := true;
end;


initialization
  fs := Tformatsettings.Create;
  DecimalSeparator := fs.DecimalSeparator;
  DateSeparator := fs.DateSeparator;

end.
