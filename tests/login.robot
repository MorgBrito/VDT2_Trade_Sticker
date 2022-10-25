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



