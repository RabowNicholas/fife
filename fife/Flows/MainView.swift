//
//  MainView.swift
//  fife
//
//  Created by Nicholas Rabow on 3/8/23.
//

import SwiftUI

struct MainView: View {
    
    @State var path: [Flows] = []
    
    var body: some View {
            NavigationStack(path: $path) {
                AuthFlowView()
            }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

enum Flows {
    case Auth
}
