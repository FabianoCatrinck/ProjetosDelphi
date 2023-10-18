program Crud;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uContatoCadastro in 'uContatoCadastro.pas' {frmContatoCadastro},
  uClienteAltera in 'uClienteAltera.pas' {frmClienteAltera},
  uDM in 'uDM.pas' {DM: TDataModule},
  uSobre in 'uSobre.pas' {frmSobre},
  uClienteCadastro in 'uClienteCadastro.pas' {frmClienteCadastro},
  uContatoAltera in 'uContatoAltera.pas' {frmContatoAltera};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmSobre, frmSobre);
  Application.CreateForm(TfrmContatoAltera, frmContatoAltera);
  Application.Run;
end.
