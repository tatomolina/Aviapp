"
Services that can be sell
"
Class {
	#name : 'Service',
	#superclass : 'Product',
	#instVars : [
		'duration',
		'price'
	],
	#category : 'Accounting',
	#package : 'Accounting'
}

{ #category : 'adding' }
Service >> addStock: aNumber [
	"Is a Service. It dosent have a stock"
	

	
]

{ #category : 'calculations' }
Service >> calculateSellingPrice [
	"It multiplies a duration of a service to  an amount to calculates the selling price"

	^duration * price.
]

{ #category : 'accessing' }
Service >> duration [
	
	^duration.
]

{ #category : 'accessing' }
Service >> duration: aDuration [
	
	duration := aDuration.
]

{ #category : 'adding' }
Service >> isBelowMinimumStock [
	"Is a service, it dosent have a stock"
	
	^false.

	
]

{ #category : 'accessing' }
Service >> price [
	
	^price.
]

{ #category : 'accessing' }
Service >> price: anAmount [
	
	price := anAmount.
]

{ #category : 'adding' }
Service >> removeStock: aNumber [
	"Is a Service. It dosent have a stock"
	
	

	
]
