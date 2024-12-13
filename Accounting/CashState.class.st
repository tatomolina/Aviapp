"
Manage Current Account particularities
"
Class {
	#name : 'CashState',
	#superclass : 'DocumentState',
	#category : 'Accounting',
	#package : 'Accounting'
}

{ #category : 'accessing' }
CashState >> totalFor: aDocument [
	
	^aDocument outstandingAmount.
]
