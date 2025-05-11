*** Settings ***
Library           AppiumLibrary
Suite Setup       LaunchAndRecord
Suite Teardown    Stop Recording

*** Variables ***
${REMOTE_URL}    http://127.0.0.1:4723
${PLATFORM_NAME}    Android
${DEVICE_NAME}    Android
${APP_PACKAGE}    com.sinopac.newmobilebank.uat
${APP_ACTIVITY}    .OnlineBanking
${ID_NUMBER}    A1525453750
${USER_CODE}    a12345
${PASSWORD}    b12345

*** Test Cases ***
APP登入測試
    [Documentation]    APP登入測試
    [Tags]    login    APP
    Login

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
    
    # Wait Until Element Is Visible    xpath=//android.widget.Button[@resource-id="android:id/button2"]    10s
    # Click Element    xpath=//android.widget.Button[@resource-id="android:id/button2"]

    #  # 點擊通知允許
    # Wait Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.android.permissioncontroller:id/permission_allow_button"]    10s
    # Click Element    xpath=//android.widget.Button[@resource-id="com.android.permissioncontroller:id/permission_allow_button"]
    
    # # 點擊通知允許
    # # Wait Until Page Contains Element    xpath=//android.widget.Button[@text="允許"]    5s
    # # Click Element    xpath=//android.widget.Button[@text="允許"]

    # # 點擊「我知道了」
    # Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="我知道了"]    10s
    # Click Element    xpath=//android.widget.TextView[@text="我知道了"]

    # # 點擊「同意」
    # Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="瞭解並同意永豐銀行可以蒐集處理利用 個資告知事項 所載個資內容"]    10s
    # Click Element    xpath=//android.widget.TextView[@text="瞭解並同意永豐銀行可以蒐集處理利用 個資告知事項 所載個資內容"]

    # Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="同意"]    10s
    # Click Element    xpath=//android.widget.TextView[@text="同意"]

    # 輸入登入ID
    Wait Until Element Is Visible    xpath=//android.widget.EditText[@text="ID/統一編號"]    10s
    Input Text    xpath=//android.widget.EditText[@text="ID/統一編號"]    ${ID_NUMBER}

    # 輸入使用者代碼
    # Wait Until Element Is Visible    xpath=//android.widget.EditText[@text="6~20 位使用者代碼"]    5s
    Input Text    xpath=//android.widget.EditText[@text="6~20 位使用者代碼"]    ${USER_CODE}

    # 輸入密碼
    # Wait Until Element Is Visible    xpath=//android.widget.EditText[@text="6~20 位網路密碼"]    5s
    Input Text    xpath=//android.widget.EditText[@text="6~20 位網路密碼"]    ${PASSWORD}

    # 點擊登入按鈕
    Click Element    xpath=//android.widget.Button[@text="登入"]
    # Wait Until Element Is Visible    xpath=//android.widget.Button[@text="先不要"]    20s
    # Click Element    xpath=//android.widget.Button[@text="先不要"]

    # 驗證是否登入成功
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="臺幣存款"]    20s
LaunchAndRecord
    Launch App
    Start Recording

Start Recording
    Start Screen Recording

Stop Recording
    Stop Screen Recording    filename=login.mp4
