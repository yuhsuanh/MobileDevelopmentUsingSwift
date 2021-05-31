import Cocoa

//... Example: Demonstrating scopes ...//
var x = 5 // global variable x

class Scope {
    var x = 1 // property hides global variable x in class Scope
    // this is called instance variable in C# and Java Or class variable
    
    // create and initialize local variable x during each call
    func useLocalVariable()
    {
        var x = 25 // initialized each time useLocalVariable is called
        
        print("\nlocal x on entering useLocalVariable is \(x)")
        x += 1 // modifies this method's local variable x
        print("local x before exiting useLocalVariable is \(x)")
    }
    
    // modify class Scope's property x during each call
    func useProperty() {
        print("\nproperty x on entering useProperty is \(x)")
        x *= 10 // modifies class Scope's property x
        print("property x before exiting useProperty is \(x)")
    }
} // end class scope

var scope = Scope() // create a Scope object

print("global variable x when program begins execution is \(x)")

scope.useLocalVariable()
scope.useProperty()
scope.useLocalVariable()
scope.useProperty()

print("\nglobal variable x before program terminates is \(x)")


