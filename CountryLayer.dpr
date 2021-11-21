program CountryLayer;

uses
  System.StartUpCopy,
  FMX.Forms,
  CountryLayer.MainUnit in 'CountryLayer.MainUnit.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
