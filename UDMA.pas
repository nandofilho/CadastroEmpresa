unit UDMA;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect, SConnect,Registry,windows,Dialogs,
  Messages,  Graphics, Controls,
  StdCtrls,ExtCtrls,ComCtrls;

type
  TDMA = class(TDataModule)
    SockFinanceiro: TSocketConnection;
    TBGeral1: TClientDataSet;
    TBGeral2: TClientDataSet;
    TBEmpresas: TClientDataSet;
    DSEmpresas: TDataSource;
    TBEmpresasSMTP: TStringField;
    TBEmpresasSENHA: TStringField;
    TBEmpresasCODIGO: TIntegerField;
    TBEmpresasSITUA: TStringField;
    TBEmpresasNOME: TStringField;
    TBEmpresasACESSO: TStringField;
    TBEmpresasENDERECO: TStringField;
    TBEmpresasBAIRRO: TStringField;
    TBEmpresasCIDADE: TStringField;
    TBEmpresasESTADO: TStringField;
    TBEmpresasCEP: TStringField;
    TBEmpresasTEL: TStringField;
    TBEmpresasPOP3: TStringField;
    TBEmpresasEMAIL: TStringField;
    TBEmpresasWEBPAGE: TStringField;
    TBEmpresasABV: TStringField;
    TBEmpresasUSUARIO: TStringField;
    SocketSaida: TSocketConnection;
    QRSaida: TClientDataSet;
    QREntrada: TClientDataSet;
  private
    { Private declarations }
  Public
   procedure GeraDadosBasicosSistema(cCodEmp:String;PB1:TProgressBar);
   Function  PegaEmpresaPadrao:String;
   Function  UpCliDataSet(x:TClientDataSet):Boolean;
   Function  PegaSequencia(nCodMov:integer;ChecaDevolucao:Boolean=False):Integer;
   procedure TransfereDadosTabelas(cCodEmp,cArquivo:String;nTam:Integer);
   Function  TabelaFindKey(cFile:string;cDataSet:TClientDataSet;aCampos,aValor:array of String;bChecaEmpresa:Boolean=True):Boolean;
   { Public declarations }
  end;

var
  DMA: TDMA;
  oBCodEmp:String;
  sqCidades:Integer=101;

implementation

uses UDMEmp,UFuncoes;

{$R *.dfm}

Function TDMA.UpCliDataSet(x:TClientDataSet):Boolean;
var
nErros:integer;
begin
nErros:=0;
Result:=True;
if x.State in [dsInsert,dsEdit] then
   x.Post;
if x.ChangeCount>0 then
   nErros:=x.ApplyUpdates(-1);
if nErros>0 then
   begin
   ShowMessage('Aten��o : '+#13+'SQL: '+x.commandtext +#13 + 'Data set n�o atualizado');
   Result:=False;
   end;
end;

Function TDMA.PegaSequencia(nCodMov:integer;ChecaDevolucao:Boolean=False):Integer;
var
nConta:integer;
cCodMov,S,I,W:string;
begin
cCodMov:=IntToStr(nCodMov);
S:='select * from sequencia';
I:='Insert into sequencia(codemp,codmov,tipo,nroseq,Flag)';
W:=' where codmov='+cCodMov+ ' and codemp='+oBCodEmp;

DMA.TBGeral2.Close;
DMA.TBGeral2.CommandText:=S+W+' and '+'tipo=''S''';
DMA.TBGeral2.Open;
if (DMA.TBGeral2.RecordCount=0) then
    begin
    DMA.TBGeral2.Close;
    DMA.TBGeral2.CommandText:=I+'values ('+oBCodEmp+','+cCodMov+',''S'',2,''0'')';
    DMA.TBGeral2.Execute;
    Result:=1;
    Exit;
    end;
nConta:=0;
Result:=DMA.TBGeral2.FieldByName('NROSEQ').Value;
DMA.TBGERAL2.Close;
DMA.TBGeral2.CommandText:='Update sequencia set nroseq='+intToStr(Result+1)+W+' and tipo=''S''';
DMA.TBGeral2.Execute;
end;

Function TDMA.PegaEmpresaPadrao:String;
Begin
Result:='1000';
End;

procedure TDMA.GeraDadosBasicosSistema(cCodEmp:String;PB1:TProgressBar);
var
nTam,n:Integer;
aTabelas:array[0..100] of String;
begin
if cCodEmp='' then
   Begin
   ShowMessage('C�digo empresa em branco');
   Exit;
   End;
ATabelas[01]:='AGENTES';
ATabelas[02]:='CATEGORIAS';
ATabelas[03]:='';
ATabelas[04]:='COMUNICACAOASSUNTOS';
ATabelas[05]:='CONSTRUTORES';
ATabelas[06]:='';
ATabelas[07]:='EQUIPES';
ATabelas[08]:='ESTOQUEPLACAS';
ATabelas[10]:='FAIXASCOMISSAO';
ATabelas[11]:='GRUPOS';
ATabelas[12]:='HISTBAN';
ATabelas[13]:='IDIOMAS';
ATabelas[14]:='LOCAIS';
ATabelas[15]:='LOCALIZACAO';
ATabelas[16]:='MENSAGEMSPADRAO';
ATabelas[17]:='MENSAGENS';
ATabelas[18]:='MOTIVOS';
ATabelas[19]:='NOTAPARAMETROS';
ATabelas[20]:='OPERACOESCONTA';
ATabelas[21]:='OPERACOESITENS';
ATabelas[22]:='ORIGEMCONTATO';
ATabelas[23]:='PARAMETROS';
ATabelas[24]:='PARAMETROSCONTA';
ATabelas[25]:='PERMISSOESGRUPO';
ATabelas[26]:='PERMISSOESNIVEL';
ATabelas[27]:='PROBLEMATIPO';
ATabelas[28]:='SISTEMA';
ATabelas[29]:='SISTEMAGRUPO';
ATabelas[30]:='TABDESCRICAO';
ATabelas[31]:='TABELACOMISSOES';
ATabelas[32]:='TABFALHAACERTO';
ATabelas[34]:='TABSITUAPROPOSTA';
ATabelas[35]:='SISTEMAOBRAS';
ATabelas[36]:='TABPOSICAO';
ATabelas[37]:='TABVALORES';
ATabelas[38]:='TBAUXPROPOSTA';
ATabelas[39]:='TELEMARKETING';
ATabelas[40]:='TERCEIROS';
ATabelas[41]:='TERCEIROTROCAS';
ATabelas[42]:='TEXTOPADRAO';
ATabelas[43]:='TIPO_DOCUMENTO';
ATabelas[44]:='TIPOCLIENTE';
ATabelas[45]:='TIPOCOMPOSICAOIDM';
ATabelas[46]:='TIPOCOMPOSICAOOPCIDM';
ATabelas[47]:='TIPOCOMPOSICOES';
ATabelas[48]:='TIPOCOPOSICOESOPC';
ATabelas[49]:='TIPOCORRETOR';
ATabelas[50]:='TIPODEBITOS';
ATabelas[51]:='TIPOENDERECO';
ATabelas[52]:='TIPOGERENCIAS';
ATabelas[53]:='TIPOIMAGENS';
ATabelas[54]:='TIPOIMOVEL';
ATabelas[55]:='TIPOOPCOES';
ATabelas[56]:='TIPOOPERACAO';
ATabelas[57]:='TIPOPLACAS';
ATabelas[58]:='TIPORECLAMACOES';
ATabelas[59]:='TIPORECLAMACONSTRUTOR';
ATabelas[60]:='TIPOTAXAS';
ATabelas[61]:='TIPOTELEFONE';
ATabelas[62]:='TIPOUNIDADE';
ATabelas[63]:='TOTALIZAVENDAS';
ATabelas[64]:='CLIENTEBASE';
ATabelas[65]:='CLIENTECOMPLE';
ATabelas[66]:='CLIENTEENDERECO';
ATabelas[67]:='CLIENTEFISICO';
ATabelas[68]:='CLIENTEFONE';
ATabelas[69]:='CLIENTEJURIDICO';
ATabelas[70]:='CLIENTESSELECIONADOS';
ATabelas[71]:='CLIENTESTIPO';
ATabelas[72]:='CLIENTEUSUARIO';
ATabelas[73]:='CLIENTEUSUARIOPROG';
nTam:=73;
PB1.Max:=nTam;
PB1.Visible:=True;
for n:=1 to nTam do
    Begin
    PB1.Position:=n;
    if ATabelas[n]<>'' then
       TransfereDadosTabelas(cCodEmp,ATabelas[n],nTam);
    end;
PB1.Visible:=False;
end;

procedure TDMA.TransfereDadosTabelas(cCodEmp,cArquivo:String;nTam:Integer);
var
n:integer;
x,cVirgula,cCampo:String;
Begin
DMEmp.QRGeral.Close;
DMEmp.QRGeral.CommandText:='Select * from '+cArquivo+' where codemp='+cCodEmp;
DMEmp.QRGeral.Open;
if (DMEmp.QRGeral.RecordCount>0) then
    Begin
    DMEmp.QRGeral.Close;
    Exit;
    End;
For n:=0 to DMEmp.QRGeral.FieldCount-1 do
    Begin
//
//    DMA.TBGeral1.FieldDefs.Update;
//
    if (DMEmp.QRGeral.FieldDefs.Items[n].Name='CODEMP') then
       cCampo:=cCampo+cVirgula+cCodEmp
    else
       cCampo:=cCampo+cVirgula+DMEmp.QRGeral.FieldDefs.Items[n].Name;
    cVirgula:=',';
    End;
cCampo:='('+cCampo+')';
x:='Insert into  '+cArquivo;
x:=x+' Select '+cCampo+' From '+cArquivo+' where codemp='+DMA.PegaEmpresaPadrao;
DMEmp.QRGeral.FieldDefs.Clear;
DMEmp.QRGeral.Close;
DMEmp.QRGeral.CommandText:=x;
DMEmp.QRGeral.Execute;
End;

Function TDMGeral.TabelaFindKey(cFile:string;cDataSet:TClientDataSet;aCampos,aValor:array of String;bChecaEmpresa:Boolean=True):Boolean;
var
OldText:string;
nTam,ni:word;
x:string;
cComple:string;
begin
cDataSet.Close;
OldText:=cDataSet.CommandText;
X:='Select * FROM '+cFile;
if bChecaEmpresa then
   begin
   x:=x+' where '+DMEmp.ChecaEmpresa;
   cComple:=' and  ';
   end
else
   cComple:=' where ';
nTam:=Length(ACampos);
if nTam>0 then
   For ni:=0 to (nTam-1) do
       Begin
       if (aCampos[ni]<>'') and (aValor[ni]<>'') then
           begin
           X:=X+cComple+aCampos[ni]+'='''+TrocaTexto(aValor[ni],'''','')+'''';
           cComple:=' and ';
           end;
       End;
cDataSet.CommandText:=X;
cDataSet.Open;
if cDataSet.RecordCount=0 then
   Result:=false
else
   Result:=true;
end;


end.