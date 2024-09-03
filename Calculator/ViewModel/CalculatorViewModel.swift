//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by 이상준 on 9/3/24.
//

import SwiftUI

class CalculatorViewModel {
    
    let buttons: [[CalculatorButtons]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
}
