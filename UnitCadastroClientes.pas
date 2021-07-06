unit UnitCadastroClientes;

interface

uses
  System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Ani,
  FMX.Edit, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, System.JSON, idHTTP, IdSSLOpenSSL,
  IdTCPConnection, IdTCPClient, IdBaseComponent, IdComponent, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP, IdMessage, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Xml.XmlTransform, FMX.Objects,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors;

type
  TFormCadastroCliente = class(TForm)
    REC_body_color: TRectangle;
    LAYOUT_upper: TLayout;
    LAYOUT_body: TLayout;
    LAYOUT_lower: TLayout;
    REC_lower_color: TRectangle;
    REC_upper_color: TRectangle;
    LABEL_title: TLabel;
    REC_cadastrar: TRectangle;
    REC_cancelar: TRectangle;
    LAYOUT_button_cancelar: TLayout;
    LAYOUT_button_cadastrar: TLayout;
    LABEL_cadastrar: TLabel;
    LABEL_cancelar: TLabel;
    LAYOUT_center_body_right: TLayout;
    LAYOUT_body_center: TLayout;
    StyleBook: TStyleBook;
    LAYOUT_cep: TLayout;
    LABEL_cep: TLabel;
    EDIT_cep: TEdit;
    REC_cep: TRectangle;
    CepColorAnimation: TColorAnimation;
    LAYOUT_sair: TLayout;
    LAYOUT_confirmar_saida: TLayout;
    REC_background_color: TRectangle;
    LAYOUT_confirmar_body: TLayout;
    REC_confirmar_body_background: TRectangle;
    LAYOUT_confirmar_descrição: TLayout;
    LAYOUT_confirmar_buttons: TLayout;
    LABEL_confirmar_descrição: TLabel;
    LAYOUT_button_sim: TLayout;
    LAYOUT_button_não: TLayout;
    REC_button_não: TRectangle;
    REC_button_sim: TRectangle;
    LABEL_não: TLabel;
    LABEL_sim: TLabel;
    REC_separador: TRectangle;
    LAYOUT_endereço: TLayout;
    LAYOUT_endereço_left: TLayout;
    LAYOUT_endereço_right: TLayout;
    LAYOUT_logradouro: TLayout;
    LAYOUT_número: TLayout;
    LAYOUT_complemento: TLayout;
    LAYOUT_bairro: TLayout;
    LAYOUT_cidade: TLayout;
    LAYOUT_pais: TLayout;
    LAYOUT_estado: TLayout;
    LABEL_logradouro: TLabel;
    REC_logradouro: TRectangle;
    LogradouroColorAnimation: TColorAnimation;
    EDIT_logradouro: TEdit;
    LABEL_numero: TLabel;
    REC_numero: TRectangle;
    NumeroColorAnimation: TColorAnimation;
    EDIT_numero: TEdit;
    LABEL_complemento: TLabel;
    REC_complemento: TRectangle;
    ComplementoColorAnimation: TColorAnimation;
    EDIT_complemento: TEdit;
    LABEL_bairro: TLabel;
    REC_bairro: TRectangle;
    BairroColorAnimation: TColorAnimation;
    EDIT_bairro: TEdit;
    LABEL_cidade: TLabel;
    REC_cidade: TRectangle;
    CidadeColorAnimation: TColorAnimation;
    EDIT_cidade: TEdit;
    LABEL_estado: TLabel;
    REC_estado: TRectangle;
    EstadoColorAnimation: TColorAnimation;
    EDIT_estado: TEdit;
    LABEL_país: TLabel;
    REC_pais: TRectangle;
    PaisColorAnimation: TColorAnimation;
    EDIT_pais: TEdit;
    NetHTTPRequest: TNetHTTPRequest;
    NetHTTPClient: TNetHTTPClient;
    LAYOUT_loading: TLayout;
    REC_loading_background: TRectangle;
    CIRCLE_loading: TCircle;
    CircleFloatAnimation: TFloatAnimation;
    CadastrarColorAnimation: TColorAnimation;
    CancelarColorAnimation: TColorAnimation;
    SimColorAnimation: TColorAnimation;
    NãoColorAnimation: TColorAnimation;
    LINE_one: TLine;
    LINE_two: TLine;
    LAYOUT_center_body_left: TLayout;
    LAYOUT_nome: TLayout;
    LABEL_nome: TLabel;
    LAYOUT_identidade: TLayout;
    LABEL_identidade: TLabel;
    EDIT_identidade: TEdit;
    LAYOUT_telefone: TLayout;
    LABEL_telefone: TLabel;
    REC_telefone: TRectangle;
    TelefoneColorAnimation: TColorAnimation;
    EDIT_telefone: TEdit;
    LAYOUT_cpf: TLayout;
    LABEL_cpf: TLabel;
    REC_cpf: TRectangle;
    CpfColorAnimation: TColorAnimation;
    EDIT_cpf: TEdit;
    LAYOUT_email: TLayout;
    LABEL_email: TLabel;
    REC_email: TRectangle;
    EmailColorAnimation: TColorAnimation;
    EDIT_email: TEdit;
    EDIT_nome: TEdit;
    REC_identidade: TRectangle;
    IdentidadeColorAnimation: TColorAnimation;
    REC_nome: TRectangle;
    NomeColorAnimation: TColorAnimation;
    REC_nome_upper: TRectangle;
    REC_identidade_upper: TRectangle;
    REC_cpf_upper: TRectangle;
    REC_telefone_upper: TRectangle;
    REC_email_upper: TRectangle;
    REC_bairro_upper: TRectangle;
    REC_complemento_upper: TRectangle;
    REC_pais_upper: TRectangle;
    REC_estado_upper: TRectangle;
    REC_numero_upper: TRectangle;
    REC_logradouro_upper: TRectangle;
    REC_cidade_upper: TRectangle;
    REC_cep_upper: TRectangle;

    //Grupo de atividades: Sair da aplicação.
    procedure ConfirmarSaidaShow(Sender: TObject);
    procedure ConfirmarSaidaHide(Sender: TObject);
    procedure ConfirmarSaida(Sender: TObject);

    //Grupo de atividades: Buscar Endereço pelo CEP.
    procedure ConsultarCep(Cep: String);
    procedure ConsultarCepEnd(Sender: TObject);
    procedure EDIT_cepTyping(Sender: TObject);

    //Grupo de atividades: Realizar o cadastro.
    procedure cadastrarCliente(Sender: TObject);
    procedure enviarEmailEnd(Sender: TObject);
    procedure enviarEmail;
    procedure xmlCreate;

    //Grupo de atividades: KeyDown.
    procedure EDIT_cepKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure EDIT_identidadeKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure EDIT_cpfKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure EDIT_telefoneKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure EDIT_numeroKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure EDIT_nomeKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure EDIT_cidadeKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure EDIT_estadoKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure EDIT_paisKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);

     //Grupo de atividade: Validações.
     function ValidarCPF(pCPF: string): Boolean;

  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroCliente: TFormCadastroCliente;
  EnderecoJsonObj: TJSONObject;
  ThreadError: string;
  XML : IXMLDocument;

implementation

uses
   ActiveX, System.SysUtils, IdText, IdAttachmentFile, Math;
{$R *.fmx}

//Grupo de atividades: Sair da aplicação.
procedure TFormCadastroCliente.ConfirmarSaidaShow(Sender: TObject);
begin
  //desabilitando os campos, para que não seja possível editá-los
  //quando a tela for escurecida.
  EDIT_cep.Enabled := false;
  EDIT_logradouro.Enabled := false;
  EDIT_cidade.Enabled := false;
  EDIT_bairro.Enabled := false;
  EDIT_estado.Enabled := false;
  EDIT_complemento.Enabled := false;
  EDIT_pais.Enabled := false;
  layout_confirmar_saida.Visible := true;
end;

procedure TFormCadastroCliente.ConfirmarSaidaHide(Sender: TObject);
begin
  EDIT_cep.Enabled := true;
  EDIT_logradouro.Enabled := true;
  EDIT_cidade.Enabled := true;
  EDIT_bairro.Enabled := true;
  EDIT_estado.Enabled := true;
  EDIT_complemento.Enabled := true;
  EDIT_pais.Enabled := true;
  layout_confirmar_saida.Visible := false;
end;

procedure TFormCadastroCliente.ConfirmarSaida(Sender: TObject);
begin
  close;
end;

//Grupo de atividades: Buscar Endereço pelo CEP.
procedure TFormCadastroCliente.EDIT_cepTyping(Sender: TObject);
begin
  if EDIT_cep.Text.Length = 8 then
    ConsultarCEP(EDIT_cep.Text);
end;

procedure TFormCadastroCliente.ConsultarCep(Cep: String);
var
  t : TThread;
  Response: TStringStream;
begin
  t := TThread.CreateAnonymousThread(procedure
  begin
    //preparando o ambiente para realizar a consulta
    TThread.Synchronize(nil, procedure
    begin
      LAYOUT_loading.Visible := true;
      CircleFloatAnimation.Start;
      EDIT_cep.Enabled := false;
      EDIT_logradouro.Enabled := false;
      EDIT_cidade.Enabled := false;
      EDIT_bairro.Enabled := false;
      EDIT_estado.Enabled := false;
      EDIT_complemento.Enabled := false;
      EDIT_pais.Enabled := false;
    end);

    //tentativa de realização da consulta
    Try
      Response := TStringStream.Create('');
      NetHTTPRequest.Get('https://viacep.com.br/ws/' + Cep + '/json', Response);
      EnderecoJsonObj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes
                          (Utf8ToAnsi(Response.DataString)), 0) as TJSONObject;
    Except
    on E: Exception do
      ThreadError := ('Erro:' + e.Message);
    end;

    //preparando o ambiente pós consulta
    TThread.Synchronize(nil, procedure
    begin
      LAYOUT_loading.Visible := false;
      EDIT_cep.Enabled := true;
      EDIT_logradouro.Enabled := true;
      EDIT_cidade.Enabled := true;
      EDIT_bairro.Enabled := true;
      EDIT_estado.Enabled := true;
      EDIT_complemento.Enabled := true;
      EDIT_pais.Enabled := true;
    end);
  end);

  //ConsultarCepEnd é responsável por popular os edits da tela
  t.OnTerminate := ConsultarCepEnd;
  t.Start;
end;

procedure TFormCadastroCliente.ConsultarCepEnd(Sender: TObject);
begin
  if EnderecoJsonObj.Count > 1 then
  begin
    EDIT_logradouro.Text := EnderecoJsonObj.GetValue('logradouro').Value;
    EDIT_cidade.Text := EnderecoJsonObj.GetValue('localidade').Value;
    EDIT_bairro.Text := EnderecoJsonObj.GetValue('bairro').Value;
    EDIT_estado.Text := EnderecoJsonObj.GetValue('uf').Value;
    EDIT_complemento.Text := EnderecoJsonObj.GetValue('complemento').Value;
    EDIT_pais.Text := 'Brasil';

    if EDIT_telefone.Text.Length = 9 then
    begin
      EDIT_telefone.Text := EnderecoJsonObj.GetValue('ddd').Value+EDIT_telefone.Text;
    end;

    REC_cep.Stroke.Color := TAlphaColorRec.Black;
  end
  else
  begin
    REC_cep.Stroke.Color := TAlphaColorRec.Red;
    showMessage('CEP inválido ou não encontrado');
  end;

  //voltar o foco para o campo cep
 EDIT_cep.SetFocus;
end;

//Grupo de atividades: Cadastrar cliente.
procedure TFormCadastroCliente.cadastrarCliente(Sender: TObject);
var
  CountErro: integer;
begin
  CountErro := 0;

  //voltando as cores ao normal para caso o usuário tenha corrigido apenas um
  //campo, este não aponte novamente que está com erro.
  REC_nome.Stroke.Color := TAlphaColorRec.BLACK;
  REC_identidade.Stroke.Color := TAlphaColorRec.BLACK;
  REC_cpf.Stroke.Color := TAlphaColorRec.BLACK;
  REC_telefone.Stroke.Color := TAlphaColorRec.BLACK;
  REC_email.Stroke.Color := TAlphaColorRec.BLACK;
  REC_cep.Stroke.Color := TAlphaColorRec.BLACK;
  REC_logradouro.Stroke.Color := TAlphaColorRec.BLACK;
  REC_numero.Stroke.Color := TAlphaColorRec.BLACK;
  REC_complemento.Stroke.Color := TAlphaColorRec.BLACK;
  REC_bairro.Stroke.Color := TAlphaColorRec.BLACK;
  REC_cidade.Stroke.Color := TAlphaColorRec.BLACK;
  REC_estado.Stroke.Color := TAlphaColorRec.BLACK;
  REC_pais.Stroke.Color := TAlphaColorRec.BLACK;

  if (EDIT_nome.Text = '') or (EDIT_nome.Text.Length < 2) then
  begin
    REC_nome.Stroke.Color := TAlphaColorRec.RED;
    CountErro := CountErro+1;
  end;

  if (EDIT_identidade.Text = '') or (EDIT_identidade.Text.Length < 8)then
  begin
    REC_identidade.Stroke.Color := TAlphaColorRec.RED;
    CountErro := CountErro+1;
  end;

  if (EDIT_cpf.Text = '') or (NOT (ValidarCPF(EDIT_cpf.Text))) then
  begin
    REC_cpf.Stroke.Color := TAlphaColorRec.RED;
    CountErro := CountErro+1;
  end;

  if (EDIT_telefone.Text = '') or (EDIT_telefone.Text.Length < 11) then
  begin
    REC_telefone.Stroke.Color := TAlphaColorRec.RED;
    CountErro := CountErro+1;
  end;

  if (EDIT_email.Text = '') or (NOT (EDIT_email.Text.Contains('@'))) or (NOT
     (EDIT_email.Text.Contains(('.')))) then
  begin
    REC_email.Stroke.Color := TAlphaColorRec.RED;
    CountErro := CountErro+1;
  end;

  if EDIT_cep.Text = '' then
  begin
    REC_cep.Stroke.Color := TAlphaColorRec.RED;
    CountErro := CountErro+1;
  end;

  if EDIT_logradouro.Text = '' then
  begin
    REC_logradouro.Stroke.Color := TAlphaColorRec.RED;
    CountErro := CountErro+1;
  end;

  if EDIT_numero.Text = '' then
  begin
    REC_numero.Stroke.Color := TAlphaColorRec.RED;
    CountErro := CountErro+1;
  end;

  if EDIT_complemento.Text = '' then
  begin
    REC_complemento.Stroke.Color := TAlphaColorRec.RED;
    CountErro := CountErro+1;
  end;

  if EDIT_bairro.Text = '' then
  begin
    REC_bairro.Stroke.Color := TAlphaColorRec.RED;
    CountErro := CountErro+1;
  end;

  if EDIT_cidade.Text = '' then
  begin
    REC_cidade.Stroke.Color := TAlphaColorRec.RED;
    CountErro := CountErro+1;
  end;

  if EDIT_estado.Text = '' then
  begin
    REC_estado.Stroke.Color := TAlphaColorRec.RED;
    CountErro := CountErro+1;
  end;

  if EDIT_pais.Text = '' then
  begin
    REC_pais.Stroke.Color := TAlphaColorRec.RED;
    CountErro := CountErro+1;
  end;

  if CountErro > 0 then
  begin
    showmessage('Ops, parece que os campos destacados em vermelho não são'
                +' válidos. Corrija-os para prosseguir!');
    exit;
  end;

  //envio do email com os dados do usuário em formato html + um anexo em xml.
  enviarEmail;
end;

procedure TFormCadastroCliente.enviarEmail;
var
  SMTP: TIdSMTP;
  MSG: TIdMessage;
  XML : IXMLDocument;
  SSLSocket: TIdSSLIOHandlerSocketOpenSSL;
  t : TThread;
  Response: TStringStream;
  XMLPath: string;
  HTMLpart: TIdText;
  
begin
  ThreadError := '';
  t := TThread.CreateAnonymousThread(procedure
  begin
    try
      CoInitialize(nil);
      //preparando o ambiente para realizar o envio do email
      TThread.Synchronize(nil, procedure
      begin
        LAYOUT_loading.Visible := true;
        CircleFloatAnimation.Start;
        EDIT_cep.Enabled := false;
        EDIT_logradouro.Enabled := false;
        EDIT_cidade.Enabled := false;
        EDIT_bairro.Enabled := false;
        EDIT_estado.Enabled := false;
        EDIT_complemento.Enabled := false;
        EDIT_pais.Enabled := false;
      end);

      //criando os elementos envolvidos no envio
      SMTP := TIdSMTP.Create(nil);
      MSG := TIdMessage.Create(nil);
      SSLSocket := TIdSSLIOHandlerSocketOpenSSL.Create(nil);

      //Preparação do socket
      with SSLSocket do
      begin
        SSLOptions.Method := sslvTLSv1;
        SSLOptions.Mode := sslmUnassigned;
        SSLOptions.VerifyMode := [];
       SSLOptions.VerifyDepth := 0;
      end;

      //criando xml file com os dados inseridos nos edits
      xmlCreate;
      XMLPath := GetCurrentDir+'\DadosDoCliente.xml';

      //configurando o SMTP com as informações do envio
      with SMTP do
      begin
        IOHandler := SSLSocket;
        Host := 'smtp.gmail.com';
        Password := 'Gmcailem2@';
        Port := 587;
        Username := 'delphicodergm@gmail.com';
        useTLS := utUseExplicitTLS;
      end;

      //estabelencedo o corpo do email
      with MSG do
      begin
        From.Address := 'delphicodergm@gmail.com';
        From.Name := 'GMaciel';
        Recipients.Add;
        Recipients.Items[0].Address := EDIT_email.Text;
        Recipients.Items[0].Name := EDIT_nome.Text;
        Subject := 'Cadastro de Cliente';
        Encoding := meMIME;        
      end;   
      
      //parte html do email
      with HTMLpart do
      begin
        HTMLpart := TIdText.Create(MSG.MessageParts);
        ContentType:='text/html';
        Body.add('<h2>Cadastro do cliente efetuado com sucesso.</h2>');
        Body.add('<hr>');
        Body.add('<p><span style="font-family: Verdana, Geneva, sans-serif;">Nome:&nbsp;'+EDIT_nome.Text+'</span></p>');
        Body.add('<p><span style="font-family: Verdana, Geneva, sans-serif;">Identidade:&nbsp;'+EDIT_identidade.Text+'</span></p>');
        Body.add('<p><span style="font-family: Verdana, Geneva, sans-serif;">CPF:&nbsp;'+EDIT_cpf.Text+'</span></p>');
        Body.add('<p><span style="font-family: Verdana, Geneva, sans-serif;">Telefone:&nbsp;'+EDIT_telefone.Text+'</span></p>');
        Body.add('<p><span style="font-family: Verdana, Geneva, sans-serif;">Email:&nbsp;'+EDIT_email.Text+'</span></p>');
        Body.add('<p><span style="font-family: Verdana, Geneva, sans-serif;">Endere&ccedil;o:&nbsp;</span></p>');
        Body.add('<ul>');
        Body.add(    '<li>CEP:&nbsp;'+EDIT_cep.Text+'</li></p>');
        Body.add(    '<li>Logradouro:&nbsp;'+EDIT_logradouro.Text+'</li></p>');
        Body.add(    '<li>N&uacute;mero:&nbsp;'+EDIT_numero.Text+'</li></p>');
        Body.add(    '<li>Complemento:&nbsp;'+EDIT_complemento.Text+'</li></p>');
        Body.add(    '<li>Bairro:&nbsp;'+EDIT_bairro.Text+'</li></p>');
        Body.add(    '<li>Cidade:&nbsp;'+EDIT_cidade.Text+'</li></p>');
        Body.add(    '<li>Estado:&nbsp;'+EDIT_estado.Text+'</li></p>');
        Body.add(    '<li>Pa&iacute;s:&nbsp;'+EDIT_pais.Text+'</li></p>');
        Body.add('</ul>');
        Body.add('<hr>');
        Body.add('<p><br></p>');
        Body.add('<p><br></p>');
        Body.add('<p style="margin-left: 20px;"><br></p>');
      end;  

      //parte do anexo do email
      if FileExists(XMLPath) then
        TIdAttachmentFile.Create(MSG.MessageParts, XMLPath);   


      //conectando, enviando a mensagem e por fim, desconectando o SMTP.
      Try //try deve ser usado, paro o caso de não conseguir enviar a mensagem
          //para o email informado do cliente.
        SMTP.Connect();
        SMTP.Send(MSG);
        SMTP.Disconnect;
      Except
      on E: Exception do
        ThreadError := ('Erro: ' + E.Message);
      end;

      //liberando os arquivos criados anteriormente
      SMTP.free;
      MSG.free;
      SSLSocket.free;

      //preparando o ambiente pós envio
      TThread.Synchronize(nil, procedure
      begin
        LAYOUT_loading.Visible := false;
        EDIT_cep.Enabled := true;
        EDIT_logradouro.Enabled := true;
        EDIT_cidade.Enabled := true;
        EDIT_bairro.Enabled := true;
        EDIT_estado.Enabled := true;
        EDIT_complemento.Enabled := true;
        EDIT_pais.Enabled := true;
      end);

    finally
      CoUninitialize;
    end;
  end);

  //iniciando a thread criada acima
  t.OnTerminate := enviarEmailEnd;
  t.Start;
end;

procedure TFormCadastroCliente.enviarEmailEnd(Sender: TObject);
begin
  if ThreadError = '' then
  begin
    showmessage('Cadastro feito com sucesso. Enviamos os dados inseridos neste' 
                +' formulário para o email do cliente.');

    //limpando os campo, para caso o envio tenha ocorrido com sucesso, os campos
    //estejam disponíveis para um novo cadastro de cliente.
    EDIT_nome.Text := '';
    EDIT_identidade.Text := '';
    EDIT_cpf.Text := '';
    EDIT_telefone.Text := '';
    EDIT_email.Text := '';
    EDIT_cep.Text := '';
    EDIT_logradouro.Text := '';
    EDIT_numero.Text := '';
    EDIT_complemento.Text := '';
    EDIT_bairro.Text := '';
    EDIT_cidade.Text := '';
    EDIT_estado.Text := '';
    EDIT_pais.Text := '';
  end
  else
  begin
    REC_email.Stroke.Color := TAlphaColorRec.RED;
    showmessage('Não foi possível prosseguir com o cadastro do cliente. Favor'
                 +' verificar se o email está correto.');
  end;
end;

procedure TFormCadastroCliente.xmlCreate;
var
  RootNode, CurNode : IXMLNODE;
begin
  XML := NewXMLDocument;
  XML.Encoding := 'utf-8';
  XML.Options := [doNodeAutoIndent];
  RootNode := XML.AddChild('XML');
  CurNode := RootNode.AddChild('Cliente');
  CurNode := CurNode.AddChild('Dados');
  CurNode.Attributes['Nome'] := EDIT_nome.Text;
  CurNode.Attributes['Identidade'] := EDIT_identidade.Text;
  CurNode.Attributes['CPF'] := EDIT_cpf.Text;
  CurNode.Attributes['Telefone'] := EDIT_telefone.Text;
  CurNode.Attributes['Email'] := EDIT_email.Text;
  CurNode.Attributes['CEP'] := EDIT_cep.Text;
  CurNode.Attributes['Logradouro'] := EDIT_logradouro.Text;
  CurNode.Attributes['Numero'] := EDIT_numero.Text;
  CurNode.Attributes['Complemento'] := EDIT_complemento.Text;
  CurNode.Attributes['Bairro'] := EDIT_bairro.Text;
  CurNode.Attributes['Cidade'] := EDIT_cidade.Text;
  CurNode.Attributes['Estado'] := EDIT_estado.Text;
  CurNode.Attributes['Pais'] := EDIT_pais.Text;

  XML.SaveToFile(GetCurrentDir+'\DadosDoCliente.xml');

end;

//Grupo de atividades: KeyDown.
procedure TFormCadastroCliente.EDIT_cepKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
//não permitir que o cep possua mais que 8 caracteres
  if EDIT_cep.Text.Length+1 > 8 then
    KeyChar := #0;

//permitir apenas números no campo cep
  if NOT (CharInSet(KeyChar,['0'..'9',#8])) then KeyChar := #0;
end;

procedure TFormCadastroCliente.EDIT_identidadeKeyDown(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
//não permitir que o identidade possua mais que 8 caracteres
  if EDIT_identidade.Text.Length+1 > 8 then KeyChar := #0;

//permitir apenas números no campo identidade
  if NOT (CharInSet(KeyChar,['0'..'9',#8])) then KeyChar := #0;
end;

procedure TFormCadastroCliente.EDIT_nomeKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
//não permitir que o nome possua mais que 25 caracteres
  if EDIT_nome.Text.Length+1 > 25 then KeyChar := #0;

//permitir apenas letras, backspace e space no campo nome
  if (NOT (CharInSet(KeyChar,['A'..'Z',#199, #8,#32])) and
     (NOT (CharInSet(KeyChar,['a'..'z',#231])))) then KeyChar := #0;

//primeira letra sempre em maiusculo, mesmo no sobrenome
  if ((EDIT_nome.Text.Length = 0) or (EDIT_nome.Text[EDIT_nome.Text.Length] = ' '))
    then KeyChar := AnsiUpperCase(KeyChar)[1];
end;

procedure TFormCadastroCliente.EDIT_numeroKeyDown(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
//não permitir que o numero do endereço possua mais que 10 caracteres
  if EDIT_numero.Text.Length+1 > 10 then KeyChar := #0;

//permitir apenas números no campo numero do endereço
  if NOT (CharInSet(KeyChar,['0'..'9',#8])) then KeyChar := #0;
end;

procedure TFormCadastroCliente.EDIT_paisKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
//permitir apenas letras, backspace e space no campo pais
  if (NOT (CharInSet(KeyChar,['A'..'Z',#199, #8,#32])) and
     (NOT (CharInSet(KeyChar,['a'..'z',#231])))) then KeyChar := #0;

//primeira letra sempre em maiusculo
  if ((EDIT_pais.Text.Length = 0) or (EDIT_pais.Text[EDIT_pais.Text.Length] = ' '))
    then KeyChar := AnsiUpperCase(KeyChar)[1];
end;

procedure TFormCadastroCliente.EDIT_telefoneKeyDown(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
//não permitir que o telefone possua mais que 8 caracteres
  if EDIT_telefone.Text.Length+1 > 11 then KeyChar := #0;

//permitir apenas números no campo telefone
  if NOT (CharInSet(KeyChar,['0'..'9',#8])) then KeyChar := #0;
end;

procedure TFormCadastroCliente.EDIT_cpfKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
//não permitir que o cpf possua mais que 11 caracteres
  if EDIT_cpf.Text.Length+1 > 11 then KeyChar := #0;

//permitir apenas números no campo cpf
  if NOT (CharInSet(KeyChar,['0'..'9',#8])) then KeyChar := #0;
end;

procedure TFormCadastroCliente.EDIT_estadoKeyDown(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
//permitir apenas letras, backspace e space no campo estado
  if (NOT (CharInSet(KeyChar,['A'..'Z',#199, #8,#32])) and
     (NOT (CharInSet(KeyChar,['a'..'z',#231])))) then KeyChar := #0;

//primeira letra sempre em maiusculo
  if ((EDIT_estado.Text.Length = 0) or (EDIT_estado.Text[EDIT_nome.Text.Length] = ' '))
    then KeyChar := AnsiUpperCase(KeyChar)[1];
end;

procedure TFormCadastroCliente.EDIT_cidadeKeyDown(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
//permitir apenas letras, backspace e space no campo cidade
  if (NOT (CharInSet(KeyChar,['A'..'Z',#199, #8,#32])) and
     (NOT (CharInSet(KeyChar,['a'..'z',#231])))) then KeyChar := #0;

//primeira letra sempre em maiusculo, mesmo no sobrenome
  if ((EDIT_cidade.Text.Length = 0) or (EDIT_cidade.Text[EDIT_nome.Text.Length] = ' '))
    then KeyChar := AnsiUpperCase(KeyChar)[1];
end;


//Grupo de atividade: Validações.
function TFormCadastroCliente.ValidarCPF(pCPF: string): Boolean;
var
  v: array [0 .. 1] of Word;
  cpf: array [0 .. 10] of Byte;
  I: Byte;
begin
  Result := False;

  { Verificando se tem 11 caracteres }
  if Length(pCPF) <> 11 then
  begin
    Exit;
  end;

  { Conferindo se todos dígitos são iguais }
  if pCPF = StringOfChar('0', 11) then
    Exit;

  if pCPF = StringOfChar('1', 11) then
    Exit;

  if pCPF = StringOfChar('2', 11) then
    Exit;

  if pCPF = StringOfChar('3', 11) then
    Exit;

  if pCPF = StringOfChar('4', 11) then
    Exit;

  if pCPF = StringOfChar('5', 11) then
    Exit;

  if pCPF = StringOfChar('6', 11) then
    Exit;

  if pCPF = StringOfChar('7', 11) then
    Exit;

  if pCPF = StringOfChar('8', 11) then
    Exit;

  if pCPF = StringOfChar('9', 11) then
    Exit;

  try
    for I := 1 to 11 do
      cpf[I - 1] := StrToInt(pCPF[I]);
    // Nota: Calcula o primeiro dígito de verificação.
    v[0] := 10 * cpf[0] + 9 * cpf[1] + 8 * cpf[2];
    v[0] := v[0] + 7 * cpf[3] + 6 * cpf[4] + 5 * cpf[5];
    v[0] := v[0] + 4 * cpf[6] + 3 * cpf[7] + 2 * cpf[8];
    v[0] := 11 - v[0] mod 11;
    v[0] := IfThen(v[0] >= 10, 0, v[0]);
    // Nota: Calcula o segundo dígito de verificação.
    v[1] := 11 * cpf[0] + 10 * cpf[1] + 9 * cpf[2];
    v[1] := v[1] + 8 * cpf[3] + 7 * cpf[4] + 6 * cpf[5];
    v[1] := v[1] + 5 * cpf[6] + 4 * cpf[7] + 3 * cpf[8];
    v[1] := v[1] + 2 * v[0];
    v[1] := 11 - v[1] mod 11;
    v[1] := IfThen(v[1] >= 10, 0, v[1]);
    // Nota: Verdadeiro se os dígitos de verificação são os esperados.
    Result := ((v[0] = cpf[9]) and (v[1] = cpf[10]));
  except
    on E: Exception do
      Result := False;
  end;
end;

end.
