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
}

struct DefaultButtonViewModifier: ViewModifier {

    @State var backgroundColor = Color.pink
    
    func body(content: Content) -> some View {
        content
            .font(.system(size:16, weight: .semibold))
            .foregroundColor(.white)
            .frame(height: 64)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(4)
    }
}

extension View {
    
    func withDefaultButtonFormatting(backgroundColor: Color) -> some View {
            modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var number = ""
    
    var body: some View {
        ZStack {
            
            FifeColor.backgroundColor.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 8) {
                
                Text("Log in using")
                    .foregroundColor(.white)
                    .font(.headline)
                
                Button() {
                    goToPhoneVerification()
                } label: {
                    Label("Phone Number", systemImage: "iphone")
                }
                .withDefaultButtonFormatting(backgroundColor: FifeColor.pink)
                
                Button {} label: {
                    Label("Email", systemImage: "mail")
                }
                .withDefaultButtonFormatting(backgroundColor: FifeColor.blue)
                
            }
            .padding()
        }
    }
    
    private func goToPhoneVerification() {
        
    }
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
