"
Class representing a Receipt
"
Class {
	#name : 'Receipt',
	#superclass : 'Document',
	#category : 'Accounting',
	#package : 'Accounting'
}

{ #category : 'initialization' }
Receipt >> calculateBalance [ 

	^payment negated.
]
