*** Settings ***
Library             SeleniumLibrary

*** Keywords ***
Start Chrome
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Create Webdriver    Chrome      chrome_options=${chrome_options}


*** Variables ***
${browser_url}                  https://demo.nopcommerce.com/
${browser_type}                 Chrome        

*** Test Cases ***
Homepage
    Start Chrome
    Go To                        ${browser_url}
    Maximize Browser Window
    Element Should Be Visible    //div[@class="header-logo"]
    Element Should Be Visible    //a[@class="ico-register"]
    Click Link                   //a[@class="ico-register"]    
    Sleep                        3s    

Register
    Element Should Be Visible       //div[@class="header-logo"]
    Element Should Be Visible       //div[@class="form-fields"]
    Select Radio Button             Gender                                M
    Input Text                      //input[@id="FirstName"]              Fachrul
    Input Text                      //input[@id="LastName"]               Christianto
    Page Should Contain List        //select[@name="DateOfBirthDay"]    
    Select From List By Value       //select[@name="DateOfBirthDay"]      8
    Page Should Contain List        //select[@name="DateOfBirthMonth"]
    Select From List By Value       //select[@name="DateOfBirthMonth"]    5
    Page Should Contain List        //select[@name="DateOfBirthYear"]
    Select From List By Value       //select[@name="DateOfBirthYear"]     1995
    Input Text                      //input[@id="Email"]                  Tester08@gmail.com
    Input Text                      //input[@id="Company"]                PT Berkah Selalu
    Page Should Contain Checkbox    //input[@id="Newsletter"]
    Select Checkbox                 Newsletter
    Input Text                      //input[@id="Password"]               12345678
    Input Text                      //input[@id="ConfirmPassword"]        12345678
    Click Element                   //button[@id="register-button"]
    Click Element                   //a[@class="button-1 register-continue-button"]        
    
    Sleep                           3s
    Close Browser