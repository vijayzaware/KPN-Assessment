*** Settings ***
Documentation  This File holds high level keywords

Resource    ../Resources/import.robot

*** Keywords ***

Login To Salesforce
    [Arguments]  ${USER_CREDENTIALS}
    LoginPage.Enter Credentials   ${USER_CREDENTIALS}
    LoginPage.Click Submit

Navigate To Account
    Go To  ${ACCOUNT_URL}

Click On Renew Contract
    AccountPage.Renew Contract

Verify Create New Contract Page is Loaded
    CreateNewContractPage.Page Load Confirmation

Fill In Contract Details and submit form
    [Arguments]  ${CONTRACT_NAME}  ${Term}  ${Status}
    CreateNewContractPage.Fill In Contract Name   ${CONTRACT_NAME}
    CreateNewContractPage.Select Term From Drop Down  ${Term}
    CreateNewContractPage.Select Status  ${Status}
    CreateNewContractPage.Click Done

Validate Contract Details
    [Arguments]  ${ACCOUNT_NAME}  ${Term}  ${Status}
    ContractCreatedPage.Get The Contract Number
    ContractCreatedPage.Verify Account Name  ${ACCOUNT_NAME}
    ContractCreatedPage.Verify Status  ${Status}
    ContractCreatedPage.Verify Contract Term  ${Term}
Get Screenshot
    ContractCreatedPage.Take Screenhot
Verify Error Pop Up
    CreateNewContractPage.Handle Error Pop Up
    CreateNewContractPage.Verify Error Message

Delete Created Contract
    ContractCreatePage.Delete Contract