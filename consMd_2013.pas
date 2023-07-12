unit consMd_2013;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  dxSkinsdxBarPainter, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxRibbonSkins, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxDataStorage,
  cxEdit, Data.DB, cxDBData, cxLocalization, Datasnap.Provider,
  Datasnap.DBClient, System.Actions, Vcl.ActnList, JvAppStorage,
  JvAppIniStorage, JvComponentBase, JvFormPlacement, Vcl.ImgList, dxBar,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxStatusBar, dxRibbonStatusBar,
  dxRibbon, cxGridExportLink, cxStyles, cxCustomData, cxFilter, cxData,
  dxSkinsdxRibbonPainter, cxNavigator, Vcl.ExtCtrls, JvExExtCtrls,
  JvExtComponent, JvCaptionPanel, Vcl.Grids, vcl.Wwdatainspector, vcl.wwrcdpnl,
  JvDBGridExport, Vcl.DBActns, dxRibbonCustomizationForm, System.ImageList,
  cxDataControllerConditionalFormattingRulesManagerDialog;

resourcestring
  rtExportado = 'Consulta exportada con exito';

type
  TFConsMd_2013 = class(TForm)
    mgr: TdxBarManager;
    ctInfo: TdxRibbonTab;
    cinta: TdxRibbon;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    imagenes: TImageList;
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
    JvCaptionPanel1: TJvCaptionPanel;
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
    recPnl: TwwRecordViewPanel;
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
  private
    { Private declarations }
    FAbrir_auto: Boolean;
    FURL: string;
    FPage: string;
    FClaves: TStringlist;

    function getArchivo( var nombre: string; idx: integer ): Boolean;
    procedure SetAbrir_auto(const Value: Boolean);
    procedure SetPage(const Value: string);
    procedure SetURL(const Value: string);
    function Getclave(Index: integer): string;
    procedure Setclave(Index: integer; const Value: string);
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

    property URL: string read FURL write SetURL;
    property Page: string read FPage write SetPage;
    property clave[index: integer]: string read Getclave write Setclave;

    property Abrir_auto: Boolean read FAbrir_auto write SetAbrir_auto;
  end;

var
  FConsMd_2013: TFConsMd_2013;

implementation
uses
  browse, SelFechas;
{$R *.dfm}

procedure TFConsMd_2013.cdsFichaAfterScroll(DataSet: TDataSet);
begin
  // aqui cambiar la consulta detail
  // esto hace mas eficiente la misma segun mis mediciones...
  requeryDetalle;
end;

constructor TFConsMd_2013.create(AOwner: TComponent);
begin
    FIni := Date;
    FFin := Date;
    Abrir_auto := true;
    FURL := 'http://www.sisnob.com.ar/';
    FPage := 'index.php';

    // inherited create( AOwner );
    cxLocal.FileName := ExtractFilePath(Application.ExeName) + 'Ini\castellano.ini';
    cxLocal.Active := True;
    cxLocal.Locale := $2c0a;

end;

procedure TFConsMd_2013.FormCreate(Sender: TObject);
var
  ini: integer;
begin
    ini := gettickcount;
    FClaves := TStringlist.create;
    if ( FAbrir_auto ) and not ( cds.Active ) then
      requeryConsulta;
    OutputDebugString(PChar('tiempo: ' + inttostr( gettickcount-ini) + ' milisegundos' ));
end;

procedure TFConsMd_2013.FormDestroy(Sender: TObject);
begin
  FClaves.free;
end;

function TFConsMd_2013.getArchivo(var nombre: string; idx: Integer ): Boolean;
begin
  grabar.FilterIndex := idx;
  if ( grabar.Execute ) then
  begin
    nombre := grabar.FileName;
    result := true;
  end;
end;

function TFConsMd_2013.Getclave(index: integer): string;
begin
    result := FClaves[index];
end;

procedure TFConsMd_2013.imprima(vista: boolean);
begin
  // verinforme...
end;

procedure TFConsMd_2013.mAyudaExecute(Sender: TObject);
begin
  BrowseURL( FUrl + FPage );
end;

procedure TFConsMd_2013.mCamFecExecute(Sender: TObject);
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
             RequeryDetalle;
        end;
     finally
            free;
     end;
end;

procedure TFConsMd_2013.mExportar_htmlExecute(Sender: TObject);
begin
    screen.Cursor := crHourGlass;
     if getArchivo( archivo, 3 ) then
     begin
      ExportGridToHTML( archivo, grilla, True, False );
      showmessage( rtExportado );
     end;
    screen.Cursor := crDefault;
end;

procedure TFConsMd_2013.mExportar_txtExecute(Sender: TObject);
begin
    screen.Cursor := crHourGlass;
     if getArchivo( archivo, 2 ) then
     begin
      ExportGridToText( archivo, grilla, True, False );
      showmessage( rtExportado );
     end;
    screen.Cursor := crDefault;

end;

procedure TFConsMd_2013.mExportar_xlsExecute(Sender: TObject);
begin
    screen.Cursor := crHourGlass;
     if getArchivo( archivo, 1 ) then
     begin
      ExportGridToExcel( archivo, grilla, True, False );
      showmessage( rtExportado );
     end;
    screen.Cursor := crDefault;
end;

procedure TFConsMd_2013.mExportar_xmlExecute(Sender: TObject);
begin
    screen.Cursor := crHourGlass;
     if getArchivo( archivo, 4 ) then
     begin
      ExportGridToXML( archivo, grilla, True, False );
      showmessage( rtExportado );
     end;
    screen.Cursor := crDefault;
end;

procedure TFConsMd_2013.mImprimirExecute(Sender: TObject);
begin
  imprima( false );
end;

procedure TFConsMd_2013.mSalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFConsMd_2013.mVisPreExecute(Sender: TObject);
begin
     imprima( true );
end;

procedure TFConsMd_2013.requeryConsulta;
begin
    if not (cdsFicha.Active) then
      cdsFicha.Open;
end;

procedure TFConsMd_2013.requeryDetalle;
var
  I: Integer;
  Field: TAggregateField;
begin
  if FClaves <> nil then
  try
      cds.Active := False;
      for I := 0 to FClaves.count-1 do
        cds.Params[i].value := cdsFicha.FieldByName( FClaves[i] ).value;
  finally
    cds.open;
  end;
end;

procedure TFConsMd_2013.SetAbrir_auto(const Value: Boolean);
begin
  FAbrir_auto := Value;
end;

procedure TFConsMd_2013.Setclave(Index: integer; const Value: string);
begin
  if FClaves.count <= index then
    FClaves.add( value )
  else
    FClaves[index] := value;
end;

procedure TFConsMd_2013.SetPage(const Value: string);
begin
  FPage := Value;
end;

procedure TFConsMd_2013.SetURL(const Value: string);
begin
  FURL := Value;
end;

end.
