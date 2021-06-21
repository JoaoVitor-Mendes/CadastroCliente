program CadastroCliente;

uses
  Vcl.Forms,
  frmCadastroCliente in 'Cadastros\frmCadastroCliente.pas' {formCadastroCliente},
  uConsultaCEP in 'Units\uConsultaCEP.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformCadastroCliente, formCadastroCliente);
  Application.Run;
end.
