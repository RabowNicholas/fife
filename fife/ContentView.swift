//
//  ContentView.swift
//  fife
//
//  Created by Austin Berenyi on 2/21/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var number = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
           Text("Log in using")
            Button() {
                goToPhoneVerification()
            } label: {
                Label("Phone Number", systemImage: "iphone")
            }
            Button {} label: {
                Label("Email", systemImage: "mail")
            }

        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle(radius: 8))
    }
    
    private func goToPhoneVerification() {
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
