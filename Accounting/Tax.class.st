"
Manage Tax logic
"
Class {
	#name : 'Tax',
	#superclass : 'Object',
	#instVars : [
		'name',
		'percentage'
	],
	#category : 'Accounting',
	#package : 'Accounting'
}

{ #category : 'accessing' }
Tax >> name [

	^name.
]

{ #category : 'accessing' }
Tax >> name: aName [

	name := aName.
]

{ #category : 'accessing' }
Tax >> percentage [

	^percentage / 100.
]

{ #category : 'accessing' }
Tax >> percentage: aNumber [

	percentage := aNumber.
]
