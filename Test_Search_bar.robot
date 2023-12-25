*** Settings ***
Library           SeleniumLibrary
Library           Browser

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.central.co.th/en


*** Test Cases ***
Test Brands Search 
    Open Browser To Central Website
    Search with Brands
    Close Browser

Test Search with Thai Language
    Open Browser To Central Website
    Multi Language Search
    Close Browser

Test Products Search
    Open Browser To Central Website
    Search with Products
    Close Browser

Test Spacebar Search
    Open Browser To Central Website
    Spacebar Search
    Close Browser

Test Number Search
    Open Browser To Central Website
    Number Search
    Close Browser

Test Special Characters
    Open Browser To Central Website
    Search with Special Characters
    Close Browser 

Check Empty Input
    Open Browser To Central Website
    ${input}=    Set Variable    ${EMPTY}    
    Run Keyword If    '${input}' == '${EMPTY}' 
    ...    Log    Input is empty
    ...    ELSE    Log    Input is not empty
    Capture Page Screenshot
    Close Browser 

Test Fliter Fuction
    Open Browser To Central Website
    Test Filter
    Close Browser 

Test Click x icon
    Open Browser To Central Website
    Search with Products
    Clear Search Results
    Close Browser 

*** Keywords ***
Open Browser To Central Website
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5s

Multi Language Search
    Input Text    //*[@id="autocomplete-0-input"]    รองเท้า
    Press Keys    //*[@id="autocomplete-0-input"]    \ue007
    Capture Page Screenshot

Search with Products
    Input Text    //*[@id="autocomplete-0-input"]    Shoe
    Press Keys    //*[@id="autocomplete-0-input"]    \ue007
    Capture Page Screenshot

Search with Brands
    Input Text    //*[@id="autocomplete-0-input"]    Nike
    Press Keys    //*[@id="autocomplete-0-input"]    \ue007
    Capture Page Screenshot


Spacebar Search
    Press Keys    //*[@id="autocomplete-0-input"]    SPACE
    BuiltIn.Sleep    3s   
    ${text}=    Get Text    xpath=//*[@id="searchSuggestions"]/div/div[1]/section[1]/div/div   
    Log    ${text}
    ${expected_result}=    Set Variable    TRENDING
    ${actual_result}=  Set Variable  ${text}  
    Should Be Equal As Strings    ${actual_result}    ${expected_result} 
    Capture Page Screenshot

Number Search
     Input Text    //*[@id="autocomplete-0-input"]    123456
     Press Keys    //*[@id="autocomplete-0-input"]    \ue007
    BuiltIn.Sleep    3s   
    ${text}=    Get Text    xpath=//*[@id="product-list"]/div/div/div/div[1]/p
    Log    ${text}
    ${expected_result}=    Set Variable    Sorry, we couldn't find any results matching
    ${actual_result}=  Set Variable  ${text}  
    Should Be Equal As Strings    ${actual_result}    ${expected_result} 
    Capture Page Screenshot

Search with Special Characters
     Input Text    //*[@id="autocomplete-0-input"]    @#$%
     Press Keys    //*[@id="autocomplete-0-input"]    \ue007
     Capture Page Screenshot

Search Suggestions & Autocomplete
     Input Text    //*[@id="autocomplete-0-input"]    shi
     Press Keys    //*[@id="autocomplete-0-input"]    \ue007
     Capture Page Screenshot

Test Filter
    Input Text    //*[@id="autocomplete-0-input"]    Nike
    Press Keys    //*[@id="autocomplete-0-input"]    \ue007
    Click Button    xpath=//*[@id="autocomplete-0-item-4"]/button 
    Mouse Over      xpath=//*[@id="product-list"]/div/div/ol/li[1]/div/div[1]/a 
    Sleep    2s
    Click element    xpath=//*[@id="product-list"]/div/div/ol/li[1]/div/div[1]
    Capture Page Screenshot

Clear Search Results
    Click Button    xpath=//*[@id="searchBox"]/div/form/div[3]/button
    Capture Page Screenshot
    


