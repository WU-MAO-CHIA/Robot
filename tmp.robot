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

*** Test Cases ***
登入流程測試
    Open Application 

    # 點擊通知允許
    Wait Until Page Contains Element    xpath=//android.widget.Button[@text="允許"]    5s
    Click Element    xpath=//android.widget.Button[@text="允許"]

    # 點擊「我知道了」
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="我知道了"]    5s
    Click Element    xpath=//android.widget.TextView[@text="我知道了"]

    # 點擊「同意」
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="同意"]    5s
    Click Element    xpath=//android.widget.TextView[@text="同意"]

    Wait Until Element Is Visible    xpath=//android.widget.EditText[@text="ID/統一編號"]    5s
    Input Text    xpath=//android.widget.EditText[@text="ID/統一編號"]    ${ID_NUMBER}

    Wait Until Element Is Visible    xpath=//android.widget.EditText[@text="6~20 位使用者代碼"]    5s
    Input Text    xpath=//android.widget.EditText[@text="6~20 位使用者代碼"]    ${USER_CODE}

    Wait Until Element Is Visible    xpath=//android.widget.EditText[@text="6~20 位網路密碼"]    5s
    Input Text    xpath=//android.widget.EditText[@text="6~20 位網路密碼"]    ${PASSWORD}

    # 點擊登入按鈕
    Click Element    xpath=//android.widget.Button[@text="登入"]

    # 驗證是否登入成功，例如首頁是否出現某元素
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="帳戶總覽"]    10s


*** Keywords ***
Launch App
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    automationName=uiautomator2
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
