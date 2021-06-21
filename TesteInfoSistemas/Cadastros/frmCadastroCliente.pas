unit frmCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.StorageBin, REST.Types, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, uConsultaCEP, System.JSON.Readers, System.JSON.Types,
  System.JSON.Writers,System.JSON,ACBrBase,ACBrMail,XMLDoc, XMLIntf, Vcl.Buttons,
  Vcl.Mask, Vcl.ComCtrls;

type
  TformCadastroCliente = class(TForm)
    pnTop: TPanel;
    btExcluir: TButton;
    btGravar: TButton;
    btIncluir: TButton;
    btCancelar: TButton;
    pnCadastro: TPanel;
    edNome: TEdit;
    Panel1: TPanel;
    edNrIdentidade: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    edCpf: TEdit;
    Panel4: TPanel;
    edEmail: TEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    dbgRegistros: TDBGrid;
    edLogradouro: TEdit;
    Panel11: TPanel;
    edNumero: TEdit;
    Panel12: TPanel;
    Panel13: TPanel;
    edComplemento: TEdit;
    Panel14: TPanel;
    edBairro: TEdit;
    edCidade: TEdit;
    Panel15: TPanel;
    Panel16: TPanel;
    edEstado: TEdit;
    edNomePais: TEdit;
    Panel17: TPanel;
    memRegistros: TFDMemTable;
    dsRegistros: TDataSource;
    memRegistrosNOME: TStringField;
    memRegistrosCPF: TStringField;
    memRegistrosNR_IDENTIDADE: TStringField;
    memRegistrosTELEFONE: TStringField;
    memRegistrosEMAIL: TStringField;
    memRegistrosCEP: TStringField;
    memRegistrosLOGRADOURO: TStringField;
    memRegistrosCOMPLEMENTO: TStringField;
    memRegistrosBAIRRO: TStringField;
    memRegistrosCIDADE: TStringField;
    memRegistrosESTADO: TStringField;
    memRegistrosPAIS: TStringField;
    ACBrMail1: TACBrMail;
    btBuscar: TBitBtn;
    edCep: TMaskEdit;
    edTelefone: TMaskEdit;
    ProgressBar1: TProgressBar;
    lbStatus: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btBuscarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsRegistrosDataChange(Sender: TObject; Field: TField);
    procedure btCancelarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure edCpfKeyPress(Sender: TObject; var Key: Char);
    procedure edCepExit(Sender: TObject);
  private
    { Private declarations }
    procedure pHabilitaEdits(bool : boolean);
    procedure pLimpaEdits();
    procedure fPopulaDadosCEP(Response:string);
    procedure pEnviarEmail();
    function  fIsEmpty(edit: TEdit):Boolean; Overload;
    function  fIsEmpty(edit: TMaskEdit):Boolean; Overload;

    function fRetornarJsonObject(const DsJsonPair: string;
      StrJson: string): Variant;
  public
    { Public declarations }
  end;

var
  formCadastroCliente: TformCadastroCliente;

implementation

{$R *.dfm}

procedure TformCadastroCliente.btBuscarClick(Sender: TObject);
var
  oConsultaCEP: TConsultaCEP;
  Response: string;
begin
  oConsultaCEP    := TConsultaCEP.Create;
  try
    Response := '';
    Response := (oConsultaCEP.fConsultaCEP(edCep.Text));

    fPopulaDadosCEP(Response);

  except on E: Exception do
    begin
      ShowMessage(E.ToString);
      exit;
    end;
  end;


  oConsultaCEP.Free;

end;

procedure TformCadastroCliente.btCancelarClick(Sender: TObject);
begin
  dsRegistros.DataSet.Cancel;
  pLimpaEdits();
  pHabilitaEdits(False);
end;

procedure TformCadastroCliente.btExcluirClick(Sender: TObject);
begin

  if (memRegistros.RecordCount <= 0) then
  begin
    MessageDlg('Nenhum registro selecionado para Exclusão!',mtError,[mbOK],0);
    exit;
  end;

  if MessageDlg('Você tem certeza que deseja excluir o registro?',mtConfirmation,[mbyes,mbno],0)=mryes
  then
  begin
    memRegistros.Delete;
  end;

end;

procedure TformCadastroCliente.btGravarClick(Sender: TObject);
var
  panelLoading: TPanel;
begin

  if (fIsEmpty(edNome)) then
  begin
    ShowMessage('Inormar Nome');
    edNome.SetFocus;
    exit;
  end;

  if (fIsEmpty(edCpf)) then
  begin
    ShowMessage('Informar CPF');
    edCpf.SetFocus;
    exit;
  end;

  if (fIsEmpty(edEmail)) then
  begin
    ShowMessage('Informar Email');
    edEmail.SetFocus;
    exit;
  end;

  if (fIsEmpty(edCep)) then
  begin
    ShowMessage('Informar o CEP');
    edCep.SetFocus;
    exit;
  end;

  try
    memRegistrosNOME.AsString          := edNome.Text;
    memRegistrosCPF.AsString           := edCpf.Text;
    memRegistrosNR_IDENTIDADE.AsString := edNrIdentidade.Text;
    memRegistrosTELEFONE.AsString      := edTelefone.Text;
    memRegistrosEMAIL.AsString         := edEmail.Text;
    memRegistrosCEP.AsString           := edCep.Text;
    memRegistrosLOGRADOURO.AsString    := edLogradouro.Text;
    memRegistrosBAIRRO.AsString        := edBairro.Text;
    memRegistrosCIDADE.AsString        := edCidade.Text;
    memRegistrosESTADO.AsString        := edEstado.Text;
    memRegistrosPAIS.AsString          := edNomePais.Text;
    memRegistros.Post;

  except on E: Exception do
    begin
      ShowMessage(E.ToString);
      exit;
    end;
  end;

  lbStatus.Visible     := True;
  lbStatus.Caption     := 'Aguarde, Enviando Email ...';
  Application.ProcessMessages;

  try
    pEnviarEmail(); //Enviar Email
  except on E: Exception do

  end;

  pLimpaEdits();

end;

procedure TformCadastroCliente.btIncluirClick(Sender: TObject);
begin
  pHabilitaEdits(True);
  pLimpaEdits();

  try
    if not (memRegistros.Active) then
      memRegistros.Active := True;

    memRegistros.Insert;

    edNome.SetFocus;

  except on E: Exception do
    begin
      ShowMessage(E.ToString);
      exit;
    end;
  end;

end;

procedure TformCadastroCliente.dsRegistrosDataChange(Sender: TObject;
  Field: TField);
begin
  if dsRegistros.DataSet.State in ([dsInsert, dsEdit]) then
  begin
    btIncluir.Visible  := False;
    btCancelar.Visible := True;
    btGravar.Visible   := True;
    btExcluir.Visible  := False;
  end
  else
  begin
    btGravar.Visible   := False;
    btCancelar.Visible := False;
    btExcluir.Visible  := True;
    btIncluir.Visible  := True;
  end;
end;

procedure TformCadastroCliente.edCepExit(Sender: TObject);
begin
  btBuscar.OnClick(nil);
end;

procedure TformCadastroCliente.edCpfKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #8 then
      exit;

  if Length(edCpf.Text) = 3 then
  begin
    edCpf.Text := edCpf.Text + '.';
    edCpf.Selstart := Length(edCpf.text);
  end;

  if Length(edCpf.Text) = 7 then
  begin
    edCpf.Text := edCpf.Text + '.';
    edCpf.Selstart := Length(edCpf.text);
  end;

  if Length(edCpf.Text) = 11 then
  begin
    edCpf.Text := edCpf.Text + '-';
    edCpf.Selstart := Length(edCpf.text);
  end;

end;

function TformCadastroCliente.fIsEmpty(edit: TMaskEdit): Boolean;
begin
  if (Trim(edit.Text) = '') then Result := True;
end;

function TformCadastroCliente.fIsEmpty(edit: TEdit): Boolean;
begin
  if (Trim(edit.Text) = '') then Result := True;
end;

procedure TformCadastroCliente.FormCreate(Sender: TObject);
begin
  pHabilitaEdits(False);
end;

procedure TformCadastroCliente.FormShow(Sender: TObject);
begin
  btIncluir.SetFocus;
end;

procedure TformCadastroCliente.fPopulaDadosCEP(Response: string);
begin
  if (Response.IsEmpty) then
  begin
    ShowMessage('CEP inválido!');
    exit;
  end;

  edLogradouro.Text  := fRetornarJsonObject('logradouro',Response);
  edComplemento.Text := fRetornarJsonObject('complemento',Response);
  edBairro.Text      := fRetornarJsonObject('bairro',Response);
  edCidade.Text      := fRetornarJsonObject('localidade',Response);
  edEstado.Text      := fRetornarJsonObject('uf',Response);
  edNomePais.Text    := 'Brasil'; //Não retorna na api

end;

function TformCadastroCliente.fRetornarJsonObject(const DsJsonPair: string;
  StrJson: string): Variant;
var
  PairObjetoResponse: TJSONPair;
  StringReader:TStringReader;
  JsonReader:TJsonTextReader;
begin
  StringReader := TStringReader.Create(StrJson);
  try
    JsonReader := TJsonTextReader.Create(StringReader);
    try
      while JsonReader.Read do
      begin
        if JsonReader.TokenType = TJsonToken.StartObject  then
        begin
          while (JsonReader.Read) do
          begin
            if (JsonReader.TokenType = TJsonToken.PropertyName) then
            begin
              if (JsonReader.Value.ToString = DsJsonPair) then
              begin
                JsonReader.Read;
                Result := JsonReader.Value.AsVariant;
                Break;
              end;
            end;
          end;
        end;
      end;
    finally
      JsonReader.Free;
    end;
  finally
    StringReader.Free;
  end;
end;

procedure TformCadastroCliente.pEnviarEmail;
var
  memoDadosCadastro: TMemo;
  XMLDocument: TXMLDocument;
  NodeTabela: IXMLNode;
  NodeDados: IXMLNode;
  NodeEndereco: IXMLNode;
  XML: string;
  MS: TMemoryStream;
  ArqXML: string;
  Dir: string;
  x: integer;
begin
  ACBrMail1.Clear;
  ACBrMail1.Subject        := 'Dados Cadastrais';
  ACBrMail1.From           := 'naorespondertesteinfo@gmail.com';
  ACBrMail1.FromName       := 'Dados Cadastrais - '+edNome.Text;
  ACBrMail1.Host           := 'smtp.gmail.com';
  ACBrMail1.Username       := 'naorespondertesteinfo@gmail.com';
  ACBrMail1.Password       := 'Senhaemail$$';
  ACBrMail1.Port           := '587';
  ACBrMail1.SetTLS         := true;
//  ACBrMail1.SetSSL         := chkSSL.Checked;  // Verifique se o seu servidor necessita SSL
  ACBrMail1.DefaultCharset := TMailCharset(27); //UTF-8
  ACBrMail1.IDECharset     := TMailCharset(15); //CP1252

  ACBrMail1.AddAddress(edEmail.Text, edNome.Text);

  memoDadosCadastro         := TMemo.Create(Self);
  memoDadosCadastro.Visible := false;
  memoDadosCadastro.Parent  := self;

  memoDadosCadastro.Lines.Add('--Dados Cadastrais--');
  memoDadosCadastro.Lines.Add('Nome: '+edNome.Text);
  memoDadosCadastro.Lines.Add('CPF: '+edCpf.Text);
  memoDadosCadastro.Lines.Add('Nr° Identidade: '+edNrIdentidade.Text);
  memoDadosCadastro.Lines.Add('Telefone: '+edTelefone.Text);
  memoDadosCadastro.Lines.Add('Email: '+edEmail.Text);
  memoDadosCadastro.Lines.Add('CEP: '+edCep.Text);
  memoDadosCadastro.Lines.Add('Logradouro: '+edLogradouro.Text);
  memoDadosCadastro.Lines.Add('Número: '+edNumero.Text);
  memoDadosCadastro.Lines.Add('Complemento '+edComplemento.Text);
  memoDadosCadastro.Lines.Add('Bairro: '+edBairro.Text);
  memoDadosCadastro.Lines.Add('Cidade: '+edCidade.Text);
  memoDadosCadastro.Lines.Add('Estado: '+edEstado.Text);
  memoDadosCadastro.Lines.Add('País: '+edNomePais.Text);

  ACBrMail1.AltBody.Assign(memoDadosCadastro.Lines);

  XMLDocument := TXMLDocument.Create(Self);
  try
    XMLDocument.Active := True;

    NodeTabela := XMLDocument.AddChild('Cadastro-Cliente');
    NodeDados  := NodeTabela.AddChild('Dados');

    NodeDados.ChildValues['Nome']       := edNome.Text;
    NodeDados.ChildValues['CPF']        := edCpf.Text;
    NodeDados.ChildValues['Identidade'] := edNrIdentidade.Text;
    NodeDados.ChildValues['Telefone']   := edTelefone.Text;
    NodeDados.ChildValues['Email']      := edEmail.Text;

    NodeEndereco := NodeDados.AddChild('Endereco');

    NodeEndereco.ChildValues['CEP']         := edCep.Text;
    NodeEndereco.ChildValues['Logradouro']  := edLogradouro.Text;
    NodeEndereco.ChildValues['Numero']      := edNumero.Text;
    NodeEndereco.ChildValues['Complemento'] := edComplemento.Text;
    NodeEndereco.ChildValues['Bairro']      := edBairro.Text;
    NodeEndereco.ChildValues['Cidade']      := edCidade.Text;
    NodeEndereco.ChildValues['Estado']      := edEstado.Text;
    NodeEndereco.ChildValues['Pais']        := edNomePais.Text;

    MS := TMemoryStream.Create;
    XMLDocument.SaveToStream(MS);

    //XML := XMLDocument.XML.Text;
  finally
    XMLDocument.Free;
  end;

  try
    MS.LoadFromStream(MS);
    ACBrMail1.AddAttachment(MS, 'Cadastro-Cliente.xml',adAttachment);
  finally
    MS.Free;
    memoDadosCadastro.Free;
  end;

  try
    ACBrMail1.Send(false);

    ProgressBar1.Visible := True;

    x := 0;
    while x < 100 do
    begin
      ProgressBar1.Position := x;
      x := x + 1;
    end;

    ShowMessage('Email enviado com sucesso no endereço: '+edEmail.Text);

  except on E: Exception do
    ShowMessage('Não foi possível enviar o email no endereço: '+edEmail.Text + '. Endereço de email inválido ou inexistente!');
  end;

  ProgressBar1.Position := 0;
  lbStatus.Visible      := False;
  btIncluir.SetFocus;
end;

procedure TformCadastroCliente.pHabilitaEdits(bool: boolean);
var
  i: Integer;
begin
  for i := Self.ComponentCount -1 downto 0 do
  begin
    if (Self.Components[i] is TEdit) then
    begin
      (Self.Components[i] as TEdit).Enabled     := bool;
    end;
  end;
  edCep.Enabled      := bool;
  edTelefone.Enabled := bool;
  btBuscar.Enabled   := bool;
end;

procedure TformCadastroCliente.pLimpaEdits;
var
  i: Integer;
begin
  for i := Self.ComponentCount -1 downto 0 do
  begin
    if (Self.Components[i] is TEdit) then
       (Self.Components[i] as TEdit).Text := '';
  end;
  edCep.Clear;
  edTelefone.Clear;
end;

end.
