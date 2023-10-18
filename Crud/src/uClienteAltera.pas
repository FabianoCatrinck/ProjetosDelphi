unit uClienteAltera;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TfrmClienteAltera = class(TForm)
    grdDistribuidor: TDBGrid;
    pnlOperacao: TPanel;
    btnFechar: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnExcluir: TSpeedButton;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClienteAltera: TfrmClienteAltera;

implementation

{$R *.dfm}

uses uDM, uClienteCadastro;

procedure TfrmClienteAltera.btnAlterarClick(Sender: TObject);
var
  lfrmClienteCadastro: TfrmClienteCadastro;
begin
  lfrmClienteCadastro := TfrmClienteCadastro.Create(Application);

  try
    lfrmClienteCadastro.Codigo := DM.qryCliente.FieldByName('IdCliente').AsInteger;
    lfrmClienteCadastro.Nome := DM.qryCliente.FieldByName('Cliente').AsString;
    lfrmClienteCadastro.RazaoSocial := DM.qryCliente.FieldByName('RazaoSocial').AsString;

    if Length(DM.qryCliente.FieldByName('cnpj').AsString) > 0 then
      lfrmClienteCadastro.CPFCNPJ := DM.qryCliente.FieldByName('cnpj').AsString
    else
      lfrmClienteCadastro.CPFCNPJ := DM.qryCliente.FieldByName('cpf').AsString;

    lfrmClienteCadastro.DataNascimento := DM.qryCliente.FieldByName('DtNascimento').AsDateTime;
    lfrmClienteCadastro.ShowModal;
    DM.qryCliente.DisableControls;
  finally
    FreeAndNil(lfrmClienteCadastro);
    DM.qryCliente.Close;
    DM.qryCliente.Open;
    DM.qryCliente.EnableControls;
  end;
end;

procedure TfrmClienteAltera.btnExcluirClick(Sender: TObject);
begin
  if not DM.qryCliente.IsEmpty then
    if MessageDlg('Confirma a exclus�o?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DM.ApagarRegistro('IdCliente ', 'TBCLIENTES', DM.qryCliente.FieldByName('IdCliente').AsInteger);
      DM.qryCliente.Close;
      DM.qryCliente.Open;
    end;
end;

procedure TfrmClienteAltera.btnFecharClick(Sender: TObject);
begin
  DM.qryCliente.Close;
  Close;
end;

procedure TfrmClienteAltera.FormShow(Sender: TObject);
begin
  DM.qryCliente.Open;
end;

end.
