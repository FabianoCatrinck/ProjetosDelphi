unit uContatoAltera;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TfrmContatoAltera = class(TForm)
    grdDistribuidor: TDBGrid;
    pnlOperacao: TPanel;
    SpeedButton3: TSpeedButton;
    btnFechar: TSpeedButton;
    btnAlterar: TSpeedButton;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContatoAltera: TfrmContatoAltera;

implementation

{$R *.dfm}

uses uDM, uContatoCadastro;

procedure TfrmContatoAltera.btnAlterarClick(Sender: TObject);
var
  lfrmContatoCadastro: TfrmContatoCadastro;
begin
  lfrmContatoCadastro := TfrmContatoCadastro.Create(Application);

  try
    lfrmContatoCadastro.Codigo := DM.qryContato.FieldByName('IdContato').AsInteger;
    lfrmContatoCadastro.Nome := DM.qryContato.FieldByName('nome').AsString;
    lfrmContatoCadastro.Cliente := DM.qryContato.FieldByName('IdCliente').AsString;
    lfrmContatoCadastro.ShowModal;
    DM.qryContato.DisableControls;
  finally
    FreeAndNil(lfrmContatoCadastro);
    DM.qryContato.Close;
    DM.qryContato.Open;
    DM.qryContato.EnableControls;
  end;
end;

procedure TfrmContatoAltera.btnFecharClick(Sender: TObject);
begin
  DM.qryContato.Close;
  Close;
end;

procedure TfrmContatoAltera.FormShow(Sender: TObject);
begin
  DM.qryContato.Open;
end;

procedure TfrmContatoAltera.SpeedButton3Click(Sender: TObject);
begin
  if not DM.qryContato.IsEmpty then
    if MessageDlg('Confirma a exclusão?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DM.ApagarRegistro('IdContato ', 'TBCONTATOS', DM.qryContato.FieldByName('IdContato').AsInteger);
      DM.qryContato.Close;
      DM.qryContato.Open;
    end;
end;

end.
