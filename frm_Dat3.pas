unit frm_Dat3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdActns, DBActns, ActnList, ImgList, Menus, ComCtrls, ToolWin,
  StdCtrls, System.Actions, dmres;

type
  TFrmDatos3 = class(TFrame)
    CoolBar1: TCoolBar;
    PageScroller1: TPageScroller;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton9: TToolButton;
    MainMenu1: TMainMenu;
    Ventana1: TMenuItem;
    Salir1: TMenuItem;
    Editar1: TMenuItem;
    Copiar1: TMenuItem;
    Cortar1: TMenuItem;
    Pegar1: TMenuItem;
    N2: TMenuItem;
    Insertar1: TMenuItem;
    Borrar1: TMenuItem;
    Anular1: TMenuItem;
    Grabar1: TMenuItem;
    Editar2: TMenuItem;
    Navegar1: TMenuItem;
    Primero1: TMenuItem;
    Anterior1: TMenuItem;
    Siguiente1: TMenuItem;
    Ultimo1: TMenuItem;
    N1: TMenuItem;
    Actualizar1: TMenuItem;
    Ayuda1: TMenuItem;
    Ayuda2: TMenuItem;
    ActionList1: TActionList;
    Salir: TAction;
    Imprimir: TAction;
    DataSetCancel1: TDataSetCancel;
    BorrarReg: TDataSetDelete;
    DataSetEdit1: TDataSetEdit;
    DataSetFirst1: TDataSetFirst;
    DataSetInsert1: TDataSetInsert;
    DataSetLast1: TDataSetLast;
    DataSetNext1: TDataSetNext;
    GrabarReg: TDataSetPost;
    DataSetPrior1: TDataSetPrior;
    DataSetRefresh1: TDataSetRefresh;
    EditCopy1: TEditCopy;
    EditCut1: TEditCut;
    EditPaste1: TEditPaste;
    Ayuda: TAction;
    N3: TMenuItem;
    Buscar: TAction;
    Grilla: TAction;
    Ordenar: TAction;
    edCod: TEdit;
    edNom: TEdit;
    BuscarRegistro1: TMenuItem;
    CambiarOrden1: TMenuItem;
    VerenGrilla1: TMenuItem;
    mConfig: TAction;
    Configurarapariencia1: TMenuItem;
    N4: TMenuItem;
    Imprimir1: TMenuItem;
    acConsulta: TAction;
    tbConsulta: TToolButton;
    verConsulta1: TMenuItem;
    procedure SalirExecute(Sender: TObject);
    procedure AyudaExecute(Sender: TObject);
    procedure BuscarExecute(Sender: TObject);
    procedure OrdenarExecute(Sender: TObject);
    procedure mConfigExecute(Sender: TObject);
    procedure ImprimirExecute(Sender: TObject);
    procedure GrillaExecute(Sender: TObject);
    procedure acConsultaExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
{$R *.DFM}

procedure TFrmDatos3.SalirExecute(Sender: TObject);
begin
     Postmessage( GetActiveWindow, WM_CLOSE, 0, 0 );
end;

procedure TFrmDatos3.acConsultaExecute(Sender: TObject);
begin
     // completar con la consulta
end;

procedure TFrmDatos3.AyudaExecute(Sender: TObject);
begin
     if Application.HelpFile <> '' then
          Application.HelpCommand( HELP_CONTENTS, 0 )
     else
          ShowMessage( 'Archivo de ayuda no ha sido especificado' );
end;

procedure TFrmDatos3.BuscarExecute(Sender: TObject);
begin
     //
end;

procedure TFrmDatos3.GrillaExecute(Sender: TObject);
begin
     //
end;

procedure TFrmDatos3.ImprimirExecute(Sender: TObject);
begin
     //
end;

procedure TFrmDatos3.OrdenarExecute(Sender: TObject);
begin
     //
end;

procedure TFrmDatos3.mConfigExecute(Sender: TObject);
begin
  //
end;

end.


