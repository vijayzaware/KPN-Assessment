*** Settings ***

Resource  ../../Resources/import.robot



*** Variables ***
${USERID_INPUT_FIELD} =         id=username
${PASSWORD_INPUT_FIELD} =       id=password
${SUBMIT_BUTTON} =              id=Login

*** Keywords ***

Enter Credentials
    [Arguments]  ${USER_CREDENTIALS}
    Input Text  ${USERID_INPUT_FIELD}    ${USER_CREDENTIALS.Email}
    Input Text  ${PASSWORD_INPUT_FIELD}  ${USER_CREDENTIALS.Password}

Click Submit
    Click Button  ${SUBMIT_BUTTON}