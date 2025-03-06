*** Settings ***
Library    keyword.py

*** Test Cases ***
Add One ToDos And Check Items
    ${project} =    Create Fake Project Name
    ${item} =    Create Fake Item Name
    ${user} =    Create Fake User Name
    ${aaa} =    CreateAfake
    Log To Console    message= ${project}
    Log To Console    message= ${item}
    Log To Console    message= ${user}
    Log To Console    message= ${aaa}