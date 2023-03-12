//
//  LoginMethod.swift
//  fife
//
//  Created by Nicholas Rabow on 3/11/23.
//

import SwiftUI

enum AuthFlowViewEnum:String, Hashable, CaseIterable, Identifiable {
    case phone
    case phoneVerify
    case email
    
    var id:String {
        self.rawValue
    }

}
