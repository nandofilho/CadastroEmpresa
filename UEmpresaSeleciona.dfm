object FSelecionaEmpresa: TFSelecionaEmpresa
  Left = 255
  Top = 179
  BorderStyle = bsSingle
  Caption = 'Configura'#231#227'o sistemas'
  ClientHeight = 79
  ClientWidth = 619
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Empresa: TGroupBox
    Left = 2
    Top = 0
    Width = 615
    Height = 77
    Caption = 'Empresa'
    TabOrder = 0
    object Label6: TLabel
      Left = 223
      Top = 17
      Width = 34
      Height = 13
      Caption = 'Senha '
    end
    object Label10: TLabel
      Left = 34
      Top = 48
      Width = 41
      Height = 13
      Caption = 'Empresa'
    end
    object Label13: TLabel
      Left = 6
      Top = 18
      Width = 70
      Height = 13
      Caption = 'C'#243'digo acesso'
    end
    object GroupBox1: TGroupBox
      Left = -2
      Top = -294
      Width = 640
      Height = 279
      Caption = 'Configura'#231#245'es deste arquivo'
      TabOrder = 0
      object Label3: TLabel
        Left = 301
        Top = 80
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Forne'#231'a o IP'
      end
      object RG1: TRadioGroup
        Left = 8
        Top = 19
        Width = 235
        Height = 45
        Caption = 'Tipo de base de dados'
        Columns = 2
        Items.Strings = (
          'Interbase'
          'MSSqlServer')
        TabOrder = 0
      end
      object RG2: TRadioGroup
        Left = 8
        Top = 65
        Width = 234
        Height = 45
        Caption = 'Acesso ao servidor via'
        Columns = 2
        Items.Strings = (
          'IP'
          'Nome do servidor')
        TabOrder = 1
      end
      object Edit2: TEdit
        Left = 365
        Top = 77
        Width = 266
        Height = 21
        TabOrder = 2
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = -116
        Width = 627
        Height = 105
        Caption = 'Arquivo de seguran'#231'a'
        TabOrder = 3
        object Label4: TLabel
          Left = 7
          Top = 23
          Width = 69
          Height = 13
          Caption = 'Codigo gerado'
        end
        object Label5: TLabel
          Left = 10
          Top = 49
          Width = 64
          Height = 13
          Caption = 'Complemento'
        end
        object Edit3: TEdit
          Left = 80
          Top = 20
          Width = 266
          Height = 21
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 0
        end
        object Edit4: TEdit
          Left = 80
          Top = 45
          Width = 266
          Height = 21
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
    object ESenhaEmpresa: TEdit
      Left = 261
      Top = 14
      Width = 116
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
    object EAcessoEmpresa: TEdit
      Left = 78
      Top = 15
      Width = 134
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object BitBtn5: TBitBtn
      Left = 385
      Top = 14
      Width = 75
      Height = 22
      Caption = 'Acessar'
      TabOrder = 3
      OnClick = BitBtn5Click
    end
    object ENomeEmpresa: TEdit
      Left = 78
      Top = 45
      Width = 427
      Height = 21
      CharCase = ecUpperCase
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 4
    end
    object BitBtn2: TBitBtn
      Left = 526
      Top = 41
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 5
      OnClick = BitBtn2Click
    end
    object BitBtn1: TBitBtn
      Left = 524
      Top = 12
      Width = 75
      Height = 26
      Caption = 'Finalizar'
      TabOrder = 6
      OnClick = BitBtn1Click
    end
  end
end
