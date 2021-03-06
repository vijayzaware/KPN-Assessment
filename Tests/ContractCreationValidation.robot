*** Settings ***
Documentation  New Contract Creation.

Resource  ../Resources/import.robot

Test Setup      Run Keywords    Begin Web Test
        ...     AND             Login To Salesforce  ${USER_CREDENTIALS}
        ...     AND             Navigate To Account

Test Teardown       End Web Test

*** Variables ***
*** Keywords ***

*** Test Cases ***
TEST1_Successful Contract Creation
  [Documentation]   This Test Creates New Contract and Verifies details of created contract.
    VlocityApp.Click On Renew Contract
    VlocityApp.Verify Create New Contract Page is Loaded
    VlocityApp.Fill In Contract Details and submit form  ${CONTRACT_NAME}  ${CONTRACT_TERM1}  ${CONTRACT_STATUS1}
    VlocityApp.Validate Contract Details  ${ACCOUNT_NAME}  ${CONTRACT_TERM1}  ${CONTRACT_STATUS1}
    VlocityApp.Get Screenshot
