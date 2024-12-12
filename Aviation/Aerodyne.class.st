Class {
	#name : 'Aerodyne',
	#superclass : 'Object',
	#instVars : [
		'registration',
		'initialAirframeHours',
		'lastOverhaulDate',
		'hoursSinceLastOverhaul',
		'flights'
	],
	#category : 'Aviation',
	#package : 'Aviation'
}

{ #category : 'instance creation' }
Aerodyne class >> new: string [

	|aerodyne|
	aerodyne := self new.
	aerodyne registration: string.
	^aerodyne.
	
]

{ #category : 'accessing' }
Aerodyne >> flights [

	^flights.
]

{ #category : 'accessing' }
Aerodyne >> hoursSinceLastOverhaul [

	^hoursSinceLastOverhaul.
]

{ #category : 'accessing' }
Aerodyne >> hoursSinceLastOverhaul: amount [

	hoursSinceLastOverhaul := amount.
]

{ #category : 'initialization' }
Aerodyne >> initialize [ 

	super initialize.
	flights := OrderedCollection new.
]

{ #category : 'accessing' }
Aerodyne >> initiallAirframeHours: amount [

	initialAirframeHours := amount.
]

{ #category : 'accessing' }
Aerodyne >> lastOverhaulDate [

	^lastOverhaulDate.
]

{ #category : 'accessing' }
Aerodyne >> lastOverhaulDate: date [

	lastOverhaulDate := date.
]

{ #category : 'accessing' }
Aerodyne >> registration [

	^registration.
]

{ #category : 'accessing' }
Aerodyne >> registration: string [

	registration := string asUppercase.
]

{ #category : 'accessing' }
Aerodyne >> totalAirframeHours [

	|result|
	result := 0.
	^initialAirframeHours + self flights do: [:i | result :=  result + i flightTime ].
]
