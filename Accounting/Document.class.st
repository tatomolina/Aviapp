"
Invoice where items are gathered.
"
Class {
	#name : 'Document',
	#superclass : 'Object',
	#instVars : [
		'client',
		'date',
		'items',
		'state',
		'payment'
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
	items add: invoiceItem.
]

{ #category : 'initialization' }
Document >> calculateBalance [

	^self calculateTotal - payment.
]

{ #category : 'totals' }
Document >> calculateSubtotal [
	"Calculates the summ of the selling prices, without VAT"

	^self items inject: 0 into: [ :sum :item | sum + item calculateItemSubtotal ].
]

{ #category : 'totals' }
Document >> calculateTotal [
	"Calculates the total of the invoice, VAT included"
	
	^self calculateSubtotal + self calculateVat.
	
]

{ #category : 'totals' }
Document >> calculateVat [
	"Calculates the summ of the VAT of each item"

	^self items inject: 0 into: [ :sum :item | sum + item calculateItemVat ].
]

{ #category : 'accessing' }
Document >> client: aClient [
	
	client := aClient.
]

{ #category : 'accessing' }
Document >> date: aDate [
	
	date := aDate.
]

{ #category : 'initialization' }
Document >> initialize [ 
	"Initialization of the instance"

	state := ''.
	payment := 0.
	date := Date today.
	items := OrderedCollection new. "List of Items"
]

{ #category : 'accessing' }
Document >> items [
	
	^items.
]

{ #category : 'initialization' }
Document >> registerPayment: anAmount [

	payment := payment + anAmount.
]

{ #category : 'accessing' }
Document >> state [

	^state.
]

{ #category : 'accessing' }
Document >> state: aState [

	state := aState.
]
