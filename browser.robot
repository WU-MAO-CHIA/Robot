*** Settings ***
Library    Browser
Library    String
Suite Setup    Suite Setup
Test Setup    Test Setup
Test Teardown    Close Context
Suite Teardown    Close Browser

*** Variables ***
${ID}    A123456789
${usercode}    123456
${password}    123456

*** Test Cases***
Add One ToDos And Check Items
    Input Text Into ToDos
    Sleep    10s
    Click    //button[@id='ctl00_ctl00_ContentPlaceHolder1_DefaultContent__submitButton']

*** Keywords ***
Suite Setup
    New Browser    chromium  headless=False

Test Setup
    New Context    viewport= {'width': 1920, 'height': 1080}
    New Page    https://mma.sinopac.com/MemberPortal/Member/MMALogin.aspx
    Wait For Load State    domcontentloaded    10s

Input Text Into ToDos
    # [Arguments]    ${text}
    # Fill Text    //input[@name='ctl00$ctl00$ContentPlaceHolder1$DefaultContent$MMA8dfd889182654ebda91cdd122d68171a']    ${ID}
    # Fill Text    //input[@id='ctl00_ctl00_ContentPlaceHolder1_DefaultContent_MMAbdc13c84ad164bde9f9f703e4cb5f602']    ${usercode}
    # Fill Text    //input[@id="ctl00_ctl00_ContentPlaceHolder1_DefaultContent_MMA8dfd889182654ebda91cdd122d68171a"]   ${password}

    Fill Text    xpath=//input[@onclick="getFocus(1,this);"]    ${ID}
    Fill Text    xpath=//input[@onclick="getFocus(2,this);chkType(this)"]    ${usercode}
    Fill Text    xpath=//input[@onclick="getFocus(3,this);chkType(this)"]    ${password}
    Sleep    8s
    # Click    //a[@id='MMA_Login']
    # Click    xpath=//input[@id='ctl00_ctl00_ContentPlaceHolder1_DefaultContent__submitButton']
    Press Keys    xpath=//input[@onclick="getFocus(3,this);chkType(this)"]    Enter
    Wait For Elements State    xpath=//a[@id='user-logout']   visible    10s

# Verify Element Text Should Display Correctly
#     [Documentation]    Verify element text should display Correctly
#     [Arguments]    ${element}    ${text}
#     Log To Console    message= ${element}
#     Log To Console    message= ${text}
#     Get Text    ${element}    ==    ${text}