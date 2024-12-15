Class {
	#name : 'AccountTest',
	#superclass : 'TestCase',
	#instVars : [
		'bank',
		'cash',
		'invoice',
		'creditNote'
	],
	#category : 'Accounting-Tests',
	#package : 'Accounting-Tests'
}

{ #category : 'configuration' }
AccountTest >> configureArticle [
	
	| article |
	article := Article new.
	article purchasePrice: 1000.
	article profitMargin: 50.
	article vat: (Tax new name: #Vat; percentage: 21; yourself).
	article stock: 10.
	^article.
]

{ #category : 'running' }
AccountTest >> setUp [

	super setUp.
	cash := Account new name: 'Cash'; yourself.
	bank := Account new name: 'Bank'; yourself.
	invoice := Invoice new.
	invoice addItem: self configureArticle quantity: 1.
	creditNote := CreditNote new.
	creditNote addItem: self configureArticle quantity: 1.
	
]

{ #category : 'tests' }
AccountTest >> testAccountBalanceUpdate [
    
	"Ensure that the account balance is correctly updated after a payment"
	invoice registerPayment: 400 to: bank.
    
	"Verify that the bank balance reflects the payment made"
	self assert: bank balance equals: 400.
]

{ #category : 'tests' }
AccountTest >> testAccountInitialization [

	bank initialBalance: 1000.
	
	self assert: bank name equals: 'Bank'.
	self assert: bank balance equals: 1000.
]

{ #category : 'tests' }
AccountTest >> testDeposit [

	cash initialBalance: 200.
	cash deposit:500.
	
	self assert: cash balance equals: 700.
	self assert: cash movements size equals: 1.
]

{ #category : 'tests' }
AccountTest >> testMultipleMovements [

	bank initialBalance: 800.
	bank deposit: 350.
	bank withdraw: 200.
	
	self assert: bank balance equals: 950.
	self assert: bank movements size equals: 2.
]

{ #category : 'tests' }
AccountTest >> testPaymentAfterDocumentIsPaid [

	"Ensure that no payment can be made to a fully paid document"
	invoice registerPayment: invoice calculateTotal to: cash. "Fully pay the invoice"
	invoice registerPayment: 100 to: cash. "Attempt to pay more after it is fully paid"
    
	"Verify that the paid amount and cash balance remain unchanged"
	self assert: invoice paidAmount equals: invoice total.
	self assert: cash balance equals: invoice total.
]

{ #category : 'tests' }
AccountTest >> testPaymentExceedsAmount [
	"Ensure that the payment cannot exceed the outstanding amount"
    
	invoice registerPayment: 2000 to: bank. "Attempt to pay more than the outstanding amount"
    
	"Verify that the paid amount equals the total outstanding amount"
	self assert: invoice paidAmount equals: invoice total.
	self assert: bank balance equals: invoice total.
]

{ #category : 'tests' }
AccountTest >> testPaymentLessThanAmount [
    
	"Ensure that a payment less than or equal to the outstanding amount is correctly registered"
	invoice registerPayment: 300 to: cash. "Pay less than the outstanding amount"
    
	"Verify that the paid amount matches the payment made"
	self assert: invoice paidAmount equals: 300.
	self assert: cash balance equals: 300.
]

{ #category : 'tests' }
AccountTest >> testRegisterPaymentToAccount [

	invoice registerPayment: 1000 to: bank.
	
	self assert: bank balance equals: 1000.
	self assert: bank movements size equals: 1.
]

{ #category : 'tests' }
AccountTest >> testWithdraw [

	cash initialBalance: 800.
	cash withdraw: 200.
	
	self assert: cash balance equals: 600.
	self assert: cash movements size equals: 1.
]

{ #category : 'tests' }
AccountTest >> testWithdrawPaymentFromAccount [

	bank initialBalance: 1000.
	creditNote registerPayment: 400 to: bank.
	
	self assert: bank balance equals: 600.
	self assert: bank movements size equals: 1.
]
