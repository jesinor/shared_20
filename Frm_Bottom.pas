unit Frm_Bottom;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons;

type
  TFrmBottom = class(TFrame)
    Panel1: TPanel;
    bbGrabar: TBitBtn;
    bbAnular: TBitBtn;
    bbInsert: TBitBtn;
    Bevel1: TBevel;
    procedure FrameResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TFrmBottom.FrameResize(Sender: TObject);
begin
     bbGrabar.Left := ( ClientWidth div 2 ) - ( bbGrabar.Width * 3 div 2 );
     bbAnular.Left := bbGrabar.Left + bbGrabar.width + 1;
     bbInsert.Left := bbAnular.Left + bbAnular.width + 1; 
end;

end.
