program GeradorINI;

uses
  Vcl.Forms,
  TelaPrincipal in 'TelaPrincipal.pas' {Principal},
  Empresas in 'Empresas.pas' {TelaEmpresas},
  DataModule in 'DataModule.pas' {DM: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  Parametros in 'Parametros.pas' {TelaParametros},
  Sobre in 'Sobre.pas' {TelaSobre};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Programa gerador de arquivos de inicializa��o (.ini)';
  TStyleManager.TrySetStyle('Aqua Light Slate');
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
