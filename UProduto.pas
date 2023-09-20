unit UProduto;

interface

type
  TProduto = class
  private
    FCOD_PRODUTO : Integer;
    FDESCCOMERCIAL : string;
    FDESCCOMPRA : string;
    FUNIDADE : string;
    FVALOR : Double;
    FQUANTIDADE : Double;
  public
    property COD_PRODUTO : Integer READ FCOD_PRODUTO WRITE FCOD_PRODUTO;
    property DESCCOMERCIAL : string READ FDESCCOMERCIAL WRITE FDESCCOMERCIAL;
    property DESCCOMPRA : string READ FDESCCOMPRA WRITE FDESCCOMPRA;
    property UNIDADE : string READ FUNIDADE WRITE FUNIDADE;
    property VALOR : Double READ FVALOR WRITE FVALOR;
    property QUANTIDADE : Double READ FQUANTIDADE WRITE FQUANTIDADE;

    Function Salvar : Boolean;
    Function Editar : Boolean;
    Function Excluir : Boolean;
    Function Cancelar : Boolean;
  end;

implementation

uses
  uDmConexao, SysUtils;

{ TProduto }

function TProduto.Cancelar: Boolean;
begin
  uDmConexao.DataModule1.ADOQuery1.Cancel;
end;

function TProduto.Editar: Boolean;
var
  sqlEditar : string;
begin
  Result:= True;

  sqlEditar :=
  '    UPDATE Produto                                   '+
  '     SET                                             '+
  '      DESCRICAO_COMERCIAL = :DESCRICAO_COMERCIAL     '+
  '     ,DESCRICAO_COMPRA = :DESCRICAO_COMPRA           '+
  '     ,UNIDADE_PRODUTO = :UNIDADE_PRODUTO             '+
  '     ,VALOR_VENDA = :VALOR_VENDA                     '+
  '     ,QUANTIDADE_ESTOQUE = :QUANTIDADE_ESTOQUE       '+
  '    WHERE COD_PRODUTO = :COD_PRODUTO                 ';

  uDmConexao.DataModule1.ADOQuery1.Close;
  uDmConexao.DataModule1.ADOQuery1.SQL.Text := sqlEditar;

  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('COD_PRODUTO').Value := Self.COD_PRODUTO;
  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('DESCRICAO_COMERCIAL').Value := Self.DESCCOMERCIAL;
  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('DESCRICAO_COMPRA').Value := Self.DESCCOMPRA;
  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('UNIDADE_PRODUTO').Value := Self.UNIDADE;
  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('VALOR_VENDA').Value := Self.VALOR;
  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('QUANTIDADE_ESTOQUE').Value := Self.QUANTIDADE;

  uDmConexao.DataModule1.ADOQuery1.ExecSQL;
end;

function TProduto.Excluir: Boolean;
var
  sql : string;
begin
  Result:= True;

  sql :=
  '     DELETE FROM Produto             '+
  '     where COD_PRODUTO = :COD_PRODUTO';

  uDmConexao.DataModule1.ADOQuery1.Close;
  uDmConexao.DataModule1.ADOQuery1.SQL.Text := sql;

  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('COD_PRODUTO').Value := Self.COD_PRODUTO;

  uDmConexao.DataModule1.ADOQuery1.ExecSQL;
end;

function TProduto.Salvar: Boolean;
var
  sqlSalvar, sqlCampos, sqlValues : string;
begin
  Result:= True;

  sqlCampos :=
  '     INSERT INTO Produto     '+
  '     (                       '+
  '      DESCRICAO_COMERCIAL    '+
  '     ,DESCRICAO_COMPRA       '+
  '     ,UNIDADE_PRODUTO        '+
  '     ,VALOR_VENDA            '+
  '     ,QUANTIDADE_ESTOQUE     '+
  '     )                       ';

  sqlValues :=
  '     VALUES                  '+
  '     (                       '+
  '      :DESCRICAO_COMERCIAL   '+
  '     ,:DESCRICAO_COMPRA      '+
  '     ,:UNIDADE_PRODUTO       '+
  '     ,:VALOR_VENDA           '+
  '     ,:QUANTIDADE_ESTOQUE    '+
  '     )                       ';

  sqlSalvar := sqlCampos + sqlValues;

  uDmConexao.DataModule1.ADOQuery1.Close;
  uDmConexao.DataModule1.ADOQuery1.SQL.Text := sqlSalvar;

  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('DESCRICAO_COMERCIAL').Value := Self.DESCCOMERCIAL;
  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('DESCRICAO_COMPRA').Value := Self.DESCCOMPRA;
  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('UNIDADE_PRODUTO').Value := Self.UNIDADE;
  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('VALOR_VENDA').Value := Self.VALOR;
  uDmConexao.DataModule1.ADOQuery1.Parameters.ParamByName('QUANTIDADE_ESTOQUE').Value := Self.QUANTIDADE;

  uDmConexao.DataModule1.ADOQuery1.ExecSQL;
end;

end.
