//
//  AuthFlow.swift
//  fife
//
//  Created by Nicholas Rabow on 3/8/23.
//

import SwiftUI

struct AuthFlowView: View {
    
    @State var authFlowPath: [AuthFlowViewEnum] = []
    
    var body: some View {
            NavigationStack(path: $authFlowPath) {
                ZStack {
                    FifeColor.backgroundColor.ignoresSafeArea()
                    VStack(alignment: .leading) {
                        Text("Log in Using")
                            .foregroundColor(Color.white)
                        NavigationLink(value: AuthFlowViewEnum.phone, label: {
                            Label("Phone", systemImage: "iphone")
                                .withDefaultButtonFormatting(backgroundColor: FifeColor.pink)
                            
                        })
                        NavigationLink(value: AuthFlowViewEnum.email, label: {
                            Label("Email", systemImage: "mail")
                                .withDefaultButtonFormatting(backgroundColor: FifeColor.blue)
                        })
                        .navigationDestination(for: AuthFlowViewEnum.self) { flowView in
                            switch flowView {
                            case .phone:
                                PhoneNumberEntry(authFlowPath: $authFlowPath)
                            case .email:
                                PhoneNumberEntry(authFlowPath: $authFlowPath)
                            case .phoneVerify:
                                PhoneNumberVerify()
                            }
                        }
                    }
                }
        }
    }
}

struct AuthFlow_Previews: PreviewProvider {
    static var previews: some View {
        AuthFlowView()
    }
}
