object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 350
  ClientWidth = 568
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
    Left = 24
    Top = 8
    Width = 22
    Height = 13
    Caption = 'Host'
  end
  object Label2: TLabel
    Left = 24
    Top = 56
    Width = 26
    Height = 13
    Caption = 'Porta'
  end
  object edtHost: TEdit
    Left = 24
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'localhost'
  end
  object edtPorta: TEdit
    Left = 24
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '211'
  end
  object btnConectar: TButton
    Left = 151
    Top = 70
    Width = 75
    Height = 25
    Caption = 'Conectar'
    TabOrder = 2
    OnClick = btnConectarClick
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 106
    Width = 536
    Height = 207
    DataSource = dsEstado
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 24
    Top = 317
    Width = 240
    Height = 25
    DataSource = dsEstado
    TabOrder = 4
  end
  object SQLConnection1: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'HostName=localhost'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=20.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Filters={}')
    Left = 432
    Top = 8
  end
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    SQLConnection = SQLConnection1
    Left = 432
    Top = 64
  end
  object dsEstado: TDataSource
    DataSet = cdsEstado
    Left = 432
    Top = 192
  end
  object cdsEstado: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstado'
    RemoteServer = DSProviderConnection1
    Left = 432
    Top = 120
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstado'
    RemoteServer = DSProviderConnection1
    Left = 440
    Top = 128
  end
end