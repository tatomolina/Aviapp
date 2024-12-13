"
Manage Cash particularities
"
Class {
	#name : 'CurrentAccountState',
	#superclass : 'DocumentState',
	#category : 'Accounting',
	#package : 'Accounting'
}

{ #category : 'accessing' }
CurrentAccountState >> totalFor: aDocument [
	
	^aDocument total.
]
