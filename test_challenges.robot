*** Settings ***
Library    Selenium2Library

*** Variables ***
${browser}    chrome
${url}    https://shop.line.me/home/ 
${Title}    xpath://body/div[@id='app']/div[1]/div[1]/lui-navigation-bar[1]/div[2]/div[1]
${Title_expected}    LINE SHOPPING
${textcolor}    #000000
${searchbox_locator}    xpath://body/div[@id='app']/div[1]/div[2]/section[1]/div[1]/div[2]/input[1]
${placeholder_locator}    xpath://body/div[@id='app']/div[1]/div[2]/section[1]/div[1]/div[2]
${placeholder_expected}    ค้นหาสินค้าและร้านค้าในไลน์
${cart_locator}    xpath://body/div[@id='app']/div[1]/div[1]/lui-navigation-bar[1]/div[3]/button[1]/div[1]/*[1]
${navigation_locator}    xpath://body/div[@id='app']/div[1]/div[3]/div[1]
${nav_home_locator}    xpath://body/div[@id='app']/div[1]/div[3]/div[1]/button[1]
${nav_explore_locator}    xpath://body/div[@id='app']/div[1]/div[3]/div[1]/button[2]
${nav_my_locator}    xpath://body/div[@id='app']/div[1]/div[3]/div[1]/button[3]
${page_two_locator}    xpath://body/div[@id='app']/div[1]/div[2]/section[3]/div[1]/div[1]/div[2]/div[1]/a[2]

##There is no shop highlight in the quick menu, So I use แม่และเด็ก instead
${quick_menu_locator}    xpath://div[contains(text(),'แม่และเด็ก')]
${quick_menu_name}    แม่และเด็ก

##newShop
${new_shop_url}    https://shop.line.me/event/shophighlight
${new_shop_title_locator}    xpath://div[contains(text(),'ร้านใหม่สุดฮอตประจำเดือน')]
${set_focus_point}    xpath://body/div[1]/div[1]/div[1]/div[2]/section[4]/div[1]/div[4]
${new_shop_tap_locator}    xpath://div[@id='tag-level-1-id-2200608']
${pay_card_button_locator}    xpath://div[@id='tag-id-220060801']
${searchbox_shop_locator}    xpath://body/div[1]/div[1]/div[1]/div[1]/lui-navigation-bar[1]/div[2]/div[1]/div[1]
${placeholder_shop_locator}    xpath://div[contains(text(),'ค้นหาร้านค้าในอีเวนท์')]
${placeholder_shop_expected}    ค้นหาร้านค้าในอีเวนท์
${more_button_locator}    xpath://button[contains(text(),'เพิ่มเติม')]
${title_shop_locator}    xpath://div[contains(text(),'ร้านใหม่ประจำเดือน')]
${credit_card_locator}    xpath://body/div[1]/div[1]/div[1]/div[2]/section[3]/div[1]/div[1]/div[2]/div[2]/div[1]/div[2]
${set_focus_point_shop}    xpath://body/div[1]/div[1]/div[1]/div[2]/section[3]/div[3]/div[1]/div[2]
${shop_2_locator}    xpath://div[contains(text(),"MAKEMEPAWS'")]
${shop_2_name}    MAKEMEPAWS'
${product_locator}    xpath://div[contains(text(),'Ho Ho Ho!🎄❄️Bandana ฮาโลวีน ผ้าพันคอสุนัข ผ้าพันค')]
${set_focus_point_shop_section}    xpath://div[contains(text(),"MAKEMEPAWS'")]
${shop_panel_locator}    xpath://body/div[@id='__nuxt']/div[@id='__layout']/div[@id='app-store-front']/div[1]/div[2]/div[4]/div[1]
${shop_panel_name}    Accept credit / debit cards 
${buy_now_button_locator}    xpath://body/div[@id='__nuxt']/div[@id='__layout']/div[@id='app-store-front']/div[1]/div[2]/div[11]/div[1]/button[1]
${addtocart_button_locator}    xpath://body/div[@id='__nuxt']/div[@id='__layout']/div[@id='app-store-front']/div[1]/div[2]/div[11]/div[1]/button[2]
${close_button}    xpath://body/div[@id='__nuxt']/div[@id='__layout']/div[@id='app-store-front']/div[2]/div[1]/div[1]/button[1] 
${Text_buy_now_button_locator}    xpath://body[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[11]/div[1]/button[1]/span[1]
${option_locator}    xpath://body/div[@id='__nuxt']/div[@id='__layout']/div[@id='app-store-front']/div[1]/div[2]/div[5]/div[1]/div[2]
${variation_buynow_locator}    xpath://body/div[@id='__nuxt']/div[@id='__layout']/div[@id='app-store-front']/div[1]/div[2]/div[14]/div[2]/div[2]/div[3]/div[1]/button[1]
${variation_addtocart_locator}    xpath://html[1]/body[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[14]/div[2]/div[2]/div[3]/div[1]/button[2]
${set_focus_point_option}    xpath://div[contains(text(),'รายละเอียด')]
${focus_section}    xpath:/html[1]/body[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[9]/div[1]/div[2]/div[1]/p[8]
${title_pop_up_locator}    xpath://p[contains(text(),'After logging in with LINE, you can continue shopping.')]
${title_pop_up_expected}    After logging in with LINE, you can continue shopping.
${title_login_locator}    xpath://body/div[@id='__nuxt']/div[@id='__layout']/div[@id='app-store-front']/div[1]/div[3]/div[1]/button[1]
${title_login_expected}    Log in
${title_create_locator}    xpath://button[contains(text(),'Create LINE')]    
${title_create_expected}    Create LINE Account



*** Keywords ***
Open page
    Open Browser     ${url}     ${browser}
    Maximize Browser Window
    Wait Until Element Contains   ${Title}    ${Title_expected}
Check text color
    Get title    
    Wait Until Element Contains   ${Title}   ${textcolor}
Check placeholder text
    Set Focus To Element   ${searchbox_locator}
    Wait Until Element Contains    ${placeholder_locator}    ${placeholder_expected} 
Check cart icon  
    Page Should Contain Element   ${cart_locator}
Navigation menus
    Set Focus To Element    ${navigation_locator}
    Page Should Contain Element   ${nav_home_locator}
    Page Should Contain Element   ${nav_explore_locator} 
    Page Should Contain Element   ${nav_my_locator} 
Click to next page
    Click Element    ${page_two_locator}
    Sleep    10s
    Wait until element is visible    ${quick_menu_locator}
    Sleep    10s
Click quick menu
    Click Element    ${quick_menu_locator}
    Location Should Contain    /event/momandkid
Go to new shop page
    Open Browser     ${new_shop_url}     ${browser}
    Maximize Browser Window
    Wait Until Element Contains   ${new_shop_title_locator}     ร้านใหม่สุดฮอตประจำเดือน
    Sleep    5s
    Scroll Element Into View   ${set_focus_point}
    Sleep    5s
Click new shop hightlight tab
    Click Element    ${new_shop_tap_locator}
    Element Should Contain   ${new_shop_tap_locator}      ร้านใหม่ประจำเดือน 
Click pay credit card tab
    Click Element    ${pay_card_button_locator}
    Element Should Contain   ${pay_card_button_locator}     จ่ายด้วยบัตรเครดิต
Check search placeholder text
    Set Focus To Element   ${searchbox_shop_locator}
    Sleep    5s
    Element Text Should Be    ${placeholder_shop_locator}    ${placeholder_shop_expected}
    Sleep    5s
Click more button
    Click Button   ${more_button_locator}
    Wait Until Element Contains   ${title_shop_locator}    ร้านใหม่ประจำเดือน
    Sleep    5s
Check credit/debit with icon
    Wait Until Element Contains   ${credit_card_locator}    Credit/Debit
Open a product in the second shop
    Scroll Element Into View   ${set_focus_point_shop}
    Wait Until Element Contains   ${shop_2_locator}    ${shop_2_name}
    Sleep    5s
    Click Element    ${product_locator}
Close pop up
    Click Button    ${close_button}
    Sleep    10s
Check panel
    Scroll Element Into View   ${focus_section}
    Element Should Contain   ${shop_panel_locator}    ${shop_panel_name}
    Sleep    5s
Check button
    Set Focus To Element   ${buy_now_button_locator} 
    Sleep    5s
    Element Text Should Be    ${buy_now_button_locator}    Buy Now     
    Element Text Should Be    ${addtocart_button_locator}    Add to cart   
    Sleep    5s
Select variations
    Scroll Element Into View   ${focus_section}
    Click Element    ${option_locator}
    Sleep    5s
Check buttons
    Element Should Be Visible    ${variation_buynow_locator}
    Sleep    5s
    Element Should Be Visible    ${variation_addtocart_locator}
Add to cart
    Click Button    ${addtocart_button_locator} 
    Element Text Should Be     ${title_pop_up_locator}    ${title_pop_up_expected}
    Sleep    5s
Check Login button
    Element Text Should Be     ${title_login_locator}    ${title_login_expected}
    Sleep    5s
Check Create LINE Account
    Element Text Should Be     ${title_create_locator}    ${title_create_expected}
    Sleep    5s





*** Test Cases ***
(Q1) Open Line shopping page successfully
    Open page
    Sleep   15s
Verify title should be displayed text color correctly
    Check text color
Verify Placeholder text should be displayed correctly
    Check placeholder text
Verify cart icon should be exist at the top right menu
    Check cart icon 
    Close Browser
Verify Navigatione menus should be displayed properly
    Open page
    Sleep   5s
    Navigation menus
    Close Browser
(Q2) Verify the path url should contains "event/momandkid"
    Open page
    Sleep   10s
    Click to next page
    Click quick menu
    Close Browser
(Q3) Verify placeholder text in new highlight shop page
    Go to new shop page
    Click new shop hightlight tab
    Click pay credit card tab
    Check search placeholder text
(Q4) Verify title and Credit/Debit should be displayed
    Click more button
    Check credit/debit with icon
(Q5) Verify the product detail page
    Open a product in the second shop
    Close pop up
    Check panel
    Check button
(08) Verify add to cart popup message
    Add to cart
    Check Login button
    Check Create LINE Account
    Close Browser





