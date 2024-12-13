"
State of a Doument. 
It will handle if it is a Current account or in cash.
"
Class {
	#name : 'DocumentState',
	#superclass : 'Object',
	#category : 'Accounting',
	#package : 'Accounting'
}

{ #category : 'accessing' }
DocumentState >> totalFor: aDocument [
	
	self subclassResponsibility.
]
