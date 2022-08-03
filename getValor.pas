unit getValor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.ImageList,
  Vcl.ImgList;

type
  TgetValorDlg = class(TForm)
    btnOK: TButton;
    btnAnu: TButton;
    edvalor: TEdit;
    lblMje: TLabel;
    img: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function getDato( const dato: string ): string; overload;
  function getDato( const dato: integer ): integer; overload;

var
  getValorDlg: TgetValorDlg;

implementation

{$R *.dfm}

function getDato( const dato: string ): string; overload;
begin
  getValorDlg := TGetValorDlg.Create( nil);
  try
    Result := dato;
    getValorDlg.edvalor.Text := dato;
    getValorDlg.ShowModal;
    if getValorDlg.ModalResult = mrOK then
      Result := getValorDlg.edvalor.Text
  finally
    getValorDlg.Free;
  end;
end;

function getDato( const dato: integer ): integer; overload;
begin
  getValorDlg := TGetValorDlg.Create( nil);
  try
    Result := dato;
    getValorDlg.edvalor.Text := inttostr( dato );

    getValorDlg.edvalor.NumbersOnly := true;
    getValorDlg.ShowModal;
    if getValorDlg.ModalResult = mrOK then
      Result := strtointdef( getValorDlg.edvalor.Text, 0 );
  finally
    getValorDlg.Free;
  end;
end;


end.
