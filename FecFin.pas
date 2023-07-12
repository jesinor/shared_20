unit FecFin;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, DateUtils, ComCtrls, pngimage, Mask, JvExMask, JvToolEdit;

type
  TFecFinDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    Label1: TLabel;
    FecFin: TJvDateEdit;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FecFinDlg: TFecFinDlg;

implementation

{$R *.DFM}

procedure TFecFinDlg.FormCreate(Sender: TObject);
begin
     FecFin.date := StartOfTheMonth(date)-1;
end;

end.
