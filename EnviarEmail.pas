unit EnviarEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxClasses, dxStatusBar,
  dxRibbonStatusBar, dxBarApplicationMenu, dmres, cxPCdxBarPopupMenu,
  System.Actions, Vcl.ActnList, cxPC, IdMessage, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, JvExStdCtrls,
  JvCombobox, Vcl.Samples.Spin, inifiles, idAttachment, idAttachmentFile,
  dxRibbonCustomizationForm, dxBarBuiltInMenu, dxSkinsCore, dxSkinCaramel,
  dxSkinCoffee, dxSkinGlassOceans, dxSkinLilian, dxSkinLiquidSky,
  dxSkinsdxRibbonPainter, dxSkinscxPCPainter, dxSkinsdxBarPainter, IdSASL,
  IdSASLUserPass, IdSASLLogin, IdSASLAnonymous, IdSASLSKey, IdServerIOHandler,
  IdSSL, IdSSLOpenSSL, IdUserPassProvider, IdSASLPlain, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, Vcl.ExtActns, Vcl.FileCtrl;

type
  TFEnviareMail = class(TdxRibbonForm)
    barMgr: TdxBarManager;
    dxRibbon1: TdxRibbon;
    dxRibbon1Tab1: TdxRibbonTab;
    statusbar: TdxRibbonStatusBar;
    barMgrBar1: TdxBar;
    smtp: TIdSMTP;
    idMsg: TIdMessage;
    cxpage: TcxPageControl;
    pconfig: TcxTabSheet;
    pEnviar: TcxTabSheet;
    ac: TActionList;
    acConfig: TAction;
    acEmail: TAction;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    acFin: TAction;
    btnok: TBitBtn;
    btnAnu: TBitBtn;
    CcEdit: TEdit;
    SubjectEdit: TEdit;
    Label6: TLabel;
    AttachmentMemo: TMemo;
    SendBtn: TBitBtn;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    BodyEdit: TRichEdit;
    ToEdit: TEdit;
    Label10: TLabel;
    barMgrBar2: TdxBar;
    dxBarLargeButton3: TdxBarLargeButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Host: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    edhost: TEdit;
    edusu: TEdit;
    edpass: TEdit;
    edfrom: TEdit;
    edname: TEdit;
    edport: TSpinEdit;
    cbtls: TComboBox;
    Label11: TLabel;
    IOHandler: TIdSSLIOHandlerSocketOpenSSL;
    InternetSendMail1: TSendMail;
    dxBarLargeButton4: TdxBarLargeButton;
    cbLog: TCheckBox;
    acLogver: TAction;
    dxBarLargeButton5: TdxBarLargeButton;
    MLog: TMemo;
    btnAdj: TBitBtn;
    acAdjuntar: TAction;
    fopen: TOpenDialog;
    procedure acConfigExecute(Sender: TObject);
    procedure acEmailExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnokClick(Sender: TObject);
    procedure smtpConnected(Sender: TObject);
    procedure smtpWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure smtpWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure smtpWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure acFinExecute(Sender: TObject);
    procedure btnAnuClick(Sender: TObject);
    procedure smtpStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure smtpTLSNotAvailable(Asender: TObject; var VContinue: Boolean);
    procedure IOHandlerStatusInfo(const AMsg: string);
    procedure InternetSendMail1Hint(var HintStr: string; var CanShow: Boolean);
    procedure acLogverExecute(Sender: TObject);
    procedure acAdjuntarExecute(Sender: TObject);
  private
    { Private declarations }
    FIni: TIniFile;
    Femail: string;
    Fbody: string;
    Fadjunto: string;
    Fasunto: string;
    procedure Setemail(const Value: string);
    procedure Setadjunto(const Value: string);
    procedure Setbody(const Value: string);
    procedure Setasunto(const Value: string);
  public
    { Public declarations }
    property email: string read Femail write Setemail;
    property body: string read Fbody write Setbody;
    property adjunto: string read Fadjunto write Setadjunto;
    property asunto: string read Fasunto write Setasunto;
  end;

var
  FEnviareMail: TFEnviareMail;

implementation

{$R *.dfm}

procedure TFEnviareMail.acAdjuntarExecute(Sender: TObject);
begin
   if ( fopen.Execute ) then
    AttachmentMemo.Lines.Add( fopen.FileName );
end;

procedure TFEnviareMail.acConfigExecute(Sender: TObject);
begin
  cxPage.ActivePage := pConfig;
end;

procedure TFEnviareMail.acEmailExecute(Sender: TObject);
var
  i:integer;
begin
     if (toEdit.Text='') then
      raise Exception.Create('Por favor, complete un destinatario. (Para varios separelos por medio de un punto y coma');
      
     cxPage.ActivePage := pEnviar;

     MLog.Visible := true;
     acLogVer.Visible := MLog.Visible;

     sendbtn.Enabled := false;
     screen.Cursor := crHourglass;
     try
        smtp.ConnectTimeout := 30000;
        smtp.ReadTimeOut := 30000;
        smtp.Host := edhost.Text;
        smtp.Username := edusu.Text;
        smtp.Port := edport.Value;
        smtp.Password := edpass.Text;

        if cbtls.ItemIndex <> 0 then
          smtp.IOHandler := IOHandler;

        // IOHandler.host := smtp.Host;
        // IOHandler.Destination := IOHandler.host ; //+ ':' + inttostr( smtp.Port );
        // IOHandler.Port := smtp.Port;

        case cbtls.ItemIndex of
          0: smtp.UseTLS := utNoTLSSupport;
          1: smtp.UseTLS := utUseExplicitTLS;
          2: smtp.UseTLS := utUseImplicitTLS;
          3: smtp.UseTLS := utUseRequireTLS;
        end;


        idMsg.From.Name := edname.Text;
        idMsg.From.Address := edfrom.Text;

        idMsg.Recipients.Clear;
        idMsg.Recipients.Add.Address := toEdit.Text;

        idMsg.Body.Text := BodyEdit.Text;
        idMsg.Subject := SubjectEdit.Text;
        for i:= 0 to AttachmentMemo.Lines.Count-1 do
          TIdattachmentFile.create( idMsg.MessageParts, AttachmentMemo.Lines[i] );

       try
           if cbtls.ItemIndex = 1 then
            smtp.SendCmd('STARTTLS', 220);

           smtp.Connect;
           smtp.Send(idmsg);

       except on E: Exception do
          showmessage( 'Error: ' + #13 + e.Message + #13 + idmsg.Headers.Text);
       end;
     finally
        smtp.Disconnect;
        smtp.IOHandler := nil;
        sendbtn.Enabled := true;
        screen.Cursor := crDefault;
     end;
end;

procedure TFEnviareMail.acFinExecute(Sender: TObject);
begin
  close;
end;

procedure TFEnviareMail.acLogverExecute(Sender: TObject);
var
  sino: boolean;
begin
  sino := not ( MLog.Visible );

  cbLog.Checked := sino;
  MLog.Visible := sino;
  acLogVer.Visible := sino;
end;

procedure TFEnviareMail.btnAnuClick(Sender: TObject);
begin
  cxPage.ActivePage := pEnviar;
end;

procedure TFEnviareMail.btnokClick(Sender: TObject);
begin
  FIni := TIniFile.create( extractFilePath(application.ExeName) + 'conf\email.ini' );
  try
    FIni.WriteString('EMAIL', 'host', edHost.Text );
    FIni.writeInteger('EMAIL', 'port', edport.Value );
    FIni.WriteString('EMAIL', 'usu', edusu.Text );
    FIni.WriteString('EMAIL', 'password', edpass.Text );
    FIni.WriteString('EMAIL', 'from', edfrom.Text );
    FIni.WriteString('EMAIL', 'name', edname.Text );
    FIni.WriteInteger('EMAIL', 'tls', cbTLS.itemindex );
  finally
      FIni.Free;
  end;
  showmessage( 'Datos han sido guardados' );
  cxPage.ActivePage := pEnviar;
end;

procedure TFEnviareMail.FormCreate(Sender: TObject);
begin
  FIni := TIniFile.create( extractFilePath(application.ExeName) + 'conf\email.ini' );
  try
    edhost.Text := FIni.ReadString('EMAIL', 'host', 'mail.servidor.com.ar' );
    edport.value := FIni.ReadInteger('EMAIL', 'port', 25 );
    edusu.Text := FIni.ReadString('EMAIL', 'usu', 'usu@servidor.com.ar' );
    edpass.Text := FIni.ReadString('EMAIL', 'password', 'password' );
    edfrom.Text := FIni.ReadString('EMAIL', 'from', 'usu@servidor.com.ar' );
    edname.Text := FIni.ReadString('EMAIL', 'name', 'usu' );
    cbTls.itemindex := FIni.ReadInteger('EMAIL', 'tls', 0 );
  finally
      FIni.Free;
      cxpage.ActivePage := pEnviar;
  end;
end;

procedure TFEnviareMail.InternetSendMail1Hint(var HintStr: string;
  var CanShow: Boolean);
begin
     InternetSendMail1.Attachments.Add( AttachmentMemo.Lines[0] );
     InternetSendMail1.Subject := SubjectEdit.Text;
     InternetSendMail1.Text := BodyEdit.Lines;
     InternetSendMail1.Recipients.Add;
     InternetSendMail1.Recipients[0].Address := toEdit.Text;
     InternetSendMail1.Recipients[0].DisplayName := toEdit.Text;

     InternetSendMail1.Execute;
end;

procedure TFEnviareMail.IOHandlerStatusInfo(const AMsg: string);
begin
  MLog.Lines.Add( AMsg );
end;

procedure TFEnviareMail.Setadjunto(const Value: string);
begin
  Fadjunto := Value;
  AttachmentMemo.Lines.Add(FAdjunto);
end;

procedure TFEnviareMail.Setasunto(const Value: string);
begin
  Fasunto := Value;
  subjectedit.Text := FAsunto;
end;

procedure TFEnviareMail.Setbody(const Value: string);
begin
  Fbody := Value;
  BodyEdit.Lines.clear;
  BodyEdit.Lines.Add(Value);
end;

procedure TFEnviareMail.Setemail(const Value: string);
begin
  Femail := Value;
  ToEdit.Text := FEmail;
end;

procedure TFEnviareMail.smtpConnected(Sender: TObject);
begin
  statusbar.SimplePanelStyle.Text := 'Conectado a servidor';
  MLog.Lines.Add(statusbar.SimplePanelStyle.Text);

  MLog.Lines.Add(smtp.Username);
  MLog.Lines.Add(smtp.Password);

  application.ProcessMessages;
end;

procedure TFEnviareMail.smtpStatus(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: string);
begin
  statusbar.SimplePanelStyle.Text := 'estado ' + AStatusText;
  MLog.Lines.Add(statusbar.SimplePanelStyle.Text);
  application.ProcessMessages;
end;

procedure TFEnviareMail.smtpTLSNotAvailable(Asender: TObject;
  var VContinue: Boolean);
begin
     statusbar.SimplePanelStyle.Text := 'TLS no disponible ';
     VContinue := true;
  MLog.Lines.Add(statusbar.SimplePanelStyle.Text);
    application.ProcessMessages;
end;

procedure TFEnviareMail.smtpWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  statusbar.SimplePanelStyle.Text := 'enviando ' + inttostr(AWorkcount ) + ' bytes';
  MLog.Lines.Add(statusbar.SimplePanelStyle.Text);
  application.ProcessMessages;
end;

procedure TFEnviareMail.smtpWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  statusbar.SimplePanelStyle.Text := 'Iniciando envio de '  + inttostr(AWorkcountMax ) + ' bytes';
  MLog.Lines.Add(statusbar.SimplePanelStyle.Text);
  application.ProcessMessages;
end;

procedure TFEnviareMail.smtpWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  statusbar.SimplePanelStyle.Text := 'finalizando envio';
  MLog.Lines.Add(statusbar.SimplePanelStyle.Text);
  application.ProcessMessages;
end;

end.
