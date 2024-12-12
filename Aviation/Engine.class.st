Class {
	#name : 'Engine',
	#superclass : 'Component',
	#instVars : [
		'serialNumber'
	],
	#category : 'Aviation',
	#package : 'Aviation'
}

{ #category : 'accessing' }
Engine >> serialNumber [

	^serialNumber.
]

{ #category : 'accessing' }
Engine >> serialNumber: aSerialNumber [

	serialNumber := aSerialNumber.
]
