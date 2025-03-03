*** Settings ***
Documentation    My First Robot Framework
# Library    AppiumLibrary
Name    測試 Settings Name
Metadata    測試 Metadata    Metadata 測試
Suite Setup    Log To Console    message=Print Suite Setup
Suite Teardown    Log To Console    message=Print Suite Teardown
Test Setup    Log To Console    message=Setting 的 Test Setup
Test Timeout    300s

# Suite Setup    Set Appium Timeout    100s
# Suite Teardown    Close All Applications

*** Variables ***
${hello_world} =    Hello World
@{fruit}    apple    banana
&{stock}    tsmc=2330

*** Test Cases ***
Test Case 001
    [Documentation]    test case 001 doc
    [Tags]    smoke    release   abc
    [Setup]    Log To Console    message= Case 的 Test Setup
    Log To Console    message=Print Test Case 001
    ${sum} =    Sum Two Number    num1=1    num2=2
    Should Be Equal As Integers    first=${sum}    second=${3}

Test Case 002
    [Tags]    release
    Log To Console    message=Print Test Case 002
    ${sum} =    Sum Two Number    num1=3    num2=3
    Should Be Equal As Integers    first=${sum}    second=${7}

Test Case 003
    [Tags]    release    abc
    Log To Console    message=Print Test Case 003
    ${sum} =    Sum Two Number    num1=2    num2=9
    Should Be Equal As Integers    first=${sum}    second=${11}  

Test Case 004
    [Tags]    abc
    [Template]    Log Template
    msg1_1    msg2_1
    msg1_2    msg2_2
    msg1_3    msg2_3

Test Case 005
    [Tags]    abc
    ${sum} =    Sum Two Number    num1=2
    Log To Console    message=${sum}

*** Keywords ***
Sum Two Number
    [Arguments]    ${num1}    ${num2}=1
    ${sum} =    Evaluate    ${num1}+${num2}
    RETURN    ${sum}
Log Template
    [Arguments]    ${msg1}    ${msg2}
    Log To Console    msg1=${msg1}    msg2=${msg2}