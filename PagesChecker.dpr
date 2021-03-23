program PagesChecker;

uses
  Vcl.Forms,
  PagesChecker.Main.View in 'PagesChecker.Main.View.pas' {PagesCheckerMainForm},
  PagesChecker.Main in 'PagesChecker.Main.pas',
  PagesChecker.Main.Frame in 'PagesChecker.Main.Frame.pas' {PagesCheckerMainFrame: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPagesCheckerMainForm, PagesCheckerMainForm);
  Application.Run;
end.
