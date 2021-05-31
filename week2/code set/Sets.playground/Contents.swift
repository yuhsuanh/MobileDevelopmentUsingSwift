//: Playground - noun: a place where people can play
// Examples of Set - Swift Programming

import UIKit

// ...Example 01: .... Initializing a Set
// Used to represent the set values
// It is unordered collection
// No duplicates allowed

var groceryItems = Set<String>(["Apples", "Oranges", "Pineapple"])
var stationaryItems: Set = ["Pen", "Pencil", "Folder"] // type inference, type of the values of the set is String

// Displaying the values
print(groceryItems)
print(stationaryItems)

// ...Example 02: .... Adding to set

var groceryBag = Set<String>() // empty set of the String
groceryBag.insert("Apples")
groceryBag.insert("Oranges")
groceryBag.insert("Pineapple")
print(groceryBag)

var stationaryBag = Set<String>()
stationaryBag.insert("Pen")
stationaryBag.insert("Pencil")
stationaryBag.insert("Eraser")

var shoppingCart = Set<String>()
shoppingCart.insert("Pant")
shoppingCart.insert("Shoes")
shoppingCart.insert("Shirt")

print(shoppingCart)

//..Example 03: .... Looping through a set:

var groceryCart = Set<String>()
groceryCart.insert("Apples")
groceryCart.insert("Oranges")
groceryCart.insert("Pineapple")

// Use of array to iterate over the Set
for food in groceryCart {
    print(food)
}

//...Example 04: .... Check if an item is present

var courseList: Set = ["Swift", "Python", "Java"]
for course in courseList {
    print(course)
}

let hasItem = courseList.contains("Java") // here hasItem is false

//..Example 05: ....Unions of Sets ..Combining sets
///*
var groceryItemsBag: Set = ["Apples", "Oranges", "Pineapple"]
for food in groceryItemsBag {
    print(food)
}
let hasItemBananas = groceryItemsBag.contains("Bananas")
let friendsGroceryBag = Set(["Bananas", "Cereal", "Milk", "Oranges"])
let commonGroceryBag = groceryItemsBag.union(friendsGroceryBag)

// ....Example 06: ....Intersecting sets:

var myGroceryBag: Set = ["Apples", "Oranges", "Pineapple"]
for food in groceryBag {
    print(food)   }
let hasBananas = myGroceryBag.contains("Bananas")
let myFriendsGroceryBag = Set(["Bananas", "Cereal", "Milk", "Oranges"])
let mycommonGroceryBag = groceryBag.union(friendsGroceryBag)
let roommatesGroceryBag = Set(["Apples", "Bananas", "Cereal", "Toothpaste"])
let itemsToReturn = commonGroceryBag.intersection(roommatesGroceryBag)




