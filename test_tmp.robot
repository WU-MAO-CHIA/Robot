*** Settings ***
Library           AppiumLibrary
Suite Setup       LaunchAndLogin
Suite Teardown    Stop Recording

*** Variables ***
${REMOTE_URL}    http://127.0.0.1:4723
${PLATFORM_NAME}    Android
${DEVICE_NAME}    Android
${APP_PACKAGE}    com.sinopac.newmobilebank.uat
${APP_ACTIVITY}    .OnlineBanking
${ID_NUMBER}    E151798250
${USER_CODE}    a12345
${PASSWORD}    b12345
${FUND_NAME}    ＰＧＩＭ保德信科技島基金(UF3)
${INVEST_AMOUNT}    30000

*** Test Cases ***
登入到基金交易成功測試
    [Documentation]    基金交易單筆申購
    # Launch App
    # Start Recording
    # Login
    Navigate To Fund Transaction
    Perform Fund Transaction
    Verify Transaction Success

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
    # Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="臺幣存款"]    20s

LaunchAndLogin
    Launch App
    Start Recording
    Login
Navigate To Fund Transaction
    # 點擊「更多」
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="更多"]    30s
    Click Element    xpath=//android.widget.TextView[@text="更多"]

    # 點擊「投資」
    Wait Until Page Contains Element    xpath=//android.widget.Button[@text="投資"]    10s
    Click Element    xpath=//android.widget.Button[@text="投資"]

    # 點擊「買基金」
    Wait Until Page Contains Element    xpath=(//android.widget.Button[@text="Button"])[4]    10s
    Click Element    xpath=(//android.widget.Button[@text="Button"])[4]

Perform Fund Transaction
    # 選擇基金
    Wait Until Page Contains Element    xpath=//android.widget.Button[@text="搜尋基金"]      20s
    Click Element    xpath=//android.widget.Button[@text="搜尋基金"]
  
    # 搜尋基金
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="ＰＧＩＭ保德信大中華基金(UF4)"]    10s
    Click Element    xpath=//android.widget.TextView[@text="ＰＧＩＭ保德信大中華基金(UF4)"]

    Wait Until Element Is Visible     xpath=//android.widget.EditText[@text="請輸入關鍵字"]    10s
    Input Text    xpath=//android.widget.EditText[@text="請輸入關鍵字"]    ${FUND_NAME}

    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="ＰＧＩＭ保德信科技島基金(UF3)"]    10s
    Click Element    xpath=//android.widget.TextView[@text="${FUND_NAME}"]

    Wait Until Page Contains Element    xpath=//android.widget.Button[@text="立即申購"]    10s
    Click Element    xpath=//android.widget.Button[@text="立即申購"]
    
    # 輸入投資金額
    Wait Until Page Contains Element    xpath=//android.widget.EditText[@text="請輸入投資金額"]    10s
    Input Text    xpath=//android.widget.EditText[@text="請輸入投資金額"]    ${INVEST_AMOUNT}

    Swipe By Percent    ${0}    ${95}    ${0}    ${5}
    Wait Until Page Contains Element    xpath=//android.widget.Button[@text="下一步"]   5s
    Click Element    xpath=//android.widget.Button[@text="下一步"]

    # Agree Page
    Wait Until Page Contains Element    xpath=//androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.ImageView    10s
    Click Element    xpath=//androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.ImageView
    # 1
    Wait Until Page Contains Element    xpath=//android.widget.Button[@text="滑到底"]    10s
    Click Element    xpath=//android.widget.Button[@text="滑到底"]
    Wait Until Page Contains Element    xpath=//android.widget.Button[@text="本人詳閱且同意"]    10s
    Click Element    xpath=//android.widget.Button[@text="本人詳閱且同意"]
    # 2
    Wait Until Page Contains Element    xpath=(//android.widget.Button[@text="下一步"])[2]   10s
    Click Element    xpath=(//android.widget.Button[@text="下一步"])[2]
    # 3
    Wait Until Page Contains Element    xpath=//android.widget.Button[@text="滑到底"]    10s
    Click Element    xpath=//android.widget.Button[@text="滑到底"]
    Wait Until Page Contains Element    xpath=(//android.widget.Button[@text="下一步"])[2]   10s
    Click Element    xpath=(//android.widget.Button[@text="下一步"])[2]
    # 4
    Wait Until Page Contains Element    xpath=//android.widget.Button[@text="本人詳閱且同意"]   10s
    Click Element    xpath=//android.widget.Button[@text="本人詳閱且同意"]
    
    Wait Until Page Contains Element    xpath=//android.widget.Button[@text="下一步"]     20s
    Click Element    xpath=//android.widget.Button[@text="下一步"]

    # Confirm Page
    Swipe By Percent    ${0}    ${95}    ${0}    ${5}
    Wait Until Page Contains Element    xpath=//android.widget.Button[@text="確認送出"]     20s
    Click Element    xpath=//android.widget.Button[@text="確認送出"]
    

Verify Transaction Success
    # 驗證交易成功訊息
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="交易成功"]    30s

Start Recording
    Start Screen Recording

Stop Recording
    Stop Screen Recording