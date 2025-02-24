*** Settings ***
Documentation    My First Robot Framework

*** Variables ***
${hello_world} =    Hello World

*** Test Cases ***
Test Case 001
    ${sum} =    Sum Two Number    num1=1    num2=2
    Should Be Equal As Integers    first=${sum}    second=${3}

Test Case 002
    ${sum} =    Sum Two Number    num1=3    num2=3
    Should Be Equal As Integers    first=${sum}    second=${5}
    
*** Keywords ***
Sum Two Number
    [Arguments]    ${num1}    ${num2}
    ${sum} =    Evaluate    ${num1}+${num2}
    RETURN    ${sum}