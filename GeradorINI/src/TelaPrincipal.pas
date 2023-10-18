unit TelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Empresas, Vcl.Buttons,
  Vcl.ExtCtrls, Parametros;

type
  TPrincipal = class(TForm)
    PanelBotoes: TPanel;
    BotaoEmpresas: TBitBtn;
    BotaoParametros: TBitBtn;
    BotaoEncerrar: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BotaoEmpresaClick(Sender: TObject);
    procedure BotaoParametrosClick(Sender: TObject);
    procedure BotaoEncerrarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirTelaEmpresas();
    procedure AbrirTelaParametros();
    procedure AbrirTelaSobre();
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

{$R *.dfm}

uses Sobre;

procedure TPrincipal.AbrirTelaEmpresas();
var
  TelaDeEmpresas: TTelaEmpresas;
begin
  TelaDeEmpresas := TTelaEmpresas.Create(Application);

  try
    TelaDeEmpresas.ShowModal;
  finally
    FreeAndNil(TelaDeEmpresas);
  end;
end;

procedure TPrincipal.AbrirTelaParametros();
var
  TelaDeParametros: TTelaParametros;
begin
  TelaDeParametros := TTelaParametros.Create(Application);

  try
    TelaDeParametros.ShowModal;
  finally
    FreeAndNil(TelaDeParametros);
  end;
end;

procedure TPrincipal.AbrirTelaSobre;
var
  TelaSobre: TTelaSobre;
begin
  TelaSobre := TTelaSobre.Create(Application);

  try
    TelaSobre.ShowModal;
  finally
    FreeAndNil(TelaSobre);
  end;
end;

procedure TPrincipal.BitBtn2Click(Sender: TObject);
begin
  AbrirTelaSobre();
end;

procedure TPrincipal.BotaoEmpresaClick(Sender: TObject);
begin
  AbrirTelaEmpresas();
end;

procedure TPrincipal.BotaoEncerrarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TPrincipal.BotaoParametrosClick(Sender: TObject);
begin
  AbrirTelaParametros();
end;

end.
