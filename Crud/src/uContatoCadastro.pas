unit uContatoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, FireDAC.Comp.Client,
  Vcl.NumberBox, Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmContatoCadastro = class(TForm)
    pnlOperacao: TPanel;
    btnCancelar: TSpeedButton;
    btnGravar: TSpeedButton;
    pnlDados: TPanel;
    lblNome: TLabel;
    edtNome: TEdit;
    cboCliente: TDBLookupComboBox;
    lblCliente: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FCodigo: Integer;
    FNome: String;
    FNovoContato: Boolean;
    FCliente: String;

    function ValidarCampos(): Boolean;
    procedure CadastrarContato(pCodigo: Integer; pNome, pCliente: String);
    procedure AlterarContato(pCodigo: Integer; pNome, pCliente: String);
  public
    { Public declarations }
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: String write FNome;
    property Cliente: String write FCliente;

  end;


implementation

{$R *.dfm}

uses uDM;

procedure TfrmContatoCadastro.AlterarContato(pCodigo: Integer; pNome, pCliente: String);
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Self);

  try
    lQry.Connection := DM.FDConnection;
    lQry.SQL.Add('UPDATE TBCONTATOS');
    lQry.SQL.Add('SET  nome = :pNome,');
    lQry.SQL.Add('     IdCliente = :pCliente');
    lQry.SQL.Add('WHERE IdContato = :pCodigo');

    lQry.ParamByName('pCodigo').AsInteger := pCodigo;
    lQry.ParamByName('pNome').AsString := pNome;
    lQry.ParamByName('pCliente').AsString := pCliente;

    try
      lQry.ExecSQL;
      MessageDlg('Contato ' + pNome + ' alterado com sucesso!', mtInformation, [mbOk], 0);
    except
      On E:Exception do
      begin
        lQry.Transaction.Rollback;
        MessageDlg('Ocoreu o erro ' + E.Message + ' ao alterar o Contato ' + pNome, mtInformation, [mbOk], 0);
        Abort;
      end;
    end;
  finally
    FreeAndNil(lQry);
  end;
end;

procedure TfrmContatoCadastro.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmContatoCadastro.btnOkClick(Sender: TObject);
begin
  if not ValidarCampos() then
    Abort
  else
    if FNovoContato then
      CadastrarContato(FCodigo, edtNome.Text, cboCliente.KeyValue)
    else
      AlterarContato(FCodigo, edtNome.Text, cboCliente.KeyValue);

  Close;
end;

procedure TfrmContatoCadastro.CadastrarContato(pCodigo: Integer; pNome,
  pCliente: String);
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Self);

  try
    lQry.Connection := DM.FDConnection;
    lQry.SQL.Add('INSERT INTO TBCONTATOS (IdContato, IdCliente, Nome)');
    lQry.SQL.Add('VALUES (:pCodigo, :pCliente, :pNome)');

    lQry.ParamByName('pCODIGO').AsInteger := pCodigo;
    lQry.ParamByName('pCliente').AsString := pCliente;
    lQry.ParamByName('pNome').AsString := pNome;

    try
      lQry.ExecSQL;
      MessageDlg('Contato ' + pNome + ' gravado com sucesso!', mtInformation, [mbOk], 0);
    except
      On E:Exception do
      begin
        lQry.Transaction.Rollback;
        MessageDlg('Ocoreu o erro ' + E.Message + ' ao inserir o contato ' + pNome, mtInformation, [mbOk], 0);
        Abort;
      end;
    end;
  finally
    FreeAndNil(lQry);
  end;
end;

procedure TfrmContatoCadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.qryCliente.Close;
end;

procedure TfrmContatoCadastro.FormShow(Sender: TObject);
begin
  if edtNome.CanFocus then
    edtNome.SetFocus;

  if FCodigo = 0 then
    begin
      FCodigo := DM.ObterCodigoTabela('IdContato', 'TBCONTATOS');
      DM.qryCliente.Open;
      FNovoContato := True;
    end
  else
    begin
      FNovoContato := False;
      edtNome.Text := FNome;
      DM.qryCliente.Open;
      DM.qryCliente.Locate('IdCliente', FCliente, []);
      cboCliente.KeyValue := FCliente;
    end;
end;

function TfrmContatoCadastro.ValidarCampos: Boolean;
begin
  Result := False;

  if edtNome.Text = '' then
    begin
      MessageDlg('O campo nome n�o pode ficar em branco. Verifique.', mtInformation, [mbOk], 0);
      edtNome.SetFocus;
    end
  else
    if Length(edtNome.Text) < 3 then
      begin
        MessageDlg('O campo nome n�o � v�lido. Verifique.', mtInformation, [mbOk], 0);
        edtNome.SetFocus;
      end
    else
      if Length(cboCliente.Text) < 3 then
      begin
        MessageDlg('O cliente n�o foi informado. Verifique.', mtInformation, [mbOk], 0);
        cboCliente.SetFocus;
      end
    else
      Result := True;
end;

end.
