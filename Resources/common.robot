*** Settings ***
Resource    ../Resources/import.robot



*** Keywords ***
Begin Web Test
    Log To Console  -- Opening Browser ...
    Open Browser    ${LOGIN_URL}  ${BROWSER}
    Maximize Browser Window

End Web Test
    Log To Console  -- Closing Browser ...
    Close Browser
