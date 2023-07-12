unit SelFechas;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Mask, wwdbdatetimepicker, DateUtils,
  JvExMask, JvToolEdit, Vcl.Imaging.pngimage;

type
  TSelFechasDlg = class(TForm)
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    FecIni: TJvDateEdit;
    FecFin: TJvDateEdit;
    Image1: TImage;
    procedure FecIniExit(Sender: TObject);
    procedure FecFinExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelFechasDlg: TSelFechasDlg;

implementation

{$R *.DFM}

procedure TSelFechasDlg.FecIniExit(Sender: TObject);
begin
     if FecFin.date < FecIni.date then
          FecFin.date := FecIni.date;
end;

procedure TSelFechasDlg.FecFinExit(Sender: TObject);
begin
     if FecFin.date < FecIni.date then
          FecIni.date := FecFin.date;
end;

procedure TSelFechasDlg.FormCreate(Sender: TObject);
begin
     FecIni.date := StartOfTheMonth(date-25);
     FecFin.date := EndOfTheMonth(date-25);
end;

end.
