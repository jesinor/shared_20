unit SelFecHasta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, jvToolEdit, JvExMask,
  ExtCtrls, pngimage;

type
  TSelFecHastaDlg = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Fecha: TJvDateEdit;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function seleccionarFecha( var FIni: TDateTime; const texto: string = '' ): boolean;
var
  SelFecHastaDlg: TSelFecHastaDlg;

implementation

{$R *.DFM}

function seleccionarFecha( var FIni: TDateTime; const texto: string): boolean;
begin
  with TSelFecHastaDlg.Create(nil) do
  try
      Fecha.Date := FIni;
      if (texto <> '') then
        GroupBox1.Caption := texto;
      showmodal;
      if modalResult = mrOK then
      begin
           FIni := Fecha.Date;
           Result := true;
      end;
  finally
      free;
  end;
end;


procedure TSelFecHastaDlg.FormCreate(Sender: TObject);
begin
     Fecha.Date := date;
end;

end.
