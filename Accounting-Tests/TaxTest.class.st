Class {
	#name : 'TaxTest',
	#superclass : 'TestCase',
	#instVars : [
		'tax'
	],
	#category : 'Accounting-Tests',
	#package : 'Accounting-Tests'
}

{ #category : 'running' }
TaxTest >> setUp [
	super setUp.

	tax := Tax new.
	tax name: #Vat.
	tax percentage: 21.
]

{ #category : 'tests' }
TaxTest >> testTaxInitialization [

	self assert: tax name equals: #Vat.
	self assert: tax percentage equals: 21/100. 
]
