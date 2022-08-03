unit ingdatosgri;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxClasses, cxLocalization, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  Vcl.ComCtrls, Vcl.ToolWin, System.Actions, Vcl.ActnList, JvAppStorage,
  JvAppIniStorage, JvComponentBase, JvFormPlacement, dxSkinsCore, dxSkinCoffee,
  dxSkinGlassOceans, dxSkinLondonLiquidSky, dxSkinStardust, dxSkinscxPCPainter,
  dxSkinTheBezier, cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFIngDatosGri = class(TForm)
    jvForm: TJvFormStorage;
    jvIni: TJvAppIniFileStorage;
    Ac: TActionList;
    acSalir: TAction;
    tbMain: TToolBar;
    ToolButton1: TToolButton;
    Ds: TDataSource;
    cxLocal: TcxLocalizer;
    repositorio: TcxStyleRepository;
    even: TcxStyle;
    odd: TcxStyle;
    group: TcxStyle;
    footer: TcxStyle;
    cxSel: TcxStyle;
    FDMem: TFDMemTable;
    vista: TcxGridDBTableView;
    level: TcxGridLevel;
    grilla: TcxGrid;
    procedure acSalirExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FIngDatosGri: TFIngDatosGri;

implementation
uses
  DMSrd;

{$R *.dfm}

procedure TFIngDatosGri.acSalirExecute(Sender: TObject);
begin
  close;
end;

procedure TFIngDatosGri.FormCreate(Sender: TObject);
begin
  FDMem.CreateDataSet;
end;

procedure TFIngDatosGri.FormDestroy(Sender: TObject);
begin
  FDMem.close;
end;

end.
