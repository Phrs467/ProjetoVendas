object FormPesqUsuario: TFormPesqUsuario
  Left = 0
  Top = 0
  Caption = 'Pesquisa Usu'#225'rio'
  ClientHeight = 397
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
    Height = 65
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 207
      Top = 10
      Width = 69
      Height = 13
      Caption = 'Digite o nome:'
    end
    object RgPesqUsuario: TRadioGroup
      Left = 8
      Top = 0
      Width = 193
      Height = 45
      Caption = 'Pesquisar Por:'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'ID'
        'Nome')
      TabOrder = 0
      OnClick = RgPesqUsuarioClick
    end
    object EdtPesqUsuario: TEdit
      Left = 207
      Top = 24
      Width = 178
      Height = 21
      TabOrder = 1
    end
    object BtnPesquisar: TButton
      Left = 391
      Top = 23
      Width = 75
      Height = 21
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = BtnPesquisarClick
    end
    object BtnSelecionar: TButton
      Left = 472
      Top = 23
      Width = 75
      Height = 21
      Caption = 'Selecionar'
      TabOrder = 3
      OnClick = BtnSelecionarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 747
    Height = 332
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 8
      Top = 6
      Width = 729
      Height = 315
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_USU'
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
          FieldName = 'LOGIN_USU'
          Title.Caption = 'Login'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 104
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_USU'
          Title.Caption = 'Nome'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 244
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SENHA_USU'
          Title.Caption = 'Senha'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = False
        end>
    end
  end
end
