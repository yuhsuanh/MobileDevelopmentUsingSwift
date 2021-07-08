//
//  StudentLoanExtensions.swift
//  YuHsuan-Huang_COMP2125-02_Mid-Term_Ex-01
//
//  Created by Yu-Hsuan Huang on 2021/6/20.
//  Copyright © 2021 Georgian College. All rights reserved.
//

import Foundation

// convenience inits
extension StudentLoan {
    
    // convenience init
    public convenience init(loanNumber: Int, studentName: String, loanAmount: Double) {
        self.init(loanNumber: loanNumber, studentName: studentName, interestRate: 2.0, loanAmount: loanAmount, duration: 5)
    }
    
}

// properties
extension StudentLoan {
    
    // display all the instance data member's values of student loan object
    var description: String {
        return String(format: "Loan Number: %d\nStudent Name: %@\nYearly Interest Rate: %.2f\nLoan Amount: %.2f\nTime Duration: %d years\nTax Exemption: %.2f", loanNumber, studentName, interestRate, loanAmount, duration, taxExemption)
    }
    
}

// functions
extension StudentLoan {
    
    // calculating the monthly installment payment base on the rate and time
    func CalculateMonthlyPayment() -> Double {
        let interest = (loanAmount - taxExemption) * interestRate * Double(duration) / 100
        let monthlyPayment = ((loanAmount - taxExemption) + interest) / (Double(duration) * 12)
        
        return monthlyPayment
    }
    
}
