## SDK UI interaction

### Mobile token
**Main actors**: Unlimit UI SDK, Merchant backend, Unlimit API <br>
**Goal**: Get mobile token for further payments <br>
**Trigger**: Request was sent to get mobile token <br>
**Precondition**: 
 - Merchant has credentials: terminal_code and password
 - Unlimit API authentication is imbedded in Merchant backend

**Postcondition**: Merchant has had mobile token <br>

![Mobile token](/Documents/Images/token-for-payment.png)
**Interaction steps**:
###### Successful case
1) Some process with payment was started in merchant application on iOS device <br>
2) Merchant backend sends request to api/mobile/token to obtaining mobile token using basic authentication to Unlimit API. <br>
3) Unlimit API returns mobile token <br>
4) Merchant backend provides mobile token to Merchant Host App <br>
5) Merchant Host App stores mobile token <br>

###### Unsuccessful case
1) Some process with payment was started in merchant application on iOS device <br>
2) Merchant backend sends request to api/mobile/token to obtaining mobile token using basic authentication to Unlimit API. <br>
3) Unlimit API return error <br>

### Card binding
**Main actors**: User, Unlimit UI SDK, Merchant backend, Unlimit API <br>
**Goal**: Get card token for futher payments <br>
**Trigger**: Request was sent to get mobile token <br>
**Precondition**:
 - Merchant has credentials: terminal_code and password
 - Merchant implements get payment endpoint in backend or callback scheme is implemented
 - Merchant has mobile token

**Postcondition**: Merchant has card token for further payments <br>

![Card binding](/Documents/Images/binding.png)
**Interaction steps**:
###### Successful case
1) User initiates card data entry <br>
2) Merchant Host Application call function **[bindNewCardForResult()](https://github.com/cardpay/unlimit-ios-sdk/blob/master/Documents/BindCard.md)**. Type of binding data must be set 'RECURRING' for recurrent payments or 'PAYMENT' for payments with card token <br>
3) Unlimit UI SDK shows form for entering card data <br>
4) User enters card dats <br>
5) Unlimit UI SDK sends Card binding request <br>
6) Unlimit returns Authentication URL and payment Id <br>
7) Unlimit UI SDK shows authentication page for user <br>
8) User  passes authentication successfully <br>
9) Unlimit UI SDK shows result page. If Merchant wants to use own success page, then parameter showStatusScreen must be false. <br>
10) Unlimit  creates and reverses payment with minimum amount <br>
11) Merchant backend sends GET request to api/payments/{transactionId}. <br>
12) Unlimit API returns a card token in case of successful payment <br>
13) Merchant backend provides card data to Merchant Host application <br>
14) Merchant Host application saves a card token for future using <br>

###### Unsuccessful case
1) User initiates card data entry <br>
2) Merchant Host Application call function **[bindNewCardForResult()](https://github.com/cardpay/unlimit-ios-sdk/blob/master/Documents/BindCard.md)**. Type of binding data must be set 'RECURRING' for recurrent payments or 'PAYMENT' for payments with card token <br>
3) Unlimit UI SDK shows form for entering card data <br>
4) User enters card dats <br>
5) Unlimit UI SDK sends Card binding request <br>
6) Unlimit returns Authentication URL and payment Id <br>
7) Unlimit UI SDK shows authentication page for user <br>
8) User does not pass authentication successfully <br>
9) Result page with Decline is showed <br>
10) Card token is not created <br>

### Payment with card token
**Main actors**: User, Unlimit UI SDK, Merchant backend, Unlimit API <br>
**Goal**: Get card token for futher payments <br>
**Trigger**: Request was sent to get mobile token <br>
**Precondition**:
 - Merchant has credentials: terminal_code and password
 - Merchant implements get payment endpoint in backend or callback scheme is implemented
 - Merchant has mobile token

**Postcondition**: Merchant has card token for further payments <br>
![Card token](/Documents/Images/payment.png)
**Interaction steps**:
###### Successful case
1) User initiates card payment <br>
2) Merchant Host Application call function **[paymentForResult()](https://github.com/cardpay/unlimit-ios-sdk/blob/master/Documents/Payment.md)** <br>
3) Unlimit UI SDK shows form for entering security code <br>
4) User enters security code <br>
5) Unlimit UI SDK sends payment request <br>
6) Unlimit returns Authentication URL and payment Id <br>
7) Unlimit UI SDK shows authentication page for user <br>
8) User  passes authentication successfully <br>
9) Unlimit UI SDK shows result page. If Merchant wants to use own success page, then parameter showStatusScreen must be false. <br>
10) Merchant backend sends GET request to api/payments/{transactionId}. <br>
11) Unlimit API returns a card token in case of successful payment <br>
12) Merchant backend have to send PATCH request /api/payments/{payment_id} to complete two-phase payment <br>

###### Unsuccessful case
1) User initiates card payment <br>
2) Merchant Host Application call function **[paymentForResult()](https://github.com/cardpay/unlimit-ios-sdk/blob/master/Documents/Payment.md)** <br>
3) Unlimit UI SDK shows form for entering security code <br>
4) User enters security code <br>
5) Unlimit UI SDK sends payment request <br>
6) Unlimit returns Authentication URL and payment Id <br>
7) Unlimit UI SDK shows authentication page for user <br>
8) User does not pass authentication successfully <br>
9) Result page with Decline is showed <br>

### COF payments
**Main actors**: User, Unlimit Swift UI SDK, Merchant backend, Unlimit API <br>
**Goal**: Get card token for further payments <br>
**Trigger**: Request was sent to get mobile token <br>
**Precondition**:
 - Merchant has credentials: terminal_code and password
 - Merchant implements get payment endpoint in backend or callback scheme is implemented
 - Merchant has mobile token
 - COF payments are available for Merchant in Unlimit system

**Postcondition**:
 - Scheduled by Unlimit (SA): subscription is created.
 - Scheduled by Merchant (SA): filing id is sent by Unlimit

![COF payments](/Documents/Images/recurring.png)
**Interaction steps**:
###### Successful case
1) User initiates card payment <br>
2) Merchant Host Application call function **[recurringForResult()](https://github.com/cardpay/unlimit-ios-sdk/blob/master/Documents/Recurring.md)** <br>
3) Unlimit UI SDK shows form for entering security code or full card data depending on request. <br>
4) User enters card data <br>
5) Unlimit UI SDK sends COF payment request. Merchant can choose SM or SA scheduled payments are used <br>
6) Unlimit returns Authentication URL and payment Id <br>
7) Unlimit UI SDK shows authentication page for user <br>
8) User  passes authentication successfully <br>
9) Unlimit UI SDK shows result page. If Merchant wants to use own success page, then parameter skipStatusPages must be true. <br>
10) Merchant backend sends GET request to api/payments/{transactionId}. <br>
11) Unlimit API returns a status of payment, filing.is that can be used in next SM payments, subscription.id that can be used for managing of subscription in case of SA payments. <br>

###### Unsuccessful case
1) User initiates card payment <br>
2) Merchant Host Application call function **[recurringForResult()](https://github.com/cardpay/unlimit-ios-sdk/blob/master/Documents/Recurring.md)** <br>
3) Unlimit UI SDK shows form for entering security code or full card data depending on request. <br>
4) User enters card data <br>
5) Unlimit UI SDK sends COF payment request. Merchant can choose SM or SA scheduled payments are used <br>
6) Unlimit returns Authentication URL and payment Id <br>
7) Unlimit UI SDK shows authentication page for user <br>
8) User does not pass authentication successfully <br>
9) Result page with Decline is showed <br>
