//
//  main.swift
//  YuHsuan-Huang_COMP2125-02_Mid-Term_Ex-01
//
//  Created by Yu-Hsuan Huang on 2021/6/20.
//  Copyright © 2021 Georgian College. All rights reserved.
//

import Foundation

print(" ========= Student Loan Tester 1 ========= ");
print("###")
print("\t\tDefault Initilizer")
print("\t\tTrying to change WRONG interest rate, WRONG loan amount, WRONG duration Values")
print("\t\tDisplay Monthly Installment Pament value")
print("###")
var studentLoan1 = StudentLoan()
//display description & monthly payment
print(studentLoan1.description)
print(String(format: "Monthly Installment Payment: %.2f", studentLoan1.CalculateMonthlyPayment()))
//set WRONG values
studentLoan1.interestRate = -1.5
studentLoan1.interestRate = 1.5
studentLoan1.interestRate = 3.5
studentLoan1.loanAmount = -100.67
studentLoan1.loanAmount = 0
studentLoan1.duration = -3
studentLoan1.duration = 3
studentLoan1.duration = 15

print("\n\n\n")
print(" ========= Student Loan Tester 2 ========= ");
print("###")
print("\t\tAll Parameters Initilizer")
print("\t\tTrying to change interest rate, loan amount, duration Values")
print("\t\tDisplay Monthly Installment Pament value")
print("###")
var studentLoan2 = StudentLoan(loanNumber: 2266, studentName: "YuHsuan", interestRate: 3.5, loanAmount: 6500, duration: 5);
//display description & monthly payment
print(studentLoan2.description)
print(String(format: "Monthly Installment Payment: %.2f", studentLoan2.CalculateMonthlyPayment()))
//change interest rate
studentLoan2.interestRate = 5
//change loan amount
studentLoan2.loanAmount = 3500
//change duration
studentLoan2.duration = 8
//display description & monthly payment
print()
print(studentLoan2.description)
print(String(format: "Monthly Installment Payment: %.2f", studentLoan2.CalculateMonthlyPayment()))




print("\n\n\n")
print(" ========= Student Loan Tester 3 ========= ");
print("###")
print("\t\tConvenience Initilizer")
print("\t\tDisplay Monthly Installment Pament value")
print("###")
var studentLoan3 = StudentLoan(loanNumber: 5566, studentName: "Sean", loanAmount: 8000);
//display description & monthly payment
print(studentLoan3.description)
print(String(format: "Monthly Installment Payment: %.2f", studentLoan3.CalculateMonthlyPayment()))

