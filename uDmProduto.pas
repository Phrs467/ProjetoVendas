unit uDmProduto;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmProduto = class(TDataModule)
    DsPesqProduto: TDataSource;
    qPesqProduto: TADOQuery;
    qPesqProdutoCOD_PRODUTO: TIntegerField;
    qPesqProdutoDESCRICAO_COMERCIAL: TStringField;
    qPesqProdutoDESCRICAO_COMPRA: TStringField;
    qPesqProdutoUNIDADE_PRODUTO: TStringField;
    qPesqProdutoVALOR_VENDA: TFloatField;
    qPesqProdutoQUANTIDADE_ESTOQUE: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmProduto: TdmProduto;

implementation

uses
  uDmConexao;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
