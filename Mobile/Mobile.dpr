program Mobile;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  Principal in 'Principal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
