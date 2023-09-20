unit uDmClientes;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmClientes = class(TDataModule)
    DsPesqClientes: TDataSource;
    qPesqClientes: TADOQuery;
    qPesqClientesCOD_CLIENTE: TIntegerField;
    qPesqClientesNOME_CLIENTE: TStringField;
    qPesqClientesIDADE: TIntegerField;
    qPesqClientesSEXO: TStringField;
    qPesqClientesCOD_UF: TIntegerField;
    qPesqClientesSIGLA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmClientes: TdmClientes;

implementation

uses
  uDmConexao;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
