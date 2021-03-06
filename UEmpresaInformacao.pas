unit UEmpresaInformacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls,UDMGeral;

type
  TFEmpresaInformacao = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label4: TLabel;
    EdSenhaE: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    EdTemporario: TEdit;
    EdImpressao: TEdit;
    Btfile1: TButton;
    Btfile2: TButton;
    OP1: TOpenDialog;
    Label3: TLabel;
    EdLocalBrowse: TEdit;
    Label5: TLabel;
    EdString1: TEdit;
    Label6: TLabel;
    edString2: TEdit;
    Label7: TLabel;
    EdAcesso: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    EdHostLocal: TEdit;
    edHostNet: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    LBUsuario: TLabel;
    EDDB: TEdit;
    EdUsuario: TEdit;
    EdSenha: TEdit;
    Label13: TLabel;
    EdServidor: TEdit;
    Label12: TLabel;
    EdPorta: TEdit;
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
    procedure Btfile1Click(Sender: TObject);
    procedure Btfile2Click(Sender: TObject);
  private
  pvVetor:array[0..13] of String;
  pvTamanho:Integer;
  pvArquivo:String;
  Procedure MontaeSelecionaOpcoesDeChecagem;
  Procedure GravaOpcoesDeChecagem;
    { Private declarations }
  public
  oBDados:TEmpresa;
  oBEmpresaAcesso:String;
    { Public declarations }
  end;

var
  FEmpresaInformacao: TFEmpresaInformacao;

implementation
uses UEstilos, Ufuncoes;
{$R *.fmx}



procedure TFEmpresaInformacao.Btfile1Click(Sender: TObject);
begin
if OP1.execute then
   EdTemporario.text:=OP1.GetNamePath;
end;

procedure TFEmpresaInformacao.Btfile2Click(Sender: TObject);
begin
if OP1.execute then
   EdImpressao.text:=OP1.GetNamePath;

end;

procedure TFEmpresaInformacao.Button1Click(Sender: TObject);
begin
ObEmpresaAcesso:=EdAcesso.Text;
//oBDados:=DMGeral.ChecaSenhasAcessoEmpresa(ObEmpresaAcesso,EdSenhaE.Text);
//if not oBDados.OK then
//   begin
//   ShowMessage('Acesso ou senha invalidos');
//   Exit;
//   end;
Tag:=1;
GravaOpcoesDeChecagem;
Close;
end;

procedure TFEmpresaInformacao.Button2Click(Sender: TObject);
begin
Close;
end;

procedure TFEmpresaInformacao.EdEmpresaKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
if key=13 then EDSenhaE.SetFocus;

end;

procedure TFEmpresaInformacao.EdSenhaEKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
if key=13 then EDTemporario.SetFocus;

end;

procedure TFEmpresaInformacao.EdSenhaUKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
if key=13 then Button1.SetFocus;

end;

procedure TFEmpresaInformacao.EdUsuarioKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
if key=13 then EDImpressao.SetFocus;

end;

procedure TFEmpresaInformacao.FormShow(Sender: TObject);
begin
pvArquivo:=GetEnvironmentVariable('USERPROFILE')+'\'+obDados.sistema+cripto(DMGERAL.kEMPRESAPADRAO+obDados.acessoUsuario)+'.pro';
MontaeSelecionaOpcoesDeChecagem;
end;

Procedure TFEmpresaInformacao.MontaeSelecionaOpcoesDeChecagem;
var
  n: Integer;
  bEmpresa: Boolean;
  bSenha: Boolean;
Begin
bSenha:=true;
bEmpresa:=false;
for n:=0 to 13  do
    pvVetor[n]:=DMGeral.kSimbolos;
pvTamanho:=DMGeral.MoveArquivoTextoParaVetor(pvArquivo,pvVetor);
if pvtamanho=0 then
   pvTamanho:=14;
EdSenhaE.Text:=descripto(pvVetor[0]);
EdTemporario.Text:=pvVetor[1];
EdImpressao.Text:=pvVetor[2];
//   pvVetor[3]:='C:\Program Files (x86)\Google\Chrome\Application\chrome.exe';
if pvVetor[3]=DMGeral.kSimbolos then
   pvVetor[3]:='iexplore.exe';
if pvVetor[4]=DMGeral.kSimbolos then
   pvVetor[4]:='http://marcioraposo.web1105.kinghost.net/paginas/map/mapa.php';
if pvVetor[5]=DMGeral.kSimbolos then
   pvVetor[5]:='http://marcioraposo.web1105.kinghost.net/paginas/map/mapa.php?busca=';
Edlocalbrowse.Text:=pvVetor[3];
EdString1.Text:=pvVetor[4];
EdString2.Text:=pvVetor[5];
EdAcesso.Text:=descripto(pvVetor[6]);
if pvVetor[07]=DMGeral.kSimbolos then
   pvVetor[07]:='192.168.0.1';
if pvVetor[08]=DMGeral.kSimbolos then
   pvVetor[08]:='marcioraposo.ddns.net';
if pvVetor[09]=DMGeral.kSimbolos then
   pvVetor[09]:='222';
if pvVetor[10]=DMGeral.kSimbolos then
   pvVetor[10]:='192.168.0.1';
if pvVetor[11]=DMGeral.kSimbolos then
   pvVetor[11]:='marcioraposo';
if pvVetor[12]=DMGeral.kSimbolos then
   pvVetor[12]:='marcioraposo';
if pvVetor[13]=DMGeral.kSimbolos then
   pvVetor[13]:=cripto('Rent*987');
EdHostLocal.Text:=pvVetor[07];
EdHostNet.Text:=pvVetor[08];
EdPorta.Text:=pvVetor[09];
EdServidor.Text:=pvVetor[10];
EdDB.Text:=pvVetor[11];
EdUsuario.Text:=pvVetor[12];
EdSenha.Text:=descripto(pvVetor[13]);
end;

Procedure TFEmpresaInformacao.GravaOpcoesDeChecagem;
Begin
pvVetor[00]:=cripto(EdSenhaE.Text);
pvVetor[01]:=EdTemporario.Text;
pvVetor[02]:=EdImpressao.Text;
pvVetor[03]:=Edlocalbrowse.Text;
pvVetor[04]:=EdString1.Text;
pvVetor[05]:=EdString2.Text;
pvVetor[06]:=cripto(EdAcesso.Text);
pvVetor[07]:=EdHostLocal.Text;
pvVetor[08]:=EdHostNet.Text;
pvVetor[09]:=EdPorta.Text;
pvVetor[10]:=EdServidor.Text;
pvVetor[11]:=EdDB.Text;
pvVetor[12]:=EdUsuario.Text;
pvVetor[13]:=cripto(EdSenha.Text);
DMGeral.GravaTextoDeVetor(pvArquivo,pvVetor,14);
end;


end.
