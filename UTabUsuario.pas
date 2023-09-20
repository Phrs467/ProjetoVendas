unit UTabUsuario;

interface

type
  TTabUsuario = class
  private
    { private declarations }
    FCD_USU : Integer;
    FNOME_USU : String;
    FLOGIN_USU : string;
    FSENHA_USU : string;
  public
    { public declarations }
    Property CD_USU : Integer READ FCD_USU write FCD_USU;
    Property NOME_USU : String READ FNOME_USU WRITE FNOME_USU;
    Property LOGIN_USU : String READ FLOGIN_USU WRITE FLOGIN_USU;
    Property SENHA_USU : String READ FSENHA_USU WRITE FSENHA_USU;

    Function Salvar : Boolean;
    Function Editar : Boolean;
    Function Excluir : Boolean;
    Function PesquisaId : Boolean;
  end;

implementation

uses
  uDmConexao,uDmUsuario, SysUtils;

{ TTabUsuario }

function TTabUsuario.Editar: Boolean;
var
  sqlEditar : string;
begin
    Result := True;

    sqlEditar :=
    '   UPDATE Usuario                  '+
    '     SET NOME_USU = :NOME_USU      '+
    '     ,LOGIN_USU = :LOGIN_USU       '+
    '     ,SENHA_USU = :SENHA_USU       '+
    '   WHERE CD_USU = :CD_USU          ';

    uDmConexao.DataModule1.ADOQuery1.Close;
    uDmConexao.DataModule1.ADOQuery1.SQL.Text := sqlEditar;

    uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('CD_USU').Value := Self.CD_USU;
    uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('NOME_USU').Value := Self.NOME_USU;
    uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('LOGIN_USU').Value := Self.LOGIN_USU;
    uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('SENHA_USU').Value := Self.SENHA_USU;

    uDmConexao.DataModule1.ADOQuery1.ExecSQL;
end;

function TTabUsuario.Excluir: Boolean;
var
  sql : string;
begin
  Result := True;

  sql :=
  '     DELETE FROM Usuario     '+
  '     WHERE CD_USU = :CD_USU  ';

  uDmConexao.DataModule1.ADOQuery1.Close;
  uDmConexao.DataModule1.ADOQuery1.SQL.Text := sql;

  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('CD_USU').Value := Self.CD_USU;

  uDmConexao.DataModule1.ADOQuery1.ExecSQL;
end;

function TTabUsuario.PesquisaId: Boolean;
var
  sql : string;
begin
  Result := True;

  sql :=
    'select             '+
    '  *                '+
    'from Usuario       ';

  sql := sql + ' WHERE CD_USU = :CD_USU';

  dmUsuario.qPesqUsuario.Close;
  dmUsuario.qPesqUsuario.SQL.Text := sql;
  dmUsuario.qPesqUsuario.Parameters.ParamByName('CD_USU').Value := Self.CD_USU;
  dmUsuario.qPesqUsuario.Open;

  Result := not dmUsuario.qPesqUsuario.IsEmpty;

  if Result then
  begin
    Self.NOME_USU := dmUsuario.qPesqUsuario.FieldByName('NOME_USU').AsString;
    Self.LOGIN_USU := dmUsuario.qPesqUsuario.FieldByName('LOGIN_USU').AsString;
    Self.SENHA_USU := dmUsuario.qPesqUsuario.FieldByName('SENHA_USU').AsString;
  end;

end;

function TTabUsuario.Salvar: Boolean;
var
  sqlSalvar, sqlCampos, sqlValues : string;
begin
  Result := True;

  sqlCampos :=
  '     INSERT INTO Usuario             '+
  '             (                       '+
  '              NOME_USU               '+
  '             ,LOGIN_USU              '+
  '             ,SENHA_USU              '+
  '             )                       ';

  sqlValues :=
  '     VALUES (                        '+
  '      :NOME_USU                      '+
  '     ,:LOGIN_USU                     '+
  '     ,:SENHA_USU                     '+
  '             )                       ';

  sqlSalvar := sqlCampos + sqlValues;

  uDmConexao.DataModule1.ADOQuery1.Close;
  uDmConexao.DataModule1.ADOQuery1.SQL.Text := sqlSalvar;

  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('NOME_USU').Value := Self.NOME_USU;
  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('LOGIN_USU').Value := Self.LOGIN_USU;
  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('SENHA_USU').Value := Self.SENHA_USU;

  uDmConexao.DataModule1.ADOQuery1.ExecSQL;
end;

end.
