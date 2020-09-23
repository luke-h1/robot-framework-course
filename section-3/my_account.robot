*** Settings ***
Library    OperatingSystem 
Library    SeleniumLibrary



Suite Setup       Run Keywords 
Suite Teardown    Run Keywords     Close Browser


*** Variables ***
${URL}           http://demostore.supersqa.com
${BROWSER}       chrome 
${MY_ACCOUNT}    xpath=//*[@id="site-navigation"]/div[1]/ul/li[4]/a


*** Test Cases ***
Login attempt with invalid user should throw error
    Open Browser     ${URL}           ${BROWSER}
    Click Element    ${MY_ACCOUNT}
    Input Text       id=username      fakeuser 
    Input Text       id=password      fakepassword
    Click Element    name=login