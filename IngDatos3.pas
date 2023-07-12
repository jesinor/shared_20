unit IngDatos3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, Db, TypInfo, DBActns,
  DBCtrls, Frm_Bottom, frm_Dat3, IngGrid07,
  JvAppStorage, JvAppIniStorage, JvComponentBase, JvFormPlacement,
  JvExControls, JvDBLookup, JvExExtCtrls, JvExtComponent,
  JvCaptionPanel, JvStaticText, StdCtrls,
  JvFormWallpaper, jpeg, Menus, adodb, dmres, informes, ayuda;

type
  TFIngDatos3 = class(TForm)
    FrmDatos1: TFrmDatos3;
    SB: TStatusBar;
    DIng: TDataSource;
    FrmBottom1: TFrmBottom;
    jvPlace: TJvFormStorage;
    jvApp: TJvAppIniFileStorage;
    pnlMain: TJvCaptionPanel;
    jvSubTit: TJvStaticText;
    wall: TJvFormWallpaper;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FrmDatos1BuscarExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FrmDatos1GrillaExecute(Sender: TObject);
    procedure DIngStateChange(Sender: TObject);
    procedure FrmDatos1GrabarRegExecute(Sender: TObject);
    procedure FrmDatos1BorrarRegExecute(Sender: TObject);
    procedure FrmDatos1edCodChange(Sender: TObject);
    procedure FrmDatos1edNomChange(Sender: TObject);
    procedure FrmDatos1CambiarOrden1Click(Sender: TObject);
    procedure FrmDatos1OrdenarExecute(Sender: TObject);
    procedure FrmDatos1mConfigExecute(Sender: TObject);
    procedure FrmDatos1AyudaExecute(Sender: TObject);
    procedure FrmDatos1ImprimirExecute(Sender: TObject);
    procedure FrmDatos1SalirExecute(Sender: TObject);
    procedure DIngUpdateData(Sender: TObject);
    procedure FrmDatos1DataSetEdit1Update(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FrmDatos1acConsultaExecute(Sender: TObject);
  private
    { Private declarations }
    FCampo: string;
    FNombre: string;
    FCampoActivo: TWinControl;
    FConfirmaBorrar: boolean;
    FConfirmaGrabacion: boolean;
    FAutoInsert: boolean;
    FMayusculas: boolean;
    FNoCerrar: boolean;
    FVieColor: TColor;

    FPrimeraVez: boolean;
    FBusCod: string;
    FBusNom: string;
    FhelpItem: integer;
    FUrl, FPage: string;
    FInforme: string;

    procedure AplicarEstilo;
    procedure CambiarOrden;
    function EsCampoNumerico: boolean;
    procedure SetCampo(const Value: string);
    procedure SetNombre(const Value: string);
    procedure SetCampoActivo(const Value: TWinControl);
    procedure SetConfirmaBorrar(const Value: boolean);
    procedure SetConfirmaGrabacion(const Value: boolean);
    procedure SetAutoInsert(const Value: boolean);
    procedure SetMayusculas(const Value: boolean);
    procedure SetBusCod(const Value: string);
    procedure SetBusNom(const Value: string);
    procedure SethelpItem(const Value: integer);
    procedure Configdatos;
    function getBusCod: string;
    procedure SetInforme(const Value: string);
  public
    { Public declarations }
    procedure CreateWnd; override;
    procedure EnHint(Sender: TObject);
    property Campo: string read FCampo write SetCampo;
    property Nombre: string read FNombre write SetNombre;
    procedure Grabar( Sender: TWinControl );

    procedure OnEnter( Sender: TObject);
    procedure OnExit(Sender: TObject);
  published
    property CampoActivo: TWinControl read FCampoActivo write SetCampoActivo;
    property ConfirmaGrabacion: boolean read FConfirmaGrabacion write SetConfirmaGrabacion;
    property ConfirmaBorrar: boolean read FConfirmaBorrar write SetConfirmaBorrar;
    property AutoInsert: boolean read FAutoInsert write SetAutoInsert;
    property Mayusculas: boolean read FMayusculas write SetMayusculas;
    property BusCod: string read FBusCod write SetBusCod;
    property BusNom: string read FBusNom write SetBusNom;
    property helpItem: integer read FhelpItem write SethelpItem;
    property Informe: string read FInforme write SetInforme;
  end;

var
  FIngDatos3: TFIngDatos3;

implementation
uses
    BusVal2, OrdenDlg, ConfPers, Utiles, browse, cons_2016;
{$R *.DFM}

procedure TFIngDatos3.EnHint(Sender: TObject);
begin
     sb.Panels[ 0 ].Text := Application.Hint;
end;

procedure TFIngDatos3.FormActivate(Sender: TObject);
begin
     Application.OnHint := EnHint;
     Screen.Cursor := crDefault;
end;

procedure TFIngDatos3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Application.OnHint := nil;
     try
        if ( Assigned( DIng.DataSet )) and not ( FNoCerrar ) then
           DIng.DataSet.Close;
     except
     end;
     Action := caFree;
end;

procedure TFIngDatos3.FormCreate(Sender: TObject);
var
   ini, x: integer;
begin
     ini := gettickcount;
     if ( ActiveControl <> nil ) then
      FCampoActivo := ActiveControl;
     if FCampoActivo = nil then
        for x:= 0 to PnlMain.ControlCount-1 do
            if PnlMain.Controls[ x ] is TWinControl then
            begin
                 FCampoActivo := TWinControl( PnlMain.Controls[ x ] );
                 break;
            end;

     if ( FPrimeraVez ) and ( FMayusculas ) then
        AplicarEstilo;
     FPrimeraVez := false;
     FBusCod := '';
     FBusNom := '';
     // pnlMain.Caption := Caption;
     if Assigned( DIng.DataSet ) then
     begin
          FNoCerrar := ( DIng.DataSet.Active = true );
          if not ( DIng.DataSet.Active ) then
               DIng.DataSet.open;
          if FAutoInsert then
             DIng.DataSet.Append;
     end;

     jvApp.FileName := extractFilePath( Application.exename ) + 'conf\gridatos.ini';
     jvPlace.AppStoragePath := Name;

     FURL := 'http://www.sisnob.com.ar/';
     FPage := 'ayuda';
     OutputDebugString( PWideChar('ABM - tiempo: ' + inttostr( gettickcount-ini) + ' milisegundos' ));
end;

procedure TFIngDatos3.FrmDatos1BuscarExecute(Sender: TObject);
var
   PropInfo: PPropInfo;
begin
     if ( FCampo = '' ) and ( ActiveControl <> nil ) then
     begin
          PropInfo := GetPropInfo( ActiveControl, 'DataField' );
          if PropInfo = nil then
          begin
               FCampo := DIng.DataSet.Fields[ 0 ].FieldName;
               FNombre := DIng.DataSet.Fields[ 0 ].DisplayName;
          end
          else
          begin
               FCampo := GetStrProp( ActiveControl, 'DataField' );
               FNombre := DIng.DataSet.FieldByname( FCampo ).DisplayName;
          end;
     end;

     BusValDlg2 := TBusValDlg2.create( self );
     BusValDlg2.DataSet := ( DIng.DataSet );
     BusValDlg2.Setear( FCampo );
     BusValDlg2.ShowModal;
     BusValDlg2.free;
end;

procedure TFIngDatos3.SetCampo(const Value: string);
begin
  FCampo := Value;
end;

procedure TFIngDatos3.SetNombre(const Value: string);
begin
  FNombre := Value;
end;

procedure TFIngDatos3.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if Assigned( DIng.DataSet ) and ( DIng.DataSet.Active ) then
        if ( DIng.DataSet ).UpdateStatus in [ usInserted, usModified, usDeleted ] then
           CanClose :=  MessageDlg( 'Cierra la ventana?' , mtConfirmation,
                                    [ mbYes, mbNo ], 0 ) = mrYes;
end;

procedure TFIngDatos3.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if ( Key in [ ',', '.' ] ) and ( EsCampoNumerico ) then
        Key := Utiles.DecimalSeparator
     else if ( Key = #13 ) then
        if  not (( ActiveControl is TJvDBLookupCombo ) and
                ( TJvDBLookupCombo( ActiveControl ).IsDropDown )) then
        begin
             Key := #0;
             SendMessage( Handle, WM_NEXTDLGCTL, 0, 0 );
        end;

end;

procedure TFIngDatos3.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  if (dIng.DataSet.State in [dsBrowse]) then
  begin
    sb.Panels[0].Text := 'Moviendose al registro siguiente';
    dIng.DataSet.Next;
  end;
end;

procedure TFIngDatos3.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  if (dIng.DataSet.state in [dsBrowse]) then
  begin
    sb.Panels[0].Text := 'Moviendose al registro anterior';
    dIng.DataSet.Prior;
  end;
end;

procedure TFIngDatos3.FrmDatos1GrillaExecute(Sender: TObject);
var
   fBus: string;
   PropInfo: PPropInfo;
   F: TFIngGrid07;
begin
     if ( ActiveControl <> nil ) then
     begin
          PropInfo := GetPropInfo( ActiveControl, 'DataField' );
          if PropInfo = nil then
               FBus := DIng.DataSet.Fields[ 0 ].FieldName
          else
               FBus := GetStrProp( ActiveControl, 'DataField' );
     end;
     // Usa el form IngGrid.pas
     f := TFIngGrid07.create( self, dIng.DataSet );
     with F do
     try
        // if (FBusCod <> '') then
        //  setCampo( Buscod );
        Inicializar(DIng.DataSet );
        ShowModal;
     finally
            free;
     end;
end;

procedure TFIngDatos3.FrmDatos1ImprimirExecute(Sender: TObject);
begin
  // Self.Print;
  Informeficha( DIng.DataSet, 'IMPRESION de FICHA de ' + self.jvSubTit.caption );
end;

procedure TFIngDatos3.FrmDatos1mConfigExecute(Sender: TObject);
begin
    FConfPers := TFConfPers.create( application );
  try
    FConfPers.cargardatos;
    FConfPers.showmodal;
    ConfigDatos;
  finally
    FConfPers.free;
  end;

end;

procedure TFIngDatos3.FrmDatos1OrdenarExecute(Sender: TObject);
begin
  FrmDatos1.OrdenarExecute(Sender);
  cambiarOrden;
end;

procedure TFIngDatos3.FrmDatos1SalirExecute(Sender: TObject);
begin
  FrmDatos1.SalirExecute(Sender);
end;

function TFIngDatos3.getBusCod: string;
begin
  if FBusCod <> '' then
    result := FBusCod
  else
  begin
      result := DIng.DataSet.Fields[0].FieldName;
  end;
end;

procedure TFIngDatos3.Grabar( Sender: TWinControl );
begin
     try
        if ( DIng.State in [ dsInsert ] ) then
        begin
             DIng.DataSet.Post;
             if FAutoInsert then
                DIng.DataSet.Append;
        end
        else if ( DIng.State in [ dsEdit ] ) then
             DIng.DataSet.Post;
     except
           ActiveControl := Sender;
           abort;
     end;
end;

procedure TFIngDatos3.OnEnter(Sender: TObject);
begin
  if (Sender is TDBEdit ) then
  begin
    FVieColor := TDBEdit(Sender).Color;
    TDBEdit(Sender).Color := clCream;
  end;
end;

procedure TFIngDatos3.OnExit(Sender: TObject);
begin
  if (Sender is TDBEdit ) then
    TDBEdit(Sender).Color := FVieColor;
end;

procedure TFIngDatos3.DIngStateChange(Sender: TObject);
begin
     if ( DIng.state in [ dsInsert ] ) and ( Assigned( FCampoActivo )) then
        ActiveControl := FCampoActivo;
end;

procedure TFIngDatos3.DIngUpdateData(Sender: TObject);
begin
     if ( FConfirmaGrabacion ) and ( MessageDlg( 'Confirma Grabacion ?', mtConfirmation, [ mbYes, mbNo ], 0 ) <> mrYes ) then
          SysUtils.Abort;
end;

procedure TFIngDatos3.SetCampoActivo(const Value: TWinControl);
begin
  FCampoActivo := Value;
end;

procedure TFIngDatos3.SetConfirmaBorrar(const Value: boolean);
begin
  FConfirmaBorrar := Value;
end;

procedure TFIngDatos3.SetConfirmaGrabacion(const Value: boolean);
begin
  FConfirmaGrabacion := Value;
end;

procedure TFIngDatos3.SethelpItem(const Value: integer);
begin
  FhelpItem := Value;
end;

procedure TFIngDatos3.SetInforme(const Value: string);
begin
  FInforme := Value;
end;

procedure TFIngDatos3.FrmDatos1GrabarRegExecute(Sender: TObject);
begin
     // if not ( FConfirmaGrabacion ) or ( MessageDlg( 'Confirma Grabacion ?', mtConfirmation,
     //   [ mbYes, mbNo ], 0 ) = mrYes ) then
        if ( DIng.State in [ dsInsert ] ) then
        begin
             DIng.DataSet.Post;
             if FAutoInsert then
                DIng.DataSet.Append;
        end
        else if ( DIng.State in [ dsEdit ] ) then
             DIng.DataSet.Post;
end;

procedure TFIngDatos3.FrmDatos1acConsultaExecute(Sender: TObject);
var
  FBusco: string;
begin
     if ( TDataSet( DIng.DataSet ).State in [ dsEdit, dsInsert ] ) then
        raise Exception.Create( 'Antes de consultar, grabe o anule las modificaciones' );
     FrmDatos1.acConsultaExecute(Sender);
     FCons_2016 := TFCons_2016.create( self, DIng.DataSet );
     try
        if FInforme<>'' then
          FCons_2016.FInforme := FInforme
        else
          FCons_2016.FInforme := pnlMain.Caption;

        FCons_2016.showmodal;
        if (FCons_2016.ModalResult = mrOK) then
        begin
          FBusco := getBuscod;
          if (FBusco<>'') then
            DIng.Dataset.Locate( FBusco, FCons_2016.FCodigo, []);
        end;
     finally
        FCons_2016.free;
     end;
end;

procedure TFIngDatos3.FrmDatos1AyudaExecute(Sender: TObject);
begin
  // FrmDatos1.AyudaExecute(Sender);
  TAyuda.mostrar_ayuda( 'general', 'inicio' );
end;

procedure TFIngDatos3.FrmDatos1BorrarRegExecute(Sender: TObject);
begin
     if not ( FConfirmaBorrar ) or ( MessageDlg( 'Confirma Eliminacion de Registro ?', mtConfirmation,
        [ mbYes, mbNo ], 0 ) = mrYes ) then
        DIng.DataSet.delete;
end;

procedure TFIngDatos3.SetAutoInsert(const Value: boolean);
begin
  FAutoInsert := Value;
end;

function TFIngDatos3.EsCampoNumerico: boolean;
var
   PropInfo: PPropInfo;
begin
     Result := false;
     PropInfo := GetPropInfo( ActiveControl, 'DataField' );
     if PropInfo <> nil then
        if DIng.DataSet.FieldByName( GetStrProp( ActiveControl, PropInfo )).DataType in [ ftFloat, ftCurrency, ftBCD ] then
           Result := true;
end;

procedure TFIngDatos3.AplicarEstilo;
var
   z, x, i: integer;
   PropInfo: PPropInfo;
begin
    exit;

     with PnlMain do
          for x:=0 to ControlCount-1 do
          begin
               PropInfo := GetPropInfo( Controls[ x ], 'CharCase' );
               if PropInfo <> nil then
                  SetEnumProp( Controls[ x ], PropInfo, 'ecUpperCase' );
               if (Controls[ x ] is TDBEdit ) then
               begin
                    TDbEdit(Controls[x]).OnEnter := self.OnEnter;
                    TDbEdit(Controls[x]).OnExit := self.OnExit;
               end
               else if (Controls[x] is TPageControl) then
                    begin
                      for i:=0 to TPageControl(Controls[x]).ControlCount-1 do // hojas
                      with TTabSheet(TPageControl(Controls[x]).controls[i]) do
                        for z := 0 to controlcount-1 do
                          if (Controls[ z ] is TDBEdit ) then
                          begin
                            TDbEdit(Controls[z]).OnEnter := self.OnEnter;
                            TDbEdit(Controls[z]).OnExit := self.OnExit;
                          end;
                    end;
               // ShowMessage(controls[x].Name + '-' + controls[x].ClassName);
          end;
end;

procedure TFIngDatos3.SetMayusculas(const Value: boolean);
begin
  FMayusculas := Value;
end;

procedure TFIngDatos3.CreateWnd;
begin
  inherited;
  FPrimeraVez := true;

  FMayusculas := true;
  FConfirmaGrabacion := false;
  FConfirmaBorrar := false;
  FAutoInsert := false;
  FHelpItem := 0;
end;

procedure TFIngDatos3.SetBusCod(const Value: string);
begin
     FBusCod := Value;
     FrmDatos1.edCod.Enabled := true; // FBusCod <> '';
     // FrmDatos1.CoolBar1.Bands[ 1 ].visible := FBusCod <> '';
end;

procedure TFIngDatos3.SetBusNom(const Value: string);
begin
  FBusNom := Value;
  FrmDatos1.edNom.Enabled := FBusNom <> '';
  // FrmDatos1.CoolBar1.Bands[ 2 ].visible := FBusNom <> '';
end;

procedure TFIngDatos3.FrmDatos1edCodChange(Sender: TObject);
var
  FBusco: string;
begin
     if ( TDataSet( DIng.DataSet ).State in [ dsEdit, dsInsert ] ) then
        raise Exception.Create( 'Antes de buscar, grabe o anule las modificaciones' );
     FBusco := getBuscod;
     if (FBusco<>'') then
     try
        TDataSet( DIng.DataSet ).DisableControls;
        TDataSet( DIng.DataSet ).Locate( FBusco,
                  FrmDatos1.edCod.Text, [ loCaseInsensitive, loPartialKey ] );
     finally
        TDataSet( DIng.DataSet ).EnableControls;
     end;
end;

procedure TFIngDatos3.FrmDatos1edNomChange(Sender: TObject);
begin
     if ( TDataSet( DIng.DataSet ).State in [ dsEdit, dsInsert ] ) then
        raise Exception.Create( 'Antes de buscar, grabe o anule las modificaciones' );
     if ( FBusNom <> '' ) then
     try
        TDataSet( DIng.DataSet ).DisableControls;
        TDataSet( DIng.DataSet ).Locate( FBusNom,
                  FrmDatos1.edNom.Text, [ loCaseInsensitive, loPartialKey ] );
     finally
            TDataSet( DIng.DataSet ).EnableControls;
     end;
end;

procedure TFIngDatos3.FrmDatos1CambiarOrden1Click(Sender: TObject);
begin
     if ( DIng.DataSet.state in [ dsInsert, dsEdit ] ) then
        raise exception.create( 'Por favor, grabe o anule las modificaciones primero' );
     FrmDatos1.OrdenarExecute(Sender);
     CambiarOrden;
end;

procedure TFIngDatos3.FrmDatos1DataSetEdit1Update(Sender: TObject);
begin
     ( Sender as TDatasetAction ).Enabled := not ( DIng.DataSet.state in [ dsEdit, dsInsert ] );
end;

procedure TFIngDatos3.CambiarOrden;
var
  lista: string;
begin
    lista := showOrderDlg( TStringlist( TDataSet( Ding.DataSet ).FieldList ));
    try
        if DIng.DataSet is TAdodataset then
          TAdoDataSet( DIng.DataSet ).indexfieldNames := lista;
    except
      on e:exception do
          showmessage( 'Error al cambiar orden. ' + e.Message );
    end;
end;

procedure TFIngDatos3.Configdatos;
var
  x: integer;
  s: string;
  c: TComponent;
  P: PPropInfo;
begin
    exit;
    for x:=0 to componentcount-1 do
    begin
      s := components[x].classname;
      c := components[x].GetParentComponent;
      if ( c <> nil ) and (( c.ClassType = TPanel ) or ( c.ClassType = TJvCaptionPanel )) then
      begin
        if ( s = 'TLabel' ) then
          TLabel( components[x] ).Font := FConfPers.contenedor.Fonlabel
        else if ( s = 'TEdit' ) or ( s = 'TComboBox' )
          or ( s = 'TDbEdit' ) or ( s = 'TjvDbEdit' ) or
          ( s = 'TDbComboBox' ) or ( s = 'TJvDbComboBox' ) then
        begin
          TEdit( components[x] ).Font := FConfPers.contenedor.Fonedit;
          TEdit( components[x] ).Color := FConfPers.contenedor.ColorEdit;
        end
        else if ( s = 'TPanel' ) then
        begin
          TPanel( components[x] ).font := FConfPers.contenedor.FonForm;
          TPanel( components[x] ).Color := FConfPers.contenedor.ColorForm;
        end
        else
        begin
          p := GetPropInfo( components[x].ClassInfo, 'Color' );
          if ( p<> nil) then
            setOrdProp( components[x], p, FConfPers.contenedor.ColorEdit );

          p := GetPropInfo( components[x].ClassInfo, 'Font' );
          if ( p<> nil) then
            SetObjectProp( components[x], p, FConfPers.Contenedor.Fonedit );
        end;
      end;
    end;

    font := FConfPers.contenedor.FonForm;
    color := FConfPers.contenedor.ColorForm;
end;

end.
