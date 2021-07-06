# CadastroDeClientess

Caso queira apenas testar a aplicação:
1. baixe o repositório, ou apenas a pasta "Debug";
2. clique duas vezes no executável "Cailem.exe";
   - Como se trata de um projeto "Debug" e não "Release", seu sistema operacional provavelmente irá alertar sobre a confiabilidade de fonte. Para prosseguir com o teste, é necessário "Confiar na fonte".

3. Ao clicar no executável, a seguinte tela aparecerá:
![image](https://user-images.githubusercontent.com/52551449/124604447-54b01b00-de41-11eb-9a90-f1d7857fa11f.png)

4. Alguns detalhes sobre os campos:
   - O campo "Nome" apenas aceitará letras;
   - No campo "Identidade" apenas números serão aceitos e a quantiadade é baseada no "RG" (documento nacional de identificação civil no Brasil);
   - No campo "CPF" apenas números serão aceitos e a quantiadade é baseada documento referente ao cadastro de pessoas físicas;
   - O campo "Telefone" aceitará apenas números;
   - O campo "Email" aceitará qualquer caractere. Este campo é usado para enviar os dados deste formulário em formato "TXT" e "XML";
   - Para o campo "CEP", ao digitar o oitavo caractere, o recurso criado em thread consumirá dados da api "Via Cep" (https://viacep.com.br/). Os dados em "JSON", populam os campos "Logradouro", "Bairro", "Cidade", 'Estado", "País" e possivelmente o campo "Telefone". Caso o campo "Telefone" possua apenas 9 caracteres, o "DDD" da região do CEP pesquisado será incluído no inicio campo, completando os 11 digitos de um telefone brasileiro. 
   - O campo "Logradouro" aceitará qualquer caractere;
   - O campo "Número" aceitará apenas números;
   - O campo "Complemento" aceitará qualquer caractere;
   - O campo "Bairro" aceitará qualquer caractere;  
   - O campo "Cidade" aceitará apenas letras;  
   - O campo "Estado" aceitará apenas letras;    
   - O campo "País" aceitará apenas letras; 
 5. Sobre os botões na tela:
    - O botão "Cadastrar" verificará as permissões de cada campo, e determinará se o usuário poderá continuar com a ação ou não. Caso um campo estava violando alguma permissão, o mesmo será marcado em vermelho. Caso o botão "Cadastrar" for acionado novamente, e um campo for corrigido corretamente, este deixará de sinalizar um highlight em vermelho.
    - O botão "Cancelar" perguntará se deseja sair da aplicação. Caso clique em "Sim", a aplicação se encerrará. Caso clique em "Não", a aplicação voltará ao seu estado anterior. Caso clique na área escurecida, a aplicação também voltará ao seu estado anterior.
    - O botão "X", no campo superior esquerdo, perguntará se deseja sair da aplicação. Caso clique em "Sim", a aplicação se encerrará. Caso clique em "Não", a aplicação voltará ao seu estado anterior. Caso clique na área escurecida, a aplicação também voltará ao seu estado anterior.  
 6. Sobre o cadastro do cliente: Ao cadastrar com sucesso um cliente, os dados serão formatos em "HTML" e "XML" pela própria aplicação, e em seguida serão enviados ao email do cliente através da biblioteca "OpenSSL". O corpo do email será composto por texto e um anexo no formato "XML".
