unit UEmpresaUsuario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Edit,UDMGeral,
  FMX.StdCtrls;

type
  TFEmpresaUsuario = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    edTemporario: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  pvVetor:array[0..3] of String;
  pvTamanho:Integer;
  pvArquivo:String;
  Procedure MontaeSelecionaOpcoesDeChecagem;
  Procedure GravaOpcoesDeChecagem;
    { Private declarations }
  public
  oBDados:TEmpresa;
    { Public declarations }
  end;

var
  FEmpresaUsuario: TFEmpresaUsuario;

implementation
uses UEstilos, Ufuncoes;
{$R *.fmx}



procedure TFEmpresaUsuario.Button1Click(Sender: TObject);
begin
GravaOpcoesDeChecagem;
Close;
end;

procedure TFEmpresaUsuario.Button2Click(Sender: TObject);
begin
Close;
end;

procedure TFEmpresaUsuario.FormShow(Sender: TObject);
begin
pvArquivo:=GetEnvironmentVariable('USERPROFILE')+'\'+obDados.sistema+cripto(obDados.acessoUsuario)+'.pro';
MontaeSelecionaOpcoesDeChecagem;
end;

Procedure TFEmpresaUsuario.MontaeSelecionaOpcoesDeChecagem;
var
  n: Integer;
  bEmpresa: Boolean;
  bSenha: Boolean;
  dados:TEMPRESA;
Begin
bSenha:=true;
bEmpresa:=false;
dados:=DMGeral.LerDados;
for n:=0 to 1  do
    pvVetor[n]:=DMGeral.kSimbolos;
pvTamanho:=DMGeral.MoveArquivoTextoParaVetor(pvArquivo,pvVetor);
if pvtamanho=0 then
   pvTamanho:=1;
   EdTemporario.Text:=pvVetor[0];
   if EdTemporario.Text='' then
      EdTemporario.Text:=dados.pastalocal;
   bEmpresa:=true;
end;

Procedure TFEmpresaUsuario.GravaOpcoesDeChecagem;
Begin
pvVetor[0]:=EdTemporario.Text;
DMGeral.GravaTextoDeVetor(pvArquivo,pvVetor,1);
end;


end.
