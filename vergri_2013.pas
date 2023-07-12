unit vergri_2013;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData, cxGridCustomView, cxGridCustomTableView,
  cxGridCustomLayoutView, cxGridCardView, cxGridDBCardView, cxClasses,
  cxGridLevel, cxGrid, Vcl.ImgList, Vcl.DBActns, System.Actions, Vcl.ActnList,
  Datasnap.Provider, Datasnap.DBClient, cxGridTableView, cxGridDBTableView,
  System.ImageList;

type
  TFVerGri_2013 = class(TForm)
    grilla: TcxGrid;
    Base: TcxGridLevel;
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
    vista: TcxGridDBTableView;
    cxRepos: TcxStyleRepository;
    cxAlter: TcxStyle;
    cxFocus: TcxStyle;
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
  FVerGri_2013: TFVerGri_2013;

implementation

{$R *.dfm}

procedure TFVerGri_2013.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cds.Close;
end;

procedure TFVerGri_2013.FormShow(Sender: TObject);
begin
    if not (FNo_Abrir) then
      if not ( cds.active ) then
        cds.Open;
end;

procedure TFVerGri_2013.Setno_abrir(const Value: boolean);
begin
  Fno_abrir := Value;
end;

end.
