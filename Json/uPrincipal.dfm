object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Json'
  ClientHeight = 424
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnCriarJson: TButton
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 207
    Height = 30
    Align = alLeft
    Caption = 'Criar Json'
    TabOrder = 0
    OnClick = btnCriarJsonClick
  end
  object btnLerJson: TButton
    AlignWithMargins = True
    Left = 216
    Top = 3
    Width = 228
    Height = 30
    Align = alRight
    Caption = 'Ler Json'
    TabOrder = 1
    OnClick = btnLerJsonClick
  end
  object mmo: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 39
    Width = 441
    Height = 382
    Align = alBottom
    TabOrder = 2
  end
end
