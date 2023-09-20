unit UTabEstados;

interface

type
  TTabEstados = class
  private
    { private declarations }
    FCOD_UF : Integer;
    FSIGLA : string;
    FDESCRICAO : string;
    FVL_ALIQ_UF : Double;
  public
    { public declarations }
    Property COD_UF : Integer READ FCOD_UF write FCOD_UF;
    Property SIGLA : String READ FSIGLA WRITE FSIGLA;
    Property DESCRICAO : String READ FDESCRICAO WRITE FDESCRICAO;
    Property VL_ALIQ_UF : Double READ FVL_ALIQ_UF WRITE FVL_ALIQ_UF;

    Function Salvar : Boolean;
    Function Editar : Boolean;
    Function Excluir : Boolean;
    Function Cancelar : Boolean;
    Function PesquisarId : Boolean;
  end;

implementation

uses
  uDmConexao,uDmEstados, SysUtils;

{ TTabEstados }

function TTabEstados.Cancelar: Boolean;
begin
  uDmConexao.DataModule1.ADOQuery1.Cancel;
end;

function TTabEstados.Editar: Boolean;
var
  sqlUpdate, sqlWhere, sqlEditar : string;
begin
  Result := True;

  try
    sqlUpdate :=
    '   UPDATE UF                   '+
    '     SET SIGLA = :SIGLA        '+
    '     ,DESCRICAO = :DESCRICAO   '+
    '     ,VL_ALIQ_UF = :VL_ALIQ_UF ';

    sqlWhere :=
    '   WHERE COD_UF = :COD_UF      ';

    sqlEditar := sqlUpdate + sqlWhere;

    uDmConexao.DataModule1.ADOQuery1.Close;
    uDmConexao.DataModule1.ADOQuery1.SQL.Text := sqlEditar;

    uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('COD_UF').Value := Self.COD_UF;
    uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('SIGLA').Value := Self.SIGLA;
    uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('DESCRICAO').Value := Self.DESCRICAO;
    uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('VL_ALIQ_UF').Value := Self.VL_ALIQ_UF;

    uDmConexao.DataModule1.ADOQuery1.ExecSQL;
    except on E: Exception do
    begin
     Result := False;
     raise Exception.Create(E.Message);
    end;
  end;
end;

function TTabEstados.Excluir: Boolean;
var
  sql : string;
begin
  Result := True;

  sql:=
  '     DELETE FROM UF          '+
  '     WHERE COD_UF = :COD_UF  ';

  uDmConexao.DataModule1.ADOQuery1.Close;
  uDmConexao.DataModule1.ADOQuery1.SQL.Text := sql;

  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('COD_UF').Value := Self.COD_UF;

  uDmConexao.DataModule1.ADOQuery1.ExecSQL;
end;

function TTabEstados.PesquisarId: Boolean;
var
  sql : string;
begin
  Result := True;
  try
    sql :=
    '  Select             '+
    '     *               '+
    '  from UF            ';

    sql := sql + 'where COD_UF = :COD_UF  ';

    DmEstados.qPesqEstados.Close;
    DmEstados.qPesqEstados.SQL.Text := sql;
    DmEstados.qPesqEstados.Parameters.ParamByName('COD_UF').Value := Self.COD_UF;
    DmEstados.qPesqEstados.Open;

    Result := not DmEstados.qPesqEstados.IsEmpty;

    if Result then
    begin
      Self.SIGLA := DmEstados.qPesqEstados.FieldByName('SIGLA').AsString;
      Self.DESCRICAO := DmEstados.qPesqEstados.FieldByName('DESCRICAO').AsString;
      Self.VL_ALIQ_UF := DmEstados.qPesqEstados.FieldByName('VL_ALIQ_UF').AsFloat;
    end;

  except on E: Exception do
    begin
      Result := False;
      raise Exception.Create(E.Message);
    end;
  end;
end;

function TTabEstados.Salvar: Boolean;
var
  sqlSalvar, sqlCampos, sqlValues : string;
begin
  Result := True;

  sqlCampos :=
  '     INSERT INTO UF          '+
  '             (               '+
  '              SIGLA          '+
  '             ,DESCRICAO      '+
  '             ,VL_ALIQ_UF     '+
  '             )               ';

  sqlValues :=
  '     VALUES (                '+
  '      :SIGLA                 '+
  '     ,:DESCRICAO             '+
  '     ,:VL_ALIQ_UF            '+
  '             )               ';

  sqlSalvar := sqlCampos + sqlValues;

  uDmConexao.DataModule1.ADOQuery1.Close;
  uDmConexao.DataModule1.ADOQuery1.SQL.Text := sqlSalvar;

  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('SIGLA').Value := Self.SIGLA;
  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('DESCRICAO').Value := Self.DESCRICAO;
  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('VL_ALIQ_UF').Value := Self.VL_ALIQ_UF;

  uDmConexao.DataModule1.ADOQuery1.ExecSQL;
end;

end.
