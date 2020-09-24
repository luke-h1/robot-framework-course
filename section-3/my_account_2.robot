*** Settings ***
Library    OperatingSystem
Library    SeleniumLibrary



Suite Setup       Run Keywords
Suite Teardown    Run Keywords    Close Browser 



*** Variables ***
${URL}              http://demostore.supersqa.com                          
${BROWSER}          chrome 
${MY_ACCOUNT}       xpath=//*[@id="site-navigation"]/div[1]/ul/li[4]/a 
${PWD_ERROR}        ERROR: The password field is empty .
${USERNAME_ERROR}   Error: Username is required.




*** Test Cases ***
Login attempt with blank password should throw "empty password" error message
    Open Browser                 ${URL}                      ${BROWSER}
    Click Element                ${MY_ACCOUNT}
    Input Text                   id=username                 fakeuser
    Click Element                name=login 
    Sleep                        2 
    Element Should Be visible    class=woocommerce-error 
    Element Text Should Be       class=woocommerce-error     ${PWD_ERROR}
    Close Browser


Login attempt with blank username should throw "empty username" error message
    Open Browser                 ${URL}                      ${BROWSER}
    Click Element                ${MY_ACCOUNT}
    Input text                   id=password                 fakepassword
    Click Element                name=login
    Sleep                        2 
    Element Should Be visible    class=woocommerce-error      
    Element Text Should Be       class=woocommerce-error     ${USERNAME_ERROR} 
    Close Browser
