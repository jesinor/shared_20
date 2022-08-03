unit ingviagrilla;

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
  dxSkinTheBezier, cxDataControllerConditionalFormattingRulesManagerDialog,
  constantes, Vcl.ExtCtrls;

type
  TFIngViaGrilla = class(TForm)
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
    vista: TcxGridDBTableView;
    level: TcxGridLevel;
    grilla: TcxGrid;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    acAplicaCambios: TAction;
    acAnulaCambios: TAction;
    pnlTop: TPanel;
    procedure acSalirExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acAplicarCambiosExecute(Sender: TObject);
    procedure acAnularCambiosExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure aplicarCambios; virtual;
    procedure anularCambios; virtual;
  end;

var
  FIngViaGrilla: TFIngViaGrilla;

implementation
uses
  DMRes;

{$R *.dfm}

procedure TFIngViaGrilla.acAnularCambiosExecute(Sender: TObject);
begin
  if ( TFDDataset( ds.DataSet ).updatesPending ) then
    if TaskMessageDlg( rsEstaSeguro, rsConfirmaCambios, mtWarning, mbYesNo, 0 ) = mrYes then
      anularCambios;
end;

procedure TFIngViaGrilla.acAplicarCambiosExecute(Sender: TObject);
begin
  aplicarCambios;
end;

procedure TFIngViaGrilla.acSalirExecute(Sender: TObject);
begin
  close;
end;

procedure TFIngViaGrilla.anularCambios;
begin
  //
end;

procedure TFIngViaGrilla.aplicarCambios;
begin
  //
end;

procedure TFIngViaGrilla.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    if ( TFDDataset( ds.DataSet ).updatesPending ) then
      if TaskMessageDlg( rsConfirma, rsAnulaCambios, mtWarning, mbYesNo, 0 ) <> mrYes then
        abort;

end;

procedure TFIngViaGrilla.FormCreate(Sender: TObject);
begin
  // llamar a metodo de lectura
end;

end.
