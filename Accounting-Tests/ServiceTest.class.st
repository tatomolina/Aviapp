Class {
	#name : 'ServiceTest',
	#superclass : 'ProductTest',
	#instVars : [
		'service'
	],
	#category : 'Accounting-Tests',
	#package : 'Accounting-Tests'
}

{ #category : 'running' }
ServiceTest >> setUp [
	super setUp.

	service := Service new.
	service duration: 10.
	service price: 50.
	service vat: 21.
]

{ #category : 'tests' }
ServiceTest >> testCalculateFinalPrice [
	"Should calculate the final price, including VAT"
	
	self assert: service calculateFinalPrice equals: 605.
]

{ #category : 'tests' }
ServiceTest >> testCalculateSellingPrice [
	"Should calculate the selling price correctly"
	
	self assert: service calculateSellingPrice equals: 500.
]
