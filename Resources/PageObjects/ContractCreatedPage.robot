*** Settings ***

Resource  ../../Resources/import.robot



*** Variables ***
${CONTRACT_NUMBER_LOCATION} =           xpath=//h1/div[text()='Contract']/../div[2]/span[@class='uiOutputText']
${ACCOUNT_NAME_LOCATION} =              xpath=//span[text()='Account Name']/../div//a
${CONTRACT_STATUS_LOCATION} =           xpath=//span[text()='Status']/../div//span
${CONTRACT_TERM_LOCATION} =             xpath=//span[text()='Contract Term (months)']/../div//span
${SUBMIT_BUTTON} =

*** Keywords ***

Get The Contract Number
      Unselect Frame
      Wait Until Page Contains Element     ${CONTRACT_NUMBER_LOCATION}   timeout=20s
      ${ContractID} =  Get Text            ${CONTRACT_NUMBER_LOCATION}                             #get contract Id from the page
      Log To Console  ${ContractID}

Take Screenhot
     Capture Page Screenshot                selenium-screenshot-{index}.png

Verify Account Name
    [Arguments]  ${ACCOUNT_NAME}
    Element Text Should Be                  ${ACCOUNT_NAME_LOCATION}   ${ACCOUNT_NAME}              #Validate Account Name

Verify Status
    [Arguments]  ${Status}
    Wait Until Page Contains Element       ${CONTRACT_STATUS_LOCATION}   timeout=5s                 #Validate Contract Status
    Element Text Should Be                 ${CONTRACT_STATUS_LOCATION}   ${Status}
    ${ConStatus} =  Get Text                  ${CONTRACT_STATUS_LOCATION}
    Log To Console  ${ConStatus}


Verify Contract Term
    [Arguments]  ${Term}
    Wait Until Page Contains Element     ${CONTRACT_TERM_LOCATION}      timeout=5s   #get contract Id
    ${ContractTerm} =  Get Text          ${CONTRACT_TERM_LOCATION}
    Log To Console  ${ContractTerm}
    Run keyword if                     '${Term}'=='1 year'      Element Text Should Be           ${CONTRACT_TERM_LOCATION}    12
      ...  ELSE IF                     '${Term}'=='2 years'    Element Text Should Be            ${CONTRACT_TERM_LOCATION}     24         #Validate Contract Term


Delete Contract


