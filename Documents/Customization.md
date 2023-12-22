iOS SDK Demo
========

# Customization


|#  |Customization block            |Description
|---|-------------------------------|----------------------------------------------------------------------------------|
|1  |titleTextColor                 |Color of additional text outside card form                                        |
|   |titleTextColorDark             |Color of additional text outside card form Dark mode                              |
|2  |topTitleTextColor              |Color of form title text                                                          |
|   |topTitleTextColorDark          |Color of form title text Dark mode                                                |
|3  |pageBackgroundColor            |Background color of form                                                          |
|   |pageBackgroundColorDark        |Background color of form Dark mode                                                |
|4  |cardBackground                 |Background of card form                                                           |
|   |cardBackgroundDark             |Background of card form Dark mode                                                 |
|5  |cardTextColor                  |Color of PAN field, Expiration field, Secret code field texts                     |
|   |cardTextColorDark              |Color of PAN field, Expiration field, Secret code field texts Dark mode           |
|6  |cardInputTextColor             |Color of entering data in PAN field, Expiration field, Secret code field          |
|   |cardInputTextColorDark         |Color of entering data in PAN field, Expiration field, Secret code fieldDark mode |
|7  |cardInputBackgroundColor       |Color of PAN field, Expiration field, Secret code field                           |
|   |cardInputBackgroundColorDark   |Color of PAN field, Expiration field, Secret code field Dark mode                 |
|8  |titleDetailTextColor           |Color of order description                                                        |
|9  |buttonTextColorColorDarkDisable|Color of text on button in disable mode Dark mode                                 |
|10 |buttonTextColorColor           |Color of Pay button text                                                          |
|   |buttonTextColorColorDark       |Color of Pay button text Dark mode                                                |
|11 |buttonBackgroundColor          |Color of enable Pay button                                                        |
|12 |buttonBackgroundColorDisable   |Color of disable Pay button                                                       |
|13 |closeButtonTextColor           |Color of text on Close button                                                     |
|14 |changeAmountBGColor            |Color of form for entering amount                                                 |


## Screenshot

### Normal Mode
 
![Description](/Documents/Images/NewCard.png)
![Description](/Documents/Images/NewCardWithData.png)
![Description](/Documents/Images/StatusPage.png)



### Dark Mode

![Description](/Documents/Images/NewCardDark.png)
![Description](/Documents/Images/NewCardWithDataDark.png)
![Description](/Documents/Images/StatusPageDark.png)


## Example

```swift 
Unlimint.shared.theme.buttonBackgroundColor = Color(hex:0xFF5D15)
Unlimint.shared.theme.buttonBackgroundColorDisable = .gray
Unlimint.shared.theme.buttonTextColorColor = .white
Unlimint.shared.theme.buttonTextColorColorDarkDisable = .black
Unlimint.shared.theme.cardBackground =  Color(hex:0x272C34)
Unlimint.shared.theme.cardBackgroundDark =  Color(hex:0x272C34)
Unlimint.shared.theme.cardTextColor = .white
Unlimint.shared.theme.cardTextColorDark = Color(hex:0xF2F4F8)
Unlimint.shared.theme.cardInputTextColor = .black
Unlimint.shared.theme.cardInputTextColorDark = Color(hex:0xF2F4F8)
Unlimint.shared.theme.cardInputBackgroundColor = .white
Unlimint.shared.theme.cardInputBackgroundColorDark = Color(hex:0x191A1C)
Unlimint.shared.theme.topTitleTextColor = .black
Unlimint.shared.theme.topTitleTextColorDark = Color(hex:0xF2F4F8)
Unlimint.shared.theme.closeButtonTextColor = .blue
Unlimint.shared.theme.pageBackgroundColor = .white
Unlimint.shared.theme.pageBackgroundColorDark = Color.black
Unlimint.shared.theme.changeAmountBGColor =  Color(hex: 0xe8e8eb)
Unlimint.shared.theme.titleTextColor = .black
Unlimint.shared.theme.titleTextColorDark = Color(hex: 0xF2F4F8)
Unlimint.shared.theme.titleDetailTextColor = .gray
```
