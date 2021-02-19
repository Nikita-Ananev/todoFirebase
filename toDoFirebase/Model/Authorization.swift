//
//  Authorization.swift
//  toDoFirebase
//
//  Created by Никита Ананьев on 20.02.2021.
//

import Foundation
import FirebaseAuth

class Authorization {
    
    static let shared = Authorization()
    
    var email: String {
        didSet {
            status = .needPassword
        }
    }
    var password: String
    
    func signIn(complitionHandler: @escaping (_ result: String, _ isLogin: Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (response, error) in
            guard let response = response else {
                let result = error?.localizedDescription ?? "unknown error"
                complitionHandler(result, false)
                return
            }
            complitionHandler(response.description, true)
            
        }
    }
    var status: Status
    
    func resetProperty() {
        self.email = ""
        self.password = ""
        self.status = .needEmail
    }
    
    private init() {
        email = String()
        password = String()
        status = .needEmail
    }
    
    enum Status {
        case needEmail
        case needPassword
    }
}
