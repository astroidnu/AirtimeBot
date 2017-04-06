*** Settings ***
Library           Selenium2Library
Library           OperatingSystem 
*** Keywords ***
Set Environment Variable   webdriver.gecko.driver  geckodriver.exe
*** Variables ***
#Your Browser
${Browser}        Firefox
#Testing URL
${SiteUrl}        https://twitter.com/?lang=en
#Login Data
${Email}          test_developer13@yahoo.com
${Password}       !q@w3e4r5t 
#Time Delay
${Delay}          3s  
*** Keywords *** 
#Feel free for add any Keywords here
Open page
    open browser    ${SiteUrl}      ${browser}     
    Maximize Browser Window
Find login button 
    Click Element  xpath=//a[@href='/login']
Fill Login Form 
    Sleep   ${Delay}
    Input Text       name=session[username_or_email]       ${Email}
    Input Text       name=session[password]                ${Password}
Click login button  
    Sleep   ${Delay}
    Click Element  xpath=//input[@value='Log in']
    [Teardown]    Close Browser    
*** Test Cases ***
#Focus in Test case 
Twitter Login Flow 
    Open Page   
    Find login button
    Fill Login Form  
    Click login button  
