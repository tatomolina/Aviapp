Class {
	#name : 'FlightTest',
	#superclass : 'ServiceTest',
	#instVars : [
		'flight',
		'departure',
		'arrival',
		'plane',
		'fuel',
		'flightType'
	],
	#category : 'Accounting-Tests',
	#package : 'Accounting-Tests'
}

{ #category : 'running' }
FlightTest >> setUp [
	super setUp.

	flightType := FlightType new:'Instruccion' factor: 3.
	plane := Plane new: 'lv-ail'.
	fuel := Fuel new.
	
	plane fuelConsumption: 25.
	fuel price: 100.
	
	departure := Time fromString: '08:00'.
	arrival := Time fromString: '09:43'.
	flight := Flight newFrom: 'sazy'  to: 'sazs'  since: departure  to: arrival. 
	
	flight fuel: fuel.
	flight plane: plane.
	flight flightType: flightType.
	
]

{ #category : 'tests' }
FlightTest >> testCalculateFlightTime [
	"Should calculate the flight time"
	
	self assert: flight flightTime equals: 1.8.
]

{ #category : 'tests' }
FlightTest >> testCalculateSellingPrice [ 
	"Should calculate the selling price"
	
	self assert: flight calculateSellingPrice equals: 13500.
]
