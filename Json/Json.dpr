program Json;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
