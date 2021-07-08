//
//  StudentLoan.swift
//  YuHsuan-Huang_COMP2125-02_Mid-Term_Ex-01
//
//  Created by Yu-Hsuan Huang on 2021/6/20.
//  Copyright © 2021 Georgian College. All rights reserved.
//

import Foundation

public class StudentLoan {
    // student name and loan number are 'PRIVATE LEVEL'
    // ** private(set) means read only for outside this class
    private(set) var loanNumber: Int
    private(set) var studentName: String
    
    // should be positive and between 2.0 - 5.0, DEFAULT 2.0
    var interestRate: Double {
        didSet {
            if interestRate < 2.0 || interestRate > 5.0 {
                print("* Yearly Interest Rate (\(interestRate)) value is wrong! It must between 2.0 - 5.0! ");
                interestRate = oldValue
            }
        }
    }
    // should not be negative or zero
    var loanAmount: Double {
        didSet {
            if loanAmount <= 0 {
                print("* Loan Amout value (\(loanAmount)) is wrong! It must greater than 0! ")
                loanAmount = oldValue
            }
        }
    }
    // should between 5 years and 9 years, DEFAULT 5 years
    var duration: Int {
        didSet {
            if duration < 5 || duration > 9 {
                print("* Time Duration (\(duration)) value is wrong! It must between 5 - 9! ")
                duration = oldValue
            }
        }
    }
    
    // tax exemption for student loan should be 1% of loan amount
    var taxExemption: Double {
        return loanAmount * 0.01
    }
    
    // initializer without parameters default value
    public init() {
        loanNumber = 1234
        studentName = "Default Name"
        interestRate = 2.0
        loanAmount = 10000
        duration = 5
    }
    
    // initializer with 5 parameters
    public init(loanNumber: Int, studentName: String, interestRate: Double, loanAmount: Double, duration: Int) {
        self.loanNumber = loanNumber
        self.studentName = studentName
        self.interestRate = interestRate
        self.loanAmount = loanAmount
        self.duration = duration
    }
    
    // deinitializer
    deinit {
    }
    
}
