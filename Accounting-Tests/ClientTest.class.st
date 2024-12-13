Class {
	#name : 'ClientTest',
	#superclass : 'TestCase',
	#instVars : [
		'client',
		'invoice1',
		'invoice2',
		'invoice3',
		'creditNote'
	],
	#category : 'Accounting-Tests',
	#package : 'Accounting-Tests'
}

{ #category : 'configuration' }
ClientTest >> configureArticle1 [
	
	| article |
    article := Article new.
    article purchasePrice: 100.
    article profitMargin: 50.
    article vat: 21.
    ^article.
]

{ #category : 'configuration' }
ClientTest >> configureArticle2 [
	
	| article |
    article := Article new.
    article purchasePrice: 200.
    article profitMargin: 25.
    article vat: 21.
    ^article.
]

{ #category : 'configuration' }
ClientTest >> configureClient [
	
	| client1 |
    client1 := Client new.
    client1 name: 'Tato'.
    client1 surname: 'Molina'.
    ^client1.
]

{ #category : 'configuration' }
ClientTest >> configureCreditNote [
	
	| creditNote1 |
   creditNote1 :=  CreditNote new.
	creditNote1 state: CurrentAccountState new.
	creditNote1 addItem: self configureArticle2 quantity: 1.
	^creditNote1.
]

{ #category : 'configuration' }
ClientTest >> configureFlight [
	
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
ClientTest >> configureInvoice1 [
	
	| invoice |
   invoice :=  Invoice new.
	invoice state: CurrentAccountState new.
	invoice addItem: self configureArticle1 quantity: 2.
	invoice addItem: self configureArticle2 quantity: 4.
	invoice addItem: self configureService quantity: 1.
	^invoice.
]

{ #category : 'configuration' }
ClientTest >> configureInvoice2 [
	
	| invoice |
   invoice :=  Invoice new.
	invoice state: CurrentAccountState new.
	invoice addItem: self configureArticle1 quantity: 2.
	invoice addItem: self configureFlight quantity: 1.
	^invoice.
]

{ #category : 'configuration' }
ClientTest >> configureInvoice3 [
	
	| invoice |
   invoice :=  Invoice new.
	invoice addItem: self configureArticle2 quantity: 1.
	invoice addItem: self configureArticle1 quantity: 3.
	invoice registerPayment: 847 to: Account new.
	^invoice.
]

{ #category : 'configuration' }
ClientTest >> configureService [
	
	| service1 |
    service1 := Service new.
    service1 duration: 1.3.
    service1 price: 100.
    service1 vat: 21.
    ^service1.
]

{ #category : 'running' }
ClientTest >> setUp [
	
		
	super setUp.
	client := Client new.
	client name: 'Tato';
		surname: 'Molina';
		addDocument: self configureInvoice1;
		addDocument: self configureInvoice2.
		
	
]

{ #category : 'tests' }
ClientTest >> testCurrentAccountBalance [

	| doc1 doc2 |
	
	doc1 := (2*100*1.5*1.21)+(4*200*1.25*1.21)+(100*1.3*1.21).
	doc2 := (2*100*1.5*1.21)+(1.8*3*25*100*1.21).

	
	self assert: client currentAccountBalance equals: (doc1 + doc2).
]

{ #category : 'tests' }
ClientTest >> testCurrentAccountBalanceWithCreditNote [

	|doc1 doc2 doc3 |
	
	doc1 := (2*100*1.5*1.21)+(4*200*1.25*1.21)+(100*1.3*1.21).
	doc2 := (2*100*1.5*1.21)+(1.8*3*25*100*1.21).
	doc3 := (200*1.25*1.21).
	
	client addDocument: self configureCreditNote.
	
	self assert: client currentAccountBalance equals: (doc1 + doc2 - doc3).
]

{ #category : 'tests' }
ClientTest >> testCurrentAccountBalanceWithOnlyCurrentAccountDocumentsStates [

	|doc1 doc2 doc3 |
	
	doc1 := (2*100*1.5*1.21)+(4*200*1.25*1.21)+(100*1.3*1.21).
	doc2 := (2*100*1.5*1.21)+(1.8*3*25*100*1.21).
	doc3 := (200*1.25*1.21).
	
	client addDocument: self configureInvoice3.
	client addDocument: self configureCreditNote.
	
	self assert: client currentAccountBalance equals: (doc1 + doc2 - doc3).
]
