unit aguardeDlg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TFAguardeDlg = class(TForm)
    lblInfo: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAguardeDlg: TFAguardeDlg;

procedure aguarde_mostrar( const cadena: string = '');
procedure aguarde_cerrar;

implementation

{$R *.dfm}

procedure aguarde_mostrar( const cadena: string);
begin
    FAguardeDlg := TFAguardeDlg.Create( nil );
    if (cadena<>'') then
       FAguardeDlg.lblInfo.Caption := cadena;
    FAguardeDlg.show;
    application.ProcessMessages;
end;

procedure aguarde_cerrar;
begin
     if (FAguardeDlg <> nil) then
     begin
        FreeAndNil( FAguardeDlg );
        application.ProcessMessages;
     end;
end;


end.
