object dmUsuario: TdmUsuario
  OldCreateOrder = False
  Height = 416
  Width = 481
  object DsPesqUsuario: TDataSource
    DataSet = qPesqUsuario
    Left = 312
    Top = 40
  end
  object qPesqUsuario: TADOQuery
    Connection = DataModule1.Conexao
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from Usuario')
    Left = 312
    Top = 88
    object qPesqUsuarioCD_USU: TIntegerField
      FieldName = 'CD_USU'
    end
    object qPesqUsuarioNOME_USU: TStringField
      FieldName = 'NOME_USU'
    end
    object qPesqUsuarioLOGIN_USU: TStringField
      FieldName = 'LOGIN_USU'
    end
    object qPesqUsuarioSENHA_USU: TStringField
      FieldName = 'SENHA_USU'
    end
  end
end
