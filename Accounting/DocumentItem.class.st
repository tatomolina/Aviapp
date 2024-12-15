"
A product can be more tha one, so with this class we will handle the product + the quantity of that product.
"
Class {
	#name : 'DocumentItem',
	#superclass : 'Object',
	#instVars : [
		'product',
		'quantity'
	],
	#category : 'Accounting',
	#package : 'Accounting'
}

{ #category : 'totals' }
DocumentItem >> calculateItemSubtotal [ 
	
	^(product calculateSellingPrice ) * (self isService ifTrue: [ 1 ] ifFalse: [ quantity ]).
]

{ #category : 'totals' }
DocumentItem >> calculateItemVat [
	
	^(product calculateVatAmount ) * (self isService ifTrue: [ 1 ] ifFalse: [ quantity ]).
]

{ #category : 'initialization' }
DocumentItem >> initialize [ 

	quantity := 1.  "Default to 1 for services"
]

{ #category : 'question' }
DocumentItem >> isService [
	
	^product isKindOf: Service.
]

{ #category : 'stock-managment' }
DocumentItem >> manageStock: aDocument [

	(aDocument isKindOf: Invoice) ifTrue: [	product addStock: quantity ].
	(aDocument isKindOf: CreditNote) ifTrue: [ product removeStock: quantity ].
]

{ #category : 'accessing' }
DocumentItem >> product [
	
	^product.
]

{ #category : 'accessing' }
DocumentItem >> product: aProduct [
	
	product := aProduct.
]

{ #category : 'accessing' }
DocumentItem >> quantity [
	
	^quantity.
]

{ #category : 'accessing' }
DocumentItem >> quantity: aQuantity [
	
	quantity := aQuantity.
]
