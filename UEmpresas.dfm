object FEmpresas: TFEmpresas
  Left = 305
  Top = 232
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Usu'#225'rios '
  ClientHeight = 460
  ClientWidth = 506
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 506
    Height = 460
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 504
      Height = 52
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        Left = 5
        Top = 5
        Width = 63
        Height = 39
        Caption = '&Retorna'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
          03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
          0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
          0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
          0333337F777FFFFF7F3333000000000003333377777777777333}
        NumGlyphs = 2
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 75
        Top = 4
        Width = 54
        Height = 42
        Caption = '&Inclui'
        OnClick = SpeedButton2Click
      end
      object SpeedButton3: TSpeedButton
        Left = 127
        Top = 4
        Width = 55
        Height = 42
        Caption = '&Altera'
        OnClick = SpeedButton3Click
      end
      object SpeedButton5: TSpeedButton
        Left = 180
        Top = 4
        Width = 61
        Height = 43
        Caption = '&Desativa'
        OnClick = SpeedButton5Click
      end
      object Bevel1: TBevel
        Left = 76
        Top = 4
        Width = 2
        Height = 43
      end
      object BitBtn1: TBitBtn
        Left = 247
        Top = 4
        Width = 249
        Height = 21
        Caption = 'Adiciona Dados padr'#245'es base de dados '
        TabOrder = 0
        OnClick = BitBtn1Click
      end
      object Button1: TButton
        Left = 247
        Top = 26
        Width = 248
        Height = 19
        Caption = 'Cadastro pessoas'
        TabOrder = 1
        OnClick = Button1Click
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 54
      Width = 500
      Height = 402
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object SpeedButton4: TSpeedButton
        Left = 211
        Top = 351
        Width = 63
        Height = 20
        Caption = 'Localiza'
        Flat = True
        OnClick = SpeedButton4Click
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 5
        Width = 492
        Height = 336
        Color = clWhite
        DataSource = DMEmp.DSEmpresas
        FixedColor = clNavy
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = DBGrid1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'nome'
            Title.Caption = 'Empresas'
            Width = 214
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'acesso'
            Title.Caption = 'C'#243'digo acesso'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATATU'
            Title.Caption = #218'ltima mod.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'id'
            Visible = True
          end>
      end
      object Edit1: TEdit
        Left = 6
        Top = 350
        Width = 201
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
        OnKeyDown = Edit1KeyDown
      end
      object RGOrdem: TRadioGroup
        Left = 296
        Top = 344
        Width = 185
        Height = 47
        Caption = 'Selecionar'
        ItemIndex = 0
        Items.Strings = (
          'Ativados'
          'Desativados')
        TabOrder = 2
        OnClick = RGOrdemClick
      end
      object pb1: TProgressBar
        Left = 5
        Top = 375
        Width = 285
        Height = 16
        TabOrder = 3
        Visible = False
      end
    end
  end
end
