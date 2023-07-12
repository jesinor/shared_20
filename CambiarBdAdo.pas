unit CambiarBdAdo;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  ExtCtrls, IniFiles, Dialogs, ImgList, ComCtrls,
  Menus, pngimage, System.ImageList;

const
  ctIniFile = 'coneccion.ini';
  ctError = 'Por favor, seleccione Base de Datos';

type
  bdatos = record
    nombre, base_datos, servidor, UserName, password, cadena, noactualiza, extended : string;
    color: string;
    instalar: boolean;
  end;

  TCambiarBdDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    Label1: TLabel;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    VerIconos1: TMenuItem;
    VerLista1: TMenuItem;
    Informe1: TMenuItem;
    IconoChico1: TMenuItem;
    Editor: TListView;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure VerIconos1Click(Sender: TObject);
    procedure VerLista1Click(Sender: TObject);
    procedure Informe1Click(Sender: TObject);
    procedure IconoChico1Click(Sender: TObject);
  private
    { Private declarations }
    FIni: TIniFile;
    FBase: bdatos;
  public
    { Public declarations }
  end;
  function CambiarBaseDeDatos: bdatos;
  function getListaBase( FLista: TStringList ): boolean;
var
  CambiarBdDlg: TCambiarBdDlg;

implementation

{$R *.dfm}

function CambiarBaseDeDatos: bdatos;
begin
      Result.base_datos := '';
      Result.servidor := '';
      Result.UserName := '';
      Result.password := '';
      Result.noactualiza := '0';
      Result.color := '';
      Result.extended := '';
      Result.instalar := false;

      With TCambiarBdDlg.Create( Application ) do
      try
        if ( FBase.base_datos <> '' ) then
          Result := FBase
        else
        begin
          if Editor.Items.Count=0 then
            Result.instalar := true
          else
          begin
            ShowModal;
            if ( ModalResult = mrOK ) then
              Result := FBase;
          end;
        end;
      finally
            free;
      end;
end;

function getListaBase( FLista: TStringList ): boolean;
var
  FItem: TListItem;
  i: Integer;
begin
    Result := False;
    With TCambiarBdDlg.Create( Application ) do
    try
      if (FBase.base_datos <> '' ) then
        FLista.Add( FBase.nombre )
      else
      begin
        // cargar los datos de las bases
        for I := 0 to Editor.Items.Count - 1 do
        begin
          FItem := Editor.Items[i];
          FLista.Add( FItem.SubItems[0] );
        end;
      end;
    finally
      result := True;
      Free;
    end;
end;


procedure TCambiarBdDlg.FormCreate(Sender: TObject);
var
    FLista: TStringList;
    i, x: integer;
    FItem: TListItem;
begin
    FLista := TStringList.create;
    try
        FIni := TIniFile.Create( ExtractFilePath( Application.ExeName ) + '\Conf\' + ctIniFile );
        FIni.ReadSections( FLista );
        if (FLista.count = 1) then
        begin
            FBase.nombre := FLista[ 0 ];
            FBase.base_datos := FIni.ReadString(FLista[ 0 ], 'Base', '' );
            FBase.servidor := FIni.ReadString(FLista[ 0 ], 'Servidor', '' );
            FBase.UserName := FIni.ReadString(FLista[ 0 ], 'Usuario', '' );
            FBase.Password := FIni.ReadString(FLista[ 0 ], 'clave', '' );
            FBase.cadena  := FIni.ReadString(FLista[ 0 ], 'cadena', '' );
            FBase.color := FIni.ReadString(FLista[ 0 ], 'color', '' );
            FBase.noActualiza := FIni.ReadString(FLista[ 0 ], 'noactualiza', '0' );
            FBase.extended := FIni.ReadString(FLista[ 0 ], 'extended', '' );
        end
        else if (FLista.count > 1) then
        begin
          for x:=0 to FLista.count-1 do
          begin
                FItem := Editor.Items.Add;
                FItem.caption := FLista[x];
          end;
          Editor.ItemIndex := 0;
        end
        else
        begin
            FBase.base_datos := '';
            FBase.servidor := '';
            FBase.UserName := '';
            FBase.password := '';
            FBase.noactualiza := '0';
            FBase.instalar := true;
            FBase.color := '';
            FBase.extended := '';
            // PostMessage(Application.Handle, WM_CLOSE, 0, 0);
        end;
    finally
        FIni.free;
        FLista.Free;
    end;

end;

procedure TCambiarBdDlg.OKBtnClick(Sender: TObject);
begin
    if Editor.ItemIndex < 0 then
    begin
          ModalResult := mrNone;
          ShowMessage( ctError );
    end
    else
    begin
        FIni := TIniFile.Create( ExtractFilePath( Application.ExeName ) + '\Conf\' + ctIniFile );
        begin
            FBase.nombre  := Editor.Selected.Caption;
            FBase.base_datos := FIni.ReadString(FBase.nombre, 'Base', '' );
            FBase.servidor := FIni.ReadString(FBase.nombre, 'Servidor', '' );
            FBase.UserName := FIni.ReadString(FBase.nombre, 'Usuario', '' );
            FBase.Password := FIni.ReadString(FBase.nombre, 'clave', '' );
            FBase.cadena  := FIni.ReadString(FBase.nombre, 'cadena', '' );
            FBase.noActualiza  := FIni.ReadString(FBase.nombre, 'noactualiza', '0' );
            FBase.color := FIni.ReadString(FBase.nombre, 'color', '' );
            FBase.extended := FIni.ReadString(FBase.nombre, 'extended', '' );
        end;
    end;
end;

procedure TCambiarBdDlg.VerIconos1Click(Sender: TObject);
begin
        Editor.ViewStyle := vsIcon;
end;

procedure TCambiarBdDlg.VerLista1Click(Sender: TObject);
begin
        Editor.ViewStyle := vsList;
end;

procedure TCambiarBdDlg.Informe1Click(Sender: TObject);
begin
        Editor.ViewStyle := vsReport;
end;

procedure TCambiarBdDlg.IconoChico1Click(Sender: TObject);
begin
        Editor.ViewStyle := vsSmallIcon;
end;

end.
