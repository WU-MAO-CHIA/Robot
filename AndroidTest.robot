*** Settings ***
Library    AppiumLibrary
Test Teardown    Close Application

*** Test Cases ***
Test Case 1
    Open Test Application
    Swipe By Percent    ${0}    ${95}    ${0}    ${5}
    Click Page Element    xpath=//android.widget.TextView[@resource-id="android:id/title" and @text="About emulated device"]
    Wait Until Page Contains Element    //android.widget.TextView[@resource-id="android:id/title" and @text="Device name"]/..//android.widget.TextView[@resource-id="android:id/summary"]
    Element Should Contain Text    //android.widget.TextView[@resource-id="android:id/title" and @text="Device name"]/..//android.widget.TextView[@resource-id="android:id/summary"]    sdk_gphone64_x86_64
    Sleep    2s

*** Keywords ***
Open Test Application
    Open Application    http://127.0.0.1:4723
    ...    platformName=Android
    ...    automationName=uiautomator2
    ...    deviceName=Android
    ...    appPackage=com.sinopac.newmobilebank.uat
    ...    appActivity=.OnlineBanking
    ...    newCommandTimeout=${3600}

Click Page Element
    [Arguments]    ${element}
    Wait Until Page Contains Element    ${element}
    Click Element    ${element}