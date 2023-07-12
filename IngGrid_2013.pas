unit IngGrid_2013;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ComCtrls, ExtCtrls, DBActns, ActnList, DbClient,
  Menus, ImgList, ToolWin, StdActns, Db, JvComponentBase,
  JvBaseDlg, JvFormPlacement, JvAppStorage, ADODB,
  JvAppIniStorage, StdCtrls, Buttons, Mask, JvExMask, JvMaskEdit,
  JvEdit, JvDBSearchEdit, JvCombobox, JvToolEdit, JvDBFindEdit,
  JvExStdCtrls, JvExDBGrids, System.Actions, vcl.wwdbigrd,
  utiles, cxGraphics, cxControls, cxLookAndFeels,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDBData, cxLocalization, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, browse, dmres, cxLookAndFeelPainters, cxStyles;

type
  TFIngGrid_2013 = class(TForm)
    MainMenu1: TMainMenu;
    sctlst: TActionList;
    Ventana1: TMenuItem;
    Salir1: TMenuItem;
    Cancel1: TDataSetCancel;
    Delete1: TDataSetDelete;
    Edit1: TDataSetEdit;
    First1: TDataSetFirst;
    Insert1: TDataSetInsert;
    Last1: TDataSetLast;
    Next1: TDataSetNext;
    Post1: TDataSetPost;
    Prior1: TDataSetPrior;
    Refresh1: TDataSetRefresh;
    Ds: TDataSource;
    pnlMain: TPanel;
    StatusBar1: TStatusBar;
    Editar1: TMenuItem;
    Primero1: TMenuItem;
    Anterior1: TMenuItem;
    Siguiente1: TMenuItem;
    Ultimo1: TMenuItem;
    N1: TMenuItem;
    Agregar1: TMenuItem;
    Borrar1: TMenuItem;
    Grabar1: TMenuItem;
    Anular3: TMenuItem;
    Ayuda1: TMenuItem;
    Informacion1: TMenuItem;
    Salir: TAction;
    Buscar: TAction;
    Editar2: TMenuItem;
    EditCopy1: TEditCopy;
    EditCut1: TEditCut;
    EditDelete1: TEditDelete;
    EditPaste1: TEditPaste;
    EditUndo1: TEditUndo;
    Copiar1: TMenuItem;
    Cortar1: TMenuItem;
    Pegar1: TMenuItem;
    N2: TMenuItem;
    Eliminar1: TMenuItem;
    Deshacer1: TMenuItem;
    jvIni: TJvAppIniFileStorage;
    jvForm: TJvFormStorage;
    mBorrarFiltro: TAction;
    cBar: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton7: TToolButton;
    ToolButton12: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton11: TToolButton;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton8: TToolButton;
    ToolButton6: TToolButton;
    vista: TcxGridDBTableView;
    nivel: TcxGridLevel;
    grilla: TcxGrid;
    cxLocal: TcxLocalizer;
    mAyuda: TAction;
    procedure Salir1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SalirExecute(Sender: TObject);
    procedure DsUpdateData(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mAyudaExecute(Sender: TObject);
  private
    { Private declarations }
    SortedField: string;
    Ascending: boolean;
    FVieProc: TNotifyEvent;
    FAsc: boolean;
    FNoCerrar: boolean;
    NoLiberar: Boolean;
    FURL: string;
    FPage: string;
    procedure OnNuevoRegistro( DataSet: TDataSet );
    procedure SetPage(const Value: string);
    procedure SetURL(const Value: string);

  public
    { Public declarations }
    procedure Inicializar( Data: TDataSet; FBus: string = '' );
    constructor create( AOwner: TComponent; NoFree: boolean ); overload;

    property URL: string read FURL write SetURL;
    property Page: string read FPage write SetPage;

  end;

var
  FIngGrid_2013: TFIngGrid_2013;

implementation

uses BusVal2;

{$R *.DFM}

procedure TFIngGrid_2013.Salir1Click(Sender: TObject);
begin
     Close;
end;

procedure TFIngGrid_2013.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if (NoLiberar) then
      Action := caHide
     else
        Action := caFree;
end;

procedure TFIngGrid_2013.FormCreate(Sender: TObject);
var
  ini: integer;
begin
    ini := gettickcount;
     if ( Assigned( Ds.DataSet )) and not (( Ds.DataSet ).Active ) then
     begin
          ( Ds.DataSet ).OnNewRecord := OnNuevoRegistro;
          if not (ds.DataSet is TClientDataSet ) then
            ( Ds.DataSet ).Open
          else
            TClientDataSet( Ds.DataSet ).createdataset;
     end
     else
         FNoCerrar := true;

    FURL := 'http://www.jesinor.com.ar/';
    FPage := 'index.php';

    cxLocal.FileName := ExtractFilePath(Application.ExeName) + 'Ini\castellano.ini';
    cxLocal.Active := True;
    cxLocal.Locale := $2c0a;

     ActiveControl := Grilla;
    OutputDebugString(PChar('tiempo: ' + inttostr( gettickcount-ini) + ' milisegundos' ));
end;

procedure TFIngGrid_2013.FormDestroy(Sender: TObject);
begin
     if not FNoCerrar then
     begin
          ( Ds.DataSet ).OnNewRecord := nil;
          if Ds.DataSet is TClientDataSet then
            cerrarDataset(TClientDataSet(ds.DataSet))
          else
            ( Ds.DataSet ).Close;
     end;
end;

procedure TFIngGrid_2013.Inicializar( Data: TDataSet; FBus: string = '' );
begin
     Ds.DataSet := Data;
end;

procedure TFIngGrid_2013.mAyudaExecute(Sender: TObject);
begin
    BrowseURL( FUrl + FPage );
end;

procedure TFIngGrid_2013.SalirExecute(Sender: TObject);
begin
     close;
end;

procedure TFIngGrid_2013.SetPage(const Value: string);
begin
  FPage := Value;
end;

procedure TFIngGrid_2013.SetURL(const Value: string);
begin
  FURL := Value;
end;

constructor TFIngGrid_2013.create(AOwner: TComponent; NoFree: boolean);
begin
  inherited create(AOwner) ;
  NoLiberar := NoFree;
end;

procedure TFIngGrid_2013.DsUpdateData(Sender: TObject);
begin
     // tomar valores de campos para ser insertados en nuevo registro
     // como ultimo valor grabado.
end;

procedure TFIngGrid_2013.OnNuevoRegistro(DataSet: TDataSet);
begin
     // asignar valores de inicio al nuevo registro
end;

end.
