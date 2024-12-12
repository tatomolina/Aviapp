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
ArticleTest >> testVatAmount [
	"Should calculate the selling price correctly"
	
	self assert: article calculateVatAmount equals: 31.5.
	
	
	
]
