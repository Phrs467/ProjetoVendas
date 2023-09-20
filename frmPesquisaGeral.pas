unit frmPesquisaGeral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, frmTabEstados,
  Vcl.StdCtrls, Vcl.ExtCtrls, frmTabUsuario, frmCadClientes, frmProduto, frmLancPedidos;

type
  TfrmPesqGeral = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel1: TPanel;
    ButtonIncluir: TButton;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ButtonIncluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var sTipoPesquisa, SPK : string;
  end;

var
  frmPesqGeral: TfrmPesqGeral;

implementation

uses uDmConexao;

{$R *.dfm}

procedure TfrmPesqGeral.ButtonIncluirClick(Sender: TObject);
begin
//  if sTipoPesquisa = 'Usuario' then
//  begin
//    FrmUsuario := TFrmUsuario.Create(self);
//    FrmUsuario.Show;
//  end;
//
//  if sTipoPesquisa = 'UF' then
//  begin
//    FrmEstados := TFrmEstados.Create(self);
//    FrmEstados.Show;
//  end;
//
//  if sTipoPesquisa = 'Clientes' then
//  begin
//    FrmClientes := TFrmClientes.Create(Self);
//    FrmClientes.Show;
//  end;
//
//  if sTipoPesquisa = 'Produto' then
//  begin
//    frmCadProduto := TfrmCadProduto.Create(Self);
//    frmCadProduto.Show
//  end;
//
//  if sTipoPesquisa = 'Pedido' then
//  begin
//    FrmPedidos := TFrmPedidos.Create(self);
//    FrmPedidos.Show;
//    FrmPedidos.Usuario;
//  end;
end;

procedure TfrmPesqGeral.DBGrid1DblClick(Sender: TObject);
begin


//  if sTipoPesquisa = 'UF' then
//  begin
//    SPK := DataModule1.ADOQuery1.FieldByName('COD_UF').AsString;
//    frmEstados := TFrmEstados.Create(self);
//    frmEstados.Show;
//  end;
//
//  if sTipoPesquisa = 'Usuario' then
//  begin
//    SPK := DataModule1.ADOQuery1.FieldByName('CD_USU').AsString;
//    FrmUsuario := TFrmUsuario.Create(Self);
//    FrmUsuario.Show;
//  end;
//
//  if sTipoPesquisa = 'Clientes' then
//  begin
//    SPK := DataModule1.ADOQuery1.FieldByName('COD_CLIENTE').AsString;
//    FrmClientes := TFrmClientes.Create(Self);
//    FrmClientes.Show;
//  end;
//
//  if sTipoPesquisa = 'Produto' then
//  begin
//    SPK := DataModule1.ADOQuery1.FieldByName('COD_PRODUTO').AsString;
//    frmCadProduto := TfrmCadProduto.Create(Self);
//    frmCadProduto.Show;
//  end;
//
//  if sTipoPesquisa = 'Pedido' then
//  begin
//    SPK := DataModule1.ADOQuery1.FieldByName('COD_PEDIDO').AsString;
//    FrmPedidos := TFrmPedidos.Create(Self);
//    FrmPedidos.Show;
//  end;
end;

procedure TfrmPesqGeral.FormShow(Sender: TObject);
begin
//  if sTipoPesquisa = 'UF' then
//  begin
//    DataSource1.DataSet := DataModule1.ADOQuery1;
//
//    DataModule1.ADOQuery1.Close;
//    DataModule1.ADOQuery1.SQL.Clear;
//    DataModule1.ADOQuery1.SQL.Text := 'SELECT * FROM UF';
//    DataModule1.ADOQuery1.Active := True;
//    DataModule1.ADOQuery1.Open;
//
//    if DataModule1.ADOQuery1.RecordCount > 0 then
//    begin
//      DBGrid1.DataSource:= DataSource1;
//    end;
//  end;
//
//  if sTipoPesquisa = 'Produto' then
//  begin
//    DataSource1.DataSet := DataModule1.ADOQuery1;
//
//    DataModule1.ADOQuery1.Close;
//    DataModule1.ADOQuery1.SQL.Clear;
//    DataModule1.ADOQuery1.SQL.Text := 'SELECT * FROM Produto';
//    DataModule1.ADOQuery1.Active := True;
//    DataModule1.ADOQuery1.Open;
//
//    if uDmConexao.DataModule1.ADOQuery1.RecordCount > 0 then
//    begin
//      DBGrid1.DataSource:= DataSource1;
//    end;
//  end;
//
//  if sTipoPesquisa = 'Clientes' then
//  begin
//    DataSource1.DataSet := DataModule1.ADOQuery1;
//
//    DataModule1.ADOQuery1.Close;
//    DataModule1.ADOQuery1.SQL.Clear;
//    DataModule1.ADOQuery1.SQL.Text :=
//    '  select                                   '+
//    '    Cli.COD_CLIENTE,                       '+
//    '    Cli.NOME_CLIENTE,                      '+
//    '    Cli.IDADE,                             '+
//    '    Cli.SEXO,                              '+
//    '    uf.SIGLA                               '+
//    '  from Clientes Cli                        '+
//    '  inner join UF uf on uf.COD_UF  = Cli.UF  ';
//    DataModule1.ADOQuery1.Active := True;
//    DataModule1.ADOQuery1.Open;
//
//    if DataModule1.ADOQuery1.RecordCount > 0 then
//    begin
//      DBGrid1.DataSource:= DataSource1;
//    end;
//  end;
//
//  if sTipoPesquisa = 'Usuario' then
//  begin
//    DataSource1.DataSet := DataModule1.ADOQuery1;
//
//    DataModule1.ADOQuery1.Close;
//    DataModule1.ADOQuery1.SQL.Clear;
//    DataModule1.ADOQuery1.SQL.Text :=
//    'SELECT * FROM Usuario';
//    DataModule1.ADOQuery1.Active := True;
//    DataModule1.ADOQuery1.Open;
//
//    if DataModule1.ADOQuery1.RecordCount > 0 then
//    begin
//      DBGrid1.DataSource:= DataSource1;
//    end;
//  end;
//
//  if sTipoPesquisa = 'Pedido' then
//  begin
//    DataSource1.DataSet := DataModule1.ADOQuery1;
//
//    DataModule1.ADOQuery1.Close;
//    DataModule1.ADOQuery1.SQL.Clear;
//    DataModule1.ADOQuery1.SQL.Text :=
//    'select                                                             '+
//    '       Ped.COD_PEDIDO,                                             '+
//    '       Ped.NUMERO_PEDIDO_CLIENTE,                                  '+
//    '       Cli.COD_CLIENTE,                                            '+
//    '       Cli.NOME_CLIENTE,                                           '+
//    '       Ped.VALOR_PEDIDO,                                           '+
//    '       Ped.VALOR_PAGO,                                             '+
//    '       Ped.DESCONTO_PEDIDO,                                        '+
//    '       Usu.CD_USU,                                                 '+
//    '       Usu.NOME_USU                                                '+
//    'from Pedido Ped                                                    '+
//    'inner join Clientes Cli on Cli.COD_CLIENTE  = Ped.COD_CLIENTE      '+
//    'inner join Usuario Usu on Usu.CD_USU = Ped.COD_USU                 ';
//    DataModule1.ADOQuery1.Active := True;
//    DataModule1.ADOQuery1.Open;
//
//    if uDmConexao.DataModule1.ADOQuery1.RecordCount > 0 then
//    begin
//      DBGrid1.DataSource:= DataSource1;
//    end;
//  end;
end;

end.
