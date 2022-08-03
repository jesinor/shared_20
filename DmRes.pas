unit DmRes;

interface

uses
  System.SysUtils, System.Classes, Vcl.ImgList, Vcl.Controls, System.ImageList;

type
  TDataRes = class(TDataModule)
    Img32_Main: TImageList;
    img16_Main: TImageList;
    img64_main: TImageList;
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
 // CAMBIOS en iconos para poder guardar el archivo y que se actualice. Sino no se graba!!
 // cambio en iconos sin fondo blanco 04/08 tomados directamente de carpeta icons.
 // 04/08 se incorporan iconos para graficos
 // 06/08 se incorporan iconos para graficos - 68
 // 11/08 se incorporan iconos para graficos - 41 y 42 en imagenes
 // 24/08 para listas un par de imagenes
 // 11/09 importar y exportar a excel. se usa un icon.
 // 15/09 Modificacion por iconos sin fondo.
 // 27/10 Agregar grafico de barras
 // 30/10 agregar icono para pdf
 // 15/02 cambio iconos para quitarle fondo
 // 04/04 cambio fondo de color en imagelist1
 // 07/07 agregar iconos grabar y cancelar
 // 25/09 cambio de iconos
 // 26/09 agregar iconos cheque y pagos
 // 21/10 agregar icono darth vader


end.
