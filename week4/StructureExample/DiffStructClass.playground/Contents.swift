//: Playground - noun: a place where people can play

import Cocoa
var str = "Hello, playground"

// Difference between Value and Reference Type
// defining a struct
struct S {
    var data:Int = -1
}
// Creating a structure variable
var a = S()
var b = a
a.data = 10
print("\(a.data), \(b.data)")
// Here output will be 10 and -1

// defining a class..
class C
{
    var item:Int = -1
    
}
// Creating an object
var x = C()
var y = x
x.item = 10
print("\(x.item), \(y.item)")
// Here output will be 10 and 10

// Few differences:
//1. Inheritance is implemented in the classes but not in the structs
//2. Class is ref type and struct is value type
//3. You need to define a method in the struct as Mutating

struct Person {
    var name: String

    mutating func UpdateName() {
        name = "John"
    }
    
    func Display()
    {
        print(name)
    }
} // end Person

var person = Person(name: "Sujeet")
person.UpdateName()
person.name
person.Display()
