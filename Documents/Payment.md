iOS SDK Demo
========

# Card Payment

This method allows you to make payment. There are three available methods:

- new bank card,
- saved bank card (token),
- PayPal.

When customer saves bank card while payment, your server will get a cardToken within unlimint’s callback You need to save this token and pass it to SDK, when customer wants to pay with saved card.


## Configuration 

### Setup Envourinment 
``` Swift
Unlimint.shared.environment = .sandbox
```
### Skip payment status page inside SDK. Marchent will show own custom pages.  
``` Swift
Unlimint.shared.skipStatusPages = false
```
### Get car binding token instead of transation id.  
``` Swift
Unlimint.shared.getCardBindingToken = self.get_card_Binding_Token
```
### Will be used in Recurring payment either sa or sm as string
``` Swift
Unlimint.shared.recurringScheduleType = .sa
```
### Will be used for cardholdername enable/disable
``` Swift
Unlimint.shared.disableCardHolderName = false
```


## Example

### Payment with collecting of card data
``` Swift
Unlimint.shared.checkout(for: homeViewModel.token, with: homeViewModel.getCardDemoData)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Unlimint SDK")
                        
func getCardDemoData() -> Unlimint.PaymentMethods {

    return .card(.init(with: "Facebook Inc",
                    paymentMethod: "BANKCARD",
                    customer: .init(homePhone: nil,
                                workPhone: nil,
                                email: "qwer@unlimint.com",
                                    locale: nil,
                                    phone: "+91 8750119811",
                                    ipAddress: nil,
                                    customerID: nil),
                    merchantOrder: .init(description: "<description>", id: "\(generateRandomOrderID())"),
                    paymentData: PaymentData.init(amount: price,
                                    currency: "EUR",
                                    note: nil,
                                    dynamicDescriptor: nil,
                                    transType: nil,
                                    isEditable: false,
                                    preauth: true),
                    cardAccount: nil))
    }
```

### Payment with saved card token

``` Swift
Unlimint.shared.checkout(for: homeViewModel.token, with: [homeViewModel.getCardTokenDemoData()])
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Unlimint SDK")
                        
func getCardTokenDemoData() -> Unlimint.PaymentMethods {
        
        return .cardToken(type: .mastercard, .init(with: "Card Merchant",
                                paymentMethod: "BANKCARD",
                                    customer: .init(homePhone: nil,
                                                workPhone: nil,
                                                email: "test@unlimint.com",
                                                locale: "nil",
                                                phone: "+91 8750119811",
                                                ipAddress: nil,
                                                customerID: nil),
                                merchantOrder: .init(description: "<description>",
                                                id: "\(generateRandomOrderID())"),
                                paymentData: .init(amount: price,
                                                currency: "EUR",
                                                note: nil,
                                                dynamicDescriptor: nil,
                                                transType: nil,
                                                isEditable: true,
                                                preauth: true),
                                cardAccount: .init(token: "9cd57184-a7f9-33f6-8cf3-1298054515ac",
                                                pan: "0085",
                                billingAddress: nil, cardIssuer: "ICICI Bank")))
    }
```


### Payment with PayPal

``` Swift
Unlimint.shared.checkout(for: homeViewModel.token, with: [homeViewModel.getPaypalDemoData()])
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Unlimint SDK")
                        
    
func getPaypalDemoData() -> Unlimint.PaymentMethods {
        
        return .payPal(.init(merchantName: "Paypal Merchant",
                          merchantOrder: .init(description: "<description>",
                                               id: "\(generateRandomOrderID())"),
                          paymentMethod: "PAYPAL",
                          paymentData: .init(amount: price,
                                        currency: "EUR",
                                        note: nil,
                                        dynamicDescriptor: nil,
                                        transType: nil,
                                        isEditable: false,
                                        preauth: true),
                          customer: .init(email: "test@unlimint.com")))
    }
```

### Checkout methods Retruns
- `View` It retuens a view 
