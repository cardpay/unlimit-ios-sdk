iOS SDK Demo
========

# Apple Pay Payment

This method allows you to make payment. There are three available methods:

- ApplePay

When customer select Apple Pay while payment, Apple pay SDK generates encypted_data and the encypted data used to pay on our server.

## Apple Developer Setup

Create a new bundle apple pay identifier on Apple developer account. 

https://developer.apple.com/documentation/applepaywebmerchantregistrationapi/registering_with_apple_pay_and_applying_to_use_the_api


## Xcode Setup

1. Go to project setting 
2. Add new capbility 
3. Search Apple pay
4. Add new merchant id created on Apple developer account. 
5. Look like given image below

![Final Look](/Documents/Images/ApplePay.png)


### 

## Code Configuration 

### Setup Envourinment 
``` Swift
Unlimint.shared.environment = .sandbox
```
### Skip payment status page inside SDK. Marchent will show own custom pages.  
``` Swift
Unlimint.shared.skipStatusPages = false
```
### Enable Apple pay
``` Swift
Unlimint.shared.enableApplePay = true
```
### setup Apple pay bundle identifier.  
``` Swift
Unlimint.shared.applePayBundleIdentifier = "merchant.com.unlimit"
```



## Example

### Payment with collecting of Apple Pay
``` Swift
Unlimint.shared.checkout(for: homeViewModel.token, with: homeViewModel.getApplePayDemoData)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Unlimint SDK")
                        
    func getApplePayDemoData() -> Unlimint.PaymentMethods {
        
        return
            .applePay(.init(with: "Apple Inc",
                            paymentMethod: "applepay",
                            customer: .init(homePhone: "",
                                            workPhone: "",
                                            email: "qwer@unlimint.com",
                                            locale: "US",
                                            phone: "+91 8750119811",
                                            ipAddress: "",
                                            customerID: ""),
                            merchantOrder: .init(description: "ApplePay51208032024", id: "\(generateRandomOrderID())"),
                            paymentData: ApplePayPaymentData.init(amount: price,
                                                          currency: "USD",
                                                          note: "note")))
    }
```

### Checkout methods Retruns
- `View` It retuens a view 


## Screenshot
![Checkout Apple Pay](/Documents/Images/NewCheckout.png)
