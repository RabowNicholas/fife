//
//  fifeApp.swift
//  fife
//
//  Created by Austin Berenyi on 2/21/23.
//

import SwiftUI

@main
struct fifeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
