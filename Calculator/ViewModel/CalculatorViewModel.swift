//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by 이상준 on 9/3/24.
//

import SwiftUI

class CalculatorViewModel: ObservableObject {
    
    @Published var displayNumber = "0"
    @Published private var calNumber: Double = 0.0
    @Published var currentOperation: CalculatorButtons.Operation = .none
    @Published var lastOperation: CalculatorButtons.Operation = .none
    @Published var isTypingNumber: Bool = false
    
    let buttons: [[CalculatorButtons]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    func calculate(button: CalculatorButtons) {
        switch button {
        case .add, .subtract, .multiply, .divide:
            if isTypingNumber {
                if let number = Double(displayNumber) {
                    performPendingOperation(with: number)
                }
            }
            currentOperation = getOperation(from: button)
            isTypingNumber = false
            
        case .equal:
            if isTypingNumber {
                if let number = Double(displayNumber) {
                    performPendingOperation(with: number)
                }
                currentOperation = .none
            }
            isTypingNumber = false
            
        case .clear:
            displayNumber = "0"
            calNumber = 0.0
            currentOperation = .none
            isTypingNumber = false
            
        case .negative:
            toggleNegative()
            
        default:
            if isTypingNumber {
                displayNumber += button.rawValue
            } else {
                displayNumber = button.rawValue
                isTypingNumber = true
            }
        }
    }
    
    private func performPendingOperation(with number: Double) {
        if currentOperation == .none {
            calNumber = number
        } else {
            calNumber = performOperation(firstNumber: calNumber, secondNumber: number)
            displayNumber = formatNumber(calNumber)
        }
    }
    
    private func performOperation(firstNumber: Double, secondNumber: Double) -> Double {
        switch currentOperation {
        case .add:
            return firstNumber + secondNumber
        case .subtract:
            return firstNumber - secondNumber
        case .multiply:
            return firstNumber * secondNumber
        case .divide:
            return firstNumber / secondNumber
        case .none:
            return secondNumber
        }
    }
    
    private func toggleNegative() {
        if let number = Double(displayNumber) {
            let toggledNumber = number * -1
            displayNumber = formatNumber(toggledNumber)
        }
    }
    
    // MARK: 소수점 .0 제거를 위한 포맷 함수
    private func formatNumber(_ number: Double) -> String {
        if number.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(number))
        } else {
            return String(number)
        }
    }
    
    private func getOperation(from button: CalculatorButtons) -> CalculatorButtons.Operation {
        switch button {
        case .add:
            return .add
        case .subtract:
            return .subtract
        case .multiply:
            return .multiply
        case .divide:
            return .divide
        default:
            return .none
        }
    }
}
