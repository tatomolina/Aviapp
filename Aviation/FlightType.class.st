Class {
	#name : 'FlightType',
	#superclass : 'Object',
	#instVars : [
		'name',
		'factor'
	],
	#category : 'Aviation',
	#package : 'Aviation'
}

{ #category : 'instance creation' }
FlightType class >> new: aName factor: aFactor [
	
	|flightType|
	
	flightType := FlightType new.
	flightType name: aName.
	flightType factor: aFactor.
	^flightType.
]

{ #category : 'accessing' }
FlightType >> factor [

	^factor.
	
	
]

{ #category : 'accessing' }
FlightType >> factor: aFactor [

	factor := aFactor.
	
	
]

{ #category : 'accessing' }
FlightType >> name [

	^name.
	
	
]

{ #category : 'accessing' }
FlightType >> name: aString [

	name := aString.
	
	
]
