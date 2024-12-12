Class {
	#name : 'Fuel',
	#superclass : 'Object',
	#instVars : [
		'price',
		'name',
		'stock'
	],
	#category : 'Aviation',
	#package : 'Aviation'
}

{ #category : 'accessing' }
Fuel >> initialize [ 

	super initialize.
	self price: 0.
	self name: ''.
]

{ #category : 'accessing' }
Fuel >> name [

	^name.
]

{ #category : 'accessing' }
Fuel >> name: aString [

	name := aString.
]

{ #category : 'accessing' }
Fuel >> price [

	^price.
]

{ #category : 'accessing' }
Fuel >> price: anAmount [

	price := anAmount.
]
