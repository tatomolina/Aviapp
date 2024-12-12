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

{ #category : 'accessing' }
Service >> price [
	
	^price.
]

{ #category : 'accessing' }
Service >> price: anAmount [
	
	price := anAmount.
]
