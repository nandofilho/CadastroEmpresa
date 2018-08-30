object FUsuarioMov: TFUsuarioMov
  Left = 0
  Top = 0
  Caption = 'Manuten'#231#227'o usu'#225'rio'
  ClientHeight = 193
  ClientWidth = 313
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 61
    Top = 71
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 55
    Top = 99
    Width = 34
    Height = 13
    Caption = 'Acesso'
  end
  object Label3: TLabel
    Left = 59
    Top = 126
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 313
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 635
    object Button1: TButton
      Left = 16
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Confirma'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 136
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Cancela'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object EdNome: TEdit
    Left = 91
    Top = 69
    Width = 198
    Height = 21
    TabOrder = 1
  end
  object edAcesso: TEdit
    Left = 92
    Top = 96
    Width = 197
    Height = 21
    TabOrder = 2
  end
  object EdSenha: TEdit
    Left = 92
    Top = 123
    Width = 197
    Height = 21
    TabOrder = 3
  end
end
