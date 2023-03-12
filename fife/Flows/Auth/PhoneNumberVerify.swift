//
//  PhoneNumberVerify.swift
//  fife
//
//  Created by Nicholas Rabow on 3/12/23.
//

import SwiftUI

struct PhoneNumberVerify: View {
    
    @State var code: String = ""
    
    private var authService:AuthService = AuthService()
    
    var body: some View {
        ZStack {
            FifeColor.backgroundColor.ignoresSafeArea()
            VStack {
                Text("Enter Verification Code")
                    .foregroundColor(.white)
                    .frame(width: 300, alignment: .leading)
                TextField("______", text: $code)
                    .frame(width: 300, height: 64)
                    .background(RoundedRectangle(cornerRadius: 8).fill(FifeColor.grey))
                    .multilineTextAlignment(.center)
                    .font(.system(size: 36, weight: .semibold))
                    .tracking(20)
                    .foregroundColor(.white)
                Button("Submit") {
                    let signInSuccess = authService.attemptSignIn(verificationCode: code)
                    if (signInSuccess) {
                        print("success")
                    } else {
                        print("fail")
                    }
                }
                .withTightButtonViewModifier(backgroundColor: FifeColor.pink)
                .padding()
            }
            .padding(30)
        }
        .keyboardType(.numberPad)
    }
}

struct PhoneNumberVerify_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberVerify()
    }
}
