*** Settings ***
Library    OperatingSystem 
Library    SeleniumLibrary



Suite Setup       Run Keywords 
Suite Teardown    Run Keywords     Close Browser


*** Variables ***
${URL}           http://demostore.supersqa.com
${BROWSER}       chrome 
${MY_ACCOUNT}    xpath=//*[@id="site-navigation"]/div[1]/ul/li[4]/a
${ERROR_STR}     ERROR: Invalid username. Lost your password?

*** Test Cases ***
Login attempt with invalid user should throw error
    Open Browser                 ${URL}                      ${BROWSER}
    Click Element                ${MY_ACCOUNT}
    Input Text                   id=username                 fakeuser 
    Input Text                   id=password                 fakepassword
    Click Element                name=login
    Sleep                        3
    Element Should Be Visible    class=woocommerce-error 
    Page Should Contain          ${ERROR_STR}