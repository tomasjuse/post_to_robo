*** Settings ***
Documentation    Test suite generated from session api_post_session containing 1 test case for automation.
Library         RequestsLibrary
Library         Collections
Test Tags       automated    generated

*** Test Cases ***
API Post Test
    [Documentation]    Test case that verifies result.
    No Operation
    Log    Hello
    Create Session    postman    https://postman-echo.com
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${response}=    POST On Session    postman    /post    json={"test": "value"}    headers=${headers}
    Status Should Be    200