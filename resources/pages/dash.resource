*** Settings ***
Documentation    Dashboard Page
Library          Browser

*** Keywords ***
User Logged In
    ${header_title}    Set Variable    Aquela figurinha incrível a um clique de distância.
    Get Text       .header-content strong    equal    ${header_title}

Search User
    [Arguments]        ${target}

    Fill Text    input[placeholder^=Busque]    ${target}
    Click        css=button >> text=Buscar

Select Sticker
    [Arguments]    ${name}
    
    Click          //img[@alt= "${name}"]/..

Get In Touch
    Click          css=button >> text=Entrar em contato

WhatsApp Sticker Menssage
    [Arguments]    ${sticker_name}

    ${expeted_message}    Set Variable
    ...    Oi, achei o seu contato no Trade Sticker. Estou interessado(a) na figurinha do ${sticker_name}, bora negociar?

    Switch Page    NEW

    Wait For Elements State
    ...    css=p >> text=${expeted_message}
    ...    visible
    ...    5000