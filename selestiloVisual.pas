unit selestiloVisual;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.themes, Inifiles;

type
  TFSelEstiloVisual = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    lista: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
  private
    { Private declarations }
    FIni: TInifile;
  public
    { Public declarations }
  end;

var
  FSelEstiloVisual: TFSelEstiloVisual;

implementation

{$R *.dfm}

procedure TFSelEstiloVisual.FormCreate(Sender: TObject);
var
	  Nombre, StyleName: string;
    Pos: integer;
begin
  inherited;
  Lista.Items.Clear;
  for StyleName in TStyleManager.StyleNames do
    Lista.Items.Add(StyleName);

  Nombre := TStyleManager.ActiveStyle.Name;
  Pos := Lista.Items.IndexOf(Nombre);
  if Pos >= 0 then
    Lista.ItemIndex := Pos;
end;

procedure TFSelEstiloVisual.OKBtnClick(Sender: TObject);
begin
  if Lista.ItemIndex >= 0 then
  begin
	    TStyleManager.SetStyle(Lista.Items[Lista.ItemIndex]);
      FIni := TIniFile.create( extractFilePath( Application.exename ) + 'conf/Config.ini');
      try
        FIni.WriteString('ESTILO', 'TEMA', Lista.Items[Lista.ItemIndex]);
      finally
        FIni.Free;
      end;
  end;
end;

end.
