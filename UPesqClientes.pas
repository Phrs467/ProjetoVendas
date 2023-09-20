unit UPesqClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TFormPesqClientes = class(TForm)
    Panel1: TPanel;
    btnPesqClientes: TButton;
    RgPesqClientes: TRadioGroup;
    EdtPesqClientes: TEdit;
    Label1: TLabel;
    BtnSelecClientes: TButton;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    procedure btnPesqClientesClick(Sender: TObject);
    procedure RgPesqClientesClick(Sender: TObject);
    procedure BtnSelecClientesClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    FrmNomeCliente : String;
    FrmIdCliente : Integer;
  end;

var
  FormPesqClientes: TFormPesqClientes;

implementation

uses
  uDmClientes;

{$R *.dfm}

procedure TFormPesqClientes.btnPesqClientesClick(Sender: TObject);
var
  sql : string;
begin
  sql :=
  'select                       '+
  '  Cli.COD_CLIENTE,           '+
  '  Cli.NOME_CLIENTE,          '+
  '  Cli.IDADE,                 '+
  '  Cli.SEXO,                  '+
  '  uf.COD_UF,                 '+
  '  uf.SIGLA                   '+
  'from Clientes Cli            '+
  'inner join UF uf on uf.COD_UF  = Cli.UF ';

  if RgPesqClientes.ItemIndex = 0 then
  begin
    if EdtPesqClientes.Text = '' then
    begin
      dmClientes.qPesqClientes.Close;
      dmClientes.qPesqClientes.SQL.Text := sql;
      dmClientes.qPesqClientes.Open;
    end
    else
    begin
      sql := sql + ' where Cli.COD_CLIENTE = :COD_CLIENTE';

      dmClientes.qPesqClientes.Close;
      dmClientes.qPesqClientes.SQL.Text := sql;
      dmClientes.qPesqClientes.Parameters.ParamByName('COD_CLIENTE').Value := EdtPesqClientes.Text;
      dmClientes.qPesqClientes.Open;
    end;
  end;

  if RgPesqClientes.ItemIndex = 1 then
  begin
    if EdtPesqClientes.Text = '' then
    begin
      dmClientes.qPesqClientes.Close;
      dmClientes.qPesqClientes.SQL.Text := sql;
      dmClientes.qPesqClientes.Open;
    end
    else
    begin
      sql := sql + ' where NOME_CLIENTE like ''%' + EdtPesqClientes.Text + '%''';

      dmClientes.qPesqClientes.Close;
      dmClientes.qPesqClientes.SQL.Text := sql;
      dmClientes.qPesqClientes.Open;
    end;
  end;
  DBGrid1.DataSource := dmClientes.DsPesqClientes;
end;

procedure TFormPesqClientes.BtnSelecClientesClick(Sender: TObject);
begin
  FrmIdCliente := 0;
  FrmNomeCliente := '';
  if not dmClientes.qPesqClientes.IsEmpty then
  begin
    FrmIdCliente := dmClientes.qPesqClientesCOD_CLIENTE.AsInteger;
    FrmNomeCliente := dmClientes.qPesqClientesNOME_CLIENTE.AsString;
  end;
  Self.Close;
end;

procedure TFormPesqClientes.RgPesqClientesClick(Sender: TObject);
begin
  if RgPesqClientes.ItemIndex = 0 then
  begin
    Label1.Caption := 'Digite o ID:';
  end;

  if RgPesqClientes.ItemIndex = 1 then
  begin
    Label1.Caption := 'Digite o Nome:';
  end;
end;

end.
