Class {
	#name : 'CreditNoteTest',
	#superclass : 'DocumentTest',
	#instVars : [
		'creditNote'
	],
	#category : 'Accounting-Tests',
	#package : 'Accounting-Tests'
}

{ #category : 'running' }
CreditNoteTest >> setUp [
	"Setup the common environment for all tests"

	super setUp.
	creditNote := CreditNote new.
	
	creditNote addItem: article1 quantity: 2.
	
]

{ #category : 'tests' }
CreditNoteTest >> testCalculateTotalOfCreditNote [
	"Should sum the total of all items plus VAT"

	self assert: creditNote calculateTotal equals: -363.
]
