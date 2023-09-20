object dmProduto: TdmProduto
  OldCreateOrder = False
  Height = 214
  Width = 298
  object DsPesqProduto: TDataSource
    DataSet = qPesqProduto
    Left = 104
    Top = 48
  end
  object qPesqProduto: TADOQuery
    Connection = DataModule1.Conexao
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from Produto')
    Left = 104
    Top = 96
    object qPesqProdutoCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object qPesqProdutoDESCRICAO_COMERCIAL: TStringField
      FieldName = 'DESCRICAO_COMERCIAL'
      Size = 50
    end
    object qPesqProdutoDESCRICAO_COMPRA: TStringField
      FieldName = 'DESCRICAO_COMPRA'
      Size = 50
    end
    object qPesqProdutoUNIDADE_PRODUTO: TStringField
      FieldName = 'UNIDADE_PRODUTO'
      Size = 5
    end
    object qPesqProdutoVALOR_VENDA: TFloatField
      FieldName = 'VALOR_VENDA'
    end
    object qPesqProdutoQUANTIDADE_ESTOQUE: TFloatField
      FieldName = 'QUANTIDADE_ESTOQUE'
    end
  end
end
