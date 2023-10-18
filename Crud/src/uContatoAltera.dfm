object frmContatoAltera: TfrmContatoAltera
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Selecione o Contato para alterar '
  ClientHeight = 165
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grdDistribuidor: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 354
    Height = 120
    Align = alTop
    DataSource = DM.dtsContato
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IdContato'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IdCliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 200
        Visible = True
      end>
  end
  object pnlOperacao: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 126
    Width = 354
    Height = 36
    Align = alBottom
    TabOrder = 1
    ExplicitWidth = 462
    DesignSize = (
      354
      36)
    object SpeedButton3: TSpeedButton
      Left = 111
      Top = 5
      Width = 75
      Height = 25
      Anchors = []
      Caption = 'Excluir'
      ImageIndex = 10
      Images = frmPrincipal.ImageList
      OnClick = SpeedButton3Click
    end
    object btnFechar: TSpeedButton
      Left = 271
      Top = 5
      Width = 75
      Height = 25
      Anchors = []
      Caption = 'Fechar'
      ImageIndex = 1
      Images = frmPrincipal.ImageList
      OnClick = btnFecharClick
    end
    object btnAlterar: TSpeedButton
      Left = 191
      Top = 5
      Width = 75
      Height = 25
      Anchors = []
      Caption = 'Alterar'
      ImageIndex = 4
      Images = frmPrincipal.ImageList
      OnClick = btnAlterarClick
    end
  end
end
