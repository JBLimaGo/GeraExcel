program PUtilitario;

uses
  Forms,
  U_Utilitario in 'U_Utilitario.pas' {F_Excel};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TF_Excel, F_Excel);
  Application.Run;
end.
