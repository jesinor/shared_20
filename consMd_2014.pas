unit consMd_2014;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxLocalization,
  Datasnap.Provider, Datasnap.DBClient, Vcl.DBActns, System.Actions,
  Vcl.ActnList, JvAppStorage, JvAppIniStorage, JvComponentBase, JvFormPlacement,
  Vcl.ImgList, dxBar, Vcl.ExtCtrls, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxGridExportLink,
  dxStatusBar, dxRibbonStatusBar, dxRibbon, dmres, dxRibbonSkins,
  dxRibbonCustomizationForm,
  cxDataControllerConditionalFormattingRulesManagerDialog;

resourcestring
  rtExportado = 'Consulta exportada con exito';
  ctRegConsulta = 'Software\SISNOB19\consultas\';

type
  TFConsMd_2014 = class(TForm)
    mgr: TdxBarManager;
    ctInfo: TdxRibbonTab;
    cinta: TdxRibbon;
    sb: TdxRibbonStatusBar;
    jvForm: TJvFormStorage;
    jvIni: TJvAppIniFileStorage;
    Aclst: TActionList;
    mSalir: TAction;
    mAyuda: TAction;
    mImprimir: TAction;
    mVisPre: TAction;
    mCamFec: TAction;
    mExportar_xls: TAction;
    ctAcc: TdxRibbonTab;
    ctAyu: TdxRibbonTab;
    mgrBar1: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    mgrBar2: TdxBar;
    mgrBar3: TdxBar;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    mgrBar4: TdxBar;
    dxBarLargeButton8: TdxBarLargeButton;
    vista: TcxGridDBTableView;
    Base: TcxGridLevel;
    grilla: TcxGrid;
    Ds: TDataSource;
    cds: TClientDataSet;
    dsp: TDataSetProvider;
    dxBarLargeButton9: TdxBarLargeButton;
    mExportar_html: TAction;
    mExportar_txt: TAction;
    mExportar_xml: TAction;
    grabar: TSaveDialog;
    cxLocal: TcxLocalizer;
    DsFicha: TDataSource;
    cdsFicha: TClientDataSet;
    DspFicha: TDataSetProvider;
    mgrBar7: TdxBar;
    DatasetFirst2: TDataSetFirst;
    DatasetPrior2: TDataSetPrior;
    DatasetNext2: TDataSetNext;
    DatasetLast2: TDataSetLast;
    dxBarLargeButton16: TdxBarLargeButton;
    dxBarLargeButton17: TdxBarLargeButton;
    dxBarLargeButton18: TdxBarLargeButton;
    dxBarLargeButton19: TdxBarLargeButton;
    mgrBar5: TdxBar;
    dxBarLargeButton20: TdxBarLargeButton;
    JvCaptionPanel1: TPanel;
    procedure mSalirExecute(Sender: TObject);
    procedure mCamFecExecute(Sender: TObject);
    procedure mVisPreExecute(Sender: TObject);
    procedure mImprimirExecute(Sender: TObject);
    procedure mExportar_xlsExecute(Sender: TObject);
    procedure mExportar_htmlExecute(Sender: TObject);
    procedure mExportar_txtExecute(Sender: TObject);
    procedure mExportar_xmlExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mAyudaExecute(Sender: TObject);
    procedure cdsFichaAfterScroll(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FAbrir_auto: Boolean;
    FURL: string;
    FPage: string;
    FClaves: TStringlist;
    EnInicio: boolean;

    function getArchivo( var nombre: string; idx: integer ): Boolean;
    procedure SetAbrir_auto(const Value: Boolean);
    procedure SetPage(const Value: string);
    procedure SetURL(const Value: string);
    function Getclave(Index: integer): string;
    procedure Setclave(Index: integer; const Value: string);
    procedure SetEn_Inicio(const Value: boolean);
  protected
    FIni, FFin: TDateTime;
    archivo: string;
  public
    { Public declarations }
//  cxLocal: TcxLocalizer;
    procedure requeryConsulta; virtual;
    procedure requeryDetalle; virtual;
    procedure imprima( vista: boolean = true ); virtual;
    constructor create( AOwner: TComponent ); overload;

    procedure buscar( const codigo: string ); overload; virtual;
    procedure buscar( const codigo: integer ); overload; virtual;

    property URL: string read FURL write SetURL;
    property Page: string read FPage write SetPage;
    property clave[index: integer]: string read Getclave write Setclave;

    property Abrir_auto: Boolean read FAbrir_auto write SetAbrir_auto;
    property En_Inicio: boolean read EnInicio write SetEn_Inicio;
  end;

var
  FConsMd_2014: TFConsMd_2014;

implementation
uses
  browse, SelFechas;
{$R *.dfm}

procedure TFConsMd_2014.buscar(const codigo: string);
begin
    EnInicio := true;
    cdsFicha.Locate( FClaves[0], codigo, [] );
    EnInicio := false;
    requeryDetalle;
end;

procedure TFConsMd_2014.buscar(const codigo: integer);
begin
    EnInicio := true;
    cdsFicha.Locate( FClaves[0], codigo, [] );
    EnInicio := false;
    requeryDetalle;
end;

procedure TFConsMd_2014.cdsFichaAfterScroll(DataSet: TDataSet);
begin
  // aqui cambiar la consulta detail
  // esto hace mas eficiente la misma segun mis mediciones...
  if not EnInicio then
    requeryDetalle;
end;

constructor TFConsMd_2014.create(AOwner: TComponent);
begin
    FIni := Date;
    FFin := Date;
    Abrir_auto := true;
    FURL := 'http://www.sisnob.com.ar/';
    FPage := 'index.php';

    inherited create( AOwner );
    cxLocal.FileName := ExtractFilePath(Application.ExeName) + 'Ini\castellano.ini';
    cxLocal.Active := True;
    cxLocal.Locale := $2c0a;

    FClaves := TStringlist.create;
end;

procedure TFConsMd_2014.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      vista.StoreToRegistry(ctRegconsulta, false, [], self.Name );
end;

procedure TFConsMd_2014.FormCreate(Sender: TObject);
var
  ini: integer;
begin
    ini := gettickcount;
    EnInicio := true;
    if ( FAbrir_auto ) and not ( cds.Active ) then
      requeryConsulta;
    EnInicio := false;
    vista.RestoreFromRegistry(ctRegconsulta, true, false, [], self.Name  );
    OutputDebugString(PChar('tiempo: ' + inttostr( gettickcount-ini) + ' milisegundos' ));
end;

procedure TFConsMd_2014.FormDestroy(Sender: TObject);
begin
  FClaves.free;
end;

function TFConsMd_2014.getArchivo(var nombre: string; idx: Integer ): Boolean;
begin
  grabar.FilterIndex := idx;
  if ( grabar.Execute ) then
  begin
    nombre := grabar.FileName;
    result := true;
  end;
end;

function TFConsMd_2014.Getclave(index: integer): string;
begin
    result := FClaves[index];
end;

procedure TFConsMd_2014.imprima(vista: boolean);
begin
  // verinforme...
end;

procedure TFConsMd_2014.mAyudaExecute(Sender: TObject);
begin
  BrowseURL( FUrl + FPage );
end;

procedure TFConsMd_2014.mCamFecExecute(Sender: TObject);
begin
     with TSelFechasDlg.create( application ) do
     try
        FecIni.date := FIni;
        FecFin.date := FFin;
        ShowModal;
        if ModalResult = mrOK then
        begin
             FIni := FecIni.date;
             FFin := FecFin.date;
             // requeryConsulta;
             requeryDetalle;
        end;
     finally
            free;
     end;
end;

procedure TFConsMd_2014.mExportar_htmlExecute(Sender: TObject);
begin
    screen.Cursor := crHourGlass;
     if getArchivo( archivo, 3 ) then
     begin
      ExportGridToHTML( archivo, grilla, True, False );
      showmessage( rtExportado );
     end;
    screen.Cursor := crDefault;
end;

procedure TFConsMd_2014.mExportar_txtExecute(Sender: TObject);
begin
    screen.Cursor := crHourGlass;
     if getArchivo( archivo, 2 ) then
     begin
      ExportGridToText( archivo, grilla, True, False );
      showmessage( rtExportado );
     end;
    screen.Cursor := crDefault;

end;

procedure TFConsMd_2014.mExportar_xlsExecute(Sender: TObject);
begin
    screen.Cursor := crHourGlass;
     if getArchivo( archivo, 1 ) then
     begin
      ExportGridToExcel( archivo, grilla, True, False );
      showmessage( rtExportado );
     end;
    screen.Cursor := crDefault;
end;

procedure TFConsMd_2014.mExportar_xmlExecute(Sender: TObject);
begin
    screen.Cursor := crHourGlass;
     if getArchivo( archivo, 4 ) then
     begin
      ExportGridToXML( archivo, grilla, True, False );
      showmessage( rtExportado );
     end;
    screen.Cursor := crDefault;
end;

procedure TFConsMd_2014.mImprimirExecute(Sender: TObject);
begin
  imprima( false );
end;

procedure TFConsMd_2014.mSalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFConsMd_2014.mVisPreExecute(Sender: TObject);
begin
     imprima( true );
end;

procedure TFConsMd_2014.requeryConsulta;
begin
    if not (cdsFicha.Active) then
    begin
      cdsFicha.Open;
      requeryDetalle;
    end;
end;

procedure TFConsMd_2014.requeryDetalle;
var
  I: Integer;
begin
  cds.Active := False;
  try
    for I := 0 to FClaves.count-1 do
      cds.Params[i].value := cdsFicha.FieldByName( FClaves[i] ).value;
  finally
    cds.open;
  end;
end;

procedure TFConsMd_2014.SetAbrir_auto(const Value: Boolean);
begin
  FAbrir_auto := Value;
end;

procedure TFConsMd_2014.Setclave(Index: integer; const Value: string);
begin
  if FClaves.count <= index then
    FClaves.add( value )
  else
    FClaves[index] := value;
end;

procedure TFConsMd_2014.SetEn_Inicio(const Value: boolean);
begin
  EnInicio := value;
end;

procedure TFConsMd_2014.SetPage(const Value: string);
begin
  FPage := Value;
end;

procedure TFConsMd_2014.SetURL(const Value: string);
begin
  FURL := Value;
end;

end.
