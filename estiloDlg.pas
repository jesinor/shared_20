unit estiloDlg;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, OKCANCL2, vcl.themes;

type
  TselEstiloVisual = class(TOKRightDlg)
    lista: TListBox;
    procedure HelpBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
  private
    { Private declarations }
    Estilo: TStyleManager;
  public
    { Public declarations }
  end;

var
  selEstiloVisual: TselEstiloVisual;

implementation

{$R *.dfm}

procedure TselEstiloVisual.FormCreate(Sender: TObject);
var
	  StyleName: string;
begin
  inherited;
  Estilo := TStyleManager.Create;
  Lista.Items.Clear;
  for StyleName in TStyleManager.StyleNames do
    Lista.Items.Add(StyleName);
end;

procedure TselEstiloVisual.FormDestroy(Sender: TObject);
begin
  inherited;
  Estilo.free;
end;

procedure TselEstiloVisual.HelpBtnClick(Sender: TObject);
begin
  Application.HelpContext(HelpContext);
end;

procedure TselEstiloVisual.OKBtnClick(Sender: TObject);
begin
  inherited;
  if Lista.ItemIndex >= 0 then
	    TStyleManager.SetStyle(Lista.Items[Lista.ItemIndex]);
end;

end.
 
