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
		'vat',
		'stock',
		'taxes'
	],
	#category : 'Accounting',
	#package : 'Accounting'
}

{ #category : 'adding' }
Product >> addStock: aNumber [

	self subclassResponsibility.
]

{ #category : 'accessing' }
Product >> addTax: aTax [

	taxes add: aTax.
]

{ #category : 'calculations' }
Product >> calculateFinalPrice [
	"Adds the VAT to the price"


	^self calculateSellingPrice + self calculateVatAmount + self calculateTaxesAmount.

]

{ #category : 'calculations' }
Product >> calculateSellingPrice [
	"Calculates the selling price"

	self subclassResponsibility.
]

{ #category : 'calculations' }
Product >> calculateTaxesAmount [
	"Calculates the amount that the VAT represents"

	^self taxes inject: 0 into: [ :sum :tax | sum + (self calculateSellingPrice * tax percentage) ].
]

{ #category : 'calculations' }
Product >> calculateVatAmount [
	"Calculates the amount that the VAT represents"

	^self calculateSellingPrice * vat percentage.
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

{ #category : 'initialization' }
Product >> initialize [ 

	super initialize.
	self vat: 0.
	self name: ''.
	self description: ''.
	self code: ''.
	taxes := OrderedCollection new.
]

{ #category : 'adding' }
Product >> isBelowMinimumStock [

	self subclassResponsibility.
]

{ #category : 'accessing' }
Product >> name [

	^name.
]

{ #category : 'accessing' }
Product >> name: aName [

	name := aName.
]

{ #category : 'adding' }
Product >> removeStock: aNumber [

	self subclassResponsibility.
]

{ #category : 'accessing' }
Product >> stock [

	^stock.
]

{ #category : 'accessing' }
Product >> stock: aNumber [

	stock := aNumber.
]

{ #category : 'accessing' }
Product >> taxes [

	^taxes.
]

{ #category : 'accessing' }
Product >> vat [

	^vat.
]

{ #category : 'accessing' }
Product >> vat: aNumber [

	vat := aNumber.
]
