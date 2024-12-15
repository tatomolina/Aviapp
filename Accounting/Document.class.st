"
Invoice where items are gathered.
"
Class {
	#name : 'Document',
	#superclass : 'Object',
	#instVars : [
		'date',
		'items',
		'state',
		'paidAmount'
	],
	#category : 'Accounting',
	#package : 'Accounting'
}

{ #category : 'adding' }
Document >> addItem: aProduct quantity: aQuantity [ 
	"Add an Item to the invoice"

	| invoiceItem |
	invoiceItem := DocumentItem new.
	invoiceItem product: aProduct.
	invoiceItem quantity: aQuantity.
	invoiceItem manageStock: self.
	items add: invoiceItem.
]

{ #category : 'totals' }
Document >> calculateBalance [

	"Calculate the remaining amount to be paid for this document"
	^self total - paidAmount.
]

{ #category : 'totals' }
Document >> calculateSubtotal [
	"Calculates the summ of the selling prices, without VAT"

	^self items inject: 0 into: [ :sum :item | sum + item calculateItemSubtotal ].
]

{ #category : 'totals' }
Document >> calculateTotal [
	"Calculates the total of the invoice, VAT included"
	
	^state totalFor: self.
	
]

{ #category : 'totals' }
Document >> calculateVat [
	"Calculates the summ of the VAT of each item"

	^self items inject: 0 into: [ :sum :item | sum + item calculateItemVat ].
]

{ #category : 'accessing' }
Document >> date: aDate [
	
	date := aDate.
]

{ #category : 'initialization' }
Document >> initialize [ 
	"Initialization of the instance"

	super initialize.
	state := CashState new.
	paidAmount := 0.
	date := Date today.
	items := OrderedCollection new. "List of Items"
]

{ #category : 'accessing' }
Document >> items [
	
	^items.
]

{ #category : 'totals' }
Document >> paidAmount [

	^paidAmount.
]

{ #category : 'initialization' }
Document >> registerPayment: anAmount to: aAccount [

	| paymentAmount |
	paymentAmount := (anAmount min: self calculateBalance).  "Ensure no overpayment"
	aAccount deposit: paymentAmount.  "For most documents, deposit money"
	paidAmount := paidAmount + paymentAmount.
]

{ #category : 'accessing' }
Document >> state [

	^state.
]

{ #category : 'accessing' }
Document >> state: aState [

	state := aState.
]

{ #category : 'totals' }
Document >> total [

	"Calculate the total amount for this document"
	^self calculateSubtotal + self calculateVat.
]
