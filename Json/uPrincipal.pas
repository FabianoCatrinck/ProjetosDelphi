unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.JSON, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    btnCriarJson: TButton;
    btnLerJson: TButton;
    mmo: TMemo;
    procedure btnCriarJsonClick(Sender: TObject);
    procedure btnLerJsonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnCriarJsonClick(Sender: TObject);
var
  lJson,
  lItensJson: TJsonObject;
  lJsonArray: TJsonArray;
begin
  try
    lJson := TJsonObject.Create;
    lJson.AddPair('pedido', '1000');
    lJson.AddPair('cliente', 'Heber');
    lJson.AddPair('total', TJsonNumber.Create(40));
    lJson.AddPair('pendente', TJsonBool.Create(true));

    lJsonArray :=  TJsonArray.Create;

    //Objetos do item
    lItensJson := TJsonObject.Create;
    lItensJson.AddPair('produto', 'AAAA');
    lItensJson.AddPair('descri��o', 'Produto A');
    lItensJson.AddPair('quantidade', TJsonNumber.Create(4));

    lJsonArray.AddElement(lItensJson);

    lItensJson := TJsonObject.Create;
    lItensJson.AddPair('produto', 'AABBBAA');
    lItensJson.AddPair('descri��o', 'Produto B');
    lItensJson.AddPair('quantidade', TJsonNumber.Create(5));

    lJsonArray.AddElement(lItensJson);


    lJson.AddPair('itens', lJsonArray);

    mmo.Lines.Add(lJson.ToString)
  finally
    FreeAndNil(lJson);
    FreeAndNil(lJsonArray);
  end;

end;

procedure TfrmPrincipal.btnLerJsonClick(Sender: TObject);
var
  lArrayPed,
  lArrayItem: TJsonArray;
  lJson: String;
  x: integer;
begin
  lJson := mmo.Lines.Text;
  lArrayPed := TJsonObject.ParseJSONValue(lJson, false, false) as TJsonArray;

  try
    for x := 0 to lArrayPed.Size -1 do
    begin
      mmo.Lines.Add('Pedido: ' + lArrayPed.Get(x).GetValue<integer>('pedido', 0).ToString);
      mmo.Lines.Add('Cliente: ' + lArrayPed.Get(x).GetValue<string>('cliente', ''));
      mmo.Lines.Add('Total: ' + lArrayPed.Get(x).GetValue<double>('total', 0).ToString);
    end;
  finally
    FreeAndNil(lArrayPed);
  end;

end;

end.
