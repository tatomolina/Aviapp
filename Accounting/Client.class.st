"
Class representing the clients
"
Class {
	#name : 'Client',
	#superclass : 'Object',
	#instVars : [
		'name',
		'surname',
		'id',
		'address',
		'email',
		'phone',
		'documents',
		'taxId'
	],
	#category : 'Accounting',
	#package : 'Accounting'
}

{ #category : 'accessing' }
Client >> addDocument: aDocument [
	
	documents add: aDocument.
]

{ #category : 'accessing' }
Client >> address [
	
	^address.
]

{ #category : 'accessing' }
Client >> address: anAddress [
	
	address := anAddress.
]

{ #category : 'account-balance' }
Client >> currentAccountBalance [
	"Calculate the summ of the documents that have a current account state"
	
	^self documents inject: 0 into: [ :sum :doc | sum + doc calculateTotal].
]

{ #category : 'accessing' }
Client >> documents [
	
	^documents.
]

{ #category : 'accessing' }
Client >> email [
	
	^email.
]

{ #category : 'accessing' }
Client >> email: aEmail [
	
	email := aEmail.
]

{ #category : 'accessing' }
Client >> id [
	
	^id.
]

{ #category : 'accessing' }
Client >> id: anId [
	
	id := anId.
]

{ #category : 'initialization' }
Client >> initialize [ 
	
	super initialize.
	documents := OrderedCollection new.
	self name: '';
	surname: '';
	address: '';
	id: '';
	email: '';
	phone: ''.
	
	
	
	
]

{ #category : 'accessing' }
Client >> name [
	
	^name.
]

{ #category : 'accessing' }
Client >> name: aName [
	
	name := aName.
]

{ #category : 'accessing' }
Client >> phone [
	
	^phone.
]

{ #category : 'accessing' }
Client >> phone: aPhone [
	
	phone := aPhone.
]

{ #category : 'accessing' }
Client >> surname [
	
	^surname.
]

{ #category : 'accessing' }
Client >> surname: aSurName [
	
	surname := aSurName.
]
