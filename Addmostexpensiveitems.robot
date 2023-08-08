*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${URL}            https://www.amazon.in
${CATEGORY}       Electronics

*** Test Cases ***
Add_Two_Most_Expensive_Items
    Open Browser   ${URL}   ${BROWSER}
    Maximize Browser Window
    Input Text      id=searchDropdownBox    ${CATEGORY}
    Click Button    xpath=//input[@value='Go']
    Wait Until Page Contains    ${CATEGORY}
    Click Element    xpath=//span[text()='${CATEGORY}']
    Sleep    2s
    ${item_prices}    Get WebElements    xpath=//span[@class='a-price-whole']
    ${sorted_prices}    Create List
    :FOR    ${item}    IN    @{item_prices}
    \    ${price}    Get Text    ${item}
    \    Convert To Integer    ${price}
    \    Append To List    ${sorted_prices}    ${price}
    Sort List    ${sorted_prices}    reverse=True
    ${most_expensive_prices}    Get From List    ${sorted_prices}    0    1
    Click Element    xpath=//span[text()='${most_expensive_prices[0]}']
    Click Element    xpath=//span[text()='${most_expensive_prices[1]}']
    Click Element    id=add-to-cart-button
    Click Element    id=hlb-ptc-btn-native
    Close Browser

*** Test Teardown ***
    Close All Browsers
