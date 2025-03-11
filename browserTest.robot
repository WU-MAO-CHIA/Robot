*** Settings ***
Library    Browser

*** Variables ***
${ID}    A123456789

*** Test Cases ***
# Verfiy Page Title
#     New Browser    chromium   headless=False
#     New Page    https://ithelp.ithome.com.tw/articles/10355314
#     ${title}=    Get Title
#     Should Be Equal    ${title}    Example Domain

Test Example Page
    New Browser    chromium   headless=False
    # ${device}=    Get Device    iPhone 15
    New Context
    New Page    https://mma.sinopac.com/MemberPortal/Member/NextWebLogin.aspx
    Browser.Click    //title[@"台幣"]
    # Click    //button[@class= 'user-login']
    # Browser.Fill Text    //input[@id= "ctl00_ctl00_ContentPlaceHolder1_DefaultContent_MMAbe5bdfc8b5cb42c7be26df1921e81b57"]    Value= ${ID}
    # Log To Console    message= ${device}