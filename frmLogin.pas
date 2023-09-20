unit frmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, frmPrincipal,
  dxGDIPlusClasses, uDmConexao;

type
  TfrmLoginSistema = class(TForm)
    btnEntrar: TButton;
    edtUsuario: TLabeledEdit;
    edtSenha: TLabeledEdit;
    Image1: TImage;
    procedure btnEntrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmLoginSistema: TfrmLoginSistema;

implementation

{$R *.dfm}

uses uDmUsuario;

procedure TfrmLoginSistema.btnEntrarClick(Sender: TObject);
var
  bconectado : Boolean;
begin
  DataModule1 := TDataModule1.Create(Application);
  bconectado := uDmConexao.DataModule1.bconectar;

  DataModule1.ADOQuery1.Close;
  DataModule1.ADOQuery1.SQL.Clear;
  DataModule1.ADOQuery1.SQL.Text := 'SELECT * FROM Usuario where LOGIN_USU ='''+ edtUsuario.Text +
  ''' and SENHA_USU ='''+edtSenha.Text+''' ';
  DataModule1.ADOQuery1.Active := True;


  if DataModule1.ADOQuery1.RecordCount >0 then
  begin
    dmUsuario.ID_Logado := DataModule1.ADOQuery1.FieldByName('CD_USU').AsString;
    dmUsuario.Usuario_Logado := DataModule1.ADOQuery1.FieldByName('NOME_USU').AsString;
    frmMenuSistema := TfrmMenuSistema.Create(Application);
    frmMenuSistema.ShowModal;
    Self.Hide;
  end
  else
    ShowMessage('Usuário ou senha inválidos!');

end;
end.
