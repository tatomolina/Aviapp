"
Class that should contemplete all related to a Plane
"
Class {
	#name : 'Plane',
	#superclass : 'Aerodyne',
	#instVars : [
		'engines',
		'fuelConsumption'
	],
	#category : 'Aviation',
	#package : 'Aviation'
}

{ #category : 'accessing' }
Plane >> engines [ 

	^engines.
]

{ #category : 'accessing' }
Plane >> engines: anEngine [

	engines add: anEngine
]

{ #category : 'accessing' }
Plane >> fuelConsumption [

	^fuelConsumption.
]

{ #category : 'accessing' }
Plane >> fuelConsumption: aNumber [

	fuelConsumption := aNumber .
]

{ #category : 'initialization' }
Plane >> initialize [ 

	super initialize.
	engines := OrderedCollection new.
	self fuelConsumption: 0.
]
