object frmSobre: TfrmSobre
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sobre'
  ClientHeight = 184
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 451
    Height = 131
    Align = alClient
    ExplicitLeft = 8
    ExplicitHeight = 158
  end
  object Label1: TLabel
    Left = 63
    Top = 21
    Width = 331
    Height = 33
    Caption = 'Projeto de Crud - Embalsoft'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 85
    Top = 104
    Width = 297
    Height = 19
    Caption = 'Feito com Delphi 10.4 Community Edition'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 94
    Top = 59
    Width = 279
    Height = 19
    Caption = 'Imagens geradas pelo aplicativo Icons8'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 134
    Top = 79
    Width = 176
    Height = 19
    Caption = 'Banco de dados SQLite 3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 140
    Width = 451
    Height = 41
    Align = alBottom
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 192
      Top = 2
      Width = 94
      Height = 31
      Caption = 'Fechar'
      OnClick = SpeedButton1Click
    end
  end
end
