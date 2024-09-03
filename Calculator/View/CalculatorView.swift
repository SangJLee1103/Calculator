//
//  ContentView.swift
//  Calculator
//
//  Created by 이상준 on 9/2/24.
//

import SwiftUI

struct CalculatorView: View {
    
    @State private var number: String = "0"
    var viewModel = CalculatorViewModel()
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    Text("\(number)")
                        .font(.system(size: 80))
                        .foregroundStyle(.white)
                }
                .padding()
                
                ForEach(viewModel.buttons, id: \.self) { button in
                    HStack(spacing: 10) {
                        ForEach(button, id: \.self) { item in
                            Button {
                                
                            } label: {
                                if item == .zero {
                                    Text(item.rawValue)
                                        .font(item.font)
                                        .foregroundStyle(item.foregroundColors)
                                        .padding(.leading, 24)
                                        .frame(width: buttonWidth(item: item), height: buttonHeight(), alignment: .leading)
                                        .background(item.buttonColor)
                                        .clipShape(RoundedRectangle(cornerRadius: buttonWidth(item: item) / 2))
                                } else {
                                    Text(item.rawValue)
                                        .font(item.font)
                                        .frame(width: buttonWidth(item: item), height: buttonHeight())
                                        .background(item.buttonColor)
                                        .foregroundStyle(item.foregroundColors)
                                        .clipShape(RoundedRectangle(cornerRadius: buttonWidth(item: item) / 2))
                                }
                            }
                        }
                    }
                    .padding(.bottom, 7)
                }
                
            }
        }
    }
    
    private func buttonWidth(item: CalculatorButtons) -> CGFloat {
        if item == .zero {
            return ((UIScreen.main.bounds.width - (4 * 14)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5 * 14)) / 4
    }
    
    private func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5 * 14)) / 4
    }
    
    private func calculate(button: CalculatorButtons) {
        
        
    }
}

#Preview {
    CalculatorView()
}
