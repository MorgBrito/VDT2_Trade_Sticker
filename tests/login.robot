*** Settings ***
Documentation        Login tests
Resource             ../resources/main.resource

Test Setup       Start Test
Test Teardown    Finish Test

*** Test Cases ***
Deve logar com sucesso
    Do Login

Não deve logar com senha incorreta

    Go To Login Page
    Submit Credentials         papito@gmail.com    123abc
    Toast Message Should Be    Credenciais inválidas, tente novamente!
    Sleep                      1

#Desafio 
#Deve exibir notificação toaster se o senha não for preenchido
Não preencher senha
    
    Go To Login Page
    Submit Credentials        papito@gmail.com   ${EMPTY} 
    Toast Message Should Be   Por favor, informe a sua senha secreta!

#Deve exibir notificação toaster se o email não for preenchido
Não preencher e-mail
    
    Go To Login Page
    Submit Credentials        ${EMPTY}   vaibrasil 
    Toast Message Should Be   Por favor, informe o seu email!

#Deve exibir notificação toaster se o email não for preenchido
Não preencher nenhuma credencial

    Go To Login Page
    Submit Credentials        ${EMPTY}   ${EMPTY}
    Toast Message Should Be   Por favor, informe suas credenciais!



