program BACKUP;

uses
  Forms,
  main in 'main.pas' {FormMain},
  settings in 'settings.pas' {FormSettings},
  about in 'about.pas' {FormAbout},
  password in 'password.pas' {FormPassword},
  changeCFG in 'changeCFG.pas' {FormChangeCFG};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormPassword, FormPassword);
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.CreateForm(TFormChangeCFG, FormChangeCFG);
  Application.Run;
end.
