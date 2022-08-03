unit myPDFDevice;

interface

uses ppPDFDevice, classes;

type

  {TmyPDFDevice }
  TmyPDFDevice = class(TppPDFDevice)
  private
    FEndPrintJob: Boolean;
    FStartPrintJob: Boolean;
  public
    constructor Create(aOwner: TComponent); override;
    procedure EndJob; override;
    procedure StartJob; override;
    property EndPrintJob: Boolean read FEndPrintJob write FEndPrintJob;
    property StartPrintJob: Boolean read FStartPrintJob write FStartPrintJob;

  end;

  
implementation

constructor TmyPDFDevice.Create(aOwner: TComponent);
begin
  inherited;

  FEndPrintJob := True;
  FStartPrintJob := True;

end;

procedure TmyPDFDevice.EndJob;
begin

  if FEndPrintJob then
    inherited;
  
end;

procedure TmyPDFDevice.StartJob;
begin

  if FStartPrintJob then
    inherited;

end;

end.
