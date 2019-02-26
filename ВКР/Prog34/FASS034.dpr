program FASS034;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  Common in 'Common.pas',
  ProbeText in 'ProbeText.pas',
  ProbeImport in 'ProbeImport.pas',
  FourierAnalys in 'FourierAnalys.pas',
  WinFourier in 'WinFourier.pas',
  SpectroGramm in 'SpectroGramm.pas',
  DataExport in 'DataExport.pas',
  WaveLet in 'WaveLet.pas',
  Test in 'Test.pas',
  VelchAnalys in 'VelchAnalys.pas',
  Morlet in 'Morlet.pas',
  Control in 'Control.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
