unit Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.TabControl, FMX.Edit;

type
  TfrmPrincipal = class(TForm)
    TabControl: TTabControl;
    tabLista: TTabItem;
    tabCadastro: TTabItem;
    Rectangle1: TRectangle;
    Clientes: TLabel;
    imgAdd: TImage;
    lvClientes: TListView;
    rectToolBar: TRectangle;
    lblTitulo: TLabel;
    lblTitul: TLabel;
    edtNome: TEdit;
    edtEmail: TEdit;
    Label1: TLabel;
    edtFone: TEdit;
    Label2: TLabel;
    imgExcluir: TImage;
    imgVoltar: TImage;
    imgSalvar: TImage;
    procedure imgAddClick(Sender: TObject);
    procedure imgVoltarClick(Sender: TObject);
    procedure imgSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure AddClienteLV(id_cliente: integer; nome, email, fone: string);
    procedure GET_Clientes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.GET_Clientes();
begin
  lvClientes.Items.Clear;
  AddClienteLV(0, 'Hebert Mazutti', 'teste@teste.com', '(11) 0000-0000');
  AddClienteLV(0, 'Hebert Mazzei', 'teste@mazzei.com', '(11) 1234-0000');
  AddClienteLV(0, 'Hebert Viana', 'teste@viana.com', '(11) 0000-1234');
  AddClienteLV(0, 'Hebert Manaus', 'teste@manaus.com', '(11) 1234-4578');
end;

procedure TfrmPrincipal.AddClienteLV(id_cliente: integer; nome, email, fone: string);
begin
  with lvClientes.items.Add do
  begin
    Height := 50;
    Tag := id_cliente;

    TListItemText(Objects.FindDrawable('edtNome')).Text := nome;
    TListItemText(Objects.FindDrawable('edtEmail')).Text := email;
    TListItemText(Objects.FindDrawable('edtFone')).Text := fone;
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  TabControl.ActiveTab := TabLista;
  GET_Clientes;
end;

procedure TfrmPrincipal.imgAddClick(Sender: TObject);
begin
  TabControl.GotoVisibleTab(1);
end;

procedure TfrmPrincipal.imgSalvarClick(Sender: TObject);
begin
  TabControl.GotoVisibleTab(0);
end;

procedure TfrmPrincipal.imgVoltarClick(Sender: TObject);
begin
  TabControl.GotoVisibleTab(0);
end;

end.
