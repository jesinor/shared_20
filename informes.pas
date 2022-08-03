unit Informes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport,
  ppCtrls, ppBands, ppVar, ppPrnabl, ppCache, ppModule, raCodMod,
  ppMemo, ppStrtch, ppSubRpt, ppEndUsr, ActnList, Menus, raIDE, myChkBoxDesign,
  ppParameter, ppChrtUI, System.Actions, ppDesignLayer, Vcl.Imaging.jpeg,
  System.Generics.Collections, ppTypes, ppDrwCmd, myPDFDevice, FireDAC.Comp.Client,
  ShellApi, EnviarEmail, ppBarCod, myChkBox, ppRegion, ppChrt, ppCTMain;

type
  TFInformes = class(TForm)
    ppR: TppReport;
    ppMaster: TppDBPipeline;
    ppDetail: TppDBPipeline;
    ppRes: TppDBPipeline;
    DMaster: TDataSource;
    DDet: TDataSource;
    DRes: TDataSource;
    ppGestor: TppDesigner;
    ActionList1: TActionList;
    Datos: TAction;
    ppOtro: TppDBPipeline;
    DOtro: TDataSource;
    ppParameterList1: TppParameterList;
    dsAdicional: TDataSource;
    ppAdicional: TppDBPipeline;
    ppReport1TitleBand1: TppTitleBand;
    Empresa: TppLabel;
    ppRLabel7: TppLabel;
    ppReport1Calc1: TppSystemVariable;
    ppReport1HeaderBand1: TppHeaderBand;
    ppRLine2: TppLine;
    ppShape1: TppShape;
    ppReport1Label4: TppLabel;
    ppReport1Label5: TppLabel;
    ppRLabel1: TppLabel;
    ppRLabel2: TppLabel;
    ppRLabel3: TppLabel;
    ppRLabel4: TppLabel;
    ppRLabel6: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppReport1DetailBand1: TppDetailBand;
    ppLine1: TppLine;
    ppReport1DBText2: TppDBText;
    ppReport1DBText3: TppDBText;
    ppReport1DBText5: TppDBText;
    ppReport1DBText6: TppDBText;
    ppReport1DBText8: TppDBText;
    ppReport1DBText9: TppDBText;
    ppDBText2: TppDBText;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppRSummaryBand1: TppSummaryBand;
    ppRLabel16: TppLabel;
    ppRDBCalc1: TppDBCalc;
    raCodeModule1: TraCodeModule;
    raProgramInfo1: TraProgramInfo;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FNombre, FArchivo: string;
    FCerrar: boolean;
    FEmpresa: string;

    procedure OnClosePrintDialog(Sender: TObject);
    procedure OnCreatePrintDialog(Sender: TObject);
    procedure SetNombre(const Value: string);
    procedure SetEmpresa(const Value: string);
  public
    { Public declarations }
    function CargarTemplate: boolean;
    function CerrarAlTerminar: boolean;
    procedure CerrarDataSets;
    function Imprima: boolean;
    procedure enviarPorEmail( const denomina, email , archivo: string );

    property Nombre: string read FNombre write SetNombre;
    property NombreEmpresa: string read FEmpresa write SetEmpresa;
  end;

  var
    Dialogo: boolean;

  procedure SetDialogo( SiNo: boolean );

  procedure Disenar;
  function generarInforme(const Nom: string; aData: array of TDataSet; Vista: boolean = true ): boolean;
  function VerInforme( const Nom: string; AMaster: TDataSet; ADet: TDataSet=nil;
                    ARes: TDataSet=nil; Vista: boolean = true ): boolean;
  function VerInformeHTML( const Nom: string; AMaster: TDataSet; ADet: TDataSet=nil;
                    ARes: TDataSet=nil; Vista: boolean = true ): boolean;
  function ArchivoInforme( const Nom: string; var Arch: string; AMaster: TDataSet; ADet: TDataSet=nil;
                    ARes: TDataSet=nil ): boolean;
  procedure crearInforme( const informe: string; AMaster: TDataSet );

  function imprimirFacturaElectronica( codigo: string; numero: integer; const formulario: string; Head, Detail, Config, DetIVA, DetRemito:TFDMemTable ): boolean;


var
  FInformes: TFInformes;


implementation
uses
     DMCompras, DMVentas, FuncsRB;

{$R *.dfm}

procedure Disenar;
begin
     with TFInformes.create( application ) do
     try
          ppGestor.ShowModal;
     finally
            free;
     end;
end;

function generarInforme(const Nom: string; aData: array of TDataSet; Vista: boolean = true ): boolean;
var
  i: integer;
begin
     with TFInformes.create( application ) do
     try
          Nombre := Nom;

          i := high( aData );
          DMaster.DataSet := aData[0];
          if i>0 then
            DDet.DataSet := aData[1];
          if i>1 then
            DRes.DataSet := aData[2];
          if i>2 then
            DOtro.DataSet := aData[3];
          if i>3 then
            DsAdicional.DataSet := aData[4];
          CargarTemplate;

          if not Vista then
               ppR.DeviceType := 'printer';
          if not ( Dialogo ) then
            ppR.ShowPrintDialog := false;
          Result := Imprima;
     finally
        free;
     end;
end;

function VerInforme( const Nom: string; AMaster: TDataSet; ADet: TDataSet=nil;
                    ARes: TDataSet=nil; Vista: boolean = true ):boolean;
begin
     with TFInformes.create( application ) do
     try
          Nombre := Nom;
          DMaster.DataSet := AMaster;
          DDet.DataSet := ADet;
          DRes.DataSet := ARes;

          CargarTemplate;

          if not Vista then
               ppR.DeviceType := 'printer';
          if not ( Dialogo ) then
            ppR.ShowPrintDialog := false;
          Result := Imprima;
     finally
            free;
     end;
end;

function VerInformeHTML( const Nom: string; AMaster: TDataSet; ADet: TDataSet=nil;
                    ARes: TDataSet=nil; Vista: boolean = true ): boolean;
begin
     with TFInformes.create( application ) do
     try
          Nombre := Nom;
          DMaster.DataSet := AMaster;
          DDet.DataSet := ADet;
          DRes.DataSet := ARes;

          CargarTemplate;
          ppR.DeviceType := 'HTMLFile';
          Result := Imprima;
     finally
            free;
     end;
end;

procedure crearInforme( const informe: string; AMaster: TDataSet );
var
  i, izq, tope, ancho, ancholbl, anchofld: integer;
  anchocar: double;
  albl: TObjectList<TppLabel>;
  aFld: TObjectList<TppDbText>;
  lDataPipeline: TppDBPipeline;
  lDataSource: TDataSource;
  lReport: TppReport;
  lSysVar: TppSystemVariable;
  lDrawLine: TppDrawLine;
  titulo: TppLabel;

  lCustomText: TppCustomText;
  lBitmap: TBitmap;
begin
     try
          AMaster.disablecontrols;

          lDataSource := TDataSource.Create(nil);
          lDataSource.Name := AMaster.Name;
          lDataSource.DataSet := AMaster;

          lDataPipeline := TppDBPipeline.Create(nil);
          lDataPipeline.Name := 'main';
          lDataPipeline.DataSource := lDataSource;

          lReport := TppReport.Create(nil);
          lReport.DataPipeline := lDataPipeline;
          lReport.CreateDefaultBands;

          lReport.HeaderBand.PrintHeight := phDynamic;
          lReport.DetailBand.PrintHeight := phDynamic;

          aLbl := TObjectList<TppLabel>.create;
          aFld := TObjectList<TppDbText>.create;

          Titulo := TppLabel.Create(nil);
          Titulo.Band := lReport.HeaderBand;
          Titulo.spLeft := 20;
          Titulo.spTop := 2;
          Titulo.Caption := 'LISTADO AUTOMATICO : ' + informe;
          Titulo.Font.Style := [fsBold];
          Titulo.Font.Color := clGreen;
          Titulo.Font.Size := 14;

          izq := 2;
          tope:= 2;

          lBitmap := TBitmap.Create;
          lCustomText := tppCustomText.Create(nil);
          lCustomText.Font.Size := 9;
          lCustomText.Text := 'M';
          anchocar := lBitmap.Canvas.TextWidth(lCustomText.Text);
          lCustomText.Free;

          for I := 0 to AMaster.FieldCount-1 do
          begin
              aLbl.add( TppLabel.Create(nil));
              aLbl[i].Band := lReport.HeaderBand;
              aLbl[i].spLeft := izq;
              aLbl[i].spTop := tope + Titulo.spHeight + 5;
              aLbl[i].Caption := AMaster.fields[i].DisplayLabel;
              aLbl[i].Font.Style := [fsBold];
              aLbl[i].Font.Color := clMaroon;
              aLbl[i].Font.Size := 10;
              ancholbl := length( aLbl[i].Caption );

              aFld.Add( TppDBText.Create(nil));
              aFld[i].Band := lReport.DetailBand;
              aFld[i].spLeft := izq;
              aFld[i].spTop := tope;
              aFld[i].DataPipeline := lDataPipeline;
              aFld[i].font.size := 10;
              aFld[i].DataField := AMaster.fields[i].fieldName;

              {lCustomText := TppCustomText(aFld[i]);
              lBitmap.Canvas.Font := lCustomText.Font;
              ancho := lBitmap.Canvas.TextWidth(lCustomText.Caption);}
              try
                anchoFld := AMaster.FieldDefs[i].Size; // lo anterior no anda :(
              except
                on e:exception do
                  anchoFld := 14;
              end;
              if (anchoLbl>anchofld) then ancho := anchoLbl else ancho := anchofld;
              ancho := round( ancho * anchocar);
              aFld[i].AutoSize := true;
              // aFld[i].spWidth := ancho;
              izq := round(izq + ancho + anchocar);
              if ( izq > lReport.DetailBand.spWidth ) then
              begin
                  izq := 2;
                  tope := tope + aFld[i].spHeight + 2;
              end;
          end;

          tope := tope + 1;
          lDrawLine := TppDrawLine.Create(nil);
          lDrawLine.Band := lReport.HeaderBand;
          lDrawLine.LinePosition := lpTop;
          lDrawLine.Left := 2;
          lDrawLine.Width := lReport.DetailBand.spWidth;
          lDrawLine.Top := tope + Titulo.spHeight + 5;

          lSysVar := TppSystemVariable.Create(nil);
          lSysVar.Band := lReport.FooterBand;
          lSysVar.VarType := vtPrintDateTime;
          lSysVar.spLeft := 2;
          lSysVar.spTop := 2;
          lSysVar := TppSystemVariable.Create(nil);
          lSysVar.Band := lReport.FooterBand;
          lSysVar.VarType := vtPageNoDesc;
          lSysVar.Alignment := taRightJustify;
          lSysVar.spLeft := (lReport.PrinterSetup.PageDef.spPrintableWidth-lSysVar.spWidth) -2; lSysVar.spTop := 2;

          lReport.print;
     finally
          lBitmap.Free;
          aLbl.Free;
          aFld.Free;
          AMaster.enablecontrols;
     end;
end;

procedure TFInformes.FormCreate(Sender: TObject);
begin
     FCerrar := false;
     FEmpresa := FDMVentas.MDatosRUTAEMPRESA.Value;
end;

function TFInformes.Imprima:boolean;
begin
     try
          FCerrar := CerrarAlTerminar;
          Result := false;
          ppR.print;
          Result := true;
     finally
          CerrarDataSets;
     end;
end;

function TFInformes.CargarTemplate: boolean;
var
  ruta, rutaempresa: string;
begin
     ruta := ExtractFilePath( Application.ExeName ) + 'Informes\';
     if FEmpresa <> '' then
        rutaempresa := ExtractFilePath( Application.ExeName ) + 'salidas\' + FEmpresa + '\Informes\'
     else
        rutaempresa := ExtractFilePath( Application.ExeName ) + 'salidas\Informes\';

     if FileExists( rutaempresa + FNombre ) then
        ppR.Template.FileName := rutaempresa + FNombre
     else
        ppR.Template.FileName := ruta + FNombre;

     ppR.Template.LoadFromFile;

     ppR.ArchiveFileName := rutaEmpresa + ppR.ArchiveFileName;
     ppR.TextFileName := ppR.ArchiveFileName + '.txt';
     Result := true;
end;

procedure TFInformes.SetEmpresa(const Value: string);
begin
  FEmpresa := Value;
end;

procedure TFInformes.SetNombre(const Value: string);
begin
  FNombre := Value;
end;

function TFInformes.CerrarAlTerminar: boolean;
begin
     Result := not ( DMaster.DataSet.Active );
end;

procedure TFInformes.CerrarDataSets;
begin
     if FCerrar then
     begin
          DMaster.DataSet.Close;
          if Assigned( DDet.DataSet ) then
               DDet.DataSet.Close;
          if Assigned( DRes.DataSet ) then
               DRes.DataSet.Close;
     end;
end;

procedure TFInformes.enviarPorEmail(const denomina, email, archivo: string);
begin
     if (email <> null ) and ( email <> '') then
     begin
       FEnviarEmail := TFEnviarEmail.create(self);
       try
         FEnviarEmail.email := email;
         FEnviarEmail.adjunto := archivo;
         FEnviarEmail.body := 'Sres: ' + denomina + #13 + 'Adjunto a la presente enviamos factura' + #13 + 'Atte.';
         FEnviarEmail.asunto := 'Envio de factura electronica';
         FEnviarEmail.showmodal;
       finally
          FEnviarEmail.free;
       end;
     end
     else
      showmessage('El cliente no tiene email asociado');
end;

function ArchivoInforme( const Nom: string; var Arch: string; AMaster: TDataSet; ADet: TDataSet=nil;
                    ARes: TDataSet=nil ): boolean;
var
  FCreate, FClose: TNotifyEvent;
begin
     with TFInformes.create( application ) do
     try
          Nombre := Nom;
          DMaster.DataSet := AMaster;
          DDet.DataSet := ADet;
          DRes.DataSet := ARes;
          FArchivo := Arch;

          CargarTemplate;

          FCreate := OnCreatePrintDialog;
          FClose := OnClosePrintDialog;

          ppR.OnPrintDialogClose := FClose;
          ppR.OnPrintDialogCreate := FCreate;

          ppR.ShowPrintDialog := true;
          ppR.DeviceType := 'PDFFile';

          Result := Imprima;
          if result then
            Arch := FArchivo;
     finally
            free;
     end;
end;

function imprimirFacturaElectronica( codigo: string; numero: integer; const formulario: string; Head, Detail, Config, DetIVA, DetRemito:TFDMemTable ): boolean;
var
  lPDFDevice: TMyPDFDevice;
  sCod, sNum: string;
  txt, fVieTxt: string;
begin
    Result := false;
    with TFInformes.create( application ) do
    try
      Nombre := Formulario;
      DMaster.DataSet := Head;
      DDet.DataSet := Detail;
      DRes.DataSet := Config;
      DOtro.DataSet := DetIVA;
      DOtro.DataSet := DetIVA;
      dsAdicional.DataSet := DetRemito;

      CargarTemplate;
      ppR.DeviceType := 'Screen';
      ppR.PrinterSetup.Copies := 3;

      sCod := head.fieldByName('LETRA').asstring + '-' + head.FieldByName('SUCURSAL').DisplayText;
      sNum := format('%8.8d', [numero]);
      // showmessage( Nombreempresa + ' y ' + Fempresa );
      if NombreEmpresa = '' then
        txt := extractfilepath( application.exename ) + 'salidas\afip\' + sCod + '-' + snum + '-' + head.FieldByName('BENEFICIARIO').value + '.pdf'
      else
        txt := extractfilepath( application.exename ) + 'salidas\' + NombreEmpresa + '\afip\' + sCod + '-' + snum + '-' + head.FieldByName('BENEFICIARIO').value + '.pdf';

      ppR.TextFileName := txt;
      ppR.ArchiveFileName := txt;
      ppR.AllowPrintToFile := True;
      ppR.DeviceType := 'PDFFile';

      if not ( FileExists( txt )) then // solo generar si no existe. en caso contrario imprimir. Para generar de nuevo eliminar manualmente de carpeta.
      begin

        lPDFDevice := TMyPDFDevice.Create(nil);
        lPDFDevice.FileName := ppR.ArchiveFileName;

        //Don't end the job after the first report.
        lPDFDevice.EndPrintJob := False;
        lPDFDevice.Publisher := ppR.Publisher;

        SetCadenaRb('ORIGINAL');
        //Print the first report
        ppR.PrintToDevices;

        SetCadenaRb('DUPLICADO');
        ppR.Reset;
        lPDFDevice.Reset;

        lPDFDevice.Publisher := ppR.Publisher;

        //No need to start a new print job.
        lPDFDevice.StartPrintJob := False;
        // lPDFDevice.EndPrintJob := True;

        //Print the second report
        ppR.PrintToDevices;

        SetCadenaRb('TRIPLICADO');
        ppR.Reset;
        lPDFDevice.Reset;
        lPDFDevice.Publisher := ppR.Publisher;
        lPDFDevice.StartPrintJob := False;
        lPDFDevice.EndPrintJob := True;

        //Print the third report
        ppR.PrintToDevices;

        lPDFDevice.Free;
      end;

      ShellExecute(Handle, 'open', PChar(ppR.ArchiveFileName), nil, nil, SW_SHOW);

      enviarPorEmail( Head.FieldByName('BENEFICIARIO').AsString, Head.FieldByName('email').AsString , ppR.ArchiveFileName );
      Result := true;
     except
        on e:exception do
          ShowMessage( 'Error al abrir lector PDF' + #13 + e.Message );
     end;
end;

procedure TFInformes.OnClosePrintDialog(Sender: TObject);
begin
  FArchivo := tppProducer( Sender ).printdialog.TextFileName;
end;

procedure TFInformes.OnCreatePrintDialog(Sender: TObject);
begin
  tppProducer( Sender ).printdialog.TextFileName := FArchivo;
end;

// definicion de funciones para setear aspectos accesorios en la impresion de informes
procedure SetDialogo( SiNo: boolean );
begin
  Dialogo := SiNo;
end;

initialization
  Dialogo := true;


end.
