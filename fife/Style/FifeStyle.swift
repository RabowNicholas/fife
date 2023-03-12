//
//  ContentView.swift
//  fife
//
//  Created by Austin Berenyi on 2/21/23.
//

import SwiftUI
import CoreData

struct FifeColor {
    
    static let backgroundColor = Color(red: 23 / 255, green: 21 / 255, blue: 25 / 255)
    static let pink = Color(red: 255 / 255, green: 23 / 255, blue: 135 / 255)
    static let blue = Color(red: 0 / 255, green: 155 / 255, blue: 242 / 255)
    static let grey = Color(red: 55 / 255, green: 64 / 255, blue: 66 / 255)
}

struct DefaultButtonViewModifier: ViewModifier {

    @State var backgroundColor = Color.pink
    
    func body(content: Content) -> some View {
        content
            .font(.system(size:16, weight: .semibold))
            .foregroundColor(.white)
            .frame(width: 350, height: 64)
            .background(backgroundColor)
    }
}

struct TightButtonViewModifier: ViewModifier {

    @State var backgroundColor = Color.pink
    
    func body(content: Content) -> some View {
        content
            .padding()
            .font(.system(size:16, weight: .semibold))
            .foregroundColor(.white)
            .background(backgroundColor)
            .cornerRadius(4)
    }
}



extension View {
    
    func withDefaultButtonFormatting(backgroundColor: Color) -> some View {
            modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
    
    func withTightButtonViewModifier(backgroundColor: Color) -> some View {
        modifier(TightButtonViewModifier(backgroundColor: backgroundColor))
    }
}





