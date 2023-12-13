iOS SDK Demo
========

# Card Recurring

This method allows you to make recurring. There are two available methods:

- new bank card,
- saved bank card (token)

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

## Examples

### Recurring with collecting of card data

``` Swift
Unlimint.shared.recuringPayment(for: homeViewModel.token, with: [homeViewModel.getRecurringCardPaymentData()])

    func getRecurringCardPaymentData() -> Unlimint.PaymentMethods {
        
        return .recurringPaymentCard(.init(with: "Facebook Inc",
                                           paymentMethod: "BANKCARD",
                                           customer: .init(
                                            email: "qwer@unlimint.com",
                                            locale: nil,
                                            
                                            customerID: "123456"),
                                           merchantOrder: .init(description: "<description>", id: "\(generateRandomOrderID())"),
                                           paymentData: PaymentData.init(amount: 100,
                                                                         currency: "EUR",
                                                                         note: nil,
                                                                         dynamicDescriptor: nil,
                                                                         transType: nil,
                                                                         isEditable: false,
                                                                         preauth: true),
                                           cardAccount: nil,
                                           recurringData: .init(amount: 100,
                                                                currency: "EUR",
                                                                contractNumber:"7481592630ARDS",
                                                                transType: "01",
                                                                initialAmount: 100,
                                                                subscriptionStart: "2024-04-22",
                                                                plan: .init(id: "rf2391UU"))))
        
    }
```


### Payment with saved card token
``` Swift
    Unlimint.shared.recuringPayment(for: homeViewModel.token, with: [homeViewModel.getRecurringTokenData()])
    
    func getRecurringTokenData() -> Unlimint.PaymentMethods {
        
        return .recurringCardToken(type: .mastercard, .init(with: "Card Merchant",
                                                         paymentMethod: "BANKCARD",
                                                         customer: .init(
                                                                        email: "test@unlimint.com",
                                                                         locale: "nil",
                                                                        customerID: "123456"),
                                                         merchantOrder: .init(description: "<description>",
                                                                              id: "\(generateRandomOrderID())"), 
                                                         paymentData: .init(amount: 100,
                                                                            currency: "EUR",
                                                                            note: nil,
                                                                            dynamicDescriptor: nil,
                                                                            transType: nil,
                                                                            isEditable: false,
                                                                            preauth: true),
                                                         cardAccount: .init(token: "9cd57184-a7f9-33f6-8cf3-1298054515ac",
                                                                            pan: "0085",
                                                                            billingAddress: nil, cardIssuer: "ICICI Bank"),
                                                         recurringData: .init(amount: 100,
                                                                              currency: "EUR",
                                                                              contractNumber:"7481592630ARDS",
                                                                              transType: "01",
                                                                              initialAmount: 100,
                                                                              subscriptionStart: "2024-04-22",
                                                                              plan: .init(id: "rf2391UU"))))
        
    }

```
