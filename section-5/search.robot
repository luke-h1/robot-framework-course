*** Settings ***
Library    OperatingSystem
Library    SeleniumLibrary



Suite Setup       Run Keywords
Suite Teardown    Run Keywords    Close Browser



*** Variables ***
${URL}                  http://demostore.supersqa.com                          
${BROWSER}              chrome
${SEARCH}               xpath=//*[@id="woocommerce-product-search-field-0"]
${PRODUCT}              Flying Ninja 
${EXPECTED_URL_TEXT}    http://demostore.supersqa.com/?s=Flying+Ninja&post_type=product
${NOT_FOUND_MSG}        No producs were found matching your selection. 
${MSG_BOX_CLASS}        woocommerce-info
${ERROR}                //*[@id="main"]/p

*** Test Cases ***
User should experience error if they enter a product that doesn't exist 
    Open Browser                     ${URL}       ${BROWSER}
    Maximize Browser Window 
    Input text                       ${SEARCH}    ${PRODUCT} 
    Press Keys                       ${SEARCH}    ENTER                
    Sleep                            3            
    Element Should Be Visible        ${ERROR}
    Sleep                            1 
    Location Should Contain          ${EXPECTED_URL_TEXT}
    Sleep                            1 
    Close Browser





