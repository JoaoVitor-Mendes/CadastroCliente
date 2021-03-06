unit uConsultaCEP;

interface

  uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
    REST.Types, REST.Client, Data.Bind.Components,Data.Bind.ObjectScope;

type
  TConsultaCEP = class
  private
    FCEP: String;
    RestClient: TRESTClient;
    RestRequest: TRESTRequest;
    RestResponse: TRESTResponse;

    procedure SetCEP(const Value: String);

  public
    constructor Create();Overload;
    destructor Destroy();
    function fConsultaCEP(CEP:string) : String;

  published

    property CEP:String read FCEP write SetCEP;

  end;



implementation

{ TConsultaCEP }

constructor TConsultaCEP.Create;
begin
  RestClient   := TRESTClient.Create(nil);
  RestRequest  := TRESTRequest.Create(nil);
  RestResponse := TRESTResponse.Create(nil);
end;

destructor TConsultaCEP.Destroy;
begin
  RestClient.Free;
  RestRequest.Free;
  RestResponse.Free;
end;

function TConsultaCEP.fConsultaCEP(CEP: string): String;
begin
  FCEP := CEP; // Se vier vazio, retorna exception

  RestClient.FallbackCharsetEncoding := 'utf-8';
  RestClient.SynchronizedEvents      := True;
  RestClient.BaseURL                 := 'viacep.com.br/ws/'+FCEP+'/json/';

  RestRequest.Accept        := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
  RestRequest.AcceptCharset := 'utf-8, *;q=0.8';
  RestRequest.Method        := rmGET;


  RestRequest.Client   := RestClient;
  RestRequest.Response := RestResponse;

  try
    RestRequest.Execute;
    Result := RestRequest.Response.JSONText;
  except on E: Exception do
    begin
      raise Exception.Create(E.ToString);
    end;
  end;

end;

procedure TConsultaCEP.SetCEP(const Value: String);
begin

  if (Value.IsEmpty) then
    raise Exception.Create('CEP n?o informado!');

  FCEP := Value;
end;

end.
