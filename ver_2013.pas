unit ver_2013;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData, cxGridCustomView, cxGridCustomTableView,
  cxGridCustomLayoutView, cxGridCardView, cxGridDBCardView, cxClasses,
  cxGridLevel, cxGrid, Vcl.ImgList, Vcl.DBActns, System.Actions, Vcl.ActnList,
  Datasnap.Provider, Datasnap.DBClient, System.ImageList;

type
  TFVer_2013 = class(TForm)
    grilla: TcxGrid;
    Base: TcxGridLevel;
    vista: TcxGridDBCardView;
    DCds: TDataSource;
    Cds: TClientDataSet;
    Dsp: TDataSetProvider;
    ac: TActionList;
    Imprima: TAction;
    Cerrar: TAction;
    DataSetFirst1: TDataSetFirst;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetLast1: TDataSetLast;
    Imagechica: TImageList;
    imagenes: TImageList;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Fno_abrir: boolean;
    procedure Setno_abrir(const Value: boolean);
    { Private declarations }
  public
    { Public declarations }
    property no_abrir: boolean read Fno_abrir write Setno_abrir;
  end;

var
  FVer_2013: TFVer_2013;

implementation

{$R *.dfm}

procedure TFVer_2013.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  cds.Close;

end;

procedure TFVer_2013.FormShow(Sender: TObject);
begin
    if not (FNo_Abrir) then
      if not ( cds.active ) then
        cds.Open;
end;

procedure TFVer_2013.Setno_abrir(const Value: boolean);
begin
  Fno_abrir := Value;
end;

end.
