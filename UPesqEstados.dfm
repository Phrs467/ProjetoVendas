object FormPesqEstados: TFormPesqEstados
  Left = 0
  Top = 0
  Caption = 'Pesquisa de Estados'
  ClientHeight = 427
  ClientWidth = 747
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
    Width = 747
    Height = 73
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 205
      Top = 22
      Width = 118
      Height = 13
      Caption = 'Pesquisar por Descri'#231#227'o:'
    end
    object RgPesqEstados: TRadioGroup
      Left = 6
      Top = 8
      Width = 193
      Height = 49
      Caption = 'Pesquisar por:'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'ID'
        'Descri'#231#227'o')
      TabOrder = 0
      OnClick = RgPesqEstadosClick
    end
    object EdtPesqEstados: TEdit
      Left = 205
      Top = 36
      Width = 205
      Height = 21
      TabOrder = 1
    end
    object btnPesqEstados: TButton
      Left = 416
      Top = 36
      Width = 75
      Height = 21
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btnPesqEstadosClick
    end
    object BtnSelecionarEstados: TButton
      Left = 497
      Top = 36
      Width = 75
      Height = 21
      Caption = 'Selecionar'
      TabOrder = 3
      OnClick = BtnSelecionarEstadosClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 73
    Width = 747
    Height = 354
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 6
      Top = 6
      Width = 731
      Height = 339
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_UF'
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
          FieldName = 'SIGLA'
          Title.Caption = 'Sigla'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 124
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_ALIQ_UF'
          Title.Caption = 'Valor Al'#237'quota'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 104
          Visible = True
        end>
    end
  end
end
