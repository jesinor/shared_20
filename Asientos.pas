unit Asientos;

interface

uses
	SysUtils, Classes, Db, ADODB, Dialogs, DmAsientos;

const
	rsCuentaNoEncontrada = 'Cuenta (%s) no encontrada.';

	procedure GrabarAsiento( const Codigo, Numero: string; Fecha: TDateTime;
  		const Detalle, Operador: string; Coef: double );
	procedure graboItemAsiento( const Cuenta, SubCta, Leyenda: string; Importe: double );

  function AbrirAsiento( abrir: Boolean = true ): boolean;
  procedure CerrarAsiento;
  procedure Cancelar;

  function EliminarAsiento( Asiento: integer; nuevaTransaccion: boolean = false ):boolean;
  procedure cerrarTablas;

var
  FTransaccion: Boolean;
	FBaseDeDatos: TAdoConnection;

implementation

var
  FSaldo: double;
	FAsiento: integer;
  Fec: TDateTime;

function ObtenerNumeroAsto: integer;
begin
	with FDataModulo do
  try
    updUltiNum.execute;
		{if not ( TUltiNum.active ) then
  		TUltiNum.open;
  	if not ( TUltinum.Locate( 'CODIGO', 'MAESBAS', [ ] )) then
  		raise exception.create( 'Codigo maestro no encontrado' );

  	TUltinum.edit;
  	TUltinumNUMERO.value := TUltinumNUMERO.value + 1;
  	TUltinum.post;
    }

    getultinum.open;
    result := getUltinumNUMERO.value;
  	// Result := TUltinumNUMERO.value;
  finally
    getUltiNum.close;
  end;
end;

// -------------------------------------

function AbrirAsiento( abrir: Boolean = true ): boolean;
begin
    FTransaccion := abrir;
	  if (FBaseDeDatos <> nil) and (abrir) then
			  FBaseDeDatos.BeginTrans;
    FAsiento := ObtenerNumeroAsto;
    FSaldo := 0;
    result := true;
end;

procedure CerrarAsiento;
begin
		FSaldo := Round( FSaldo * 100 ) / 100;
    if ( FSaldo <> 0 ) then
    begin
    	ShowMessage( 'Asiento no Grabado! ' + #13 + 'Saldo no balancea: '
      	+ Format( '%10.2f', [ FSaldo ] ));
      Cancelar;
      cerrarTablas;
      abort;
    end
    else
	  	if (FBaseDeDatos <> nil) and (FTransaccion) then
      	if FBaseDeDatos.InTransaction then
					FBaseDeDatos.CommitTrans;
    cerrarTablas;
end;

procedure cerrarTablas;
begin
	with FDataModulo do
  begin
    // TUltiNum.close;
    // TCuentas.close;
  end;
end;

procedure Cancelar;
begin
    // anula el asiento ante una falla y hace rollback
	  if (FBaseDeDatos <> nil) and (FTransaccion) then
    	if FBaseDeDatos.InTransaction then
				FBaseDeDatos.RollbackTrans;
end;

procedure GrabarAsiento( const Codigo, Numero: string; Fecha: TDateTime;
			const Detalle, Operador: string; Coef: double );
begin
     with FDataModulo do
     try
          Fec := Fecha;
          spMaesbas.Parameters.ParamByName( 'ASIENTO' ).value := FAsiento;
          spMaesbas.Parameters.ParamByName( 'CODIGO' ).value := Codigo;
          spMaesbas.Parameters.ParamByName( 'NUMERO' ).value := Numero;
          spMaesbas.Parameters.ParamByName( 'FECHA' ).value := Fecha;
          spMaesbas.Parameters.ParamByName( 'DETALLE' ).value := copy( Detalle, 1, 50 );
          spMaesbas.Parameters.ParamByName( 'OPERADOR' ).value := Operador;
          spMaesbas.Parameters.ParamByName( 'FECHAOP' ).value := date;
          spMaesbas.Parameters.ParamByName( 'COEFICIENTE' ).value := Coef;
          spMaesbas.Execute;
     except
        on e:exception do
          showmessage( e.message );
     end;
end;

procedure ActualSdoCta(const Cuenta: string; FValor: double );
begin
     with FDataModulo do
     try
      updCuentas.parameters.paramByName('CUENTA').value := Cuenta;
      updCuentas.parameters.paramByName('IMPORTE').value := FValor;
      updCuentas.execute;
      {if not ( TCuentas.Active ) then
      	TCuentas.Open;
     	if TCuentas.Locate( 'CUENTA', Cuenta, [locaseinsensitive] ) then
     	begin
          TCuentas.edit;
          TCuentasSALDO.Value := TCuentasSALDO.value + FValor;
          TCuentas.post;
     	end
     	else
          raise exception.createfmt( rsCuentaNoEncontrada, [ Cuenta ] );
     end;}
     finally

     end;
end;

procedure GrabarItemAsto(const Cuenta: string; FValor: double);
begin
     With FDataModulo do
     begin
          FValor := Round( FValor * 100 ) /100;
          FSaldo := FSaldo + FValor;
          SpMaestro.parameters.ParamByName( 'CUENTA' ).value := Cuenta;
          SpMaestro.parameters.ParamByName( 'IMPORTE' ).value := FValor;
          SpMaestro.parameters.ParamByName( 'SALDO' ).value := FValor;
          SpMaestro.Execute;
          ActualSdoCta( Cuenta, FValor );
     end;
end;

procedure graboItemAsiento( const Cuenta, SubCta, Leyenda: string; Importe: double );
begin
     with FDataModulo do
     begin
          SpMaestro.parameters.ParamByName( 'ASIENTO' ).value := FAsiento;
          SpMaestro.parameters.ParamByName( 'FECHA' ).value := Fec;
          SpMaestro.parameters.ParamByName( 'SUBCOD' ).value := SubCta;
          SpMaestro.parameters.ParamByName( 'LEYENDA' ).value := copy( leyenda, 1, 40 );
          GrabarItemAsto( Cuenta, Importe );
     end;
end;

function EliminarAsiento( Asiento: integer; nuevaTransaccion: boolean = false):boolean;
begin
  	with FDataModulo do
  	try
	  		if ( FBaseDeDatos <> nil ) and ( nuevaTransaccion ) then
          if not ( FBaseDeDatos.InTransaction ) then
					  FBaseDeDatos.BeginTrans;
        QSelCtas.Prepared := true;
        try
        	QElimMaesbas.parameters.ParamByName( 'ASIENTO' ).value := Asiento;
          QElimMaestro.parameters.ParamByName( 'ASIENTO' ).value := Asiento;
          QSelCtas.parameters.ParamByName( 'ASIENTO' ).value := Asiento;
          QSelCtas.active := true;
          while not QSelCtas.eof do
          begin
          	QUpdSaldoCta.parameters.ParamByName( 'CUENTA' ).Value := QSelCtasCUENTA.value;
            QUpdSaldoCta.parameters.ParamByName( 'IMPORTE' ).Value := QSelCtasIMPORTE.value;
            QUpdSaldoCta.Execute;
            QSelCtas.next;
          end;
          QSelCtas.close;

          QElimMaestro.Execute;
          QElimMaesbas.Execute;

	  			if ( FBaseDeDatos <> nil ) and ( nuevaTransaccion ) then
      			if FBaseDeDatos.InTransaction then
							FBaseDeDatos.CommitTrans;
        except
        	on e:exception do
        	begin
	  				if ( FBaseDeDatos <> nil ) and ( nuevaTransaccion ) then
    					if FBaseDeDatos.InTransaction then
								FBaseDeDatos.RollbackTrans;
            showmessage( 'Error al eliminar asiento' + #13 + e.Message );
        	end;
        end;
    finally
    	QSelCtas.Prepared := false;
    end;
    result := true;
end;

end.
