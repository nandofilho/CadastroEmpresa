unit UEmpresas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls,DB, StdCtrls,
  ComCtrls;


type
  TFEmpresas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Bevel1: TBevel;
    Edit1: TEdit;
    SpeedButton4: TSpeedButton;
    RGOrdem: TRadioGroup;
    BitBtn1: TBitBtn;
    pb1: TProgressBar;
    Button1: TButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure RGOrdemClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
     { Public declarations }
   procedure IncluiEmpresa;
   procedure AlteraEmpresa;
   procedure Localiza;
  end;

var
  FEmpresas: TFEmpresas;
  pxCodigoCidade:integer;
  pvCampo:String;
implementation
uses UEmpresasMov, UDMEmp,UFuncoes,Useguro;
{$R *.dfm}

procedure TFEmpresas.SpeedButton1Click(Sender: TObject);
begin
Close;
end;

procedure TFEmpresas.SpeedButton4Click(Sender: TObject);
begin
Localiza;
end;

procedure TFEmpresas.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then
   Localiza;
end;

procedure TFEmpresas.FormCreate(Sender: TObject);
begin
DMEmp.TabelaFindKey('Empresa',DMEmp.TBEmpresas,['SITUA'],['N'],False);
end;

procedure TFEmpresas.SpeedButton2Click(Sender: TObject);
begin
IncluiEmpresa;
end;

procedure TFEmpresas.IncluiEmpresa;
var
obj:TFEmpresasMov;
cCodEmp:String;
  cChave: string;
begin
DMEmp.TBEmpresas.Append;
DMEmp.TBEmpresasID.value:=DMEmp.PegaSequencia(sqEmpresas);
cCodEmp:=StrZero(DMEmp.TBEmpresasID.value,4);
DMEmp.TBEmpresasSitua.value:='N';
cChave:=Seg_Complemento(cCodemp+cCodEmp,cCodemp);
DMEmp.TBEmpresasAcesso.Value:=Subs(cChave,1,4)+'.'+Subs(cChave,6,4);
DMEmp.TBEmpresasAcesso.Value:=TiraCaracterTexto(DMEmp.TBEmpresasAcesso.Value,'.');
DMEmp.TBEmpresasNome.Value:='';
DMEmp.setEmpresa(DMEmp.TBEmpresasId.Value);
Obj:=TFEmpresasMov.create(self);
 Try
 Obj.ShowModal;
 Finally
 Obj.free;
 End;
end;


procedure TFEmpresas.SpeedButton3Click(Sender: TObject);
begin
DMEmp.setEmpresa(DMEmp.TBEmpresasId.Value);
AlteraEmpresa;
end;


procedure TFEmpresas.AlteraEmpresa;
var
obj:TFEmpresasMov;
begin
DMEmp.TBEmpresas.Edit;
 try
 Obj:=TFEmpresasMov.create(self);
 Obj.EdSenha.Text   :=Descripto(trim(DMEmp.TBEmpresasSenha.Value));
 Obj.EdSenhaNet.Text:=Descripto(trim(DMEmp.TBEmpresasNetSenha.Value));
 Obj.ShowModal;
 Finally
 Obj.free;
 end;
end;

procedure TFEmpresas.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
//DMA.DesenhaGrid(Sender,Rect,DataCol,Column,State,DMD.QRBairrosCor.value,DBGrid1);
end;


procedure TFEmpresas.Localiza;
begin
if Edit1.Text='' then
   ShowMessage('Favor digite um nome')
else
   DMEmp.TBEmpresas.Locate('nome',Edit1.Text,[loPartialKey]);
DBGrid1.SetFocus
end;

procedure TFEmpresas.SpeedButton5Click(Sender: TObject);
begin
//if not DMEmp.ConfirmaDlg(SpeedButton5.Caption+' o usu�rio '+DMA.TBEmpresasNome.value) then
//   Exit;
DMEmp.setEmpresa(DMEmp.TBEmpresasId.Value);
DMEmp.TBEmpresas.Edit;
if PvCampo='E' then
   DMEmp.TBEmpresasSITUA.Value:='N'
else
   DMEmp.TBEmpresasSITUA.Value:='E';
DMEmp.TBEmpresas.Post;
DMEmp.UpCliDataSet(DMEmp.TBEmpresas);
DMEmp.TBEMpresas.Close;
DMEmp.TBEMpresas.CommandText:='Select * from empresa where situa='''+pvCampo+'''';
DMEmp.TBEMpresas.Open;
end;

procedure TFEmpresas.RGOrdemClick(Sender: TObject);
begin
if RGOrdem.ItemIndex=0 then
   Begin
   pvCampo:='N';
   Caption:='Usu�rios Ativados';
   SpeedButton5.Caption:='Desativa';
   End
else
   Begin
   pvCampo:='E';
   Caption:='Usu�rios desativados';
   SpeedButton5.Caption:='Ativa';
   End;
DMEmp.TBEMpresas.Close;
DMEmp.TBEMpresas.CommandText:='Select * from empresa where situa='''+pvCampo+'''';
DMEmp.TBEMpresas.Open;

end;

procedure TFEmpresas.BitBtn1Click(Sender: TObject);
begin
DMEmp.GeraDadosBasicosSistema(DMEmp.TBEmpresasID.AsString,PB1);

end;

procedure TFEmpresas.Button1Click(Sender: TObject);
begin
DMEmp.AcessaPessoa(Sender,DMEmp.TBEmpresasId.value,DMEmp.TBEmpresasNome.value,false);
end;

end.
