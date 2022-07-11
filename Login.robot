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
    Element Should Be Visible    //a[@class="ico-login"]
    Click Link                   //a[@class="ico-login"]    
    Sleep                        3s    
    
LogIn
    Element Should Be Visible    //div[@class="header-logo"]
    Element Should Be Visible    //div[@class="form-fields"]    
    Input Text                   //input[@class="email"]            Tester08@gmail.com
    Input Text                   //input[@class="password"]         12345678      
    Click Element                //button[@class="button-1 login-button"]      
    Sleep                        3s          
    Close Browser