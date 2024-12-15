Class {
	#name : 'StockMovement',
	#superclass : 'Object',
	#instVars : [
		'type',
		'quantity',
		'timestamp'
	],
	#category : 'Accounting',
	#package : 'Accounting'
}

{ #category : 'new selection' }
StockMovement class >> type: aType quantity: aQuantity timestamp: aTimestamp [ 

	^self new
		type: aType;
		quantity: aQuantity;
		timestamp: aTimestamp;
		yourself.
]

{ #category : 'accessing' }
StockMovement >> quantity [

	^quantity.
]

{ #category : 'accessing' }
StockMovement >> quantity: aQuantity [

	quantity := aQuantity.
]

{ #category : 'accessing' }
StockMovement >> timestamp [

	^timestamp.
]

{ #category : 'accessing' }
StockMovement >> timestamp: aTimestamp [

	timestamp := aTimestamp.
]

{ #category : 'accessing' }
StockMovement >> type [

	^type.
]

{ #category : 'accessing' }
StockMovement >> type: aType [

	type := aType.
]
