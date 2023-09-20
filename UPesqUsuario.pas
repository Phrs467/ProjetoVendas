unit UPesqUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Data.Win.ADODB, Vcl.Menus, Vcl.ToolWin,
  Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus;


type
  TFormPesqUsuario = class(TForm)
    Panel1: TPanel;
    RgPesqUsuario: TRadioGroup;
    EdtPesqUsuario: TEdit;
    Label1: TLabel;
    BtnPesquisar: TButton;
    BtnSelecionar: TButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    procedure RgPesqUsuarioClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnSelecionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FrmNomeUsuario : String;
    FrmIdUsuario : Integer;
  end;

var
  FormPesqUsuario: TFormPesqUsuario;

implementation

uses
        uDmUsuario;

{$R *.dfm}

procedure TFormPesqUsuario.BtnPesquisarClick(Sender: TObject);
var
  sql : string;
begin
  sql :=
  '  select             '+
  '     CD_USU,         '+
  '     LOGIN_USU,      '+
  '     NOME_USU,       '+
  '     SENHA_USU       '+
  '  from Usuario       ';

  if RgPesqUsuario.ItemIndex = 0 then
  begin
    if EdtPesqUsuario.Text = '' then
    begin
      dmUsuario.qPesqUsuario.Close;
      dmUsuario.qPesqUsuario.SQL.Text := sql;
      dmUsuario.qPesqUsuario.Open;
    end
    else
    begin
      sql := sql + ' where CD_USU = :CD_USU';

      dmUsuario.qPesqUsuario.Close;
      dmUsuario.qPesqUsuario.SQL.Text := sql;
      dmUsuario.qPesqUsuario.Parameters.ParamByName('CD_USU').Value := EdtPesqUsuario.Text;
      dmUsuario.qPesqUsuario.Open;
    end;
  end;

  if RgPesqUsuario.ItemIndex = 1 then
  begin
    if EdtPesqUsuario.Text = '' then
    begin
      dmUsuario.qPesqUsuario.Close;
      dmUsuario.qPesqUsuario.SQL.Text := sql;
      dmUsuario.qPesqUsuario.Open;
    end
    else
    begin
      sql := sql + ' where NOME_USU like ''%' + EdtPesqUsuario.Text + '%''';

      dmUsuario.qPesqUsuario.Close;
      dmUsuario.qPesqUsuario.SQL.Text := sql;
      dmUsuario.qPesqUsuario.Open;
    end;
  end;

  DBGrid1.DataSource := dmUsuario.DsPesqUsuario;
end;

procedure TFormPesqUsuario.BtnSelecionarClick(Sender: TObject);
begin
  FrmIdUsuario := 0;
  FrmNomeUsuario := '';

  if not dmUsuario.qPesqUsuario.IsEmpty then
  begin
    FrmIdUsuario := dmUsuario.qPesqUsuarioCD_USU.AsInteger;
    FrmNomeUsuario := dmUsuario.qPesqUsuarioNOME_USU.AsString;
  end;
  Self.Close;
end;

procedure TFormPesqUsuario.RgPesqUsuarioClick(Sender: TObject);
begin
  if RgPesqUsuario.ItemIndex = 0 then
  begin
    Label1.Caption := 'Digite o ID:';
  end;

  if RgPesqUsuario.ItemIndex = 1 then
  begin
    Label1.Caption := 'Digite o Nome:';
  end;
end;

end.
