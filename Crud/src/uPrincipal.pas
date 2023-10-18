unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, System.ImageList, Vcl.ImgList;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Distribuidor1: TMenuItem;
    Cadastro2: TMenuItem;
    Alterao2: TMenuItem;
    Produto1: TMenuItem;
    Produto2: TMenuItem;
    Alterao3: TMenuItem;
    Image: TImage;
    ImageList: TImageList;
    Sair1: TMenuItem;
    Sobre1: TMenuItem;
    Controledevendas1: TMenuItem;
    procedure Cadastro2Click(Sender: TObject);
    procedure Alterao2Click(Sender: TObject);
    procedure Produto2Click(Sender: TObject);
    procedure Alterao3Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Controledevendas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  uClienteCadastro, uClienteAltera,
  uContatoCadastro, uContatoAltera, uDM, uSobre;

procedure TfrmPrincipal.Alterao2Click(Sender: TObject);
var
  lfrmClienteAltera: TfrmClienteAltera;
begin
  lfrmClienteAltera := TfrmClienteAltera.Create(Application);

  try
    lfrmClienteAltera.ShowModal;
  finally
    FreeAndNil(lfrmClienteAltera);
  end;
end;

procedure TfrmPrincipal.Alterao3Click(Sender: TObject);
var
  lfrmContatoAltera: TfrmContatoAltera;
begin
  lfrmContatoAltera := TfrmContatoAltera.Create(Application);

  try
    lfrmContatoAltera.ShowModal;
  finally
    FreeAndNil(lfrmContatoAltera);
  end;
end;

procedure TfrmPrincipal.Cadastro2Click(Sender: TObject);
var
  lfrmClienteCadastro: TfrmClienteCadastro;
begin
  lfrmClienteCadastro := TfrmClienteCadastro.Create(Application);

  try
    lfrmClienteCadastro.Codigo := 0;
    lfrmClienteCadastro.ShowModal;
  finally
    FreeAndNil(lfrmClienteCadastro);
  end;
end;

procedure TfrmPrincipal.Controledevendas1Click(Sender: TObject);
begin
  frmSobre.ShowModal;
end;

procedure TfrmPrincipal.Produto2Click(Sender: TObject);
var
  lfrmContatoCadastro: TfrmContatoCadastro;
begin
  lfrmContatoCadastro := TfrmContatoCadastro.Create(Application);

  try
    lfrmContatoCadastro.Codigo := 0;
    lfrmContatoCadastro.ShowModal;
  finally
    FreeAndNil(lfrmContatoCadastro);
  end;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
