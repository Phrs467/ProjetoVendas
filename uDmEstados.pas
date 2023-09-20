unit uDmEstados;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TDmEstados = class(TDataModule)
    qEstados: TADOQuery;
    dsEstados: TDataSource;
    DsPesqEstados: TDataSource;
    qPesqEstados: TADOQuery;
    qPesqEstadosCOD_UF: TIntegerField;
    qPesqEstadosSIGLA: TStringField;
    qPesqEstadosDESCRICAO: TStringField;
    qPesqEstadosVL_ALIQ_UF: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmEstados: TDmEstados;

implementation

uses
  uDmConexao;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
