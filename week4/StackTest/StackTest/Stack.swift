// Stack.swift
// Generic Stack type that uses an Array to store elements.
public struct Stack<T> {
    private var elements: [T] = [] // Array to store the Stack's elements
    
    // push element onto stack
    public mutating func push(element: T) {
        elements.append(element)
    }
    
    // pop and return the top element, or nil if the Stack is empty
    public mutating func pop() -> T? {
        return !isEmpty ? elements.removeLast() : nil
    }
    
    // return the top element, or nil if the Stack is empty
    public var top: T? {
        return elements.last
    }
    
    // return true if the Stack is empty; otherwise, return false
    public var isEmpty: Bool {
        return elements.isEmpty
    }
}

