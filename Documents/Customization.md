iOS SDK Demo
========

# Customization


|#  |Customization block            |Description
|---|-------------------------------|-------------------------------------------------------------------------|
|1  |titleTextColor                 |Color of additional text outside card form                               |
|2  |topTitleTextColor              |Color of form title text                                                 |
|3  |pageBackgroundColor            |Background color of form                                                 |
|4  |cardBackground                 |Background of card form                                                  |
|5  |cardTextColor                  |Color of PAN field, Expiration field, Secret code field texts            |
|6  |cardInputTextColor             |Color of entering data in PAN field, Expiration field, Secret code field |
|7  |cardInputBackgroundColor       |Color of PAN field, Expiration field, Secret code field                  |
|8  |titleDetailTextColor           |Color of order description                                               |
|9  |buttonTextColorColorDarkDisable|Color of text on button in disable mode                                  |
|10 |buttonTextColorColor           |Color of Pay button text                                                 |
|11 |buttonBackgroundColor          |Color of enable Pay button.                                              |
|12 |buttonBackgroundColorDisable   |Color of disable Pay button.                                             |
|13 |closeButtonTextColor           |Color of text on Close button                                            |
|14 |changeAmountBGColor            |Color of form for entering amount                                        |


## Screenshot

![Description](/Documents/Images/NewCard.png)
![Description](/Documents/Images/NewCardWithData.png)
![Description](/Documents/Images/StatusPage.png)


## Example

```swift 
Unlimint.shared.theme.buttonBackgroundColor = Color(hex:0xFF5D15)
Unlimint.shared.theme.buttonBackgroundColorDisable = .gray
Unlimint.shared.theme.buttonTextColorColor = .white
Unlimint.shared.theme.buttonTextColorColorDarkDisable = .black
Unlimint.shared.theme.cardBackground =  Color(hex:0x272C34)
Unlimint.shared.theme.cardTextColor = .white
Unlimint.shared.theme.cardInputTextColor = .black
Unlimint.shared.theme.cardInputBackgroundColor = .white
Unlimint.shared.theme.topTitleTextColor = .black
Unlimint.shared.theme.closeButtonTextColor = .blue
Unlimint.shared.theme.pageBackgroundColor = .white
Unlimint.shared.theme.changeAmountBGColor =  Color(hex: 0xe8e8eb)
Unlimint.shared.theme.titleTextColor = .black
Unlimint.shared.theme.titleDetailTextColor = .gray
```
