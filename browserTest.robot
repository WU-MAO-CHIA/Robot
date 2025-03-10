*** Settings ***
Library    Browser

*** Test Cases ***
Verfiy Page Title
    New Browser    chromium   headless=False
    New Page    https://ithelp.ithome.com.tw/articles/10355314
    ${title}=    Get Title
    Should Be Equal    ${title}    Example Domain

Test Example Page
    New Browser    chromium   headless=False
    ${device}=    Get Device    iPhone 15
    New Context    &{device}
    New Page    https://example.com
    Sleep    2s
    Log To Console    message= ${device}