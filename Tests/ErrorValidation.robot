*** Settings ***
Documentation  Error Validation

Resource  ../Resources/import.robot

Test Setup      Run Keywords    Begin Web Test
        ...     AND             Login To Salesforce  ${USER_CREDENTIALS}
        ...     AND             Navigate To Account

Test Teardown       End Web Test

*** Variables ***
*** Keywords ***

*** Test Cases ***
TEST2_Error Validation
  [Documentation]  This Test attempts to verify Error Message While submitting Invalid Details in Contract Form.
    VlocityApp.Click On Renew Contract
    VlocityApp.Verify Create New Contract Page is Loaded
    VlocityApp.Fill In Contract Details and submit form  ${CONTRACT_NAME}  ${CONTRACT_TERM2}  ${CONTRACT_STATUS2}
    VlocityApp.Verify Error Pop Up




