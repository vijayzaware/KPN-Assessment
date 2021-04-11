*** Settings ***

Resource  ../../Resources/import.robot



*** Variables ***
${ACCOUNT_PAGE_LOADED} =        xpath=//div/span[text()='${ACCOUNT_NAME}']
${IFRAME0} =                    xpath=//iframe[@id="iFrameResizer0"]
${RENEW_CONTRACT_BUTTON}=       xpath=//div[@class="slds-col--padded slds-size--1-of-2"][2]/div[2]/a
${SUBMIT_BUTTON} =

*** Keywords ***

Renew Contract
    Verify Page is Loaded
    Click Renew Contract Link


Verify Page is Loaded
    Wait Until Element Contains     ${ACCOUNT_PAGE_LOADED}     John Smith      timeout=10s          #Wait for Account page to load

Click Renew Contract Link
    Wait Until Page Contains Element        ${IFRAME0}        timeout=5s
    Select Frame        ${IFRAME0}                                                                  #Select iframe
    Wait Until Page Contains     Renew Contract   timeout=30s                                       #Wait for Renew Button to be visible in the page
    Set Focus To Element       ${RENEW_CONTRACT_BUTTON}
    Scroll Element Into View   ${RENEW_CONTRACT_BUTTON}                                             #Scroll page to bring Renew Contract button/Link into view
    Double Click Element     ${RENEW_CONTRACT_BUTTON}                                               #Click link/button(Renew Contract) --Here Click Element, Click Button & Click Link keywords were not working hence as a woraround using Double Click keyword
    Unselect Frame                                                                                  #Unselect frame to move control to parent