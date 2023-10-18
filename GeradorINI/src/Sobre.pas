unit Sobre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TTelaSobre = class(TForm)
    Bevel1: TBevel;
    PanelRodape: TPanel;
    LabelTitulo: TLabel;
    LabelSubTitulo3: TLabel;
    LabelSubTitulo1: TLabel;
    LabelSubTitulo2: TLabel;
    BotaoFechar: TSpeedButton;
    procedure BotaoFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaSobre: TTelaSobre;

implementation

{$R *.dfm}

procedure TTelaSobre.BotaoFecharClick(Sender: TObject);
begin
  Close;
end;

end.
