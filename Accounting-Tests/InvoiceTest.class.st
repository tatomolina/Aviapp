Class {
	#name : 'InvoiceTest',
	#superclass : 'DocumentTest',
	#instVars : [
		'invoice'
	],
	#category : 'Accounting-Tests',
	#package : 'Accounting-Tests'
}

{ #category : 'running' }
InvoiceTest >> setUp [
	"Setup the common environment for all tests"

	super setUp.
	invoice := Invoice new.
	
	invoice addItem: article1 quantity: 3.
	invoice addItem: article2 quantity: 2.
	invoice addItem: service quantity: 1.
	invoice addItem: flight quantity: 1.
]

{ #category : 'tests' }
InvoiceTest >> testCalculateBalance [

	invoice registerPayment: 10000 to: Account new.
	self assert: invoice calculateTotal equals: 17641.8 - 10000.
]

{ #category : 'tests' }
InvoiceTest >> testCalculateSubtotal [ 
	"Test Subtotal Calculation"

	self assert: invoice calculateSubtotal equals: 14580.
	
	
]

{ #category : 'tests' }
InvoiceTest >> testCalculateTotal [
	"Should sum the total of all items plus VAT"

	self assert: invoice calculateTotal equals: 17641.8.
]

{ #category : 'tests' }
InvoiceTest >> testCalculateTotalOfInvoice [
	"Should sum the total of all items plus VAT"

	self assert: invoice calculateTotal equals: 17641.8.
]

{ #category : 'tests' }
InvoiceTest >> testCalculateVat [
	"Should sum the total VAT acumulated in the invoice"

	self assert: invoice calculateVat equals: 3061.8.
]
