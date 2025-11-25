*** Settings ***
Library    SeleniumLibrary
Library    DateTime

*** Variables ***
${URL}         https://practice.expandtesting.com/inputs
${BROWSER}     Chrome

*** Keywords ***
Handle Cookie Banner If Present
    [Documentation]    Checks for cookie banner and accepts it if visible.
    ${is_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    id:cookie-policy-panel    timeout=5s
    Run Keyword If    ${is_visible}    Click Button    text:Accept

*** Test Cases ***
Test Number Input
    [Documentation]    Inputs a number, clicks a button, and verifies the output.
    Open Browser    ${URL}    ${BROWSER}
    Handle Cookie Banner If Present
    ${today}=    Get Current Date    result_format=%Y-%m-%d

    Input Text      id:input-number    99
    Input Text      id:input-text    hojaa
    Input Text      id:input-password    Password123
    Execute Javascript    document.getElementById('input-date').value = arguments[0];    ARGUMENTS    ${today}
    Scroll Element Into View    id:btn-display-inputs
    Execute Javascript    document.getElementById('btn-display-inputs').click();
    Wait Until Page Contains Element    id:output-number    timeout=5s
    Element Text Should Be    id:output-number    99
    Element Text Should Not Be    id:output-number    100
    Element Text Should Be    id:output-text    hojaa
    Element Text Should Be    id:output-password    Password123
    Element Text Should Be    id:output-date      ${today}
    Capture Page Screenshot

    Close Browser