unit frmProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uDmConexao, UProduto,
  Vcl.Buttons;

type
  TfrmCadProduto = class(TForm)
    edt_desc_comercial: TLabeledEdit;
    edt_desc_compra: TLabeledEdit;
    edt_Unidade: TLabeledEdit;
    edt_Valor: TLabeledEdit;
    edt_QtdEstoque: TLabeledEdit;
    Panel1: TPanel;
    btn_excluir: TButton;
    btn_incluir: TButton;
    btn_pesquisar: TButton;
    btn_salvar: TButton;
    btn_cancelar: TButton;
    edt_CodProduto: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure LimparForm;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    Produto : TProduto;

    procedure PesquisarId;
  public
    { Public declarations }
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

uses
  frmPesquisaGeral, UPesqProduto;

{$R *.dfm}

procedure TfrmCadProduto.btn_cancelarClick(Sender: TObject);
begin
  Produto := TProduto.Create;

  Produto.Cancelar;
  btn_pesquisar.Click;

  Produto.Free;
end;

procedure TfrmCadProduto.btn_excluirClick(Sender: TObject);
begin
  Produto := TProduto.Create;

  Produto.COD_PRODUTO := StrToInt(edt_CodProduto.Text);

  if Application.MessageBox('Você deseja excluir o registro? ', 'Aviso',
    MB_ICONQUESTION+MB_YESNO) = mrYes then
  begin
    Produto.Excluir;
    Produto.Free
  end
  else
    Exit;

  LimparForm;
end;

procedure TfrmCadProduto.btn_incluirClick(Sender: TObject);
begin

  if (edt_desc_comercial.Text <> '') or (edt_desc_compra.Text <> '') or (edt_Unidade.Text <> '')
  or (edt_Valor.Text <> '') then
  begin
    if Application.MessageBox('Você deseja incluir um novo registro? as alterações realizadas caso não salvar serão perdidas!',
    'Aviso', MB_ICONQUESTION+MB_YESNO) = mrNo then
    exit;
  end;
  LimparForm;
  edt_desc_comercial.SetFocus;
end;

procedure TfrmCadProduto.btn_salvarClick(Sender: TObject);
begin
  Produto := TProduto.Create;

  Produto.DESCCOMERCIAL := UpperCase(edt_desc_comercial.Text);
  Produto.DESCCOMPRA := UpperCase(edt_desc_compra.Text);
  Produto.UNIDADE := UpperCase(edt_Unidade.Text);
  Produto.VALOR := StrToFloat(edt_Valor.Text);
  Produto.QUANTIDADE := StrToFloat(edt_QtdEstoque.Text);

  if edt_desc_comercial.Text = '' then
  begin
    Application.MessageBox('Você deve preencher a Descrição comercial' , 'Aviso', MB_ICONEXCLAMATION+MB_OK);
    Abort
  end;

  if edt_desc_compra.Text = '' then
  begin
    Application.MessageBox('Você deve preencher a Descrição da compra', 'Aviso', MB_ICONEXCLAMATION+MB_OK);
    abort
  end;

  if edt_Unidade.Text = '' then
  begin
    Application.MessageBox('Você deve preencher a Unidade', 'Aviso', MB_ICONEXCLAMATION+MB_OK);
    abort
  end;

  if edt_Valor.Text = '' then
  begin
    Application.MessageBox('Você deve preencher o Valor', 'Aviso', MB_ICONEXCLAMATION+MB_OK);
    abort
  end;

  if edt_QtdEstoque.Text = '' then
  begin
    Application.MessageBox('Você deve preencher a Quantidade do Estoque', 'Aviso', MB_ICONEXCLAMATION+MB_OK);
    abort
  end;

  if edt_CodProduto.Text <> '' then
  begin
    Produto.COD_PRODUTO := StrToInt(edt_CodProduto.Text);
    Produto.Editar;
  end
  else
    Produto.Salvar;

  Produto.Free;
end;

procedure TfrmCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LimparForm;
end;

procedure TfrmCadProduto.LimparForm;
begin
  edt_desc_comercial.Clear;
  edt_desc_compra.Clear;
  edt_QtdEstoque.Clear;
  edt_Unidade.Clear;
  edt_Valor.Clear;
end;

procedure TfrmCadProduto.PesquisarId;
begin
  if edt_CodProduto.Text <> '' then
  begin
    Produto := TProduto.Create;
    Produto.COD_PRODUTO := StrToInt(edt_CodProduto.Text);

    if Produto.PesquisarId then
    begin
      edt_desc_comercial.Text := Produto.DESCCOMERCIAL;
      edt_desc_compra.Text := Produto.DESCCOMPRA;
      edt_Unidade.Text := Produto.UNIDADE;
      edt_Valor.Text := FloatToStr(Produto.VALOR);
      edt_QtdEstoque.Text := FloatToStr(Produto.QUANTIDADE);
    end
    else
      ShowMessage('Produto não localizado! ');

    Produto.Free;
  end;

end;

procedure TfrmCadProduto.SpeedButton1Click(Sender: TObject);
begin
  FormPesqProduto.ShowModal;
  if FormPesqProduto.FrmIdProduto > 0 then
  begin
    edt_CodProduto.Text := IntToStr(FormPesqProduto.FrmIdProduto);
    PesquisarId;
  end;

end;

end.
