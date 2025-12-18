*** Settings ***
Library    Browser

*** Variables ***
${JAVA_LANGUAGE_FILTER}    css=input[name="lang"][value="Java"]
${TABLE_ROWS}              css=table tbody tr:visible

*** Keywords ***
Navigate To Practice Table Page
    [Arguments]    ${url}
    New Page    ${url}

Select Java Language Filter
    Click    ${JAVA_LANGUAGE_FILTER}
    Wait For Elements State
    ...    ${JAVA_LANGUAGE_FILTER}:checked
    ...    attached
    ...    timeout=5s

Get Visible Table Rows
    ${rows}=    Get Elements    ${TABLE_ROWS}
    RETURN    ${rows}

Get Language From Row
    [Arguments]    ${row_element}
    ${language}=    Get Text    ${row_element} >> td:nth-child(3)
    RETURN    ${language}
