*** Settings ***
Library    Browser
Resource    practice_table_page.resource
Variables    env.yaml

*** Test Cases ***
Java Language Filter Test
    [Documentation]
    ...    Navigate to the practice test table page, select the Java language
    ...    filter, and verify that only courses with Java language are visible
    ...    in the table.
    [Tags]    ui    filter    java
    New Browser    chromium    headless=False
    Navigate To Practice Table Page    ${PRACTICE_TABLE_URL}
    Select Java Language Filter
    ${visible_rows}=    Get Visible Table Rows
    FOR    ${row}    IN    @{visible_rows}
        ${language}=    Get Language From Row    ${row}
        Should Be Equal    ${language}    Java
    END
    Close Browser