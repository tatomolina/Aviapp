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

	^paidAmount negated.
]

{ #category : 'initialization' }
Receipt >> registerPayment: anAmount to: aAccount [

  "Receipts can accept any payment amount"
	aAccount deposit: anAmount.  "Always deposit money in receipt"
	paidAmount := paidAmount + anAmount.
]
