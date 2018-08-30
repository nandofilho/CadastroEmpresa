unit UEmpresasMov;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, ExtDlgs, Buttons, ExtCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP,DB,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Components, Data.Bind.DBScope;

type
  TFEmpresasMov = class(TForm)
    GB1: TGroupBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    OP1: TOpenPictureDialog;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Panel1: TPanel;
    GB2: TGroupBox;
    SpeedButton1: TSpeedButton;
    Label12: TLabel;
    Label14: TLabel;
    DBEdit11: TDBEdit;
    DBEdit14: TDBEdit;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn2: TBitBtn;
    Label16: TLabel;
    DBEdit15: TDBEdit;
    Button1: TButton;
    Label15: TLabel;
    BitBtn5: TBitBtn;
    Image1: TImage;
    BindingsList1: TBindingsList;
    BindSourceDB1: TBindSourceDB;
    LinkControlToFieldfoto: TLinkControlToField;
    EdSenhaNet: TEdit;
    EdSenha: TEdit;
    Button2: TButton;
    Label17: TLabel;
    DBEdit12: TDBEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEmpresasMov: TFEmpresasMov;

implementation

uses UDMEmp,ufuncoes;

{$R *.DFM}

procedure TFEmpresasMov.BitBtn1Click(Sender: TObject);
begin
if (DMEmp.DSEmpresas.State=dsInsert) or (DMEmp.DSEmpresas.State=dsEdit) then
    begin
    DMEmp.TBEmpresasnetsenha.Value:=Cripto(trim(EdSenhaNet.Text));
    DMEmp.TBEmpresassenha.Value   :=Cripto(trim(EdSenha.Text));
    DMEmp.TBEmpresas.post;
    end;
DMEmp.CriaNovoUsuario(DMEmp.TBEmpresasId.Value,DMEmp.TBEmpresasNome.Value);
DMEmp.UpCliDataSet(DMEmp.TBEmpresas);
close;
end;

procedure TFEmpresasMov.Button1Click(Sender: TObject);
begin
//SMTP.AuthenticationType := atLogin;
//Smtp.Host:=DMA.TBEmpresassmtp.Value;
//Smtp.UserId:=DMA.TBEmpresausuario.Value;
//Smtp.Password:=DMA.TBEmpresassenha.Value;
//Conecta com o servidor
//try
//try
// SMTP.Connect;
// except on Exception do
//   begin
//   ShowMessage('N�o foi possivel encontrar o servidor. Endere�o invalido');
//   EXIT;
//   end;
// end;
//try
// SMTP.Authenticate;
// except on Exception do
//   begin
//   ShowMessage('N�o foi possivel fazer a autentica�ao. Usuario ou senha invalidos..');
//   abort;
//   end;
// end;
// IF SMTP.Connected then
//    ShowMessage('Conectado com sucesso.');
//finally
//SMTP.Disconnect;
//end;
end;

procedure TFEmpresasMov.Button2Click(Sender: TObject);
begin
DMEmp.AcessaPessoa(Sender,DMEmp.TBEmpresasId.value,DMEmp.TBEmpresasNome.value,false);
end;

procedure TFEmpresasMov.SpeedButton1Click(Sender: TObject);
begin
if OP1.Execute then
   begin
   DMEmp.TBEmpresas.Edit;
   DMEmp.TBEmpresasFoto.LoadFromFile(OP1.FileName);
   DMEmp.TBEmpresas.Post;
   end;
end;

procedure TFEmpresasMov.BitBtn5Click(Sender: TObject);
begin
if (DMEmp.DSEmpresas.State=dsInsert) or (DMEmp.DSEmpresas.State=dsEdit) then
    DMEmp.TBEmpresas.Cancel;
Close;
end;

end.
