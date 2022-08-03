unit constantes;

interface

resourcestring

ctSi = 'S';
ctNo = 'N';
ctEstadoEliminado = 'ELIMINADO';
ctEstadoPendiente = 'PENDIENTE';
ctEstadoPedido = 'PEDIDO';

ctRegConsulta = 'Software\nob19\consultas\';
ctIndice = 'indice';

codPagoACuenta = 'PAGO';
sistema_sisnob = 'sisnob20';
modulo_ventas = 'ventas';
modulo_ctacte = 'ctacte';
modulo_general = 'general';
codigoStock = 'ALTA';
codigoAsientos = 'ASTO';

ctFacturaElectronica = 'FACTURA ELECTRONICA';
ctFacturaDeCredito = 'FACTURA DE CREDITO';
ctComprobanteManual = 'COMPROBANTE MANUAL';

rsConfirma = 'Confirma?';
rsConfirmaGrabacion = 'Confirma grabacion de %s ?';
rsConfirmaAnulacion = 'Anula %s en curso?';
rsAnulaCambios = 'Anula los cambios efectuados?';
rsCambiosAnulados = 'Los cambios han sido anulados';
rsConfirmaCambios = 'Confirma los cambios efectuados?';
rsConfirmaEliminar = 'Elimina comprobante?';
rsGrabacionExitosa = 'El comprobante ha sido grabado';
rsEstaSeguro = 'Esta seguro?';
rsGrabacion = 'Grabacion de comprobante';
rsSinDatos = 'Sin datos';
rsCredencialesNoValidas = 'Credenciales de acceso no son validas (o suscripcion vencida?)';
rsPosibleAbonoVencido = '( Su abono ha sido renovado? )';
rsNosepuedecambiarClave = 'Error! No se pudo cambiar clave';
rsDatosIncorrectos = 'Los datos ingresados no son correctos. Reviselos por favor';
rsNoEliminaGrilla = 'No se pueden eliminar registros de la grilla. Operacion no permitida para el comprobante actual';
rsClienteSinPresupuestos = 'El cliente seleccionado no posee presupuestos pendientes';
rsClienteSinPedidos = 'El cliente seleccionado no posee pedidos pendientes';
rsClienteSinRemitos = 'El cliente seleccionado no posee remitos pendientes';
rsClienteSinFacturas = 'El cliente seleccionado no posee facturas pendientes';
rsSeleccioneCliente = 'Primero seleccione cliente';

rsSeleccioneProveedor = 'Primero seleccione proveedor';
rsProveSinFacturas = 'El proveedor seleccionado no posee facturas pendientes';
rsAplicarFCE = 'Para Notas de debito y credito (FCE) debe aplicar la operacion a una factura';

rsLimpieAplicacionesRecibo = 'Limpie aplicaciones del recibo primero';
rsSaldoNoAplicado = 'Saldo no aplicado ( %f ) fue insertado como pago a cuenta. ';
rsMontoAplicadoRecibo = 'Monto aplicado de comprobante no puede exceder su valor original';
rsComprobanteNoExiste = 'Comprobante seleccionado no existe';
rsDebeSeleccionarTipoCte = 'Debe seleccionar tipo de comprobante F(actura)/C(redito)/D(ebito)';
rsComprobanteNoBalancea = 'El %s no balancea. No se puede grabar';
rsSinIngresosRecibo = 'El recibo no tiene ingresos. Imposible grabar';
rsSinIngresosPago = 'El pago no tiene salidas. Imposible grabar';
rsDatosFENoactualizados = 'Datos de comprobante electronico no actualizados';
rsDatosFEActualizados = 'Datos de comprobante electronico han sido actualizados';
rsCompleteValorDeclarado = 'Complete datos de valor declarado del remito y cantidad de bultos';
rsCompleteValor = 'Debe completar un valor en %s';
rsCompleteSoloUnValor = 'Debe completar solo un valor : $s';
rsExportado = 'Consulta exportada con exito';

rsOpcionNoHabilitada = 'Opcion no habilitada';
rsNoEncontrado = 'Elemento no ha sido encontrado';
rsFechaErronea = 'Fecha esta fuera de los valores admitidos';
rsFecha = 'Revision de fecha';
rsReviseFecha = 'Por favor revise si la fecha es correcta!';
rsReviseFechaAdelante = 'La fecha ingresada esta en el futuro. Por favor revise si es correcta';
rsReviseFechaAtras = 'La fecha ingresada es muy antigua. Por favor revise si es correcta';

rsMontoPresupuesto = 'Monto de presupuesto no puede ser 0 o negativo';
rsMontoComprobante = 'Monto de comprobante debe ser mayor a 0';
rsMontoComprobanteNC = 'Monto de comprobante (credito) debe ser menor a 0';
rsCampoObligatorio = 'Complete campo. Es un valor requerido.';
rsCompleteDatos = 'Complete datos obligatorios. (%s)';
rsCompleteItems = 'Complete items de detalle';
rsDescuentoIncorrecto = 'Descuento incorrecto. (No puede ser negativo)';
rsCompleteDatosBanco = 'Complete datos minimos de Banco: Nombre, Tipo de cuenta y numero';
rsLista = 'Por favor, complete valor de lista desplegable';
rsCUIT = 'Numero de CUIT/CUIL/CDI no es valido';

rsErrorOperacion = 'Error al grabar operacion ';
rsErrorAsiento = 'Error al grabar asiento ';
rsErrorFormulario = 'Error al grabar formulario ';
rsFormularioGrabadoLocal = 'El formulario fue grabado localmente. No olvide emitir factura electronica';
rsErrorCompras = 'Error al grabar compras ';
rsErrorGrabacionPedido = 'Error al grabar encabezado de pedido';
rsErrorGrabacionRemito = 'Error al grabar encabezado de remito';
rsErrorGrabacionFactura = 'Error al grabar encabezado de factura';
rsSeleccioneRegistro = 'Primero seleccione registro antes de efectuar la consulta';
rsComprobanteConCAE = 'Comprobante posee CAE';
rsNosePuedeModificar = 'Imposible modificar';
rsCompteYaEmitido = 'Comprobante ha sido emitido previamente';

rsErrorConfiguracionTerminal = 'Error de configuracion de terminal. Avise a soporte tecnico';

rsActualizarTabla = 'Debe actualizar la informacion antes de modificar un registro recien insertado';
rsCompletarDatos = 'Por favor complete los datos de los campos: %s ';
rsNumeroDebeserPositivo = 'Por favor Indique valor positivo para : %s ';
rsDocumentoerroneo = 'Documento es erroneo';
rsEmailNoValido = 'Email no es valido';
rscero_o_positivo = '$s debe ser 0 o mayor.';
rspositivo = '%s debe ser mayor a 0.';
rsRecuerdeCodigoAFIP = 'Recuerde que si va a utilizar el comprobante para emitir factura electronica este debe tener el codigo de AFIP asignado';
rsInsercionNodmitida = 'No se admite ingresar nuevos registros';
rsEliminacionNodmitida = 'Eliminacion de registro no esta permitida';
rsComprobanteNoPuedeEliminarse = 'El comprobante seleccionado no puede eliminarse';
rsNoCorresponde = 'La opcion no corresponde para el elemento seleccionado';
rsSeleccioneListaPrecios = 'Primero debe seleccionar una lista de precios';
rsSeleccionModalidadListaPrecios = 'Seleccione la modalidad de impresion de la lista de precios';
rsListaConsumidorFinal = 'Lista con IVA incluido';
rsListaMayorista = 'Lista sin IVA';

rsActualizaPrecios = 'Actualizando precio de listas';
rsConfirmaActualizacionPrecios = 'Confirma aplicar actualizacion de precios a articulos mostrados en pantalla? ';

rsEnProceso = 'Tarea en proceso. Aguarde por favor';
rsTareaFinalizada = 'Tarea se ha completado';
rsTareaConError = 'Tarea finalizo con el siguiente error: ';
rsNotificacion = 'Notificacion';
rsReqConfirma = 'Confirmacion requerida';
rsSeleccion = 'Seleccione opcion deseada';
rsInformeGenerado = 'Informe ha sido generado';
rsError = 'Error!';
rsExcepcion = 'Ha ocurrido un error!';
rsSubtotalIVADifiere = 'Subtotal contable no coincide con subtotal declarado en IVA';
rsCuentaImputacion = 'Debe Indicar cuenta de imputacion';
rsValoresCargados = 'Valores han sido cargados';
rsValorDebeSerPositivo = 'Debe ingresar un valor positivo';

rsConeccionNoEstablecida = 'Coneccion No establecida. Cerrando aplicativo';

// constantes de derechos de asignacion
ctBancos = 'BA';
ctVentas = 'VE';
ctCtaCte = 'CC';
ctProve = 'PR';
ctStock = 'ST';
ctCompras = 'CM';
ctContable = 'CO';
ctAdmin = 'AD';

ctOpcABM = 'ABM';
ctOpcCons = 'CONSUL';
ctOpcFc = 'FACTUR';
ctOpcPedido = 'PEDIDO';
ctOpcPres = 'PRESUP';
ctOpcPrecios = 'MODIPR';
ctOpcRecibo = 'RECIBO';
ctOpcPago = 'PAGOS';
ctOpcCompras = 'COMPRA';
ctOpcMerc = 'INGMER';

ctOpcElimAsto = 'ELIMAS';
ctOpcElimDep = 'ELIMDE';
ctOpcElimPago = 'ELIMPA';
ctOpcElimStk = 'ELIMCO';
ctOpcElimCom = 'ELIMCO';
ctOpcElimRec = 'ELIMRE';
ctOpcElimFac = 'ELIMFA';


ctDerechoNoConcedido = 'Error. No tiene derechos asignados para ingresar en la opcion elegida';

rsLineaAsientoSinValor = 'Debe indicar valor en DEBE o HABER';
rsLineaAsientoValorUnico = 'Debe indicar solo valor en DEBE o HABER, no ambos';
rsCompleteValorElementoAsiento = 'Complete valor de DEBE o HABER';
rsAsientoNoBalancea = 'Asiento no balancea. Imposible grabar';
rsCuentaPatrimonial = 'CUENTA PATRIMONIAL';
rsCuentaResultadoPositivo = 'RESULTADO POSITIVO';
rsCuentaResultadoNegativo = 'RESULTADO NEGATIVO';
rsEstadoResultados = 'ESTADO RESULTADOS';
rsEstadoPatrimonial = 'ESTADO PATRIMONIAL';

rsSeleccioneCodigoDeposito = 'SELECCIONE CODIGO DE DEPOSITO';
rsLetraXDebeserCodigoAFIP99 = 'Para comprobantes con letra X el codigo de afip debe ser 99';
rsCompelteAccionGrabar = 'Debe completar la accion encargada de realizar la grabacion';
rsTareaFinalizadaNoEditable = 'Tarea figura como finalizada. No puede editarse';
rsUltimoAbonoEmitido = 'Ultimo abono fue emitido el %s. Confirma emision de nuevo abono? ';
rsAbonosEmitidos = 'Abonos han sido emitidos';
rsIndiquePorcentaje = 'Por favor, indique porcentaje a aplicar';
rsListaDebeSerDistinta = 'Por favor, seleccione una lista de origen distinta de la lista destino';

rsUsuarioDemo = 'Se encuentra operando bajo el usuario DEMO';
rsCreaCuentaUsuario = 'Si desea crear su cuenta de usuario haga clic en "Crear Usuario" ' + #13 +
  'Podra utilizar gratis el sistema por 30 dias con su propia base de datos ' + #13 +
  'En caso contrario puede continuar como usuario demo (con datos compartidos).';
rsReabraSistema = 'Por favor, cierre y abra nuevamente el sistema';
rsClaveNoConfirmada = 'La clave difiere de su confirmacion';
rsCaracteresNoAlfanumericos = 'El texto debe contener solo caracteres alfanumericos sin espacios';
rsMinimaLongitudPassword = 'La clave requiere un minimo de 6 letras';
rsUsuarioCreado = 'Se ha realizado el registro de nuevo usuario. En breve recibira un email cuando su cuenta este habilitada. ' + #13 +
  'Muchas Gracias!';
rsTerminalIncorporada = 'Se ha incorporado la terminal a la cuenta indicada. Por favor reabra el sistema para que los cambios tomen efecto';
rsCambioNombre = 'Su nombre de usuario sera cambiado a %s ' + #13 + '( por una cuestion administrativa)';
rsExportacionDebeTenerTasaIVA0 = 'Para comprobantes de exportacion la tasa de IVA debe ser 0';
rsDebeSerNuevaFactura = 'Solo puede cambiar la condicion de Exencion Debito Fiscal en un comprobante nuevo sin detalle de items cargado!';
rsDebeCompletarTipoCambio = 'Debe completar tipo de cambio positivo' ;
rsDebeSeleccionarIncoterms = 'Debe seleccionar INCOTERMS de la lista';
rsDebeSeleccionarMoneda = 'Debe seleccionar moneda de la lista';
rsClienteExteriorFaltaPais = 'Debe indicar pais cuando es un cliente del exterior';
rsCarpetasEmpresaNoCreadas = 'Error!. Carpetas de empresa no han podido crearse. Consulte con su soporte tecnico';

const

idSinIdentificar = 99;
idDocumentoUnico = 96;

implementation

end.
