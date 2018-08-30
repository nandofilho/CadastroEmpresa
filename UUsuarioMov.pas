unit UUsuarioMov;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFUsuarioMov = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    EdNome: TEdit;
    Label2: TLabel;
    edAcesso: TEdit;
    Label3: TLabel;
    EdSenha: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUsuarioMov: TFUsuarioMov;

implementation

{$R *.dfm}

procedure TFUsuarioMov.Button1Click(Sender: TObject);
begin
Tag:=1;
Close;
end;

procedure TFUsuarioMov.Button2Click(Sender: TObject);
begin
Close;
end;

end.
