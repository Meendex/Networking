//
//  LoginViewModel.swift
//  Networking
//
//  Created by Mindaugas Balakauskas on 14/09/2022.
//

import Foundation

class LoginViewModel {
    
    let userModel = UserModel(userName: "1", password: "1")
    func validate(username: String?, password: String?)-> String {
        guard let username = username, !username.isEmpty, let password = password, !password.isEmpty else {
            return "Please enter your credentials."
        }
        guard userModel.userName == username else {
            return "Usrname is invalid."
        }
        guard userModel.password == password else {
            return "Pasword is invalid."
        }
        return ""
    }
}
