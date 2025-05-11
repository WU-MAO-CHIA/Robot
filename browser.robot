*** Settings ***
Library    Browser
Library    String
Suite Setup    Suite Setup
Test Setup    Test Setup
Test Teardown    Close Context
Suite Teardown    Close Browser

*** Variables ***
${ID}    A128514133
${usercode}    markwu0821
${password}    9907mkmnK

*** Test Cases***
Add One ToDos And Check Items
    Input Text Into ToDos
    Sleep    10s
    Click    //button[@id='ctl00_ctl00_ContentPlaceHolder1_DefaultContent__submitButton']


# Add ToDos And Mark Same ToDos
#     Input Text Into ToDos    abds
#     Click    //label[text()= 'abds']/../input
#     Sleep    2s
#     Verify Element Text Should Display Correctly    .todo-count    0 items left!
*** Keywords ***
Suite Setup
    New Browser    chromium  headless=False

Test Setup
    New Context    viewport= {'width': 1920, 'height': 1080}
    New Page    https://mma.sinopac.com/MemberPortal/Member/MMALogin.aspx
    Wait For Load State    domcontentloaded    20s

Input Text Into ToDos
    # [Arguments]    ${text}
    Fill Text    //input[@id='ctl00_ctl00_ContentPlaceHolder1_DefaultContent_MMAecbcc7ae326847ff8ed63d855929cb3d']    ${ID}
    Fill Text    //input[@id='ctl00_ctl00_ContentPlaceHolder1_DefaultContent_MMAd579574357eb40a9970620a3fb6908bd']    ${usercode}
    Fill Text    //input[@id='ctl00_ctl00_ContentPlaceHolder1_DefaultContent_MMA2dba87ca6b984a5eb41fa9c937891568']    ${password}
    
   
# Verify Element Text Should Display Correctly
#     [Documentation]    Verify element text should display Correctly
#     [Arguments]    ${element}    ${text}
#     Log To Console    message= ${element}
#     Log To Console    message= ${text}
#     Get Text    ${element}    ==    ${text}