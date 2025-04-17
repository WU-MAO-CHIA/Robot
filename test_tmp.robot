*** Settings ***
Library           AppiumLibrary

*** Variables ***
${REMOTE_URL}    http://127.0.0.1:4723
${PLATFORM_NAME}    Android
${DEVICE_NAME}    Android
${APP_PACKAGE}    com.sinopac.newmobilebank.uat
${APP_ACTIVITY}    .OnlineBanking
${ID_NUMBER}    A1510200200
${USER_CODE}    a12345
${PASSWORD}    b12345
${FUND_NAME}    ＰＧＩＭ保德信大中華基金
${INVEST_AMOUNT}    10000

*** Test Cases ***
登入到基金交易成功測試
    [Documentation]    測試銀行 App 登入到基金交易成功測試
    Launch App
    Start Recording
    Login
    Navigate To Fund Transaction
    Perform Fund Transaction
    Verify Transaction Success
    Stop Recording

*** Keywords ***
Launch App
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    automationName=uiautomator2
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    noReset=true

Login
    
    Wait Until Element Is Visible    xpath=//android.widget.Button[@resource-id="android:id/button2"]    10s
    Click Element    xpath=//android.widget.Button[@resource-id="android:id/button2"]

    Wait Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.android.permissioncontroller:id/permission_allow_button"]    10s
    Click Element    xpath=//android.widget.Button[@resource-id="com.android.permissioncontroller:id/permission_allow_button"]
    # 點擊通知允許
    # Wait Until Page Contains Element    xpath=//android.widget.Button[@text="允許"]    5s
    # Click Element    xpath=//android.widget.Button[@text="允許"]

    # 點擊「我知道了」
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="我知道了"]    5s
    Click Element    xpath=//android.widget.TextView[@text="我知道了"]

    # 點擊「同意」
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="同意"]    5s
    Click Element    xpath=//android.widget.TextView[@text="同意"]

    # 輸入登入資訊
    Wait Until Element Is Visible    xpath=//android.widget.EditText[@text="ID/統一編號"]    5s
    Input Text    xpath=//android.widget.EditText[@text="ID/統一編號"]    ${ID_NUMBER}

    Wait Until Element Is Visible    xpath=//android.widget.EditText[@text="6~20 位使用者代碼"]    5s
    Input Text    xpath=//android.widget.EditText[@text="6~20 位使用者代碼"]    ${USER_CODE}

    Wait Until Element Is Visible    xpath=//android.widget.EditText[@text="6~20 位網路密碼"]    5s
    Input Text    xpath=//android.widget.EditText[@text="6~20 位網路密碼"]    ${PASSWORD}

    # 點擊登入按鈕
    Click Element    xpath=//android.widget.Button[@text="登入"]

    # 驗證是否登入成功
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="帳戶總覽"]    10s

Navigate To Fund Transaction
    # 點擊「買賣基金」
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="買賣基金"]    5s
    Click Element    xpath=//android.widget.TextView[@text="買賣基金"]

    # 選擇基金
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="${FUND_NAME}"]    5s
    Click Element    xpath=//android.widget.TextView[@text="${FUND_NAME}"]

Perform Fund Transaction
    # 輸入投資金額
    Wait Until Element Is Visible    xpath=//android.widget.EditText[@text="請輸入投資金額"]    5s
    Input Text    xpath=//android.widget.EditText[@text="請輸入投資金額"]    ${INVEST_AMOUNT}

    # 確認交易
    Wait Until Page Contains Element    xpath=//android.widget.Button[@text="申購"]    5s
    Click Element    xpath=//android.widget.Button[@text="申購"]

Verify Transaction Success
    # 驗證交易成功訊息
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="交易成功"]    10s

Start Recording
    Start Screen Recording

Stop Recording
    Stop Screen Recording