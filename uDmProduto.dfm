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
  end
end
