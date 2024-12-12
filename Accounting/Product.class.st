"
Superclass of Article and Services that gather common methods
"
Class {
	#name : 'Product',
	#superclass : 'Object',
	#instVars : [
		'name',
		'description',
		'code',
		'vat'
	],
	#category : 'Accounting',
	#package : 'Accounting'
}

{ #category : 'calculations' }
Product >> calculateFinalPrice [
	"Adds the VAT to the price"


	^self calculateSellingPrice + self calculateVatAmount.

]

{ #category : 'calculations' }
Product >> calculateSellingPrice [
	"Calculates the selling price"


]

{ #category : 'calculations' }
Product >> calculateVatAmount [
	"Calculates the amount that the VAT represents"

	^self calculateSellingPrice * vat / 100
]

{ #category : 'accessing' }
Product >> code [

	^code.
]

{ #category : 'accessing' }
Product >> code: aCode [

	code := aCode.
]

{ #category : 'accessing' }
Product >> description [

	^description.
]

{ #category : 'accessing' }
Product >> description: aDescription [

	description := aDescription.
]

{ #category : 'accessing' }
Product >> initialize [ 

	super initialize.
	self vat: 0.
	self name: ''.
	self description: ''.
	self code: ''.
]

{ #category : 'accessing' }
Product >> name [

	^name.
]

{ #category : 'accessing' }
Product >> name: aName [

	name := aName.
]

{ #category : 'accessing' }
Product >> vat [

	^vat.
]

{ #category : 'accessing' }
Product >> vat: aNumber [

	vat := aNumber.
]
