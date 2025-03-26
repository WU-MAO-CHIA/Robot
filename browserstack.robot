*** Settings ***
Library    AppiumLibrary
Library    RPA.Desktop

Suite Teardown    Close Application
Resource    AndroidTest.robot

*** Variables ***
${REMOTE_URL}    http://hub-cloud.browserstack.com/wd/hub

*** Test Cases ***
Test browserstack
    Open Application    ${REMOTE_URL}
    Click Page Element    //android.widget.FrameLayout[@content-desc= "My list"]
    Click Page Element    //android.widget.FrameLayout[@content-desc= "History"]
    Click Page Element    //android.widget.FrameLayout[@content-desc= "Nearby"]
    Click Page Element    //android.widget.FrameLayout[@content-desc= "Explore"]

*** Keywords ***
Click Page element
    [Arguments]    ${element}
    Wait Until Page Contains Element    ${element}
    Click Element    ${element}