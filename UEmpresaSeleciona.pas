unit UEmpresaSeleciona;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,USeguro, ComCtrls;

type
  TFSelecionaEmpresa = class(TForm)
    Empresa: TGroupBox;
    Label6: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    RG1: TRadioGroup;
    RG2: TRadioGroup;
    Edit2: TEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    ESenhaEmpresa: TEdit;
    EAcessoEmpresa: TEdit;
    BitBtn5: TBitBtn;
    ENomeEmpresa: TEdit;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    oBCodEmp:String;
    { Public declarations }
  end;

var
  FSelecionaEmpresa: TFSelecionaEmpresa;
  oBSeguro:TSEGURO;
  oBServidor,oBTipoAcesso,oBDirLocal,oBLocalRemoto:String;
  oBNomeServidor,oBPorta,oBBaseDados:String;
  oBVetor: array of String;
  pvSalvou:Boolean=False;
implementation

uses UDMEmp;

{$R *.dfm}


procedure TFSelecionaEmpresa.BitBtn5Click(Sender: TObject);
var
x:String;
Begin
x:='Select * from empresa where acesso='''+trim(EAcessoEmpresa.Text)+'''';
DMEmp.QRGeral.Close;
DMEmp.QRGeral.CommandText:=x;
DMEmp.QRGeral.Open;
oBCodEmp:='';
if DMEmp.QRGeral.RecordCount>0 then
   Begin
   if trim(DMEmp.QRGeral.FieldByName('SENHA').Value)<>Trim(ESenhaEmpresa.Text) then
      Begin
      ShowMessage('Código acesso ou Senha inválida!');
      Exit;
      end;
   oBCodEmp:=DMEmp.QRGeral.FieldByName('CODIGO').AsString;
   ENomeEmpresa.Text:=DMEmp.QRGeral.FieldByName('NOME').Value;
   End;
end;



procedure TFSelecionaEmpresa.BitBtn2Click(Sender: TObject);
begin
Tag:=0;
Close;
end;

procedure TFSelecionaEmpresa.BitBtn1Click(Sender: TObject);
begin
Tag:=0;
if oBCodEmp<>'' then
   Begin
   Tag:=1;
   Close;
   End;
end;
end.
