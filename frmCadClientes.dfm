object FrmClientes: TFrmClientes
  Left = 0
  Top = 0
  Caption = 'Cadastro de Clientes'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object LblSexo: TLabel
    Left = 32
    Top = 122
    Width = 24
    Height = 13
    Caption = 'Sexo'
  end
  object LblUF: TLabel
    Left = 32
    Top = 173
    Width = 13
    Height = 13
    Caption = 'UF'
  end
  object SpeedButton1: TSpeedButton
    Left = 311
    Top = 31
    Width = 23
    Height = 22
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000002000000920000009C000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000020000009D000000FF00000092000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000100000097000000FF0000009E00000002000000000000
      0000000000000000001D0000007C000000B7000000CC000000AB000000690000
      000E000000020000009E000000FF0000009E0000000200000000000000000000
      000000000072000000F7000000FF000000E9000000D4000000F6000000FF0000
      00E7000000B4000000FF0000009E000000020000000000000000000000000000
      007C000000FF000000C80000003A000000000000000000000002000000550000
      00E1000000FF000000B400000002000000000000000000000000000000320000
      00FC000000BF0000000700000000000000000000000000000000000000000000
      001D000000E2000000E70000000E000000000000000000000000000000A30000
      00FB000000210000000000000000000000000000000000000000000000000000
      000000000055000000FF00000069000000000000000000000000000000E70000
      00C0000000000000000000000000000000000000000000000000000000000000
      000000000006000000F4000000AB000000000000000000000000000000FE0000
      00A1000000000000000000000000000000000000000000000000000000000000
      000000000000000000D7000000C4000000000000000000000000000000F00000
      00BB000000000000000000000000000000000000000000000000000000000000
      000000000001000000E8000000B5000000000000000000000000000000B80000
      00F2000000130000000000000000000000000000000000000000000000000000
      00000000003A000000FF0000007C000000000000000000000000000000500000
      00FF0000009C0000000000000000000000000000000000000000000000000000
      0008000000D0000000F70000001D000000000000000000000000000000000000
      00AC000000FF0000009D00000012000000000000000000000000000000200000
      00C5000000FF0000007200000000000000000000000000000000000000000000
      000A000000AC000000FF000000F4000000B5000000A0000000C0000000FC0000
      00FC0000007C0000000000000000000000000000000000000000000000000000
      00000000000000000050000000B8000000F0000000FF000000E6000000A40000
      0032000000000000000000000000000000000000000000000000}
    OnClick = SpeedButton1Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 258
    Width = 635
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btn_excluir: TButton
      Left = 203
      Top = 8
      Width = 75
      Height = 25
      Caption = 'E&xcluir'
      TabOrder = 1
      OnClick = btn_excluirClick
    end
    object btn_incluir: TButton
      Left = 24
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Novo'
      TabOrder = 0
      OnClick = btn_incluirClick
    end
    object btn_pesquisar: TButton
      Left = 373
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Pesquisar'
      TabOrder = 4
    end
    object btn_salvar: TButton
      Left = 113
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Salvar'
      TabOrder = 2
      OnClick = btn_salvarClick
    end
    object btn_cancelar: TButton
      Left = 292
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 3
      OnClick = btn_cancelarClick
    end
  end
  object edt_CodCliente: TLabeledEdit
    Left = 32
    Top = 32
    Width = 41
    Height = 21
    EditLabel.Width = 11
    EditLabel.Height = 13
    EditLabel.Caption = 'ID'
    TabOrder = 1
  end
  object edt_NomeCliente: TLabeledEdit
    Left = 79
    Top = 32
    Width = 226
    Height = 21
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome'
    TabOrder = 2
  end
  object edt_Idade: TLabeledEdit
    Left = 32
    Top = 88
    Width = 121
    Height = 21
    EditLabel.Width = 28
    EditLabel.Height = 13
    EditLabel.Caption = 'Idade'
    TabOrder = 3
  end
  object ComboBoxSexo: TComboBox
    Left = 32
    Top = 138
    Width = 41
    Height = 21
    TabOrder = 4
    Items.Strings = (
      'M'
      'F')
  end
  object Edt_CodUf: TEdit
    Left = 32
    Top = 192
    Width = 32
    Height = 21
    TabOrder = 5
  end
  object DBLookupComboBoxUF: TDBLookupComboBox
    Left = 79
    Top = 192
    Width = 145
    Height = 21
    DataField = 'COD_UF'
    KeyField = 'COD_UF'
    ListField = 'SIGLA'
    ListSource = DmEstados.dsEstados
    TabOrder = 6
  end
end
