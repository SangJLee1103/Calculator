//
//  CalculatorButton.swift
//  Calculator
//
//  Created by 이상준 on 9/3/24.
//

import SwiftUI

enum CalculatorButtons: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case subtract = "\u{2212}"
    case add = "\u{002B}"
    case divide = "\u{00F7}"
    case multiply = "\u{00D7}"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "\u{002B}/-"
    
    var buttonColor: Color {
        switch self {
        case .add, .subtract, .divide, .multiply, .equal:
            return .orange
        case .clear, .negative, .percent:
            return Color(.lightGray)
        default:
            return Color(.darkGray)
        }
    }
    
    var foregroundColors: Color {
        switch self {
        case .clear, .negative,. percent:
            return .black
        default:
            return .white
        }
    }
    
    var font: Font {
        switch self {
        case .clear, .negative, .percent:
            return .system(size: 34, weight: .medium)
        case .divide, .multiply, .subtract, .add, .equal:
            return .system(size: 42, weight: .semibold)
        default:
            return .system(size: 38)
        }
    }
    
    enum Operation {
        case add, subtract, divide, multiply, none
    }
}
