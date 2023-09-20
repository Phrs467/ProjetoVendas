unit frmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  Vcl.ComCtrls, uDmConexao,uDmUsuario, UPesqUsuario, frmCadClientes, frmTabEstados;

type
  TfrmMenuSistema = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Usurios1: TMenuItem;
    Clientes1: TMenuItem;
    Produtos1: TMenuItem;
    Estados1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    Vendas1: TMenuItem;
    FazerPedido1: TMenuItem;
    StatusBar1: TStatusBar;
    Pesquisa1: TMenuItem;
    Usurio1: TMenuItem;
    Clientes2: TMenuItem;
    Estados2: TMenuItem;
    Pesquisar1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Usurio1Click(Sender: TObject);
    procedure Estados2Click(Sender: TObject);
    procedure Pesquisar1Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Estados1Click(Sender: TObject);
    procedure FazerPedido1Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenuSistema: TfrmMenuSistema;

implementation

uses
UPesqEstados, UPesqProduto, UPesqClientes, UTabUsuario, frmTabUsuario, frmProduto, frmLancPedidos;

{$R *.dfm}


procedure TfrmMenuSistema.Clientes1Click(Sender: TObject);
begin
  FrmClientes.ShowModal;
end;

procedure TfrmMenuSistema.Clientes2Click(Sender: TObject);
begin
  FormPesqClientes.ShowModal;
end;

procedure TfrmMenuSistema.Estados1Click(Sender: TObject);
begin
  FrmEstados.ShowModal;
end;

procedure TfrmMenuSistema.Estados2Click(Sender: TObject);
begin
  FormPesqEstados.ShowModal;
end;

procedure TfrmMenuSistema.FazerPedido1Click(Sender: TObject);
begin
  FrmPedidos.ShowModal;
end;

procedure TfrmMenuSistema.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmMenuSistema.FormCreate(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := StatusBar1.Panels[0].Text + dmUsuario.ID_Logado;
  StatusBar1.Panels[1].Text := dmUsuario.Usuario_Logado;
end;

procedure TfrmMenuSistema.Pesquisar1Click(Sender: TObject);
begin
  FormPesqProduto.ShowModal;
end;

procedure TfrmMenuSistema.Produtos1Click(Sender: TObject);
begin
  frmCadProduto.ShowModal;
end;

procedure TfrmMenuSistema.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMenuSistema.Usurio1Click(Sender: TObject);
begin
  FormPesqUsuario.ShowModal;
end;

procedure TfrmMenuSistema.Usurios1Click(Sender: TObject);
begin
  FormUsuario.ShowModal;
end;

end.
