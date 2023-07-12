unit DmReduRes;

interface

uses
  System.SysUtils, System.Classes, Vcl.ImgList, Vcl.Controls;

type
  TDataRes = class(TDataModule)
    ImageList1: TImageList;
    img: TImageList;
    imagenes: TImageList;
    imgseleccion: TImageList;
    imgInggrid: TImageList;
    Img32_Main: TImageList;
    img16_Main: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataRes: TDataRes;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
