unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DBXInterbase, Data.DB, Data.SqlExpr,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Dialogs, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat;

type
  TDM = class(TDataModule)
    FDConnection: TFDConnection;
    FDTransaction1: TFDTransaction;
    qryContato: TFDQuery;
    qryCliente: TFDQuery;
    dtsContato: TDataSource;
    dtsCliente: TDataSource;
    qryClienteIdCliente: TLargeintField;
    qryClienteCliente: TStringField;
    qryClienteRazaoSocial: TStringField;
    qryClienteCNPJ: TStringField;
    qryClienteCPF: TStringField;
    qryClienteDtNascimento: TDateTimeField;
    qryContatoIdContato: TLargeintField;
    qryContatoIdCliente: TIntegerField;
    qryContatoNome: TStringField;
  private
    { Private declarations }
    function GetCodigoTabela(pCampo, pNomeTabela: String): Integer;
    procedure ApagarRegistroDaTabela(pCampo, pNomeTabela: String; pCodigoTabela: Integer);
  public
    { Public declarations }
    function ObterCodigoTabela(pCampo, pNomeTabela: String): Integer;
    procedure ApagarRegistro(pCampo, pNomeTabela: String; pCodigoTabela: Integer);
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM }

procedure TDM.ApagarRegistro(pCampo, pNomeTabela: String;
  pCodigoTabela: Integer);
begin
  ApagarRegistroDaTabela(pCampo, pNomeTabela, pCodigoTabela);
end;

procedure TDM.ApagarRegistroDaTabela(pCampo, pNomeTabela: String;
  pCodigoTabela: Integer);
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Self);

  try
    lQry.Connection := FDConnection;
    lQry.SQL.Add('DELETE ');
    lQry.SQL.Add('FROM ' + pNomeTabela);
    lQry.SQL.Add('WHERE ' + pCampo + ' = :pCodigoTabela');
    lQry.ParamByName('pCodigoTabela').AsInteger := pCodigoTabela;

    try
      lQry.ExecSQL;
      MessageDlg('Registro apagado com sucesso!', mtInformation, [mbOk], 0);
    except
      On E:Exception do
      begin
        lQry.Transaction.Rollback;
        MessageDlg('Ocoreu o erro ' + E.Message + ' ao tentar excluir o registro da tabela ' + pNomeTabela, mtInformation, [mbOk], 0);
        Abort;
      end;
    end;
  finally
    lQry.Close;
    FreeAndNil(lQry);
  end;
end;

function TDM.GetCodigoTabela(pCampo, pNomeTabela: String): Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Self);

  try
    lQry.Connection := FDConnection;
    lQry.SQL.Add('SELECT COALESCE(MAX(' + pCampo + '), 0) AS Codigo');
    lQry.SQL.Add('FROM ' + pNomeTabela);

    try
      lQry.Open;

      Result := lQry.FieldByName('Codigo').AsInteger + 1;
    except
      On E:Exception do
      begin
        MessageDlg('Ocoreu o erro ' + E.Message + ' ao obter o código da tabela ' + pNomeTabela, mtInformation, [mbOk], 0);
      end;
    end;
  finally
    lQry.Close;
    FreeAndNil(lQry);
  end;
end;

function TDM.ObterCodigoTabela(pCampo, pNomeTabela: String): Integer;
begin
  Result := GetCodigoTabela(pCampo, pNomeTabela);
end;

end.
