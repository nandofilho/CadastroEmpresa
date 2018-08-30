program PEmpresa;

uses
  Vcl.Forms,
  UEmpresas in 'UEmpresas.pas' {FEmpresas},
  UEmpresaSeleciona in 'UEmpresaSeleciona.pas' {FSelecionaEmpresa},
  UEmpresasMov in 'UEmpresasMov.pas' {FEmpresasMov},
  UDMEmp in 'UDMEmp.pas' {DMEmp: TDataModule},
  Ufuncoes in '..\FUNCOES\Ufuncoes.pas',
  USeguro in '..\FUNCOES\USeguro.pas',
  Unit1 in 'Unit1.pas',
  UUsuario in '..\CadastroUsuarios\UUsuario.pas' {Fusuario},
  UUsuarioMov in 'UUsuarioMov.pas' {FUsuarioMov};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMEmp, DMEmp);
  Application.CreateForm(TFEmpresas, FEmpresas);
  Application.CreateForm(TFusuario, Fusuario);
  Application.CreateForm(TFUsuarioMov, FUsuarioMov);
  Application.Run;
end.
