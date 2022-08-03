unit Impenlet;

interface

uses
    Windows, Messages, SysUtils, utiles;
    
type
    Unidad = array[ 0..9 ] of string;
    Decena = array[ 0..9 ] of string;
    Deceuno = array[ 0..9 ] of string;
    Centena = array[ 0..9 ] of string;
    Miles = array[ 0..6 ] of string;

const
     aUnidad : Unidad = ( '', 'un ', 'dos ', 'tres ', 'cuatro ', 'cinco ', 'seis ',
                       'siete ', 'ocho ', 'nueve ' );
     aDecena : Decena = ( '', 'diez ', 'veinti', 'treinta y ', 'cuarenta y ', 'cincuenta y ',
                       'sesenta y ', 'setenta y ', 'ochenta y ', 'noventa y ' );
     aDeceuno : Deceuno = ( 'diez ', 'once ', 'doce ', 'trece ', 'catorce ', 'quince ',
                         'dieciseis ', 'diecisiete ', 'dieciocho ', 'diecinueve ' );
     aCentena : Centena = ( '', 'ciento ', 'doscientos ', 'trescientos ', 'cuatrocientos ',
                         'quinientos ', 'seiscientos ', 'setecientos ', 'ochocientos ',
                         'novecientos ' );
     aMiles : Miles = ( '', 'mil ', 'millones ', 'mil millones ', 'billones ',
                      'mil billones ', 'trillones ' );
     cVeinte = 'veinte ';

function ImpEnLetras( nTotDebe :real ) :string;

implementation

function ImpEnLetras( nTotDebe :real ) :string;
var
   nContador, nContGrupo, nCeroAcum :integer;
   nNro, nPosComa, nDigito, nDigDec :integer;
   cValor, cDecimales :string;
   cNumero: string;
begin
     nCeroAcum := 0;
     nContGrupo := 0;
     nContador := 0;
     nDigDec := 0;
     cValor := FormatFloat( '###########0.00', nTotDebe );
     nPosComa := Pos( Utiles.DecimalSeparator, cValor );
     // modificado para emision de recibos
     // nPosComa := Pos( '.', cValor );
     if nPosComa <> 0 then
     begin
          cDecimales := Copy( cValor, nPosComa + 1, 2 );
          cNumero := 'con ' + cDecimales + '/100';
          cValor := Copy( cValor, 1, nPosComa - 1 );
     end
     else
         cNumero := '.';
     nContGrupo := nContGrupo + 1;
     nNro := Length( cValor );
     while nNro > 0 do
     begin
          Inc( nContador );
          if nContador > 3 then
          begin
             nContador := 1;
             Inc( nContGrupo );
          end;
          nDigito := StrToInt( Copy( cValor, nNro, 1 ) );
          if nContador = 1 then
          begin
               if nDigito > 0 then
               begin
                  nCeroAcum := 0;
                  if nNro > 1 then
                  begin
                     nDigDec := StrToInt( Copy( cValor, nNro -1 , 1 ) );
                     if nDigDec = 1 then
                     begin
                          cNumero := aDeceUno[ nDigito ] + aMiles[ nContGrupo - 1 ] +
                                     cNumero;
                          Dec( nNro );
                          Inc( nContador );
                     end;
                  end;
                  if ( ( nDigDec <> 1 ) or ( nNro = 1 ) ) and ( nContador = 1 ) then
                  begin
                       if nDigito = 1 then
                       begin
                            if nContGrupo = 1 then
                               cNumero := 'uno ' + cNumero
                            else if nContGrupo = 2 then
                               cNumero := aUnidad[ nDigito ] + aMiles[ nContGrupo - 1] +
                                         cNumero
                            else
                                 cNumero := aUnidad[ nDigito ]+
                                           Copy( aMiles[ nContGrupo -1 ], 1, Length( aMiles[ nContGrupo -1 ] ) -3 )+
                                           ' ' + cNumero;
                       end
                       else
                           cNumero := aUnidad[ nDigito ] + aMiles[ nContGrupo -1 ] + cNumero;
                  end;
               end
               else
                   Inc( nCeroAcum );
          end
          else if nContador = 2 then
          begin
               if nDigito > 0 then
               begin
                    if nCeroAcum > 0 then
                    begin
                         if nDigito = 1 then
                            cNumero := aDecena[ nDigito ] + aMiles[ nContGrupo -1 ] + cNumero
                         else if nDigito = 2 then
                            cNumero := cVeinte + aMiles[ nContGrupo -1 ] + cNumero
                         else
                            cNumero := Copy( aDecena[ nDigito ], 1, Length( aDecena[ nDigito ] ) -3 )
                                    + ' ' + aMiles[ nContGrupo -1 ] + cNumero;
                    end
                    else
                        cNumero := aDecena[ nDigito ] + cNumero;
                    nCeroAcum := 0;
                end
		else
                    Inc( nCeroAcum );
          end
          else 	{  nContador = 3 }
          begin
               if nDigito > 0 then
               begin
                    if nCeroAcum >= 2 then
                    begin
                       if nDigito = 1 then
                          cNumero := 'cien ' + aMiles[ nContGrupo -1 ] + cNumero
                       else
                           cNumero := aCentena[ nDigito ] + aMiles[ nContGrupo -1 ] + cNumero;
                    end
                    else
                        cNumero := aCentena[ nDigito ] + cNumero;
                    nCeroAcum := 0;
               end
               else
                   Inc( nCeroAcum );
          end;
	  Dec( nNro );
{          cNumero := aUnidad[ nDigito ] + cNumero;
          Dec( nNro ); }
     end;


     result := cNumero;
end;

end.
