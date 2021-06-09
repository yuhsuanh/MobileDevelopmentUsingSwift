// Circle.swift
// Circle class with read-write computed properties
import Darwin

public class Circle {
    public var radius: Double = 0.0 // stored property
    
    // Computed Properties..
    // computes diameter or sets radius based on new diameter
    // They don't store the values
    public var diameter: Double {
        get {
            return 2.0 * radius
        }
        set {
            radius = newValue / 2.0
        }
    }
    
    // computes circumference or sets radius based on new circumference
    public var circumference: Double {
        get {
            return Double.pi * diameter // 2 * pi * r or 2 * 3.14 * radious
        }
        set {
            radius = newValue / (2.0 * Double.pi)
        }
    }

    // computes area or sets radius based on new area
    public var area: Double {
        get {
            return Double.pi * radius * radius
        }
      set {
            radius = sqrt(newValue / Double.pi)
        }
    } // end property
} // end class


