unit frmTabEstados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, MemDS, DBAccess, VirtualQuery, uDmConexao,
  Vcl.StdCtrls, Vcl.ExtCtrls, UTabEstados, Vcl.Buttons;

type
  TFrmEstados = class(TForm)
    edt_sigla: TLabeledEdit;
    btn_incluir: TButton;
    btn_salvar: TButton;
    btn_excluir: TButton;
    btn_pesquisar: TButton;
    Panel1: TPanel;
    edt_descricao: TLabeledEdit;
    edt_aliq: TLabeledEdit;
    btn_cancelar: TButton;
    edt_CodUf: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure LimparForm;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    TabEstados : TTabEstados;

    procedure PesquisarId;
  public
    { Public declarations }
  end;

var
  FrmEstados: TFrmEstados;

implementation

uses UPesqEstados;

{$R *.dfm}


procedure TFrmEstados.btn_cancelarClick(Sender: TObject);
begin
  TabEstados := TTabEstados.Create;

  TabEstados.Cancelar;
  btn_pesquisar.Click;

  TabEstados.Free;
end;

procedure TFrmEstados.btn_excluirClick(Sender: TObject);
begin
  TabEstados := TTabEstados.Create;

  TabEstados.COD_UF := StrToInt(edt_CodUf.Text);

  if Application.MessageBox('Voc� deseja excluir o registro? ', 'Aviso',
    MB_ICONQUESTION+MB_YESNO) = mrYes then
  begin
    TabEstados.Excluir;
    TabEstados.Free;
  end
  else
    Exit;

  LimparForm;
end;

procedure TFrmEstados.btn_incluirClick(Sender: TObject);
begin
  if (edt_sigla.Text <> '') or (edt_descricao.Text <> '') or (edt_aliq.Text <> '') then
  begin
    if Application.MessageBox('Voc� deseja limpar os dados preenchidos? ', 'Aviso',
    MB_ICONQUESTION+MB_YESNO) = mrNo then
    Exit;
  end;

  LimparForm;
end;

procedure TFrmEstados.btn_salvarClick(Sender: TObject);
var
  cod : String;
begin
  TabEstados := TTabEstados.Create;


  TabEstados.SIGLA := UpperCase(edt_sigla.Text);
  TabEstados.DESCRICAO := UpperCase(edt_descricao.Text);
  TabEstados.VL_ALIQ_UF := StrToFloat(edt_aliq.Text);

  if edt_sigla.Text = '' then
  begin
    Application.MessageBox('Voc� deve preencher a Sigla' , 'Aviso', MB_ICONEXCLAMATION+MB_OK);
    Abort
  end;

  if edt_descricao.Text = '' then
  begin
    Application.MessageBox('Voc� deve preencher a Descri��o', 'Aviso', MB_ICONEXCLAMATION+MB_OK);
    abort
  end;

  if edt_aliq.Text = '' then
  begin
    Application.MessageBox('Voc� deve preencher o Valor da al�quota', 'Aviso', MB_ICONEXCLAMATION+MB_OK);
    abort
  end;


  if edt_CodUf.Text <> '' then
  begin
    TabEstados.COD_UF := StrToInt(edt_CodUf.Text);
    TabEstados.Editar
  end
  else
    TabEstados.Salvar;

  TabEstados.Free;
end;

procedure TFrmEstados.LimparForm;
begin
  edt_CodUf.Clear;
  edt_sigla.Clear;
  edt_descricao.Clear;
  edt_aliq.Clear;
end;

procedure TFrmEstados.PesquisarId;
begin
  if edt_CodUf.Text <> '' then
  begin
    TabEstados := TTabEstados.Create;
    TabEstados.COD_UF := StrToInt(edt_CodUf.Text);

    if TabEstados.PesquisarId then
    begin
      edt_sigla.Text := TabEstados.SIGLA;
      edt_descricao.Text := TabEstados.DESCRICAO;
      edt_aliq.Text := FloatToStr(TabEstados.VL_ALIQ_UF);
    end
    else
      ShowMessage('Estado N�o localizado');

  end;
end;

procedure TFrmEstados.SpeedButton1Click(Sender: TObject);
begin
  FormPesqEstados.ShowModal;
  if FormPesqEstados.FrmIdEstados > 0 then
  begin
    edt_CodUf.Text := IntToStr(FormPesqEstados.FrmIdEstados);
    PesquisarId;
  end;
end;

end.