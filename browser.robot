*** Settings ***
Library    Browser
Library    String
Suite Setup    Suite Setup
Test Setup    Test Setup
Test Teardown    Close Context
Suite Teardown    Close Browser

*** Test Cases***
Add One ToDos And Check Items
    Input Text Into ToDos    Buy the milk
    Sleep    2s
    Verify Element Text Should Display Correctly    .todo-count    1 item left!

Add ToDos And Mark Same ToDos
    Input Text Into ToDos    abds
    Click    //label[text()= 'abds']/../input
    Sleep    2s
    Verify Element Text Should Display Correctly    .todo-count    0 items left!

*** Keywords ***
Suite Setup
    New Browser    chromium  headless=False

Test Setup
    New Context    viewport= {'width': 1920, 'height': 1080}
    New Page    https://todomvc.com/examples/react/dist/
    Wait For Load State    domcontentloaded    20s

Input Text Into ToDos
    [Arguments]    ${text}
    Fill Text    .new-todo    ${text}
    Press Keys    .new-todo    Enter

Verify Element Text Should Display Correctly
    [Documentation]    Verify element text should display Correctly
    [Arguments]    ${element}    ${text}
    Log To Console    message= ${element}
    Log To Console    message= ${text}
    Get Text    ${element}    ==    ${text}