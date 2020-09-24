*** Settings ***
Library    OperatingSystem
Library    SeleniumLibrary



Suite Setup       Run Keywords
Suite Teardown    Run Keywords    Close Browser 



*** Variables ***
${URL}           http://demostore.supersqa.com                          
${BROWSER}       chrome 
${MY_ACCOUNT}    xpath=//*[@id="site-navigation"]/div[1]/ul/li[4]/a 
${ERROR_STR}     ERROR: The password field is empty.





*** Test Cases ***
Login attempt with blank password should throw error
    Open Browser                 ${URL}                      ${BROWSER}
    Click Element                ${MY_ACCOUNT}
    Input Text                   id=username                 fakeuser
    Click Element                name=login 
    Sleep                        2 
    Element Should Be visible    class=woocommerce-error 
    Element Text Should Be       class=woocommerce-error     ${ERROR_STR}