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

{ #category : 'initialization' }
CreditNote >> registerPayment: anAmount to: aAccount [

	| paymentAmount |
	paymentAmount := (anAmount min: self calculateBalance).  "Ensure no overpayment"
	aAccount withdraw: paymentAmount.  "For most documents, deposit money"
	paidAmount := paidAmount + paymentAmount.
]
