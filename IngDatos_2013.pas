unit IngDatos_2013;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  cxControls, dmres,
  Vcl.ExtCtrls,
  cxStyles, cxClasses, cxLocalization, JvFormPlacement, JvComponentBase,
  JvAppStorage, JvAppIniStorage, System.Actions, Vcl.ActnList,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, dxRibbonSkins, Data.DB,
  Vcl.DBActns, dxBarExtItems, dxBar, cxNavigator, cxDBNavigator, dxRibbon,
  dxRibbonCustomizationForm, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinsdxRibbonPainter, dxSkinsdxBarPainter;

type
  TFIng = class(TForm)
    mgr: TdxBarManager;
    mgrBar1: TdxBar;
    mgrBar4: TdxBar;
    mgrBar5: TdxBar;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    cinta: TdxRibbon;
    ctInfo: TdxRibbonTab;
    ctAyu: TdxRibbonTab;
    Aclst: TActionList;
    mSalir: TAction;
    mAyuda: TAction;
    mImprimir: TAction;
    jvIni: TJvAppIniFileStorage;
    jvForm: TJvFormStorage;
    cxLocal: TcxLocalizer;
    repositorio: TcxStyleRepository;
    even: TcxStyle;
    odd: TcxStyle;
    group: TcxStyle;
    footer: TcxStyle;
    Panel1: TPanel;
    cxDBNavigator1: TcxDBNavigator;
    DIng: TDataSource;
    ctOpera: TdxRibbonTab;
    mgrBar6: TdxBar;
    dxBarLargeButton10: TdxBarLargeButton;
    dxBarLargeButton11: TdxBarLargeButton;
    DatasetPost1: TDataSetPost;
    DatasetCancel1: TDataSetCancel;
    mgrBar2: TdxBar;
    cxCampo: TdxBarCombo;
    cxBuscar: TdxBarEdit;
    cxFecha: TdxBarDateCombo;
    procedure mSalirExecute(Sender: TObject);
    procedure mImprimirExecute(Sender: TObject);
    procedure mAyudaExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxBuscarCurChange(Sender: TObject);
    procedure cxCampoChange(Sender: TObject);
  private
    { Private declarations }
    FUrl, FPage: string;
  public
    { Public declarations }

  end;

var
  FIng: TFIng;

implementation
uses
  informes, browse;
{$R *.dfm}

procedure TFIng.cxBuscarCurChange(Sender: TObject);
begin
  if (cxCampo.ItemIndex >-1 )  then
  begin
      DIng.dataset.locate( cxCampo.Items[cxCampo.ItemIndex], cxBuscar.CurText, [loPartialKey] );
  end;
end;

procedure TFIng.cxCampoChange(Sender: TObject);
begin
    try
      if ( dIng.DataSet.FieldByName( cxCampo.Text ).dataType = ftDateTime ) then
      begin
        cxBuscar.Visible := ivNever;
        cxFecha.visible := ivAlways;
      end
      else
      begin
        cxBuscar.Visible := ivAlways;
        cxFecha.visible := ivNever;
      end;

    finally

    end;

end;

procedure TFIng.FormCreate(Sender: TObject);
var
  i: integer;
begin
    FURL := 'http://www.sisnob.com.ar/';
    FPage := 'index.php';

    cxLocal.FileName := ExtractFilePath(Application.ExeName) + 'Ini\castellano.ini';
    cxLocal.Active := True;
    cxLocal.Locale := $2c0a;

    with DIng.DataSet do
    try
      for i := 0 to fieldcount-1 do
        cxCampo.Items.Add(Fields[i].FieldName);
      cxcampo.ItemIndex := 0;
    finally

    end;
end;

procedure TFIng.mAyudaExecute(Sender: TObject);
begin
  BrowseURL( FUrl + FPage );
end;

procedure TFIng.mImprimirExecute(Sender: TObject);
begin
    Informeficha( DIng.DataSet, 'IMPRESION de FICHA ' );
end;

procedure TFIng.mSalirExecute(Sender: TObject);
begin
     close;
end;

end.
