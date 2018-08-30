object DMA: TDMA
  OldCreateOrder = False
  Height = 380
  Width = 953
  object SockFinanceiro: TSocketConnection
    ServerGUID = '{87EBADFA-24EA-4C6B-8202-5A520BCD1A0E}'
    ServerName = 'PSImovel.SSGI'
    Host = 'rentixsistemas.ddns.com.br'
    Port = 6890
    Left = 207
    Top = 22
  end
  object TBGeral1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    RemoteServer = SockFinanceiro
    Left = 171
    Top = 92
  end
  object TBGeral2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DPDenuncia'
    RemoteServer = SockFinanceiro
    Left = 248
    Top = 95
  end
  object TBEmpresas: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from empresa'
    Params = <>
    ProviderName = 'DataSetProvider13'
    RemoteServer = SockFinanceiro
    Left = 168
    Top = 160
    object TBEmpresasSMTP: TStringField
      FieldName = 'SMTP'
      Size = 100
    end
    object TBEmpresasSENHA: TStringField
      FieldName = 'SENHA'
      Size = 30
    end
    object TBEmpresasCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object TBEmpresasSITUA: TStringField
      FieldName = 'SITUA'
      Size = 1
    end
    object TBEmpresasNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object TBEmpresasACESSO: TStringField
      FieldName = 'ACESSO'
      Size = 15
    end
    object TBEmpresasENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object TBEmpresasBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object TBEmpresasCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object TBEmpresasESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object TBEmpresasCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object TBEmpresasTEL: TStringField
      FieldName = 'TEL'
      Size = 50
    end
    object TBEmpresasPOP3: TStringField
      FieldName = 'POP3'
      Size = 50
    end
    object TBEmpresasEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object TBEmpresasWEBPAGE: TStringField
      FieldName = 'WEBPAGE'
      Size = 50
    end
    object TBEmpresasABV: TStringField
      FieldName = 'ABV'
      Size = 50
    end
    object TBEmpresasUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 50
    end
  end
  object DSEmpresas: TDataSource
    DataSet = TBEmpresas
    Left = 250
    Top = 161
  end
  object SocketSaida: TSocketConnection
    ServerGUID = '{57822BAA-BC6B-4325-BFCC-E157DCAC431A}'
    ServerName = 'PSFinance.SFinanceiro'
    Host = 'rentixsistemas.ddns.com.br'
    Port = 6890
    Left = 607
    Top = 22
  end
  object QRSaida: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DPDozeMeses'
    RemoteServer = SocketSaida
    Left = 611
    Top = 100
  end
  object QREntrada: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DPDoc'
    RemoteServer = SockFinanceiro
    Left = 163
    Top = 228
  end
end
