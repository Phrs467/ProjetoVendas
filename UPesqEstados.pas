unit UPesqEstados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TFormPesqEstados = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    RgPesqEstados: TRadioGroup;
    EdtPesqEstados: TEdit;
    btnPesqEstados: TButton;
    BtnSelecionarEstados: TButton;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    procedure RgPesqEstadosClick(Sender: TObject);
    procedure btnPesqEstadosClick(Sender: TObject);
    procedure BtnSelecionarEstadosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FrmIdEstados : Integer;
    FrmSiglaEstados : string;
  end;

var
  FormPesqEstados: TFormPesqEstados;

implementation

uses
  uDmEstados;

{$R *.dfm}

procedure TFormPesqEstados.btnPesqEstadosClick(Sender: TObject);
var
  sql : string;
begin
  sql :=
  'select * from UF';

  if RgPesqEstados.ItemIndex = 0 then
  begin
    if EdtPesqEstados.Text = '' then
    begin
      DmEstados.qPesqEstados.Close;
      DmEstados.qPesqEstados.SQL.Text := sql;
      DmEstados.qPesqEstados.Open;
    end
    else
    begin
      sql := sql + ' where COD_UF = :COD_UF';

      DmEstados.qPesqEstados.Close;
      DmEstados.qPesqEstados.SQL.Text := sql;
      DmEstados.qPesqEstados.Parameters.ParamByName('COD_UF').Value := EdtPesqEstados.Text;
      DmEstados.qPesqEstados.Open;
    end;
  end;

  if RgPesqEstados.ItemIndex = 1 then
  begin
    if EdtPesqEstados.Text <> '' then
    begin
      DmEstados.qPesqEstados.Close;
      DmEstados.qPesqEstados.SQL.Text := sql;
      DmEstados.qPesqEstados.Open;
    end
    else
    begin
      sql := sql + ' where DESCRICAO like ''%' + EdtPesqEstados.Text + '%''';

      DmEstados.qPesqEstados.Close;
      DmEstados.qPesqEstados.SQL.Text := sql;
      DmEstados.qPesqEstados.Open;
    end;
  end;

  DBGrid1.DataSource := DmEstados.DsPesqEstados;
end;

procedure TFormPesqEstados.BtnSelecionarEstadosClick(Sender: TObject);
begin
  FrmIdEstados := 0;
  FrmSiglaEstados := '';

  if not DmEstados.qPesqEstados.IsEmpty then
  begin
    FrmIdEstados := DmEstados.qPesqEstadosCOD_UF.AsInteger;
    FrmSiglaEstados := DmEstados.qPesqEstadosSIGLA.AsString;
  end;
  Self.Close;
end;

procedure TFormPesqEstados.RgPesqEstadosClick(Sender: TObject);
begin
  if RgPesqEstados.ItemIndex = 0 then
  begin
    Label1.Caption := 'Digite o ID:';
  end;

  if RgPesqEstados.ItemIndex = 1 then
  begin
    Label1.Caption := 'Digite o Descri��o:';
  end;
end;

end.
