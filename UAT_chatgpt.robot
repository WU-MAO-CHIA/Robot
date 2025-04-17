*** Settings ***
Library    AppiumLibrary

*** Variables ***
${REMOTE_URL}    http://127.0.0.1:4723
${PLATFORM_NAME}    Android
${DEVICE_NAME}    Android
${APP_PACKAGE}    com.sinopac.newmobilebank.uat
${APP_ACTIVITY}    .OnlineBanking
${ID_NUMBER}    A1510200200
${USER_CODE}    a12345
${PASSWORD}    b12345

*** Test Cases ***
Test Bank App Login
    [Documentation]    測試銀行 App 的完整登入流程

    Launch App
    Handle Debugger Popup
    Handle Notification Permission
    Accept Terms
    Acknowledge Info
    Select General Login
    Enter Login Credentials
    Click Login Button
    Verify Login Success

    Capture Page Screenshot
    Close Application

*** Keywords ***
Launch App
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    automationName=uiautomator2
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}

Handle Debugger Popup
    Wait Until Element Is Visible    xpath=//android.widget.Button[@resource-id="android:id/button2"]    10s
    Click Element    xpath=//android.widget.Button[@resource-id="android:id/button2"]

Handle Notification Permission
    Wait Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.android.permissioncontroller:id/permission_allow_button"] 10s
    Click Element    xpath=//android.widget.Button[@resource-id="com.android.permissioncontroller:id/permission_allow_button"]

Accept Terms
    Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@text,"同意")]    10s
    Click Element    xpath=//android.widget.Button[contains(@text,"同意")]

Acknowledge Info
    Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@text,"我知道了")]    10s
    Click Element    xpath=//android.widget.Button[contains(@text,"我知道了")]

Select General Login
    Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@text,"一般登入")]    5s
    Click Element    xpath=//android.widget.Button[contains(@text,"一般登入")]

Enter Login Credentials
    Wait Until Element Is Visible    xpath=//android.widget.EditText[@text="ID/統一編號"]    5s
    Input Text    xpath=//android.widget.EditText[@text="ID/統一編號"]    ${ID_NUMBER}

    Wait Until Element Is Visible    xpath=//android.widget.EditText[@text="6~20 位使用者代碼"]    5s
    Input Text    xpath=//android.widget.EditText[@text="6~20 位使用者代碼"]    ${USER_CODE}

    Wait Until Element Is Visible    xpath=//android.widget.EditText[@text="6~20 位網路密碼"]    5s
    Input Text    xpath=//android.widget.EditText[@text="6~20 位網路密碼"]    ${PASSWORD}

Click Login Button
    Click Element    xpath=//android.widget.Button[contains(@text,"登入")]

Verify Login Success
    Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@text,"帳戶")]    10s
