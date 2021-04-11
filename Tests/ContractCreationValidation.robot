*** Settings ***
Resource  ../Resources/import.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

*** Variables ***
*** Keywords ***

*** Test Cases ***
TEST1_Successful Contract Creation
  [Documentation]   This Test Creates New Contract and Verifies details of created contract.
  [Template]   Contract Creation and Validation
  ${USER_CREDENTIALS}  ${ACCOUNT_NAME}  ${CONTRACT_NAME}  ${CONTRACT_TERM1}  ${CONTRACT_STATUS1}

TEST2_Error Validation
  [Documentation]  This Test attempts to verify Error Message While submitting Invalid Details in Contract Form.
  [Template]  Error Validation On Selecting Invalid Details
  ${USER_CREDENTIALS}  ${ACCOUNT_NAME}  ${CONTRACT_NAME}  ${CONTRACT_TERM2}  ${CONTRACT_STATUS2}



