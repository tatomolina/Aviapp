Class {
	#name : 'DocumentTest',
	#superclass : 'TestCase',
	#instVars : [
		'invoice',
		'article1',
		'article2',
		'service',
		'flight',
		'creditNote'
	],
	#category : 'Accounting-Tests',
	#package : 'Accounting-Tests'
}

{ #category : 'configuration' }
DocumentTest >> configureArticle1 [
	
	| article |
    article := Article new.
    article purchasePrice: 100.
    article profitMargin: 50.
    article vat: 21.
    ^article.
]

{ #category : 'configuration' }
DocumentTest >> configureArticle2 [
	
	| article |
    article := Article new.
    article purchasePrice: 200.
    article profitMargin: 25.
    article vat: 21.
    ^article.
]

{ #category : 'configuration' }
DocumentTest >> configureFlight [
	
	| flightType plane fuel flight1 departure arrival |
	
    flightType := FlightType new: 'Instruccion' factor: 3.
    plane := Plane new: 'lv-ail'.
    plane fuelConsumption: 25.
    fuel := Fuel new.
    fuel price: 100.
    departure := Time fromString: '08:00'.
    arrival := Time fromString: '09:43'.
    flight1 := Flight newFrom: 'sazy' to: 'sazs' since: departure to: arrival.
    flight1 fuel: fuel.
    flight1 plane: plane.
    flight1 flightType: flightType.
    flight1 vat: 21.
    ^flight1.
]

{ #category : 'configuration' }
DocumentTest >> configureService [
	
	| service1 |
    service1 := Service new.
    service1 duration: 1.3.
    service1 price: 100.
    service1 vat: 21.
    ^service1.
]

{ #category : 'running' }
DocumentTest >> setUp [
	"Setup the common environment for all tests"

	super setUp.
	invoice := Invoice new.
	creditNote := CreditNote new.
	article1 := self configureArticle1.
	article2 := self configureArticle2.
	service := self configureService.
	flight := self configureFlight.
	
	invoice addItem: article1 quantity: 3.
	invoice addItem: article2 quantity: 2.
	invoice addItem: service quantity: 1.
	invoice addItem: flight quantity: 1.
	
	creditNote  addItem: article1 quantity: 2. 
]

{ #category : 'tests' }
DocumentTest >> testCalculateBalance [

	invoice registerPayment: 10000 to: Account new.
	self assert: invoice calculateTotal equals: 17641.8 - 10000.
]

{ #category : 'tests' }
DocumentTest >> testCalculateSubtotal [ 
	"Test Subtotal Calculation"

	self assert: invoice calculateSubtotal equals: 14580.
	
	
]

{ #category : 'tests' }
DocumentTest >> testCalculateTotal [
	"Should sum the total of all items plus VAT"

	self assert: invoice calculateTotal equals: 17641.8.
]

{ #category : 'tests' }
DocumentTest >> testCalculateTotalOfCreditNote [
	"Should sum the total of all items plus VAT"

	self assert: creditNote calculateTotal equals: -363.
]

{ #category : 'tests' }
DocumentTest >> testCalculateTotalOfInvoice [
	"Should sum the total of all items plus VAT"

	self assert: invoice calculateTotal equals: 17641.8.
]

{ #category : 'tests' }
DocumentTest >> testCalculateVat [
	"Should sum the total VAT acumulated in the invoice"

	self assert: invoice calculateVat equals: 3061.8.
]

{ #category : 'tests' }
DocumentTest >> testDocumentInitialization [

	self assert: invoice items size equals: 4.
	self assert: creditNote items size equals: 1.
]
