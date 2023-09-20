object DmEstados: TDmEstados
  OldCreateOrder = False
  Height = 292
  Width = 456
  object qEstados: TADOQuery
    Connection = DataModule1.Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from UF')
    Left = 112
    Top = 104
  end
  object dsEstados: TDataSource
    DataSet = qEstados
    Left = 112
    Top = 40
  end
  object DsPesqEstados: TDataSource
    DataSet = qPesqEstados
    Left = 216
    Top = 40
  end
  object qPesqEstados: TADOQuery
    Connection = DataModule1.Conexao
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from UF')
    Left = 216
    Top = 104
    object qPesqEstadosCOD_UF: TIntegerField
      FieldName = 'COD_UF'
    end
    object qPesqEstadosSIGLA: TStringField
      FieldName = 'SIGLA'
      Size = 2
    end
    object qPesqEstadosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qPesqEstadosVL_ALIQ_UF: TFloatField
      FieldName = 'VL_ALIQ_UF'
    end
  end
end
