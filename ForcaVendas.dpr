program ForcaVendas;

uses
  Vcl.Forms,
  frmLogin in 'frmLogin.pas' {frmLoginSistema},
  frmPrincipal in 'frmPrincipal.pas' {frmMenuSistema},
  Vcl.Themes,
  Vcl.Styles,
  uDmConexao in 'uDmConexao.pas' {Data: TDataModule},
  frmTabEstados in 'frmTabEstados.pas' {Form1},
  UTabEstados in 'UTabEstados.pas',
  frmTabUsuario in 'frmTabUsuario.pas' {FormUsuario},
  UTabUsuario in 'UTabUsuario.pas',
  frmCadClientes in 'frmCadClientes.pas' {Form2},
  UClientes in 'UClientes.pas',
  frmProduto in 'frmProduto.pas' {frmCadProduto},
  UProduto in 'UProduto.pas',
  frmLancPedidos in 'frmLancPedidos.pas' {FrmPedidos},
  ULancPedido in 'ULancPedido.pas',
  UPesqUsuario in 'UPesqUsuario.pas' {FormPesqUsuario},
  UPesqClientes in 'UPesqClientes.pas' {FormPesqClientes},
  UPesqEstados in 'UPesqEstados.pas' {FormPesqEstados},
  UPesqProduto in 'UPesqProduto.pas' {Form3},
  uDmUsuario in 'uDmUsuario.pas' {dmUsuario: TDataModule},
  uDmClientes in 'uDmClientes.pas' {dmClientes: TDataModule},
  uDmEstados in 'uDmEstados.pas' {DmEstados: TDataModule},
  uDmProduto in 'uDmProduto.pas' {dmProduto: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'For�a de Vendas';
  TStyleManager.TrySetStyle('Light');
  Application.CreateForm(TdmUsuario, dmUsuario);
  Application.CreateForm(TfrmLoginSistema, frmLoginSistema);
  Application.CreateForm(TfrmMenuSistema, frmMenuSistema);
  Application.CreateForm(TfrmCadProduto, frmCadProduto);
  Application.CreateForm(TFormUsuario, FormUsuario);
  Application.CreateForm(TFrmClientes, FrmClientes);
  Application.CreateForm(TFrmEstados, FrmEstados);
  Application.CreateForm(TFrmPedidos, FrmPedidos);
  Application.CreateForm(TFormPesqUsuario, FormPesqUsuario);
  Application.CreateForm(TFormPesqClientes, FormPesqClientes);
  Application.CreateForm(TFormPesqEstados, FormPesqEstados);
  Application.CreateForm(TFormPesqProduto, FormPesqProduto);
  Application.CreateForm(TdmClientes, dmClientes);
  Application.CreateForm(TDmEstados, DmEstados);
  Application.CreateForm(TdmProduto, dmProduto);
  Application.CreateForm(TDataModule1, DataModule1);
  //Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
