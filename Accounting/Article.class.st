"
Articles thaat can be purchase or sell
"
Class {
	#name : 'Article',
	#superclass : 'Product',
	#instVars : [
		'stock',
		'purchasePrice',
		'profitMargin'
	],
	#category : 'Accounting',
	#package : 'Accounting'
}

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

{ #category : 'accessing' }
Article >> stock: aNumber [

	stock := aNumber.
]
