{ ****************************************************************************** }
{ }
{ ReportBuilder Report Component Library }
{ }
{ Copyright (c) 1996, 2000 Digital Metaphors Corporation }
{ }
{ ****************************************************************************** }

unit ppVistaPre;

interface

{$I ppIfDef.pas}

uses
    Windows, ComCtrls, SysUtils, Messages, Classes, Graphics, Controls, Forms,
    ExtCtrls,
    Buttons, ppForms, ppTypes, ppProd, ppDevice, ppViewr, Dialogs, ppUtils,
    ActnList, ppComm, ppRelatv, ppArchiv, ppReport,
    ppFilDev, ppClass, Inifiles, System.Actions, vcl.stdctrls,
    cxControls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
    JvAppStorage, JvAppIniStorage, JvComponentBase, JvFormPlacement, dxBar,
    cxClasses, dxRibbon, dxRibbonSkins, dxRibbonCustomizationForm,
    System.ImageList, vcl.ImgList, ppSMTPCustom, ppVar, ppSMTPMapi,
    ppIniStorage, ayuda, dxSkinsCore, dxSkinTheBezier;

type
    { TppPrintPreview }
    TppVistaPre = class(TppCustomPreviewer)
        Visor: TppViewer;
        ppReader: TppArchiveReader;
        OpenDialog1: TOpenDialog;
        Ac: TActionList;
        Imprimir: TAction;
        Cerrar: TAction;
        Grabar: TAction;
        acToda: TAction;
        acAncho: TAction;
        ac100: TAction;
        acPrimera: TAction;
        acAnterior: TAction;
        acProx: TAction;
        acUltima: TAction;
        IrAPag: TAction;
        Ayuda: TAction;
        Abrir: TAction;
        imagenes: TImageList;
        SaveDialog1: TSaveDialog;
        StatusBar1: TStatusBar;
        AutoSearch: TAction;
        Configurar: TAction;
        acMail: TAction;
        mgr: TdxBarManager;
        ribbon: TdxRibbonTab;
        dxRibbon1: TdxRibbon;
        dxBarLargeButton1: TdxBarLargeButton;
        dxBarLargeButton4: TdxBarLargeButton;
        dxBarLargeButton5: TdxBarLargeButton;
        mgrBar3: TdxBar;
        mgrBar4: TdxBar;
        dxBarLargeButton12: TdxBarLargeButton;
        jvForm: TJvFormStorage;
        jvIni: TJvAppIniFileStorage;
        mgrBar1: TdxBar;
        mgrBar2: TdxBar;
        dxBarLargeButton2: TdxBarLargeButton;
        dxBarLargeButton3: TdxBarLargeButton;
        dxBarLargeButton6: TdxBarLargeButton;
        dxBarLargeButton7: TdxBarLargeButton;
        dxBarLargeButton8: TdxBarLargeButton;
        dxBarLargeButton9: TdxBarLargeButton;
        dxBarLargeButton10: TdxBarLargeButton;
        dxBarLargeButton11: TdxBarLargeButton;
        dxBarLargeButton13: TdxBarLargeButton;
        acPDF: TAction;
    dxBarLargeButton14: TdxBarLargeButton;
        procedure FormCreate(Sender: TObject);
        procedure VisorPrintStateChange(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormKeyDown(Sender: TObject; var Key: Word;
          Shift: TShiftState);
        procedure ImprimirExecute(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure CerrarExecute(Sender: TObject);
        procedure acTodaExecute(Sender: TObject);
        procedure acAnchoExecute(Sender: TObject);
        procedure ac100Execute(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure VisorMouseDown(Sender: TObject; Button: TMouseButton;
          Shift: TShiftState; X, Y: Integer);
        procedure VisorMouseUp(Sender: TObject; Button: TMouseButton;
          Shift: TShiftState; X, Y: Integer);
        procedure GrabarExecute(Sender: TObject);
        procedure acPrimeraExecute(Sender: TObject);
        procedure acAnteriorExecute(Sender: TObject);
        procedure acProxExecute(Sender: TObject);
        procedure acUltimaExecute(Sender: TObject);
        procedure IrAPagExecute(Sender: TObject);
        procedure AbrirExecute(Sender: TObject);
        procedure VisorMouseMove(Sender: TObject; Shift: TShiftState;
          X, Y: Integer);
        procedure AutoSearchExecute(Sender: TObject);
        procedure VisorStatusChange(Sender: TObject);
        procedure ConfigurarExecute(Sender: TObject);
        procedure acMailExecute(Sender: TObject);
        procedure acPDFExecute(Sender: TObject);
    procedure AyudaExecute(Sender: TObject);

    private
        // FStatusBar: TStatusBar;
        FBeginDrag, FInProceso: boolean;
        IniIzq, IniTop: Integer;
        FCerrar: boolean;
        FhelpItem: Integer;
        FNombrepdf, FNombreText: string;
        FUrl: string;
        FPage: string;

        procedure SetearDatos;
        procedure EnHint(Sender: TObject);
        procedure SethelpItem(const Value: Integer);
        procedure SetNombrepdf(const Value: string);
        procedure SetPage(const Value: string);
        procedure SetUrl(const Value: string);
        procedure PerformPreviewAction(aPreviewAction: TppPreviewActionType);
        procedure ToggleSearch;
        procedure Zoom(aZoomSetting: TppZoomSettingType);
        procedure SendEmail;
        procedure Cancel;

    protected
        function GetViewer: TObject; override;
        procedure LanguageChanged; override;

    public
        procedure Init; override;
        property helpItem: Integer read FhelpItem write SethelpItem;
        procedure WMMouseWheel(var Message: TWMMouseWheel);
          message WM_MOUSEWHEEL;
        property Nombrepdf: string read FNombrepdf write SetNombrepdf;
        property Url: string read FUrl write SetUrl;
        property Page: string read FPage write SetPage;

    end; { class, TppPrintPreview }

procedure VistaPreviaInforme(Informe: tppReport); StdCall;
procedure SeleccionarInforme; StdCall;

var
    FppVistaPre: TppVistaPre;
    uCancelled: boolean;

implementation

{$R *.DFM}

procedure SeleccionarInforme; StdCall;
begin
    with TppVistaPre.create(application) do
        try
            if OpenDialog1.execute then
            begin
                Screen.Cursor := crHourGlass;
                UpdateWindow(Handle);
                ppReader.ArchiveFileName := OpenDialog1.FileName;
                ppReader.Print;
                WindowState := wsMaximized;
                Screen.Cursor := crDefault;
            end;
        finally
            free;
        end;
end;

{ ------------------------------------------------------------------------------ }
{ TppPrintPreview.FormCreate }

procedure TppVistaPre.FormCreate(Sender: TObject);
begin
    // codigo predefinido para ayuda en todos los proyectos
    FUrl := 'http://www.sisnob.com.ar/';
    FPage := 'ayuda';
    TppIniStoragePlugIn.SetStorageName(extractfilePath( application.exename ) + 'conf/rbuilder.ini');

    // visor.report.PreviewFormSettings.SinglePageOnly := true;
end; { procedure FormCreate }

{ ------------------------------------------------------------------------------ }
{ TppPrintPreview.FormClose }

procedure TppVistaPre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end; { procedure FormClose }

{ ------------------------------------------------------------------------------ }
{ TppPrintPreview.Init }

procedure TppVistaPre.Init;
begin
    if (Report is TppProducer) then
    begin
        Visor.Report := TppProducer(Report);
        AutoSearch.Visible := TppProducer(Report).ShowAutoSearchDialog;
        Visor.ZoomSetting := zs100Percent;

    end;

end; { procedure, Init }

{ ------------------------------------------------------------------------------ }
{ TppPrintPreview.LanguageChanged }

procedure TppVistaPre.LanguageChanged;
begin

    { spbAutoSearch.Hint := ppLoadStr(1021);
      spbPreviewPrint.Hint := ppLoadStr(22);
      spbPreviewWhole.Hint := ppLoadStr(30);
      spbPreviewWidth.Hint := ppLoadStr(31);
      spbPreview100Percent.Hint := ppLoadStr(1); //'100 %'
      spbPreviewFirst.Hint := ppLoadStr(13);
      spbPreviewPrior.Hint := ppLoadStr(29);
      spbPreviewNext.Hint  := ppLoadStr(15);
      spbPreviewLast.Hint  := ppLoadStr(14);
      spbPreviewClose.Caption := ppLoadStr(6); //'Close'

      lBitMap := TBitMap.Create;
      spbPreviewClose.Width := lBitMap.Canvas.TextWidth(spbPreviewClose.Caption) + 30;
      lBitMap.Free;

      Caption := ppLoadStr(23); }

end; { procedure, LanguageChanged }

{ ------------------------------------------------------------------------------ }
{ TppPrintPreview.GetViewer }

function TppVistaPre.GetViewer: TObject;
begin
    Result := Visor;
end; { function, GetViewer }

{ ------------------------------------------------------------------------------ }
{ TppPrintPreview.ppViewer1PrintStateChange }

procedure TppVistaPre.VisorPrintStateChange(Sender: TObject);
var
    lPosition: TPoint;
begin

    if Visor.Busy then
    begin
        { mskPreviewPercentage.Enabled := False;
          mskPreviewPage.Enabled := False;

          pnlPreviewBar.Cursor := crHourGlass; }

        Visor.PaintBox.Cursor := crHourGlass;

        StatusBar1.Cursor := crHourGlass;

        { spbPreviewClose.Cursor := crArrow; }

        Cerrar.Caption := ppLoadStr(ppMsgCancel);
    end
    else
    begin
        { mskPreviewPercentage.Enabled := True;
          mskPreviewPage.Enabled := True;

          pnlPreviewBar.Cursor := crDefault; }

        Visor.PaintBox.Cursor := crDefault;

        StatusBar1.Cursor := crDefault;

        { spbPreviewClose.Cursor := crDefault; }

        Cerrar.Caption := ppLoadStr(6); { 'Close' }
    end;

    { this code will force the cursor to update }
    GetCursorPos(lPosition);
    SetCursorPos(lPosition.X, lPosition.Y);

end; { procedure, ppViewer1PrintStateChange }

{ ------------------------------------------------------------------------------ }
{ TppPrintPreview.FormKeyDown }

procedure TppVistaPre.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
    lScrollBar: TScrollBar;
begin
    if (ssCtrl in Shift) then
        case Key of
            VK_PRIOR:
                PerformPreviewAction(paPrior);
            VK_NEXT:
                PerformPreviewAction(paNext);
            VK_HOME:
                PerformPreviewAction(paFirst);
            VK_END:
                PerformPreviewAction(paLast);
        end
    else
        case Key of
            VK_PRIOR, VK_UP:
                Visor.Scroll(dtUp);
            VK_NEXT, VK_DOWN:
                Visor.Scroll(dtDown);
            VK_LEFT:
                Visor.Scroll(dtLeft);
            VK_RIGHT:
                Visor.Scroll(dtRight);
            VK_ESCAPE:
                PerformPreviewAction(paClose);
        end;

    {
      if (ssCtrl in Shift) then
      begin
      case Key of
      VK_PRIOR: Visor.PriorPage;
      VK_NEXT:  Visor.NextPage;
      VK_HOME:  Visor.FirstPage;
      VK_END:   Visor.LastPage;
      end;

      end
      else
      begin

      case Key of
      VK_PRIOR, VK_UP:
      begin
      lScrollBar := Visor.ScrollablePaintBox.VerticalScrollbar;
      lScrollBar.Position := lScrollBar.Position - lScrollBar.Height;


      end;

      VK_NEXT, VK_DOWN:
      begin
      lScrollBar := Visor.ScrollablePaintBox.VerticalScrollbar;
      lScrollBar.Position := lScrollBar.Position + lScrollBar.Height;
      end;

      VK_LEFT:
      begin
      lScrollBar := Visor.ScrollablePaintBox.VerticalScrollbar;
      lScrollBar.Position := lScrollBar.Position - lScrollBar.Width;
      end;

      VK_RIGHT:
      begin
      lScrollBar := Visor.ScrollablePaintBox.VerticalScrollbar;
      lScrollBar.Position := lScrollBar.Position + lScrollBar.Width;
      end;

      end;

      end;
    }
end; { procedure, FormKeyDown }

procedure TppVistaPre.ImprimirExecute(Sender: TObject);
begin
    SetearDatos;
    Visor.Print;
end;

procedure TppVistaPre.FormActivate(Sender: TObject);
begin
    // Application.OnHint := EnHint;
    // Visor.ZoomSetting := zsPageWidth;
    acToda.Checked := (Visor.ZoomSetting = zsWholePage);
    acAncho.Checked := (Visor.ZoomSetting = zsPageWidth);
    ac100.Checked := (Visor.ZoomSetting = zs100Percent);
end;

procedure TppVistaPre.CerrarExecute(Sender: TObject);
begin
    if TppProducer(Visor.Report).Printing then
        Visor.Cancel
    else
        Close;
end;

procedure TppVistaPre.acTodaExecute(Sender: TObject);
begin
    Visor.ZoomSetting := zsWholePage;
    // Toda.Down := true;
end;

procedure TppVistaPre.acAnchoExecute(Sender: TObject);
begin
    Visor.ZoomSetting := zsPageWidth;
    // Ancho.Down := true;
end;

procedure TppVistaPre.ac100Execute(Sender: TObject);
begin
    Visor.ZoomSetting := zs100Percent;
    // ac100.Down := true;
end;

procedure TppVistaPre.EnHint(Sender: TObject);
begin
    StatusBar1.SimpleText := application.Hint;
end;

procedure TppVistaPre.FormShow(Sender: TObject);
begin
    Screen.Cursor := crDefault;
end;

procedure TppVistaPre.VisorMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    FBeginDrag := true;
    Screen.Cursor := crHandPoint;
    IniIzq := X;
    IniTop := Y;
end;

procedure TppVistaPre.VisorMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    if FBeginDrag then
        FBeginDrag := false;
    Screen.Cursor := crDefault;
end;

procedure TppVistaPre.GrabarExecute(Sender: TObject);
var
    lArchivo: tppArchiveDevice;
begin
    SaveDialog1.FileName := Visor.Report.ArchiveFileName;
    if SaveDialog1.execute then
        try
            Screen.Cursor := crHourGlass;
            lArchivo := tppArchiveDevice.create(self);
            lArchivo.FileName := SaveDialog1.FileName;
            lArchivo.Publisher := Visor.Report.Publisher;
            lArchivo.PageSetting := psAll;
            Visor.Report.PrintToDevices;
            lArchivo.free;
        finally
            Screen.Cursor := crDefault;
        end;
end;

procedure TppVistaPre.acPDFExecute(Sender: TObject);
begin
    if FNombrepdf = '' then
        FNombrepdf := extractfilepath(application.ExeName) +
          // ExtractFileName(Visor.Report.ArchiveFileName);
          ExtractFileName(Visor.Report.TextFileName);

    try
        // Visor.Report.ShowPrintDialog := true;
        Visor.Report.AllowPrintToFile := true;
        Visor.Report.DeviceType := dtPDF;
        Visor.Report.ShowPrintDialog := true;

        // Visor.Report.ArchiveFileName := FNombrePDF;
        Visor.Report.TextFileName := FNombrepdf;
        // Visor.Report.PDFSettings.OpenPDFFile := True;
        Visor.Report.Print;
    finally
        Visor.Report.DeviceType := dtScreen;
        Visor.Report.ShowPrintDialog := false;
    end;
end;

procedure TppVistaPre.acPrimeraExecute(Sender: TObject);
begin
    Screen.Cursor := crHourGlass;
    Visor.FirstPage;
    Screen.Cursor := crDefault;
end;

procedure TppVistaPre.acAnteriorExecute(Sender: TObject);
begin
    Screen.Cursor := crHourGlass;
    Visor.PriorPage;
    Screen.Cursor := crDefault;
end;

procedure TppVistaPre.acMailExecute(Sender: TObject);
begin
    try
        // Visor.Report.SendMail;

        sendEmail;
        // showmessage( 'Email ha sido enviado' );
    finally
    end;
end;

procedure TppVistaPre.acProxExecute(Sender: TObject);
begin
    Screen.Cursor := crHourGlass;
    Visor.NextPage;
    Screen.Cursor := crDefault;
end;

procedure TppVistaPre.acUltimaExecute(Sender: TObject);
begin
    Screen.Cursor := crHourGlass;
    Visor.LastPage;
    Screen.Cursor := crDefault;
end;

procedure TppVistaPre.IrAPagExecute(Sender: TObject);
var
    sValor: string;
begin
    sValor := IntToStr(Visor.AbsolutePageNo);
    if InputQuery('Ir a Pagina...', 'Seleccione Pagina: ', sValor) then
        try
            Screen.Cursor := crHourGlass;
            try
                Visor.GotoPage(StrToInt(sValor));
            except
                ShowMessage('Numero Incorrecto');
            end;
        finally
            Screen.Cursor := crDefault;
        end;
end;

procedure TppVistaPre.AbrirExecute(Sender: TObject);
begin
    if OpenDialog1.execute then
    begin
        Screen.Cursor := crHourGlass;
        UpdateWindow(Handle);
        ppReader.ArchiveFileName := OpenDialog1.FileName;

        Visor.Report := ppReader;
        WindowState := wsMaximized;
        ppReader.PrintToDevices;
        Screen.Cursor := crDefault;
    end;
end;

procedure TppVistaPre.VisorMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    if (FBeginDrag) and not(FInProceso) then
    begin
        FInProceso := true;
        LockWindowUpdate(Visor.Handle);
        { StatusBar1.SimpleText := IntToStr( X ) + '/' + IntToStr( Y ) + ' anterior: ' +
          IntToStr( IniIzq ) + '/' + IntToStr( IniTop ) +
          ' Dif ' + IntToStr( X-IniIzq ) + '/' + IntToStr( Y-IniTop ); }
        if (Y + 5 < IniTop) then // scroll down ( abajo la pagina )
        begin
            Visor.ScrollablePaintBox.VerticalScrollbar.Position :=
              Visor.ScrollablePaintBox.VerticalScrollbar.Position +
              (IniTop - Y);
            // Visor.ScrollBox.VertScrollBar.Position := Visor.ScrollBox.VertScrollBar.Position+(IniTop-Y );
            IniTop := Y;
        end
        else if (Y - 5 > IniTop) then // scroll up
        begin
            Visor.ScrollablePaintBox.VerticalScrollbar.Position :=
              Visor.ScrollablePaintBox.VerticalScrollbar.Position -
              (Y - IniTop);
            // Visor.ScrollBox.VertScrollBar.Position := Visor.ScrollBox.VertScrollBar.Position-(Y-IniTop );
            IniTop := Y;
        end;
        if X + 5 < IniIzq then // scroll left
        begin
            Visor.ScrollablePaintBox.HorizontalScrollBar.Position :=
              Visor.ScrollablePaintBox.HorizontalScrollBar.Position +
              (IniIzq - X);
            // Visor.ScrollBox.HorzScrollBar.Position := Visor.ScrollBox.HorzScrollBar.Position+(IniIzq-X );
            IniIzq := X;
        end
        else if X - 5 > IniIzq then // scroll right
        begin
            Visor.ScrollablePaintBox.HorizontalScrollBar.Position :=
              Visor.ScrollablePaintBox.HorizontalScrollBar.Position -
              (X - IniIzq);
            // Visor.ScrollBox.HorzScrollBar.Position := Visor.ScrollBox.HorzScrollBar.Position-(X-IniIzq );
            IniIzq := X;
        end;
        LockWindowUpdate(HWND(nil));
        FInProceso := false;
    end;
end;

procedure VistaPreviaInforme(Informe: tppReport);
var
    FDialogo: TForm;
begin
    with TppVistaPre.create(application) do
        try
            Visor.Report := Informe;
            WindowState := wsMaximized;
            // ConfiguraInforme( RInforme );
            FDialogo := CreateMessageDialog('Preparando Informe', mtInformation,
              [mbCancel]);
            FDialogo.OnClose := OnClose;
            if FDialogo <> nil then
                FDialogo.Show;
            FDialogo.BringToFront;
            application.ProcessMessages;
            Informe.PrintToDevices;
            // Visor.LastPage;
            if FCerrar then
                ShowMessage('Informe Anulado por usuario!')
            else
                ShowModal;
        finally
            FDialogo.OnClose := nil;
            FDialogo.free;
            free;
        end
end;

procedure TppVistaPre.AutoSearchExecute(Sender: TObject);
begin
    Visor.DisplayAutoSearchDialog;
end;

procedure TppVistaPre.AyudaExecute(Sender: TObject);
begin
     TAyuda.mostrar_ayuda('general', 'general');
end;

procedure TppVistaPre.VisorStatusChange(Sender: TObject);
begin
    // Visor.ScrollBox.VertScrollBar.Position := 1;
    Visor.Hint := Visor.Status;
    StatusBar1.SimpleText := Visor.Status;
end;

procedure TppVistaPre.WMMouseWheel(var Message: TWMMouseWheel);
var
    zDelta: smallint;
begin
    {TWMMouseWheel = packed record
      Msg: Cardinal;
      Keys: SmallInt;
      WheelDelta: SmallInt;
      case Integer of
      0: (XPos: Smallint;
      YPos: Smallint;);
      1: (Pos: TSmallPoint;
      Result: Longint;);
      end;
    }
    try
      Visor.ScrollBox.VertScrollBar.Position :=
      Visor.ScrollBox.VertScrollBar.Position - (TWMMouseWheel( Message ).WheelDelta div 5);
    except
      on e:exception do
       OutputDebugString( PChar( 'Error scroll: ' + e.message ));
    end;
    exit;

    try
      if Mouse.WheelPresent then
      begin
          LockWindowUpdate(Visor.Handle);
          zDelta := Message.WheelDelta;
          Visor.ScrollablePaintBox.VerticalScrollbar.Position :=
            Visor.ScrollablePaintBox.VerticalScrollbar.Position - (zDelta);
          LockWindowUpdate(HWND(nil));
      end;
      if Message.Result = 0 then
          inherited;
    except

    end;
end;

procedure TppVistaPre.PerformPreviewAction(aPreviewAction
  : TppPreviewActionType);
begin

    { if (FSearchPreview <> nil) then
      FSearchPreview.BeforePreviewActionPerformed(aPreviewAction);
    }
    case aPreviewAction of
        paPrint:
            Print;
        paEmail:
            SendEmail;
        paAutoSearch:
            begin
                uCancelled := false;
                Visor.DisplayAutoSearchDialog;
            end;

        // paTextSearch:     ToggleSearch;
        paWholePage:
            Zoom(zsWholePage);
        paPageWidth:
            Zoom(zsPageWidth);
        pa100Percent:
            Zoom(zs100Percent);
        paFirst:
            Visor.FirstPage;
        paPrior:
            Visor.PriorPage;
        paNext:
            Visor.NextPage;
        paLast:
            Visor.LastPage;
        paCancel:
            Cancel;
        // paClose:          if Assigned(FOnClose) then FOnClose(Self);
        paSingle:
            Visor.PageDisplay := pdSingle;
        paTwoUp:
            Visor.PageDisplay := pdTwoUp;
        paContinuous:
            Visor.PageDisplay := pdContinuous;
        paContinuousTwoUp:
            Visor.PageDisplay := pdContinuousTwoUp;
    end;

    { if (FSearchPreview <> nil) then
      FSearchPreview.AfterPreviewActionPerformed(aPreviewAction);
    }
end;

procedure TppVistaPre.Cancel;
begin
    if (Visor.Report <> nil) and Visor.Report.Printing then
    begin
        Visor.Cancel;
        uCancelled := true;
    end;

end;

procedure TppVistaPre.ToggleSearch;
begin

    { if (FSearchPreview <> nil) then
      FSearchPreview.ToggleSearch;
    }
end;

procedure TppVistaPre.SendEmail;
begin
    try
      TppSMTPPlugIn.RegisterClass(TppSMTPMapi);
      visor.Report.EmailSettings.enabled := true;
      visor.Report.EmailSettings.ShowEmailDialog := False;
      visor.Report.EmailSettings.PreviewInEmailClient := True;

      // visor.Report.EmailSettings.Body.Text := cMapiMail;
      visor.Report.EmailSettings.Body.Text := 'Enviamos documento.' + #13 + 'Atentamente';
      visor.Report.EmailSettings.Subject := 'Envio de documento';

      visor.Report.SendMail;
    finally
    end;

end;

procedure TppVistaPre.Zoom(aZoomSetting: TppZoomSettingType);
begin
    Visor.ZoomSetting := aZoomSetting;
end;

procedure TppVistaPre.ConfigurarExecute(Sender: TObject);
begin
    Visor.Report.Reset;
    Visor.RefreshPage;
end;

procedure TppVistaPre.SetearDatos;
begin
    //
end;

procedure TppVistaPre.SethelpItem(const Value: Integer);
begin
    FhelpItem := Value;
end;

procedure TppVistaPre.SetNombrepdf(const Value: string);
begin
    FNombrepdf := Value;
end;

procedure TppVistaPre.SetPage(const Value: string);
begin
    FPage := Value;
end;

procedure TppVistaPre.SetUrl(const Value: string);
begin
    FUrl := Value;
end;

initialization

ppRegisterForm(TppCustomPreviewer, TppVistaPre);

finalization

ppUnRegisterForm(TppCustomPreviewer);

end.
