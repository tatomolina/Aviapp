"
Class representing a receipt.
"
Class {
	#name : 'CreditNote',
	#superclass : 'Document',
	#category : 'Accounting',
	#package : 'Accounting'
}

{ #category : 'totals' }
CreditNote >> calculateTotal [
	
	|total|
	total := super calculateTotal.
	^total negated.
]
