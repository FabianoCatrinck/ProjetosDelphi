object frmContatoCadastro: TfrmContatoCadastro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Contato'
  ClientHeight = 148
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlOperacao: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 111
    Width = 389
    Height = 34
    Align = alBottom
    TabOrder = 0
    object btnCancelar: TSpeedButton
      Left = 306
      Top = 1
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      ImageIndex = 1
      Images = frmPrincipal.ImageList
      OnClick = btnCancelarClick
    end
    object btnGravar: TSpeedButton
      Left = 220
      Top = 1
      Width = 75
      Height = 25
      Caption = 'Gravar'
      ImageIndex = 0
      Images = frmPrincipal.ImageList
      OnClick = btnOkClick
    end
  end
  object pnlDados: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 389
    Height = 106
    Align = alTop
    TabOrder = 1
    object lblNome: TLabel
      Left = 8
      Top = 8
      Width = 30
      Height = 13
      Caption = 'Nome'
    end
    object lblCliente: TLabel
      Left = 11
      Top = 54
      Width = 36
      Height = 13
      Caption = 'Cliente'
    end
    object edtNome: TEdit
      Left = 8
      Top = 27
      Width = 369
      Height = 21
      TabOrder = 0
    end
    object cboCliente: TDBLookupComboBox
      Left = 8
      Top = 73
      Width = 369
      Height = 21
      KeyField = 'IdCliente'
      ListField = 'Cliente'
      ListSource = DM.dtsCliente
      TabOrder = 1
    end
  end
end
