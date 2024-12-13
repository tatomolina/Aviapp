"
It handles the deposit and withdraw of money from an account
"
Class {
	#name : 'Account',
	#superclass : 'Object',
	#instVars : [
		'name',
		'description',
		'balance',
		'movements'
	],
	#category : 'Accounting',
	#package : 'Accounting'
}

{ #category : 'accessing' }
Account >> balance [

	^balance.
]

{ #category : 'accessing' }
Account >> deposit: anAmount [

	balance := balance + anAmount.
	movements add: anAmount.
]

{ #category : 'accessing' }
Account >> initialBalance: anAmount [

	balance := anAmount.
]

{ #category : 'initialization' }
Account >> initialize [ 
	
	name := ''.
	balance := 0.
	movements := OrderedCollection new.
]

{ #category : 'accessing' }
Account >> movements [

	^movements.
]

{ #category : 'accessing' }
Account >> name [

	^name.
]

{ #category : 'accessing' }
Account >> name: aName [

	name := aName.
]

{ #category : 'accessing' }
Account >> withdraw: anAmount [

	balance := balance - anAmount.
	movements add: anAmount negated.
]
