object frmCadProduto: TfrmCadProduto
  Left = 0
  Top = 0
  Caption = 'frmCadProduto'
  ClientHeight = 390
  ClientWidth = 647
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 151
    Top = 32
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
  object edt_desc_comercial: TLabeledEdit
    Left = 24
    Top = 80
    Width = 121
    Height = 21
    EditLabel.Width = 95
    EditLabel.Height = 13
    EditLabel.Caption = 'Descri'#231#227'o Comercial'
    TabOrder = 0
  end
  object edt_desc_compra: TLabeledEdit
    Left = 24
    Top = 128
    Width = 121
    Height = 21
    EditLabel.Width = 91
    EditLabel.Height = 13
    EditLabel.Caption = 'Descri'#231#227'o Compras'
    TabOrder = 1
  end
  object edt_Unidade: TLabeledEdit
    Left = 24
    Top = 176
    Width = 121
    Height = 21
    EditLabel.Width = 39
    EditLabel.Height = 13
    EditLabel.Caption = 'Unidade'
    TabOrder = 2
  end
  object edt_Valor: TLabeledEdit
    Left = 24
    Top = 224
    Width = 121
    Height = 21
    EditLabel.Width = 72
    EditLabel.Height = 13
    EditLabel.Caption = 'Valor de Venda'
    TabOrder = 3
  end
  object edt_Estoque: TLabeledEdit
    Left = 24
    Top = 272
    Width = 121
    Height = 21
    EditLabel.Width = 98
    EditLabel.Height = 13
    EditLabel.Caption = 'Quantidade Estoque'
    TabOrder = 4
  end
  object Panel1: TPanel
    Left = 0
    Top = 349
    Width = 647
    Height = 41
    Align = alBottom
    TabOrder = 5
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
      Left = 380
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Pesquisar'
      TabOrder = 4
    end
    object btn_salvar: TButton
      Left = 115
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
  object edt_CodProduto: TLabeledEdit
    Left = 24
    Top = 32
    Width = 121
    Height = 21
    EditLabel.Width = 11
    EditLabel.Height = 13
    EditLabel.Caption = 'ID'
    TabOrder = 6
  end
end
