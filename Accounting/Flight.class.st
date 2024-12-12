"
Class in charge of all the flight calculations
"
Class {
	#name : 'Flight',
	#superclass : 'Service',
	#instVars : [
		'departureHour',
		'arrivalHour',
		'departureAirdrome',
		'arrivalAirdrome',
		'plane',
		'flightType',
		'fuel'
	],
	#category : 'Accounting',
	#package : 'Accounting'
}

{ #category : 'instance creation' }
Flight class >> newFrom: departure to: arrival since: timeOfDeparture to: timeOfArrival [
	"new method"

	|flight|
	
	flight := self new.
	flight departureAirdrome: departure; arrivalAirdrome: arrival; departureHour: timeOfDeparture; arrivalHour: timeOfArrival.
	^flight.
				 
]

{ #category : 'accessing' }
Flight >> arrivalAirdrome [
	
	^arrivalAirdrome.
]

{ #category : 'accessing' }
Flight >> arrivalAirdrome: airdrome [
	
	arrivalAirdrome := airdrome asUppercase.
]

{ #category : 'accessing' }
Flight >> arrivalHour [
	
	^arrivalHour.
]

{ #category : 'accessing' }
Flight >> arrivalHour: aTime [
	
	arrivalHour :=  aTime.
]

{ #category : 'flight-calculations' }
Flight >> calculateSellingPrice [ 
	"Calculates the selling price of the flight"
	
	
	^self plane fuelConsumption * self flightType factor * self duration * self fuel price.
	

]

{ #category : 'accessing' }
Flight >> departureAirdrome [
	
	^departureAirdrome.
]

{ #category : 'accessing' }
Flight >> departureAirdrome: airdrome [
	
	departureAirdrome := airdrome asUppercase.
]

{ #category : 'accessing' }
Flight >> departureHour [
	
	^departureHour.
]

{ #category : 'accessing' }
Flight >> departureHour: aTime [
	
	departureHour := aTime.
]

{ #category : 'services-calculations' }
Flight >> duration [
	
	^self flightTime.
]

{ #category : 'flight-calculations' }
Flight >> flightTime [
	"Responds the amount of time flighted"
	
	|timeInHours|
	
	timeInHours := (((arrivalHour subtractTime: departureHour) asSeconds / 60) / 60) asFloat.
	^(timeInHours * 10) ceiling / 10 asFloat.
	

]

{ #category : 'accessing' }
Flight >> flightType [
	
	^flightType.
]

{ #category : 'accessing' }
Flight >> flightType: aType [
	
	flightType := aType.
]

{ #category : 'accessing' }
Flight >> fuel [
	
	^fuel.
]

{ #category : 'accessing' }
Flight >> fuel: anAmount [
	
	fuel :=  anAmount.
]

{ #category : 'accessing' }
Flight >> plane [
	
	^plane.
]

{ #category : 'accessing' }
Flight >> plane: aPlane [
	
	plane :=  aPlane.
]
