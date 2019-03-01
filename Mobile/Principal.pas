unit Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Data.DBXDataSnap, IPPeerClient, Data.DBXCommon, Data.DB, Datasnap.DBClient,
  Datasnap.DSConnect, Data.SqlExpr, FMX.Edit, FMX.Layouts, FMX.ListBox,
  FMX.TabControl, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, FMX.StdCtrls, Data.Bind.Components,
  Data.Bind.DBScope, System.Actions, FMX.ActnList;

type
  TfrmPrincipal = class(TForm)
    tcGeral: TTabControl;
    tbPrincipal: TTabItem;
    tbDados: TTabItem;
    ListBox1: TListBox;
    SearchBox1: TSearchBox;
    SQLConnection1: TSQLConnection;
    DSProviderConnection1: TDSProviderConnection;
    cdsEstado: TClientDataSet;
    cdsEstadoID: TIntegerField;
    cdsEstadoSIGLA: TStringField;
    cdsEstadoNOME: TStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    tbConfig: TTabItem;
    edtHost: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtPorta: TEdit;
    btnConectar: TButton;
    Label3: TLabel;
    edtNome: TEdit;
    LinkControlToField2: TLinkControlToField;
    ActionList1: TActionList;
    Label4: TLabel;
    edtSigla: TEdit;
    ChangeTabAction1: TChangeTabAction;
    LinkListControlToField1: TLinkListControlToField;
    LinkControlToField1: TLinkControlToField;
    procedure FormShow(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    procedure ListBox1ItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.btnConectarClick(Sender: TObject);
begin
  try
    cdsEstado.Close;
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
    tcGeral.ActiveTab := tbPrincipal;
  except
    SQLConnection1.Close;
    cdsEstado.Close;
    tcGeral.ActiveTab := tbConfig;
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  btnConectarClick(Self);
end;

procedure TfrmPrincipal.ListBox1ItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  ChangeTabAction1.ExecuteTarget(Self);
end;

end.
