unit UEmpresaAcesso;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Edit,UDMGeral,
  FMX.StdCtrls;

type
  TFEmpresaAcesso = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    EdUsuario: TEdit;
    EdSenhaU: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    Label4: TLabel;
    EdSenhaE: TEdit;
    EdEmpresa: TEdit;
    ChkEmpresa: TCheckBox;
    ChkSenhaE: TCheckBox;
    ChkUsuario: TCheckBox;
    ChkSenhaU: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure EdEmpresaKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure EdSenhaEKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure EdUsuarioKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure EdSenhaUKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
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
  FEmpresaAcesso: TFEmpresaAcesso;

implementation
uses UEstilos, Ufuncoes;
{$R *.fmx}



procedure TFEmpresaAcesso.Button1Click(Sender: TObject);
begin
oBDados:=DMGeral.ChecaSenhasAcesso(EdEmpresa.Text,EdSenhaE.Text,EDUsuario.Text,EdSenhaU.Text,
                         ChkEmpresa.isChecked,ChkSenhaE.isChecked,ChkUsuario.isChecked,ChkSenhaU.isChecked);
if not oBDados.OK then
   begin
   ShowMessage('Acesso ou senha invalidos');
   Exit;
   end;
Tag:=1;
//DMGeral.SetUsuarioAtual(oBDados.CodUsu);
GravaOpcoesDeChecagem;
Close;
end;

procedure TFEmpresaAcesso.Button2Click(Sender: TObject);
begin
Close;
end;

procedure TFEmpresaAcesso.EdEmpresaKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
if key=13 then EDSenhaE.SetFocus;

end;

procedure TFEmpresaAcesso.EdSenhaEKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
if key=13 then EDUsuario.SetFocus;

end;

procedure TFEmpresaAcesso.EdSenhaUKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
if key=13 then Button1.SetFocus;

end;

procedure TFEmpresaAcesso.EdUsuarioKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
if key=13 then EDSenhaU.SetFocus;

end;

procedure TFEmpresaAcesso.FormShow(Sender: TObject);
begin
pvArquivo:=GetEnvironmentVariable('USERPROFILE')+'\'+obDados.sistema+cripto(obDados.acessoUsuario)+'.pro';
MontaeSelecionaOpcoesDeChecagem;
end;

Procedure TFEmpresaAcesso.MontaeSelecionaOpcoesDeChecagem;
var
  n: Integer;
  bEmpresa: Boolean;
  bSenha: Boolean;
Begin
bSenha:=true;
bEmpresa:=false;
for n:=1 to 3  do
    pvVetor[n]:=DMGeral.kSimbolos;
pvTamanho:=DMGeral.MoveArquivoTextoParaVetor(pvArquivo,pvVetor);
if pvtamanho=0 then
   pvTamanho:=4;
if pvVetor[0]<>DMGeral.kSimbolos then
   Begin
   ChkEmpresa.IsChecked:=True;
   EdEmpresa.Text:=descripto(pvVetor[0]);
   bEmpresa:=true;
   end;
if pvVetor[1]<>DMGeral.kSimbolos then
   Begin
   ChkSenhaE.IsChecked:=True;
   EdSenhaE.Text:=descripto(pvVetor[1]);
   bSenha:=true;
   end;
if pvVetor[2]<>DMGeral.kSimbolos then
   Begin
   ChkUsuario.IsChecked:=True;
   EdUsuario.Text:=descripto(pvVetor[2]);
   end;
if pvVetor[3]<>DMGeral.kSimbolos then
   Begin
   ChkSenhaU.IsChecked:=True;
   EdSenhaU.Text:=descripto(pvVetor[3]);
   end;
//if not (bEmpresa and bSenha) then
//   begin
   Label3.visible:=true;
   Label4.visible:=true;
   EdEmpresa.visible:=true;
   EdSenhaE.visible:=true;
   ChkEmpresa.visible:=true;
   ChkSenhaE.visible:=true;
//   end;
//else
//   begin
//   label1.Position.Y:=label1.Position.x-20;
//   EdUsuario.Position.Y:=EdUsuario.Position.x-20;
//   ChkUsuario.Position.Y:=ChkUsuario.Position.x-20;
//
//   end;
end;

Procedure TFEmpresaAcesso.GravaOpcoesDeChecagem;
Begin
if ChkEmpresa.IsChecked then
   pvVetor[0]:=cripto(EdEmpresa.Text)
else
   pvVetor[0]:=DMGeral.kSimbolos;
if ChkSenhaE.IsChecked then
   pvVetor[1]:=cripto(EdSenhaE.Text)
else
   pvVetor[1]:=DMGeral.kSimbolos;
if ChkUsuario.IsChecked then
   pvVetor[2]:=cripto(EdUsuario.Text)
else
   pvVetor[2]:=DMGeral.kSimbolos;
if ChkSenhaU.IsChecked then
   pvVetor[3]:=cripto(EdSenhaU.Text)
else
   pvVetor[3]:=DMGeral.kSimbolos;
DMGeral.GravaTextoDeVetor(pvArquivo,pvVetor,4);
end;


end.
