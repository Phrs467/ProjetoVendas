unit frmLancPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, uDmConexao, ULancPedido, UClientes;

type
  TFrmPedidos = class(TForm)
    Panel1: TPanel;
    btn_excluir: TButton;
    btn_incluir: TButton;
    btn_pesquisar: TButton;
    btn_salvar: TButton;
    btn_cancelar: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    edt_NumPedido: TLabeledEdit;
    edt_CodCliente: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    edt_NomeCliente: TLabeledEdit;
    edt_Vendedor: TLabeledEdit;
    edt_Total: TLabeledEdit;
    edt_Desconto: TLabeledEdit;
    edt_ValorPago: TLabeledEdit;
    edt_CodPedido: TLabeledEdit;
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure edt_DescontoExit(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    LancPedido : TLancPedido;
    Clientes : TCadClientes;

    procedure LimparForm;

  public
    { Public declarations }
    Procedure Usuario;
  end;

var
  FrmPedidos: TFrmPedidos;

implementation

uses frmPesquisaGeral, uDmUsuario;

{$R *.dfm}

{ TFrmPedidos }



procedure TFrmPedidos.btn_cancelarClick(Sender: TObject);
begin
  LancPedido := TLancPedido.Create;

  LancPedido.Cancelar;
  btn_pesquisar.Click;

  LancPedido.Free;
end;

procedure TFrmPedidos.btn_excluirClick(Sender: TObject);
begin
  LancPedido := TLancPedido.Create;

  LancPedido.COD_PEDIDO := StrToInt(edt_CodPedido.Text);

  if Application.MessageBox('Voc� deseja excluir o registro? ', 'Aviso',
    MB_ICONQUESTION+MB_YESNO) = mrYes then
  begin
    LancPedido.Excluir;
    LancPedido.Free;
  end
  else
    Exit;

  LimparForm;
end;

procedure TFrmPedidos.btn_incluirClick(Sender: TObject);
begin
    if (edt_NumPedido.Text <> '') or (edt_CodCliente.Text <> '') or (edt_NomeCliente.Text <> '') then
  begin
    if Application.MessageBox('Voc� deseja incluir um novo registro? as altera��es realizadas caso n�o salvar ser�o perdidas!',
    'Aviso', MB_ICONQUESTION+MB_YESNO) = mrNo then
    exit;
  end;
  LimparForm;
end;

procedure TFrmPedidos.btn_salvarClick(Sender: TObject);
begin
  LancPedido := TLancPedido.Create;


  LancPedido.NUMERO_PEDIDO_CLIENTE := StrToInt(edt_NumPedido.Text);
  LancPedido.COD_CLIENTE := StrToInt(edt_CodCliente.Text);
  LancPedido.NOME_CLIENTE := UpperCase(edt_NomeCliente.Text);
  LancPedido.VALOR_PEDIDO := StrToFloat(edt_Total.Text);
  LancPedido.DESCONTO_PAGO := StrToFloat(edt_Desconto.Text);
  LancPedido.VALOR_PAGO := StrToFloat(edt_ValorPago.Text);

  LancPedido.COD_USU := StrToInt(dmUsuario.ID_Logado);

  if edt_CodPedido.Text <> '' then
  begin
    LancPedido.COD_PEDIDO := StrToInt(edt_CodPedido.Text);
    LancPedido.Editar
  end
  else
    LancPedido.Salvar;

  LancPedido.Free;
end;


procedure TFrmPedidos.edt_DescontoExit(Sender: TObject);
var
  ValorPago,Desconto, ValorTotal : Double;
begin
  ValorTotal := StrToFloatDef(edt_Total.Text, 0);
  Desconto := StrToFloatDef(edt_Desconto.Text, 0);

  ValorPago := ValorTotal - Desconto;
  edt_ValorPago.Text := FormatFloat('#0.00', ValorPago);
end;

procedure TFrmPedidos.LimparForm;
begin
  edt_NumPedido.Clear;
  edt_CodCliente.Clear;
  edt_NomeCliente.Clear;
  edt_Total.Clear;
  edt_Desconto.Clear;
  edt_ValorPago.Clear;
  edt_Vendedor.Text := dmUsuario.Usuario_Logado;
end;


procedure TFrmPedidos.SpeedButton1Click(Sender: TObject);
begin
  if edt_CodCliente.Text <> '' then
  begin
    DataModule1.ADOQuery1.SQL.Text :=
    'select                                     '+
    'cli.NOME_CLIENTE                           '+
    'from Clientes Cli                          '+
    'where Cli.COD_CLIENTE = :COD_CLIENTE       ';

    DataModule1.ADOQuery1.Parameters.ParamByName('COD_CLIENTE').Value := StrToInt(edt_CodCliente.Text);
    DataModule1.ADOQuery1.Open;

    if not DataModule1.ADOQuery1.IsEmpty then
      edt_NomeCliente.Text := DataModule1.ADOQuery1.FieldByName('NOME_CLIENTE').AsString
    else
      ShowMessage('Cliente n�o encontrado');

  end;
end;

procedure TFrmPedidos.Usuario;
begin
  edt_Vendedor.Text := dmUsuario.Usuario_Logado;
end;

end.