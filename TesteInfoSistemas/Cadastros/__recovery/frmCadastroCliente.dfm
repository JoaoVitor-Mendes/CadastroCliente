object formCadastroCliente: TformCadastroCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Cliente'
  ClientHeight = 492
  ClientWidth = 1014
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 1014
    Height = 49
    Align = alTop
    TabOrder = 0
    object lbStatus: TLabel
      AlignWithMargins = True
      Left = 589
      Top = 4
      Width = 108
      Height = 41
      Margins.Left = 20
      Align = alLeft
      Caption = 'lbStatus'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      ExplicitHeight = 32
    end
    object btExcluir: TButton
      AlignWithMargins = True
      Left = 430
      Top = 4
      Width = 136
      Height = 41
      Align = alLeft
      Caption = '&Excluir'
      TabOrder = 0
      OnClick = btExcluirClick
    end
    object btGravar: TButton
      AlignWithMargins = True
      Left = 146
      Top = 4
      Width = 136
      Height = 41
      Align = alLeft
      Caption = '&Gravar'
      TabOrder = 1
      OnClick = btGravarClick
    end
    object btIncluir: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 136
      Height = 41
      Align = alLeft
      Caption = '&Incluir'
      TabOrder = 2
      OnClick = btIncluirClick
    end
    object btCancelar: TButton
      AlignWithMargins = True
      Left = 288
      Top = 4
      Width = 136
      Height = 41
      Align = alLeft
      Caption = '&Cancelar'
      TabOrder = 3
      OnClick = btCancelarClick
    end
  end
  object pnCadastro: TPanel
    Left = 0
    Top = 49
    Width = 1014
    Height = 240
    Align = alTop
    BorderStyle = bsSingle
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object edNome: TEdit
      Left = 12
      Top = 34
      Width = 981
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Panel1: TPanel
      Left = 12
      Top = 11
      Width = 117
      Height = 23
      Caption = 'Nome'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 8
    end
    object edNrIdentidade: TEdit
      Left = 175
      Top = 90
      Width = 157
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object Panel2: TPanel
      Left = 175
      Top = 67
      Width = 117
      Height = 23
      Caption = 'Identidade'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 9
    end
    object Panel3: TPanel
      Left = 12
      Top = 67
      Width = 117
      Height = 23
      Caption = 'CPF'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 10
    end
    object edCpf: TEdit
      Left = 12
      Top = 90
      Width = 157
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 1
      OnKeyPress = edCpfKeyPress
    end
    object Panel4: TPanel
      Left = 338
      Top = 67
      Width = 118
      Height = 23
      Caption = 'Telefone'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 11
    end
    object edEmail: TEdit
      Left = 493
      Top = 90
      Width = 500
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object Panel5: TPanel
      Left = 493
      Top = 67
      Width = 117
      Height = 23
      Caption = 'Email'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 12
    end
    object Panel6: TPanel
      Left = 12
      Top = 121
      Width = 117
      Height = 23
      Caption = 'CEP'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 13
    end
    object edLogradouro: TEdit
      Left = 239
      Top = 144
      Width = 648
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object Panel11: TPanel
      Left = 239
      Top = 121
      Width = 117
      Height = 23
      Caption = 'Logradouro'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 14
    end
    object edNumero: TEdit
      Left = 893
      Top = 144
      Width = 100
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
    end
    object Panel12: TPanel
      Left = 893
      Top = 121
      Width = 100
      Height = 23
      Caption = 'N'#250'mero'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 16
    end
    object Panel13: TPanel
      Left = 12
      Top = 177
      Width = 117
      Height = 23
      Caption = 'Complemento'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 17
    end
    object edComplemento: TEdit
      Left = 12
      Top = 200
      Width = 221
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 18
    end
    object Panel14: TPanel
      Left = 239
      Top = 177
      Width = 137
      Height = 23
      Caption = 'Bairro'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 19
    end
    object edBairro: TEdit
      Left = 239
      Top = 200
      Width = 137
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 20
    end
    object edCidade: TEdit
      Left = 384
      Top = 200
      Width = 360
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 21
    end
    object Panel15: TPanel
      Left = 384
      Top = 177
      Width = 116
      Height = 23
      Caption = 'Cidade'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 22
    end
    object Panel16: TPanel
      Left = 750
      Top = 177
      Width = 75
      Height = 23
      Caption = 'Estado'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 23
    end
    object edEstado: TEdit
      Left = 750
      Top = 200
      Width = 75
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 24
    end
    object edNomePais: TEdit
      Left = 832
      Top = 200
      Width = 161
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 25
    end
    object Panel17: TPanel
      Left = 832
      Top = 177
      Width = 116
      Height = 23
      Caption = 'Pa'#237's'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 26
    end
    object btBuscar: TBitBtn
      Left = 172
      Top = 144
      Width = 51
      Height = 24
      Caption = 'Buscar'
      DoubleBuffered = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = btBuscarClick
    end
    object edCep: TMaskEdit
      Left = 12
      Top = 144
      Width = 157
      Height = 24
      Enabled = False
      EditMask = '99999\-999;1;'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 9
      ParentFont = False
      TabOrder = 5
      Text = '     -   '
      OnExit = edCepExit
    end
    object edTelefone: TMaskEdit
      Left = 338
      Top = 90
      Width = 143
      Height = 24
      EditMask = '!\(99\)9.9099-9999;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 15
      ParentFont = False
      TabOrder = 3
      Text = '(  ) .    -    '
    end
  end
  object Panel9: TPanel
    Left = 0
    Top = 465
    Width = 1014
    Height = 27
    Align = alBottom
    TabOrder = 2
    object ProgressBar1: TProgressBar
      Left = 1
      Top = -16
      Width = 1012
      Height = 42
      Align = alBottom
      TabOrder = 0
    end
  end
  object Panel10: TPanel
    Left = 0
    Top = 289
    Width = 1014
    Height = 176
    Align = alClient
    TabOrder = 3
    object dbgRegistros: TDBGrid
      Left = 1
      Top = 1
      Width = 1012
      Height = 174
      Align = alClient
      DataSource = dsRegistros
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Width = 146
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CPF'
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_IDENTIDADE'
          Title.Caption = 'Nr'#176' Identidade'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELEFONE'
          Title.Caption = 'Telefone'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMAIL'
          Title.Caption = 'Email'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CEP'
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOGRADOURO'
          Title.Caption = 'Logradouro'
          Width = 112
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMPLEMENTO'
          Title.Caption = 'Complemento'
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BAIRRO'
          Title.Caption = 'Bairro'
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CIDADE'
          Title.Caption = 'Cidade'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO'
          Title.Caption = 'UF'
          Width = 27
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAIS'
          Title.Caption = 'Pa'#237's'
          Width = 65
          Visible = True
        end>
    end
  end
  object memRegistros: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'NOME'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'CPF'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NR_IDENTIDADE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TELEFONE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOGRADOURO'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'COMPLEMENTO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'ESTADO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'PAIS'
        DataType = ftString
        Size = 80
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 416
    Top = 336
    Content = {
      414442530F00750729050000FF00010001FF02FF030400180000006D0065006D
      0052006500670069007300740072006F00730005000A0000005400610062006C
      006500060000000000070000080032000000090000FF0AFF0B0400080000004E
      004F004D0045000500080000004E004F004D0045000C00010000000E000D000F
      00780000001000011100011200011300011400011500011600080000004E004F
      004D004500170078000000FEFF0B040006000000430050004600050006000000
      4300500046000C00020000000E000D000F001400000010000111000112000113
      0001140001150001160006000000430050004600170014000000FEFF0B04001A
      0000004E0052005F004900440045004E0054004900440041004400450005001A
      0000004E0052005F004900440045004E005400490044004100440045000C0003
      0000000E000D000F001400000010000111000112000113000114000115000116
      001A0000004E0052005F004900440045004E0054004900440041004400450017
      0014000000FEFF0B040010000000540045004C00450046004F004E0045000500
      10000000540045004C00450046004F004E0045000C00040000000E000D000F00
      1400000010000111000112000113000114000115000116001000000054004500
      4C00450046004F004E004500170014000000FEFF0B04000A00000045004D0041
      0049004C0005000A00000045004D00410049004C000C00050000000E000D000F
      007800000010000111000112000113000114000115000116000A00000045004D
      00410049004C00170078000000FEFF0B04000600000043004500500005000600
      00004300450050000C00060000000E000D000F00140000001000011100011200
      01130001140001150001160006000000430045005000170014000000FEFF0B04
      00140000004C004F0047005200410044004F00550052004F000500140000004C
      004F0047005200410044004F00550052004F000C00070000000E000D000F0078
      0000001000011100011200011300011400011500011600140000004C004F0047
      005200410044004F00550052004F00170078000000FEFF0B0400160000004300
      4F004D0050004C0045004D0045004E0054004F0005001600000043004F004D00
      50004C0045004D0045004E0054004F000C00080000000E000D000F0064000000
      10000111000112000113000114000115000116001600000043004F004D005000
      4C0045004D0045004E0054004F00170064000000FEFF0B04000C000000420041
      004900520052004F0005000C000000420041004900520052004F000C00090000
      000E000D000F003C00000010000111000112000113000114000115000116000C
      000000420041004900520052004F0017003C000000FEFF0B04000C0000004300
      4900440041004400450005000C0000004300490044004100440045000C000A00
      00000E000D000F00500000001000011100011200011300011400011500011600
      0C000000430049004400410044004500170050000000FEFF0B04000C00000045
      0053005400410044004F0005000C000000450053005400410044004F000C000B
      0000000E000D000F000200000010000111000112000113000114000115000116
      000C000000450053005400410044004F00170002000000FEFF0B040008000000
      500041004900530005000800000050004100490053000C000C0000000E000D00
      0F00500000001000011100011200011300011400011500011600080000005000
      410049005300170050000000FEFEFF18FEFF19FEFF1AFEFEFEFF1BFEFF1C1D00
      02000000FF1EFEFEFE0E004D0061006E0061006700650072001E005500700064
      0061007400650073005200650067006900730074007200790012005400610062
      006C0065004C006900730074000A005400610062006C00650008004E0061006D
      006500140053006F0075007200630065004E0061006D0065000A005400610062
      0049004400240045006E0066006F0072006300650043006F006E007300740072
      00610069006E00740073001E004D0069006E0069006D0075006D004300610070
      0061006300690074007900180043006800650063006B004E006F0074004E0075
      006C006C00140043006F006C0075006D006E004C006900730074000C0043006F
      006C0075006D006E00100053006F007500720063006500490044001800640074
      0041006E007300690053007400720069006E0067001000440061007400610054
      007900700065000800530069007A006500140053006500610072006300680061
      0062006C006500120041006C006C006F0077004E0075006C006C000800420061
      007300650014004F0041006C006C006F0077004E0075006C006C0012004F0049
      006E0055007000640061007400650010004F0049006E00570068006500720065
      001A004F0072006900670069006E0043006F006C004E0061006D006500140053
      006F007500720063006500530069007A0065001C0043006F006E007300740072
      00610069006E0074004C00690073007400100056006900650077004C00690073
      0074000E0052006F0077004C006900730074001800520065006C006100740069
      006F006E004C006900730074001C0055007000640061007400650073004A006F
      00750072006E0061006C001200530061007600650050006F0069006E0074000E
      004300680061006E00670065007300}
    object memRegistrosNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object memRegistrosCPF: TStringField
      FieldName = 'CPF'
    end
    object memRegistrosNR_IDENTIDADE: TStringField
      FieldName = 'NR_IDENTIDADE'
    end
    object memRegistrosTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object memRegistrosEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 120
    end
    object memRegistrosCEP: TStringField
      FieldName = 'CEP'
    end
    object memRegistrosLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 120
    end
    object memRegistrosCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 100
    end
    object memRegistrosBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 60
    end
    object memRegistrosCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 80
    end
    object memRegistrosESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object memRegistrosPAIS: TStringField
      FieldName = 'PAIS'
      Size = 80
    end
  end
  object dsRegistros: TDataSource
    DataSet = memRegistros
    OnDataChange = dsRegistrosDataChange
    Left = 496
    Top = 336
  end
  object ACBrMail1: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 880
    Top = 6
  end
end
