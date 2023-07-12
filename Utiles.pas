unit Utiles;

interface

uses
    Windows, Messages, SysUtils, Classes, Controls, Dialogs, Forms, IniFiles,
    DateUtils, DbClient, db;

// devuelve fechas de consulta de sistema
// corresponde a ultima consulta hecha por usuario
function GetFechaIni: TDatetime;
function GetFechaFin: TDatetime;
procedure cerrarDataset( cds: TClientDataset );
{: Returns a string with all occurrences of a given Character removed }
function StripChar (const S: string; Ch: Char): string;
{: Returns the substring consisting of the first N characters of S.
	If N > Length (S) then the substring = S. }
function LeftStr (const S : string; const N : Integer): string;

// establece fechas de consulta
procedure SetFechas( fecIni, FecFin: TDateTime );
function setEAN13controlcode( const code: string): integer;
var
  fs: TformatSettings;
  DecimalSeparator: char;

implementation

var
  FIni: TIniFile;

function GetFechaIni: TDatetime;
begin
    FIni := TIniFile.create( ExtractFilePath( Application.ExeName ) + 'Conf\Config.Ini' );
    try
      Result := FIni.ReadDateTime( 'FECHAS', 'FECINI', StartofTheMonth( date-25));
    finally
      FIni.Free;
    end;
end;

function GetFechaFin: TDatetime;
begin
    FIni := TIniFile.create( ExtractFilePath( Application.ExeName ) + 'Conf\Config.Ini' );
    try
      Result := FIni.ReadDateTime( 'FECHAS', 'FECFIN', EndOfTheMonth(date-25));
    finally
      FIni.Free;
    end;
end;

procedure SetFechas( FecIni, FecFin: TDateTime );
begin
  FIni := TIniFile.create( ExtractFilePath( Application.ExeName ) + 'Conf\Config.Ini' );
  try
    FIni.WriteDateTime( 'FECHAS', 'FECINI', FecIni );
    FIni.WriteDateTime( 'FECHAS', 'FECFIN', FecFin );
  finally
    FIni.free;
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

// function GetMod10CheckDigit(Number: String): Integer;
function setEAN13controlcode( const code: string): integer;
var
  SLen,CurrentPos,Total1,Total2,Total3,Count: Integer;
  TempStr: String;
begin
  Slen:=Length(code);
  CurrentPos:=SLen;
  Total1:=0;Total2:=0;
  while (1=1) do
  begin
    Total1:=Total1+strtointdef(code[CurrentPos],0);
    CurrentPos:=CurrentPos-2;
    if CurrentPos<1 then
      break;
  end;

  CurrentPos:=SLen-1;
  while (1=1) do
  begin
    Total2:=Total2+strtointdef(code[CurrentPos],0);
    CurrentPos:=CurrentPos-2;
    if CurrentPos<1 then
      break;
  end;

  Total3:=(3*Total1)+Total2-1;
  for Count:=0 to 9 do
  begin
    inc(Total3);
    TempStr:=inttostr(Total3);
    if copy(TempStr,Length(TempStr),1)='0' then
    begin
      Result:=Count;
      exit;
    end
  end;
  Result:=0;
end;

// alternativa
{

Function GetCheckDigit(Barcode:String):String;
Var
  I,SumOdd,SumEven,Tot:Integer;
begin
  SumOdd := 0;
  SumEven := 0;
  For I := 1 to length(Barcode) do
  begin
    if Odd(I) then SumOdd := SumOdd + StrToInt(Copy(Barcode,I,1))
  else SumEven := SumEven + StrToInt(Copy(Barcode,I,1));
  end;
  Tot := ( (SumOdd*3) + SumEven );
  if Tot mod 10 = 0
    then Tot := 0
  else
    Tot := 10 - (Tot mod 10);
  Result := Trim(IntToStr(Tot));
end;
}
initialization
  fs := Tformatsettings.Create;
  DecimalSeparator := fs.DecimalSeparator;

end.
