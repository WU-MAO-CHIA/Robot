*** Settings ***
Documentation    Control Structure
Task Timeout    5s

*** Variables ***
${fruit} =   bananas
${price} =     890
@{abc}    apple    banana  gravel

*** Test Cases ***
Test Case 001
    IF   '${fruit}' == 'apple'
        Log To Console    message= I have a apple
    ELSE IF  '${fruit}' == 'bananas'
        Log To Console    message= I have a bananas
    ELSE
        Log To Console    message= I have a ${fruit}
    END

Test Case 002
    IF    '${fruit}' == 'apple'
        IF    ${price} < 100
            Log To Console    message= Buy!
        ELSE
            Log To Console    message= Too expensive!
        END
    ELSE
        Log To Console    message= No need to buy
    END

Test Case 003
    FOR    ${fruit}    IN    apple    banana
        Log To Console    message= ${fruit}
    END 
    FOR     ${fruit}    IN    @{abc}
        Log To Console    message= ${fruit}
    END