unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  Datasnap.DSConnect, Data.SqlExpr, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Data.DBXDataSnap, IPPeerClient, Data.DBXCommon;

type
  TfrmPrincipal = class(TForm)
    edtHost: TEdit;
    edtPorta: TEdit;
    btnConectar: TButton;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    SQLConnection1: TSQLConnection;
    DSProviderConnection1: TDSProviderConnection;
    dsEstado: TDataSource;
    cdsEstado: TClientDataSet;
    ClientDataSet1: TClientDataSet;
    procedure btnConectarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnConectarClick(Sender: TObject);
begin
  if btnConectar.Caption = 'Conectar' then
  begin
    SQLConnection1.Close;
    SQLConnection1.Params.Clear;
    SQLConnection1.Params.Add('DriverUnit=Data.DBXDataSnap');
    SQLConnection1.Params.Add('HostName='+edtHost.Text);
    SQLConnection1.Params.Add('Port='+edtPorta.Text);
    SQLConnection1.Params.Add('CommunicationProtocol=tcp/ip');
    SQLConnection1.Params.Add('DatasnapContext=datasnap/');
    SQLConnection1.Params.Add('DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland.Data.DbxClientDriver,Version=20.0.0.0,Culture=neutral,PublicKeyToken=91d62ebb5b0d1b1b');
    SQLConnection1.Params.Add('Filters={}');
    SQLConnection1.Connected := True;
    cdsEstado.Open;
    if SQLConnection1.Connected then
      btnConectar.Caption := 'Desconectar'
  end
  else
  begin
    SQLConnection1.Close;
    cdsEstado.Close;
    btnConectar.Caption := 'Conectar';
  end;

end;

end.
