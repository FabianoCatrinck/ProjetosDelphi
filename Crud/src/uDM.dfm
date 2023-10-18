object DM: TDM
  OldCreateOrder = False
  Height = 322
  Width = 535
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=D:\ProjetosDelphi\Crud\data\BDCANDIDATO.DB'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 24
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnection
    Left = 104
    Top = 16
  end
  object qryContato: TFDQuery
    Connection = FDConnection
    Transaction = FDTransaction1
    SQL.Strings = (
      'select * from TBCONTATOS')
    Left = 128
    Top = 96
    object qryContatoIdContato: TLargeintField
      FieldName = 'IdContato'
      Origin = 'IdContato'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryContatoIdCliente: TIntegerField
      FieldName = 'IdCliente'
      Origin = 'IdCliente'
    end
    object qryContatoNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Size = 60
    end
  end
  object qryCliente: TFDQuery
    Connection = FDConnection
    Transaction = FDTransaction1
    SQL.Strings = (
      'select * from TBCLIENTES')
    Left = 24
    Top = 136
    object qryClienteIdCliente: TLargeintField
      FieldName = 'IdCliente'
      Origin = 'IdCliente'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryClienteCliente: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'Cliente'
      Origin = 'Cliente'
    end
    object qryClienteRazaoSocial: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RazaoSocial'
      Origin = 'RazaoSocial'
      Size = 60
    end
    object qryClienteCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Size = 14
    end
    object qryClienteCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 11
    end
    object qryClienteDtNascimento: TDateTimeField
      DisplayLabel = 'Nascimento'
      FieldName = 'DtNascimento'
      Origin = 'DtNascimento'
    end
  end
  object dtsContato: TDataSource
    DataSet = qryContato
    Left = 128
    Top = 144
  end
  object dtsCliente: TDataSource
    DataSet = qryCliente
    Left = 32
    Top = 80
  end
end
