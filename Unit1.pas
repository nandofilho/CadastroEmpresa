// 
// Created by the DataSnap proxy generator.
// 10/09/2014 1:19:03 PM
// 

unit Unit1;

interface

uses Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServerMethods1Client = class(TDSAdminClient)
  private
    FPegaUmaImagemCommand: TDBXCommand;
    FHoraConexaoCommand: TDBXCommand;
    FPegaImagemdeArquivoCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function PegaUmaImagem(nCodigo: Integer; cCodSeq: string; cCodEmp: string; nReducao: Integer): TStream;
    procedure HoraConexao(DataHora: TDateTime; cMensagem: string; Base: string; Usuario: string; Senha: string; Server: string);
    function PegaImagemdeArquivo(cLocal: string; cArquivo: string; nReducao: Integer): TStream;
  end;

  TServerMethods2Client = class(TDSAdminClient)
  private
    FMontaConexaoCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure MontaConexao(Base: string; Usuario: string; Senha: string; Server: string);
  end;

implementation

function TServerMethods1Client.PegaUmaImagem(nCodigo: Integer; cCodSeq: string; cCodEmp: string; nReducao: Integer): TStream;
begin
  if FPegaUmaImagemCommand = nil then
  begin
    FPegaUmaImagemCommand := FDBXConnection.CreateCommand;
    FPegaUmaImagemCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPegaUmaImagemCommand.Text := 'TServerMethods1.PegaUmaImagem';
    FPegaUmaImagemCommand.Prepare;
  end;
  FPegaUmaImagemCommand.Parameters[0].Value.SetInt32(nCodigo);
  FPegaUmaImagemCommand.Parameters[1].Value.SetWideString(cCodSeq);
  FPegaUmaImagemCommand.Parameters[2].Value.SetWideString(cCodEmp);
  FPegaUmaImagemCommand.Parameters[3].Value.SetInt32(nReducao);
  FPegaUmaImagemCommand.ExecuteUpdate;
  Result := FPegaUmaImagemCommand.Parameters[4].Value.GetStream(FInstanceOwner);
end;

procedure TServerMethods1Client.HoraConexao(DataHora: TDateTime; cMensagem: string; Base: string; Usuario: string; Senha: string; Server: string);
begin
  if FHoraConexaoCommand = nil then
  begin
    FHoraConexaoCommand := FDBXConnection.CreateCommand;
    FHoraConexaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FHoraConexaoCommand.Text := 'TServerMethods1.HoraConexao';
    FHoraConexaoCommand.Prepare;
  end;
  FHoraConexaoCommand.Parameters[0].Value.AsDateTime := DataHora;
  FHoraConexaoCommand.Parameters[1].Value.SetWideString(cMensagem);
  FHoraConexaoCommand.Parameters[2].Value.SetWideString(Base);
  FHoraConexaoCommand.Parameters[3].Value.SetWideString(Usuario);
  FHoraConexaoCommand.Parameters[4].Value.SetWideString(Senha);
  FHoraConexaoCommand.Parameters[5].Value.SetWideString(Server);
  FHoraConexaoCommand.ExecuteUpdate;
end;

function TServerMethods1Client.PegaImagemdeArquivo(cLocal: string; cArquivo: string; nReducao: Integer): TStream;
begin
  if FPegaImagemdeArquivoCommand = nil then
  begin
    FPegaImagemdeArquivoCommand := FDBXConnection.CreateCommand;
    FPegaImagemdeArquivoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPegaImagemdeArquivoCommand.Text := 'TServerMethods1.PegaImagemdeArquivo';
    FPegaImagemdeArquivoCommand.Prepare;
  end;
  FPegaImagemdeArquivoCommand.Parameters[0].Value.SetWideString(cLocal);
  FPegaImagemdeArquivoCommand.Parameters[1].Value.SetWideString(cArquivo);
  FPegaImagemdeArquivoCommand.Parameters[2].Value.SetInt32(nReducao);
  FPegaImagemdeArquivoCommand.ExecuteUpdate;
  Result := FPegaImagemdeArquivoCommand.Parameters[3].Value.GetStream(FInstanceOwner);
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TServerMethods1Client.Destroy;
begin
  FPegaUmaImagemCommand.DisposeOf;
  FHoraConexaoCommand.DisposeOf;
  FPegaImagemdeArquivoCommand.DisposeOf;
  inherited;
end;

procedure TServerMethods2Client.MontaConexao(Base: string; Usuario: string; Senha: string; Server: string);
begin
  if FMontaConexaoCommand = nil then
  begin
    FMontaConexaoCommand := FDBXConnection.CreateCommand;
    FMontaConexaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FMontaConexaoCommand.Text := 'TServerMethods2.MontaConexao';
    FMontaConexaoCommand.Prepare;
  end;
  FMontaConexaoCommand.Parameters[0].Value.SetWideString(Base);
  FMontaConexaoCommand.Parameters[1].Value.SetWideString(Usuario);
  FMontaConexaoCommand.Parameters[2].Value.SetWideString(Senha);
  FMontaConexaoCommand.Parameters[3].Value.SetWideString(Server);
  FMontaConexaoCommand.ExecuteUpdate;
end;


constructor TServerMethods2Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TServerMethods2Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TServerMethods2Client.Destroy;
begin
  FMontaConexaoCommand.DisposeOf;
  inherited;
end;

end.
