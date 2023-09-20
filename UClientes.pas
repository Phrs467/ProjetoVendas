unit UClientes;

interface

type
  TCadClientes = class
  private
    { private declarations }
    FCOD_CLIENTE : Integer;
    FNOME_CLIENTE : string;
    FIDADE : Integer;
    FSEXO : String;
    FCOD_UF : Integer;
    FSIGLA : String;

  public
    { public declarations }
    Property COD_CLIENTE : Integer READ FCOD_CLIENTE write FCOD_CLIENTE;
    Property NOME_CLIENTE : String READ FNOME_CLIENTE WRITE FNOME_CLIENTE;
    Property IDADE : Integer READ FIDADE WRITE FIDADE;
    Property SEXO : String READ FSEXO WRITE FSEXO;
    Property COD_UF : Integer READ FCOD_UF WRITE FCOD_UF;
    Property SIGLA : String READ FSIGLA write FSIGLA;

    Function Salvar : Boolean;
    Function Editar : Boolean;
    Function Excluir : Boolean;
    Function Cancelar : Boolean;
    Function PesquisarId : Boolean;
  end;

implementation

uses
  uDmConexao,uDmClientes, SysUtils;

{ TCadClientes }

function TCadClientes.Cancelar: Boolean;
begin
  uDmConexao.DataModule1.ADOQuery1.Cancel;
end;

function TCadClientes.Editar: Boolean;
var
  sqlEditar : string;
begin
  Result := True;

  sqlEditar :=
  '   UPDATE Clientes                         '+
  '     SET NOME_CLIENTE = :NOME_CLIENTE      '+
  '     ,IDADE = :IDADE                       '+
  '     ,SEXO = :SEXO                         '+
  '     ,UF = :UF                             '+
  '   WHERE COD_CLIENTE = :COD_CLIENTE        ';

  uDmConexao.DataModule1.ADOQuery1.Close;
  uDmConexao.DataModule1.ADOQuery1.SQL.Text := sqlEditar;

  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('COD_CLIENTE').Value := Self.COD_CLIENTE;
  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('NOME_CLIENTE').Value := self.NOME_CLIENTE;
  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('IDADE').Value := Self.IDADE;
  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('SEXO').Value := Self.SEXO;
  if Self.COD_UF > 0 then
    uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('UF').Value := Self.COD_UF;

  uDmConexao.DataModule1.ADOQuery1.ExecSQL;
end;

function TCadClientes.Excluir: Boolean;
var
  sql : string;
begin
  Result := True;

  sql :=
  '     DELETE FROM Clientes              '+
  '     WHERE COD_CLIENTE = :COD_CLIENTE  ';

  uDmConexao.DataModule1.ADOQuery1.Close;
  uDmConexao.DataModule1.ADOQuery1.SQL.Text := sql;

  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('COD_CLIENTE').Value := Self.COD_CLIENTE;

  uDmConexao.DataModule1.ADOQuery1.ExecSQL;
end;

function TCadClientes.PesquisarId: Boolean;
var
  sql : string;
begin
  Result := True;
  try
    sql:=
    'select                                     '+
    '  Cli.COD_CLIENTE,                         '+
    '  Cli.NOME_CLIENTE,                        '+
    '  Cli.IDADE,                               '+
    '  Cli.SEXO,                                '+
    '  uf.COD_UF,                               '+
    '  uf.SIGLA                                 '+
    'from Clientes Cli                          '+
    'inner join UF uf on uf.COD_UF  = Cli.UF    ';

    sql := sql + 'where  Cli.COD_CLIENTE = :COD_CLIENTE ';

    dmClientes.qPesqClientes.Close;
    dmClientes.qPesqClientes.SQL.Text := sql;
    dmClientes.qPesqClientes.Parameters.ParamByName('COD_CLIENTE').Value := Self.COD_CLIENTE;
    dmClientes.qPesqClientes.Open;

    Result :=  not dmClientes.qPesqClientes.IsEmpty;

    if Result then
    begin
      Self.NOME_CLIENTE := dmClientes.qPesqClientes.FieldByName('NOME_CLIENTE').AsString;
      Self.IDADE := dmClientes.qPesqClientes.FieldByName('IDADE').AsInteger;
      Self.SEXO := dmClientes.qPesqClientes.FieldByName('SEXO').AsString;
      Self.COD_UF := dmClientes.qPesqClientes.FieldByName('COD_UF').AsInteger;
    end;

  except on E: Exception do
    begin
      Result := False;
      raise Exception.Create(E.Message);
    end;
  end;
end;

function TCadClientes.Salvar: Boolean;
var
  sqlSalvar, sqlCampos, sqlValues : string;
begin
  Result := True;

  sqlCampos :=
  '     INSERT INTO Clientes            '+
  '             (                       '+
  '              NOME_CLIENTE           '+
  '             ,IDADE                  '+
  '             ,SEXO                   '+
  '             ,UF                     '+
  '             )                       ';

  sqlValues :=
  '     VALUES (                        '+
  '             :NOME_CLIENTE           '+
  '            ,:IDADE                  '+
  '            ,:SEXO                   '+
  '            ,:UF                     '+
  '             )                       ';

  sqlSalvar := sqlCampos + sqlValues;

  uDmConexao.DataModule1.ADOQuery1.Close;
  uDmConexao.DataModule1.ADOQuery1.SQL.Text := sqlSalvar;


  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('NOME_CLIENTE').Value := self.NOME_CLIENTE;
  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('IDADE').Value := Self.IDADE;
  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('SEXO').Value := Self.SEXO;
  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('UF').Value := Self.COD_UF;


  uDmConexao.DataModule1.ADOQuery1.ExecSQL;
end;

end.
