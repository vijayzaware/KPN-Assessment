*** Settings ***

Resource  ../../Resources/import.robot



*** Variables ***
${IFRAME1} =                     xpath=//iframe[@id="iFrameResizer1"]
${CONTRACT_NAME_INPUT} =         id=ContractName
${CONTRACT_TERM_INPUT1} =        xpath=//div/select/option[text()="1 year"]
${CONTRACT_TERM_INPUT2} =        xpath=//div/select/option[text()="2 years"]
${CONTRACT_STATUS_INPUT1} =      xpath=//input[@value='Draft']/..
${CONTRACT_STATUS_INPUT2} =      xpath=//input[@value='Signed']/..
${DONE_BUTTON} =                 xpath=//div[@id="CreateNew_nextBtn"]
${ERROR_POPUP_HEADER} =          xpath=//div[@id="alert-container"]//h2[text()='Error']
${ERROR_POPUP_OK_BUTTON} =       xpath=//button[@id='alert-ok-button']
${ERROR_MESSAGE_LOCATION} =      xpath=//div[@class='error']/small

*** Keywords ***

Page Load Confirmation
    Wait Until Page Contains Element  ${IFRAME1}                timeout=30s
    Select Frame                      ${IFRAME1}
    Wait Until Page Contains          Create New Contract       timeout=30s
    Page Should Contain               Create New Contract

Fill In Contract Name
    [Arguments]  ${CONTRACT_NAME}
    Select Frame                       ${IFRAME1}
    Wait Until Page Contains Element   ${CONTRACT_NAME_INPUT}       timeout=30s
    Wait Until Element Is Enabled      ${CONTRACT_NAME_INPUT}
    Click Element                      ${CONTRACT_NAME_INPUT}
    Input Text                         ${CONTRACT_NAME_INPUT}       ${CONTRACT_NAME}

Select Term From Drop Down
    [Arguments]  ${Term}
    Wait Until Element Is Visible   //*[@id="SelectOption"]/option[3]
    Wait Until Element Is Enabled      ${CONTRACT_TERM_INPUT1}
    Run keyword if                     '${Term}'=='1 year'   Click Element  ${CONTRACT_TERM_INPUT1}
       ...  ELSE IF                    '${Term}'=='2 years'   Click Element  ${CONTRACT_TERM_INPUT2}

Select Status
    [Arguments]  ${Status}
    Wait Until Element Is Enabled      ${CONTRACT_STATUS_INPUT1}
    Run keyword if                     '${Status}'=='Draft'   Click Element  ${CONTRACT_STATUS_INPUT1}
      ...  ELSE IF                     '${Status}'=='Signed'  Click Element  ${CONTRACT_STATUS_INPUT2}


Click Done
     Wait Until Page Contains          Done     timeout=30s
     Set Focus To Element              ${DONE_BUTTON}
     Scroll Element Into View          ${DONE_BUTTON}
     Click Element                     ${DONE_BUTTON}


Handle Error Pop Up
    Wait Until Page Contains Element   ${ERROR_POPUP_HEADER}        timeout=10s
    Element Text Should Be             ${ERROR_POPUP_HEADER}        Error
    Click Element                      ${ERROR_POPUP_OK_BUTTON}

Verify Error Message
    Unselect Frame
    Wait Until Page Contains Element   ${IFRAME1}                   timeout=10s
    Select Frame                       ${IFRAME1}
    Wait Until Page Contains Element   ${ERROR_MESSAGE_LOCATION}     timeout=10s
    Element Text Should Be             ${ERROR_MESSAGE_LOCATION}     Choose a valid contract status and save your changes. Ask your admin for details.
    ${ErrorMessage} =  Get Text        ${ERROR_MESSAGE_LOCATION}
    Log To Console  ${ErrorMessage}

