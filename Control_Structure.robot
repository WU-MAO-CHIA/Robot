*** Settings ***
Documentation    Control Structure
Task Timeout    5s

*** Variables ***
${fruit} =   bananas
${price} =     890
@{abc}    apple    banana  gravel
&{user}    name=mark    gender=male
${result.status_code} =    200

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

Test Case 004a
    FOR    ${fruit}    IN    apple    banana
        FOR    ${size}    IN    small    medium
            Log To Console    message= ${fruit}_${size}
        END
    END

Tset Case 005
    FOR    ${index}    IN RANGE    10
        Log To Console    message= ${index}
    END

Test Case 006
    FOR    ${key}    ${value}    IN    &{user}
        Log To Console    message= Key is '${key}' and value is '${value}'
    END
Test Case 007
    Should Be Equal    ${result.status_code}    200
    Should Contain    I have a apple    apple
    Should Be True    ${10}>=${11}