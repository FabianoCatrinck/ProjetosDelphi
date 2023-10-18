program Clientes;

uses
  System.StartUpCopy,
  FMX.Forms,
  Principal in 'Principal.pas' {frmPrincipal},
  UnitDM in 'UnitDM.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
