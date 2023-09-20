object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 221
  Width = 307
  object Conexao: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=saoba123;Persist Security Info=True' +
      ';User ID=sa;Initial Catalog=FORCA_VENDAS;Data Source=DESENV5'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 40
  end
  object ADOQuery1: TADOQuery
    Connection = Conexao
    Parameters = <>
    Left = 32
    Top = 104
  end
end
