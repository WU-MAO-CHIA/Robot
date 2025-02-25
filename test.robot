*** Settings ***
Documentation    My First Robot Framework
# Library    AppiumLibrary
Name    測試 Settings Name
Metadata    測試 Metadata    Metadata 測試
Suite Setup    Log To Console    message=Print Suite Setup
Suite Teardown    Log To Console    message=Print Suite Teardown

Test Timeout    300s

# Suite Setup    Set Appium Timeout    100s
# Suite Teardown    Close All Applications

*** Variables ***
${hello_world} =    Hello World
@{fruit}    apple    banana
&{stock}    tsmc=2330

*** Test Cases ***
Test Case 001
    Log To Console    message=Print Test Case 001
    ${sum} =    Sum Two Number    num1=1    num2=2
    Should Be Equal As Integers    first=${sum}    second=${3}

Test Case 002
    Log To Console    message=Print Test Case 002
    ${sum} =    Sum Two Number    num1=3    num2=3
    Should Be Equal As Integers    first=${sum}    second=${7}
    
*** Keywords ***
Sum Two Number
    [Arguments]    ${num1}    ${num2}
    ${sum} =    Evaluate    ${num1}+${num2}
    RETURN    ${sum}