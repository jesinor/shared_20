unit AdoConec;

interface
uses
  Windows, Messages, classes, Forms, Dialogs, ADODB, DB, IniFiles, SysUtils, dmasientos;

const
  ctdatosconec = 'Provider=SQLOLEDB.1;Persist Security Info=True;';
  ctCatalogo = 'Initial Catalog=';
  ctDataSource = ';Data Source=';
  // ctUser='sa';

  ctdatosconecAzu = 'Provider=MSDASQL.1;';

function conectar( ado: TAdoConnection; negro: boolean= false ): boolean;
function vieja_coneccion( ado: TAdoConnection; negro: boolean= false ): boolean;
function nueva_coneccion( ado: TAdoConnection; negro: boolean= false ): boolean;
function get_base: string;

procedure SetConeccionAsientos( ado: TAdoConnection );

var
    ctPassword: string;
    ctUser: string;
    BaseDeDatos: string;

implementation

function get_base: string;
begin
  result := BaseDeDatos;
end;

function conectar(ado: TAdoConnection; negro: boolean= false ): boolean;
begin
  result := nueva_coneccion(ado, negro);
end;

function vieja_coneccion( ado: TAdoConnection; negro: boolean ): boolean;
var
  FIni: TIniFile;
  f, Base, BaseX, DataS: string;
  bAzure, datosConec: string;
begin
    FIni := TIniFile.Create( ExtractFilePath( application.ExeName ) + 'Conf\bdatos.ini' );
    try
      BaseX := FIni.ReadString('BDATOS', 'SISNOBX', 'SISNOBX');

      if ( ParamCount > 1) then
        Base := ParamStr(2)
      else
        Base := FIni.ReadString('ULTIMA', 'ULTIMA', 'SISNOB' );
      DataS := FIni.ReadString('BDATOS', Base, 'SQL\SQLEXPRESS' );

      bAzure := FIni.ReadString('AZURE', Base, '0' );
      if (bAzure='1') then
      begin
        ctUser := FIni.ReadString('AZURE', 'USUARIO', 'sisnob' );
        ctPassword := FIni.ReadString('AZURE', 'PASSWORD', 'Kazaztan' );
        datosConec := ctdatosconecAzu;
      end
      else
      begin
        ctUser := FIni.ReadString('USER', 'USUARIO', 'sisnob' );
        ctPassword := FIni.ReadString('USER', 'PASSWORD', 'kazaztan' );
        datosConec := ctdatosconec;
      end;
      FIni.Free;

      if negro then
        f := BaseX
      else
        f := Base;

      if Ado.Connected then
        Ado.Connected := false;

      Ado.ConnectionString := datosconec + ctCatalogo + f + ctDataSource +
        DataS + ';User ID=' + ctUser + ';Password=' + ctPassword;
      Ado.Connected := true;

      Result := true;
    except
        on e:exception do
        begin
          showmessage( ado.connectionstring + #13 +'Error en coneccion a base de datos' + #13 + e.Message );
          Result := false;
        end;
    end;

end;

function nueva_coneccion( ado: TAdoConnection; negro: boolean= false ): boolean;
var
	Ruta: string;
  FSer, FUsu, FBase, FCat, FCla, FCadena, FExtended: string;
  FPos: integer;
  FIni: TIniFile;
  FLista: TStringlist;
begin
     FLista := TStringlist.Create;
     try
        FIni := TIniFile.create( ExtractFilePath( Application.ExeName ) + 'Conf\coneccion.ini' );
        FIni.ReadSections(FLista);

        if ( ParamCount > 1) then
          FCat := ParamStr(2)
        else if FLista.Count > 0 then
          FCat := FLista[0]
        else
        begin
          PostMessage( Application.Handle, WM_CLOSE, 0, 0 );
          Exit;
        end;

        FBase := FIni.ReadString(FCat, 'Base', '' );
        FSer := FIni.ReadString(FCat, 'Servidor', '' );
        FCla := FIni.ReadString(FCat, 'clave', '' );
        FUsu := FIni.ReadString(FCat, 'Usuario', '' );
        FCadena := FIni.ReadString(FCat, 'cadena', '' );
        FCadena := StringReplace(FCadena, '{app}', extractfilepath(application.ExeName), [rfReplaceAll]);
        FExtended := FIni.ReadString(FCat, 'extended', '' );

        BaseDeDatos := FBase;
        FCadena := FCadena + 'User ID=%s;Password=%s;Initial Catalog=%s;Data Source=%s';
        // FCadena := FCadena + 'User ID=%s;Password=%s;Initial Catalog=%s;Data Source=%s;Extended Properties=%s';
        if Ado.Connected then
          Ado.Connected := false;

        Ado.ConnectionString := Format( FCadena, [FUsu, FCla, FBase, FSer, FExtended ]);
        try
          Ado.Connected := true;
          Result := true;

          // pasar la nueva coneccion a DmAsientos...
          SetConeccionAsientos( ado );
        except
          on e:exception do
          begin
            showmessage( ado.connectionstring + #13 + 'Error en coneccion a base de datos' + #13 + e.Message );
            Result := false;
          end;
        end;

        if not ( Ado.Connected) then
          PostMessage( Application.Handle, WM_CLOSE, 0, 0 );
     finally
        FLista.free;
        FIni.free;
     end;
end;

procedure SetConeccionAsientos( ado: TAdoConnection );
begin
  if not Assigned( FDataModulo) then
    FDataModulo := TFDataModulo.create( application );
  FdataModulo.setearOficial(ado);
end;

end.
