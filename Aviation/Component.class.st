Class {
	#name : 'Component',
	#superclass : 'Object',
	#instVars : [
		'hours',
		'overhaulDate',
		'name'
	],
	#category : 'Aviation',
	#package : 'Aviation'
}

{ #category : 'accessing' }
Component >> hours [ 

	^hours.
]

{ #category : 'accessing' }
Component >> hours: hour [

	hours := hour.
]

{ #category : 'accessing' }
Component >> name [ 

	^name.
]

{ #category : 'accessing' }
Component >> name: aString [

	name := aString.
]

{ #category : 'accessing' }
Component >> overhaulDate [

	^overhaulDate.
]

{ #category : 'accessing' }
Component >> overhaulDate: date [

	overhaulDate := date.
]
