unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Samples.Spin, Vcl.Imaging.pngimage;

type
  TfrmPrincipal = class(TForm)
    pnlMines: TPanel;
    pnlLinha5: TPanel;
    pnlLinha1: TPanel;
    pnlLinha2: TPanel;
    pnlLinha3: TPanel;
    pnlLinha4: TPanel;
    btn6: TBitBtn;
    btn8: TBitBtn;
    btn10: TBitBtn;
    btn9: TBitBtn;
    btn7: TBitBtn;
    btn11: TBitBtn;
    btn13: TBitBtn;
    btn15: TBitBtn;
    btn14: TBitBtn;
    btn12: TBitBtn;
    btn16: TBitBtn;
    btn18: TBitBtn;
    btn20: TBitBtn;
    btn19: TBitBtn;
    btn17: TBitBtn;
    btn21: TBitBtn;
    btn23: TBitBtn;
    btn25: TBitBtn;
    btn24: TBitBtn;
    btn22: TBitBtn;
    lblSortear: TLabel;
    spnQuantidadeSorteio: TSpinEdit;
    lblCliques: TLabel;
    btnSortear: TBitBtn;
    btn1: TBitBtn;
    btn2: TBitBtn;
    btn3: TBitBtn;
    btn4: TBitBtn;
    btn5: TBitBtn;
    procedure btnSortearClick(Sender: TObject);
  private
    { Private declarations }
    procedure Sortear(pQuantidade: Integer);
    procedure InicializarBotoes();
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnSortearClick(Sender: TObject);
begin
  Sortear(spnQuantidadeSorteio.Value);
end;

procedure TfrmPrincipal.InicializarBotoes;
var
  lComponente: Integer;
begin
  for lComponente := 0 to frmPrincipal.ComponentCount - 1 do
  begin
    if (frmPrincipal.Components[lComponente] is TBitBtn) and
       (frmPrincipal.Components[lComponente].Name <> 'btnSortear') then
    begin
      TBitBtn(frmPrincipal.Components[lComponente]).Caption := '';
    end;

  end;

end;

procedure TfrmPrincipal.Sortear(pQuantidade: Integer);
var
  lNumero,
  lSorteio: Integer;
begin
  InicializarBotoes();
  for lSorteio := 1 to pQuantidade do
  begin
    lNumero := Random(24);

    case lNumero + 1 of
      1: btn1.Caption := 'X';
      2: btn2.Caption := 'X';
      3: btn3.Caption := 'X';
      4: btn4.Caption := 'X';
      5: btn5.Caption := 'X';
      6: btn6.Caption := 'X';
      7: btn7.Caption := 'X';
      8: btn8.Caption := 'X';
      9: btn9.Caption := 'X';
     10: btn10.Caption := 'X';
     11: btn11.Caption := 'X';
     12: btn12.Caption := 'X';
     13: btn13.Caption := 'X';
     14: btn14.Caption := 'X';
     15: btn15.Caption := 'X';
     16: btn16.Caption := 'X';
     17: btn17.Caption := 'X';
     18: btn18.Caption := 'X';
     19: btn19.Caption := 'X';
     20: btn20.Caption := 'X';
     21: btn21.Caption := 'X';
     22: btn22.Caption := 'X';
     23: btn23.Caption := 'X';
     24: btn24.Caption := 'X';
     25: btn25.Caption := 'X';
    end;
  end;


end;

end.
