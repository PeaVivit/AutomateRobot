*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn

*** Keywords ***
Scroll Down
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);

*** Test Cases ***
Open Central Website and Perform Search
    Open Browser    https://www.central.co.th/en    Chrome
    Maximize Browser Window
    Set Selenium Speed    0.5  # Optional: Adjust the speed of test execution
    Input Text    //*[@id="autocomplete-0-input"]    Nike
    Press Keys    //*[@id="autocomplete-0-input"]    \ue007   # \ue007 is the Enter key to submit the search
    # Scroll Down
    Capture Page Screenshot  # Optional: Capture a screenshot for verification
    # Sleep    2s  # Optional: Add a delay to see the search results
    # Close Browser

Select Item
    Click Button    xpath=//*[@id="autocomplete-0-item-4"]/button  # Replace with your button's locator
    Mouse Over      xpath=//*[@id="product-list"]/div/div/ol/li[1]/div/div[1]/a  # Replace with your element's locator
    Sleep    2s
    Click element    xpath=//*[@id="product-list"]/div/div/ol/li[1]/div/div[1]
    Capture Page Screenshot

Click To see anothor picture
    Click Button   xpath= //*[@id="container-f08775fc6f"]/div/div[1]/div[2]/div[1]/div[1]/div[2]/div[2]/button[2]
    # Click Button   xpath=//*[@id="pdpQuantity"]
    # # Select From List By Value    xpath=//select[@id='dropdown']    option_value    # Select an option from the dropdown by its value
    Capture Page Screenshot

# Collect Data Example
#     ${Detail}=    Get Title    # Collect the page title and store it in ${page_title} variable
#     Log    Page Title: ${Detail}    # Display the collected page title in the log
#     Close Browser
   