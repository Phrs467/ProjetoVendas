object FormPesqProduto: TFormPesqProduto
  Left = 0
  Top = 0
  Caption = 'Pesquisa de Produto'
  ClientHeight = 469
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 67
    Align = alTop
    TabOrder = 0
    object LblPesqProduto: TLabel
      Left = 199
      Top = 18
      Width = 118
      Height = 13
      Caption = 'Pesquisar por Descri'#231#227'o:'
    end
    object RgPesqProduto: TRadioGroup
      Left = 8
      Top = 4
      Width = 185
      Height = 49
      Caption = 'Pesquisar por:'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'ID'
        'Descri'#231#227'o')
      TabOrder = 0
      OnClick = RgPesqProdutoClick
    end
    object EdtPesqProduto: TEdit
      Left = 199
      Top = 32
      Width = 186
      Height = 21
      TabOrder = 1
    end
    object BtnPesqProduto: TButton
      Left = 391
      Top = 32
      Width = 75
      Height = 21
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = BtnPesqProdutoClick
    end
    object BtnSelecProduto: TButton
      Left = 480
      Top = 32
      Width = 75
      Height = 21
      Caption = 'Selecionar'
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 67
    Width = 800
    Height = 402
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 8
      Top = 6
      Width = 781
      Height = 387
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_PRODUTO'
          Title.Caption = 'ID'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO_COMERCIAL'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 201
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO_COMPRA'
          Title.Caption = 'Descri'#231#227'o Compra'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 142
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADE_PRODUTO'
          Title.Caption = 'Unidade'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_VENDA'
          Title.Caption = 'Valor '
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTIDADE_ESTOQUE'
          Title.Caption = 'Quantidade'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 90
          Visible = True
        end>
    end
  end
end
