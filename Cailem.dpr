program Cailem;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitCadastroClientes in 'UnitCadastroClientes.pas' {FormCadastroCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormCadastroCliente, FormCadastroCliente);
  Application.Run;
end.
