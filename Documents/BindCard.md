iOS SDK Demo
========

# Bind Card

## Method signature
```swiftUI 
  func Unlimint.shared.bind(for mobileToken: String, with methods: BindingMethodData) -> some View
```

### Parameter

- `mobileToken` Mobile token received from Unlimint (authentication mobile token)
- `methods` needed information for binding

###Retruns
- `View` It retuens a view 

### BindingMethodData

```swiftUI
public init(currency: Currency,
                customer: BindingCustomer,
                merchantOrder: MerchantOrder? = nil,
                cardAccount: CheckCardAccount? = nil)
```

## Examples

### Binding for payment
```swiftUI

Unlimint.shared.bind(for: homeViewModel.token, with:BindingMethodData(currency: .init(with: "USD"), customer: .init(id: "some-customer-id", email:"some@email.com"), 
    merchantOrder: .init(description: "some description", id: "some id")))

.navigationBarTitleDisplayMode(.inline)

```
