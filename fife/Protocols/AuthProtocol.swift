//
//  AuthProtocol.swift
//  fife
//
//  Created by Nicholas Rabow on 3/12/23.
//

import Foundation
import FirebaseAuth

protocol AuthProtocol {
    func sendVerificationCode(phoneNumber: String) -> Bool
    func attemptSignIn(verificationCode: String) -> Bool
}

struct AuthService : AuthProtocol {
    
    func sendVerificationCode(phoneNumber: String) -> Bool  {
        var sent: Bool = true;
        PhoneAuthProvider.provider()
            .verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
                if let error = error {
                    print(error)
                    sent = false
                    return
                }
                UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
            }
        return sent
    }
        
        func attemptSignIn(verificationCode: String) -> Bool {
            var signedIn: Bool = true
            let verificationID = UserDefaults.standard.string(forKey: "authVerificationID")!
            let credential = PhoneAuthProvider.provider().credential(
                withVerificationID: verificationID,
                verificationCode: verificationCode
            )
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                  let authError = error as NSError
                    print(authError)
                    signedIn = false
                    return
                  }
                }
                return signedIn
        }
}
