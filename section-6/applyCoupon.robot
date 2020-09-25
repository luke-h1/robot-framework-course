*** Settings ***
Library    OperatingSystem
Library    SeleniumLibrary

Suite Setup       Run Keywords 
Suite Teardown    Run Keywords     Close Browser 



*** Variables ***
${URL}            http://demostore.supersqa.com/
${CART}           http://demostore.supersqa.com/cart/ 
${BROWSER}        chrome
${add_to_cart}    xpath=//*[@id="main"]/ul/li[1]/a[2]
${CODE_1}         90off 
${CODE_2}         50off
${CODE_3}         10off
${APPLY}          xpath=//*[@id="post-7"]/div/div/form/table/tbody/tr[2]/td/div/button
${SUCCESS_MSG}    xpath=//*[@id="post-7"]/div/div/div[1]/div
${ERROR_MSG}      Coupon "${TEXT}" does not exist!
${TEXT}           hello123
${ERROR_EL}       xpath=//*[@id="post-7"]/div/div/div[1]
*** Test Cases ***
valid coupon should show success msg
    Open Browser                 ${URL}                                                               ${BROWSER}
    Click Link                   ${add_to_cart}
    Sleep                        1 
    Go To                        ${CART} 
    Input Text                   xpath=//*[@id="coupon_code"]                                         ${CODE_1} 
    Click Button                 ${APPLY}                                                             
    Sleep                        2 
    Element Should Be Visible    ${SUCCESS_MSG} 
    Page Should Contain          Coupon code applied successfully.
    Sleep                        1 
    Click Link                   xpath=//*[@id="post-7"]/div/div/div[2]/div/table/tbody/tr[2]/td/a
    Input Text                   xpath=//*[@id="coupon_code"]                                         ${CODE_2} 
    Click Button                 ${APPLY}                                                             
    Sleep                        2
    Element Should Be Visible    ${SUCCESS_MSG} 
    Page Should Contain          Coupon code applied successfully.
    Sleep                        1 
    Click Link                   xpath=//*[@id="post-7"]/div/div/div[2]/div/table/tbody/tr[2]/td/a
    Input Text                   xpath=//*[@id="coupon_code"]                                         ${CODE_3} 
    Click Button                 ${APPLY}                                                             
    Sleep                        2
    Element Should Be Visible    ${SUCCESS_MSG} 
    Page Should Contain          Coupon code applied successfully.
    Sleep                        1 



invalid coipon should show error msg
    Open Browser                 ${URL}                          ${BROWSER}
    Click Link                   ${add_to_cart}
    Sleep                        1 
    Go To                        ${CART} 
    Input Text                   xpath=//*[@id="coupon_code"]    ${TEXT}
    Click Button                 ${APPLY}                        
    Sleep                        2 
    Element Should Be Visible    ${ERROR_EL}

