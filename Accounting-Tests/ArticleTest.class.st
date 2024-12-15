Class {
	#name : 'ArticleTest',
	#superclass : 'ProductTest',
	#instVars : [
		'article'
	],
	#category : 'Accounting-Tests',
	#package : 'Accounting-Tests'
}

{ #category : 'running' }
ArticleTest >> setUp [
	super setUp.

	article := Article new.
	article purchasePrice: 100.
	article profitMargin: 50.
	article vat: 21.
]

{ #category : 'tests' }
ArticleTest >> testAddStock [
	"Should add stock to the Article"
	
	article stock: 10.
	article addStock: 5.
	self assert: article stock equals: 15.
]

{ #category : 'tests' }
ArticleTest >> testCalculateFinalPrice [
	"Should calculate the selling price correctly"
	
	self assert: article calculateFinalPrice equals: 181.5.
	
	
	
]

{ #category : 'tests' }
ArticleTest >> testCalculateSellingPrice [
	"Should calculate the selling price correctly"
	
	self assert: article calculateSellingPrice equals: 150.
	
	
	
]

{ #category : 'tests' }
ArticleTest >> testImpactFromACreditNote [
	
	|creditNote|
	article name: 'Pilot Hat'; stock: 10.

	creditNote := CreditNote new.
	creditNote addItem: article quantity: 3.

	self assert: article stock equals: 7.
]

{ #category : 'tests' }
ArticleTest >> testImpactFromAnInvoice [
	
	|invoice|
	article name: 'Pilot Hat'; stock: 10.

	invoice := Invoice new.
	invoice addItem: article quantity: 3.

	self assert: article stock equals: 13.
]

{ #category : 'tests' }
ArticleTest >> testInitailStock [
	"When specified should have an initial stock"
	
	article stock: 10.
	self assert: article stock equals: 10.
]

{ #category : 'tests' }
ArticleTest >> testIsBelowMinimumStock [
	

	article name: 'Pilot Hat'; stock: 5; minimumStock: 3.
	article removeStock: 3.
	
	self assert: article stock equals: 2.
	self assert: article isBelowMinimumStock.
]

{ #category : 'tests' }
ArticleTest >> testItHasStockMovements [
	"An Article should have stock movements"
	
	|movements|
	
	article stock: 10.
	article addStock: 5.
	article removeStock: 2.	
	movements := article stockMovements.
		
		
	self assert: movements size equals: 2.
	self assert: (movements first type) equals: #entry.
	self assert: (movements first quantity) equals: 5.
	self assert: (movements second type) equals: #exit.
	self assert: (movements second quantity) equals: -2.
]

{ #category : 'tests' }
ArticleTest >> testRemoveMoreStockThanItHas [
	"Should remove stock from the Article"
	
	article stock: 10.
		
	self should: [ article removeStock: 15 ] raise: Error.
]

{ #category : 'tests' }
ArticleTest >> testRemoveStock [
	"Should remove stock from the Article"
	
	article stock: 10.
	article removeStock: 3.
	
	self assert: article stock equals: 7.
]

{ #category : 'tests' }
ArticleTest >> testVatAmount [
	"Should calculate the selling price correctly"
	
	self assert: article calculateVatAmount equals: 31.5.
	
	
	
]
