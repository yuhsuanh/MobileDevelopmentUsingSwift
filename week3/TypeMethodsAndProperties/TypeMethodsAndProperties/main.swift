// main.swift
// Demonstrating type methods and properties

// function that creates two Employees
func createEmployees() {
    // create two Employees; count should be 2
    let e1 = Employee(name: "Susan Baker")
    let e2 = Employee(name: "Bob Blue")
    let e3 = Employee(name: "Sujeet Lohan")
    
    // show that Employee count is 2 after creating two Employees
    print("\nEMPLOYEES AFTER INSTANTIATION")
    print("   via type property: \(Employee.count)")
    print("   via type method: \(Employee.getCount())\n")
}

// show that Employee count is 0 before creating Employees
print("EMPLOYEES BEFORE INSTANTIATION")
print("   via type property: \(Employee.count)")
print("   via type method: \(Employee.getCount())\n")

createEmployees()

// show that count is 0 after Employees' references counts go to 0
// Automatic Reference Count
print("\nEMPLOYEES AFTER ARC")
print("   via type property: \(Employee.count)") // no need to create an object of employee class to access the typed property
print("   via type method: \(Employee.getCount())") // no need to create an object of employee class to access typed method

