Class {
	#name : 'DocumentTest',
	#superclass : 'TestCase',
	#instVars : [
		'document',
		'article1',
		'article2',
		'service',
		'flight'
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
	article vat: (Tax new name: #Vat; percentage: 21; yourself).
	article stock: 10.
	^article.
]

{ #category : 'configuration' }
DocumentTest >> configureArticle2 [
	
	| article |
    article := Article new.
    article purchasePrice: 200.
    article profitMargin: 25.
    article vat: (Tax new name: #Vat; percentage: 21; yourself).
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
    flight1 vat: (Tax new name: #Vat; percentage: 21; yourself).
    ^flight1.
]

{ #category : 'configuration' }
DocumentTest >> configureService [
	
	| service1 |
    service1 := Service new.
    service1 duration: 1.3.
    service1 price: 100.
    service1 vat: (Tax new name: #Vat; percentage: 21; yourself).
    ^service1.
]

{ #category : 'running' }
DocumentTest >> setUp [
	"Setup the common environment for all tests"

	super setUp.
	document := Document new.
	article1 := self configureArticle1.
	article2 := self configureArticle2.
	service := self configureService.
	flight := self configureFlight.
	
	document addItem: article1 quantity: 3.
	document addItem: article2 quantity: 2.
	document addItem: service quantity: 1.
	document addItem: flight quantity: 1.
]

{ #category : 'tests' }
DocumentTest >> testDocumentInitialization [

	self assert: document items size equals: 4.
	self assert: document paidAmount equals: 0.
]
