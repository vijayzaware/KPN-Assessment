*** Settings ***
#Libraries
Library      SeleniumLibrary
Library     BuiltIn


#PageObjects
Resource    ../Data/InputData.robot
Resource    ../Resources/common.robot
Resource    ../Resources/VlocityApp.robot
Resource    ../PageObjects/LoginPage.robot
Resource    ../PageObjects/AccountPage.robot
Resource    ../PageObjects/CreateNewContractPage.robot
Resource    ../PageObjects/ContractCreatedPage.robot

