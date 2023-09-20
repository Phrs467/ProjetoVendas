unit frmTabUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst, Vcl.ExtCtrls, UTabUsuario, uDmConexao,
  Vcl.Buttons;

type
  TFormUsuario = class(TForm)
    edt_NomeUsu: TLabeledEdit;
    edt_LoginUsu: TLabeledEdit;
    edt_SenhaUsu: TLabeledEdit;
    Panel1: TPanel;
    btn_excluir: TButton;
    btn_incluir: TButton;
    btn_pesquisar: TButton;
    btn_salvar: TButton;
    btn_cancelar: TButton;
    edt_CdUsu: TLabeledEdit;
    SpeedButton1: TSpeedButton;

    procedure btn_salvarClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure edt_CdUsuKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    TabUsuario : TTabUsuario;

   Procedure LimparForm;
   procedure PesquisarUsuario;
  public
    { Public declarations }
  end;

var
  FormUsuario: TFormUsuario;

implementation

uses UPesqUsuario;

{$R *.dfm}

procedure TFormUsuario.btn_excluirClick(Sender: TObject);
begin
  TabUsuario := TTabUsuario.Create;

  TabUsuario.CD_USU := StrToInt(edt_CdUsu.Text);

  if Application.MessageBox('Voc� deseja excluir o registro? ', 'Aviso',
    MB_ICONQUESTION+MB_YESNO) = mrYes then
  begin
    TabUsuario.Excluir;
    TabUsuario.Free;
  end
  else
    exit;

  LimparForm;
end;

procedure TFormUsuario.btn_incluirClick(Sender: TObject);
begin
  if (edt_NomeUsu.Text <> '') or (edt_LoginUsu.Text <> '') or (edt_SenhaUsu.Text <> '') then
  begin
    if Application.MessageBox('Voc� deseja limpar os dados preenchidos? ', 'Aviso',
    MB_ICONQUESTION+MB_YESNO) = mrNo then
    Exit;
  end;

  LimparForm;
end;

procedure TFormUsuario.btn_salvarClick(Sender: TObject);
begin
  TabUsuario := TTabUsuario.Create;

  TabUsuario.NOME_USU := edt_NomeUsu.Text;
  TabUsuario.LOGIN_USU := edt_LoginUsu.Text;
  TabUsuario.SENHA_USU := edt_SenhaUsu.Text;

  if edt_NomeUsu.Text = '' then
  begin
    Application.MessageBox('Voc� deve preencher o Nome' , 'Aviso', MB_ICONEXCLAMATION+MB_OK);
    Abort
  end;

  if edt_LoginUsu.Text = '' then
  begin
    Application.MessageBox('Voc� deve preencher o Login', 'Aviso', MB_ICONEXCLAMATION+MB_OK);
    abort
  end;

  if edt_SenhaUsu.Text = '' then
  begin
    Application.MessageBox('Voc� deve preencher a Senha', 'Aviso', MB_ICONEXCLAMATION+MB_OK);
    abort
  end;


  if edt_CdUsu.Text <> '' then
  begin
    TabUsuario.CD_USU := StrToInt(edt_CdUsu.Text);
    TabUsuario.Editar
  end
  else
    TabUsuario.Salvar;

  TabUsuario.Free;
end;

procedure TFormUsuario.edt_CdUsuKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if  Key = VK_RETURN then
  begin
    PesquisarUsuario;
  end;
end;

procedure TFormUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LimparForm;
end;

procedure TFormUsuario.LimparForm;
begin
  edt_CdUsu.Clear;
  edt_NomeUsu.Clear;
  edt_LoginUsu.Clear;
  edt_SenhaUsu.Clear;
end;

procedure TFormUsuario.PesquisarUsuario;
begin
  if edt_CdUsu.Text <> '' then
  begin
    TabUsuario := TTabUsuario.Create;
    TabUsuario.CD_USU := StrToInt(edt_CdUsu.Text);

    if TabUsuario.PesquisaId then
    begin
      edt_CdUsu.Text := IntToStr(TabUsuario.CD_USU);
      edt_NomeUsu.Text := TabUsuario.NOME_USU;
      edt_LoginUsu.Text := TabUsuario.LOGIN_USU;
      edt_SenhaUsu.Text := TabUsuario.SENHA_USU;
    end
    else
      ShowMessage('Usu�rio n�o localizado');
  end;

  TabUsuario.Free;
end;

procedure TFormUsuario.SpeedButton1Click(Sender: TObject);
begin
  FormPesqUsuario.ShowModal;
  if FormPesqUsuario.FrmIdUsuario > 0 then
  begin
    edt_CdUsu.Text := IntToStr(FormPesqUsuario.FrmIdUsuario);
    PesquisarUsuario;
  end;
end;

end.
