object DMEmp: TDMEmp
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 607
  Width = 953
  object TBGeral1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DPImovelComposicao'
    RemoteServer = DSPConexao
    Left = 171
    Top = 92
  end
  object TBGeral2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DPImovelDescricao'
    RemoteServer = DSPConexao
    Left = 248
    Top = 95
  end
  object TBEmpresas: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from empresa'
    Params = <>
    ProviderName = 'DPEmpresa'
    RemoteServer = DSPConexao
    Left = 168
    Top = 160
    object TBEmpresasid: TIntegerField
      FieldName = 'id'
    end
    object TBEmpresasnome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object TBEmpresasacesso: TStringField
      FieldName = 'acesso'
    end
    object TBEmpresassenha: TStringField
      DisplayWidth = 80
      FieldName = 'senha'
      Size = 80
    end
    object TBEmpresasendereco: TStringField
      FieldName = 'endereco'
      Size = 50
    end
    object TBEmpresasbairro: TStringField
      FieldName = 'bairro'
      Size = 30
    end
    object TBEmpresascidade: TStringField
      FieldName = 'cidade'
      Size = 30
    end
    object TBEmpresasestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object TBEmpresascep: TStringField
      FieldName = 'cep'
      Size = 9
    end
    object TBEmpresastel: TStringField
      FieldName = 'tel'
      Size = 50
    end
    object TBEmpresaspop3: TStringField
      FieldName = 'pop3'
      Size = 50
    end
    object TBEmpresasemail: TStringField
      FieldName = 'email'
      Size = 50
    end
    object TBEmpresaswebpage: TStringField
      FieldName = 'webpage'
      Size = 50
    end
    object TBEmpresasabv: TStringField
      FieldName = 'abv'
    end
    object TBEmpresassitua: TStringField
      FieldName = 'situa'
      FixedChar = True
      Size = 1
    end
    object TBEmpresassmtp: TStringField
      FieldName = 'smtp'
      Size = 50
    end
    object TBEmpresasNetUsuario: TStringField
      FieldName = 'NetUsuario'
      Size = 40
    end
    object TBEmpresasNetSenha: TStringField
      FieldName = 'NetSenha'
      Size = 80
    end
    object TBEmpresasfoto: TBlobField
      FieldName = 'foto'
    end
    object TBEmpresasnetporta: TStringField
      FieldName = 'netporta'
      Size = 10
    end
  end
  object DSEmpresas: TDataSource
    DataSet = TBEmpresas
    Left = 250
    Top = 161
  end
  object QRSaida: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DPDozeMesesold'
    Left = 611
    Top = 100
  end
  object TBUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DPUsuario'
    RemoteServer = DSPConexao
    Left = 179
    Top = 516
    object TBUsuariocodemp: TIntegerField
      FieldName = 'codemp'
    end
    object TBUsuariocodpes: TIntegerField
      FieldName = 'codpes'
    end
    object TBUsuarioid: TIntegerField
      FieldName = 'id'
    end
    object TBUsuariocodsis: TIntegerField
      FieldName = 'codsis'
    end
    object TBUsuarioacesso: TStringField
      FieldName = 'acesso'
      Size = 40
    end
    object TBUsuariosenha: TStringField
      FieldName = 'senha'
      Size = 40
    end
    object TBUsuariositua: TStringField
      FieldName = 'situa'
      Size = 1
    end
    object TBUsuarionivel: TIntegerField
      FieldName = 'nivel'
    end
  end
  object DSPConexao: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    SQLConnection = SQLConnection1
    Left = 64
    Top = 80
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'DataSnapCLIENTENOTAS'
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DbxDatasnap'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      'DriverName=DataSnap'
      'HostName=rentix.ddns.com.br'
      'port=222'
      'Filters={}'
      'BufferKBSize=64')
    Left = 216
    Top = 16
    UniqueId = '{C4834604-B3C1-4AD6-97FE-F86AA16B986B}'
  end
  object DSUsuario: TDataSource
    DataSet = TBUsuario
    Left = 274
    Top = 513
  end
  object QRGeral: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DPGeral'
    RemoteServer = DSPConexao
    Left = 163
    Top = 300
  end
  object TBSequencia: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from sequencia'
    Params = <>
    ProviderName = 'DPSequencia'
    RemoteServer = DSPConexao
    Left = 259
    Top = 300
    object TBSequenciacodemp: TIntegerField
      FieldName = 'codemp'
      Required = True
    end
    object TBSequenciacodmov: TIntegerField
      FieldName = 'codmov'
      Required = True
    end
    object TBSequenciatipo: TStringField
      FieldName = 'tipo'
      Required = True
      FixedChar = True
      Size = 1
    end
    object TBSequencianroseq: TIntegerField
      FieldName = 'nroseq'
    end
    object TBSequenciaflag: TStringField
      FieldName = 'flag'
      FixedChar = True
      Size = 1
    end
  end
  object QRUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DPQCedente'
    RemoteServer = DSPConexao
    Left = 171
    Top = 372
    object QRUsuariocodemp: TIntegerField
      FieldName = 'codemp'
    end
    object QRUsuarioidpes: TIntegerField
      FieldName = 'idpes'
    end
    object QRUsuarioidusu: TIntegerField
      FieldName = 'idusu'
    end
    object QRUsuarionome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object QRUsuariodatcad: TDateTimeField
      FieldName = 'datcad'
    end
    object QRUsuariocpfcnpj: TStringField
      FieldName = 'cpfcnpj'
    end
    object QRUsuariosituap: TStringField
      FieldName = 'situap'
      Size = 1
    end
    object QRUsuariosituau: TStringField
      FieldName = 'situau'
      Size = 1
    end
  end
  object DSUsuarioQ: TDataSource
    DataSet = QRUsuario
    Left = 274
    Top = 377
  end
  object TBPessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DPPessoa'
    RemoteServer = DSPConexao
    Left = 171
    Top = 444
    object TBPessoacodemp: TIntegerField
      FieldName = 'codemp'
    end
    object TBPessoaid: TIntegerField
      FieldName = 'id'
    end
    object TBPessoanome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object TBPessoadatcad: TDateTimeField
      FieldName = 'datcad'
    end
    object TBPessoasitua: TStringField
      FieldName = 'situa'
      Size = 1
    end
    object TBPessoacpfcnpj: TStringField
      FieldName = 'cpfcnpj'
    end
  end
  object DSPessoa: TDataSource
    DataSet = TBPessoa
    Left = 274
    Top = 441
  end
end
