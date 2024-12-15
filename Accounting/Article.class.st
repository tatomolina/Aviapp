"
Articles thaat can be purchase or sell
"
Class {
	#name : 'Article',
	#superclass : 'Product',
	#instVars : [
		'purchasePrice',
		'profitMargin',
		'stockMovements',
		'minimumStock'
	],
	#category : 'Accounting',
	#package : 'Accounting'
}

{ #category : 'adding' }
Article >> addStock: aQuantity [

	|movement|
	
	movement := StockMovement type: #entry quantity: aQuantity timestamp: DateAndTime now.
	stock := stock + aQuantity.
	stockMovements add: movement. 
]

{ #category : 'calculations' }
Article >> calculateSellingPrice [
	"It multiplys the purchase price by a profit margin to determine the selling price"

	^purchasePrice + (purchasePrice * profitMargin / 100).
	
]

{ #category : 'accessing' }
Article >> initialize [ 

	super initialize.
	self purchasePrice: 0.
	self profitMargin: 0.
	self stock: 0.
	self minimumStock: 0.
	stockMovements := OrderedCollection new.
]

{ #category : 'accessing' }
Article >> isBelowMinimumStock [

	^stock < minimumStock.
]

{ #category : 'accessing' }
Article >> minimumStock [

	^minimumStock.
]

{ #category : 'accessing' }
Article >> minimumStock: aNumber [

	minimumStock := aNumber.
]

{ #category : 'accessing' }
Article >> profitMargin [

	^profitMargin.
]

{ #category : 'accessing' }
Article >> profitMargin: aPercentaje [

	profitMargin := aPercentaje.
]

{ #category : 'accessing' }
Article >> purchasePrice [

	^purchasePrice.
]

{ #category : 'accessing' }
Article >> purchasePrice: anAmount [

	purchasePrice := anAmount.
]

{ #category : 'adding' }
Article >> removeStock: aQuantity [

	| remainingStock movement |
	remainingStock := stock - aQuantity.
	remainingStock >= 0 ifTrue: [
		stock := remainingStock.
		movement := StockMovement type: #exit quantity: aQuantity negated timestamp: DateAndTime now.
		stockMovements add: movement.
	] ifFalse: [
		self error: 'Not enough stock to complete the operation.'
	].
]

{ #category : 'accessing' }
Article >> stockMovements [

	^stockMovements.
]
