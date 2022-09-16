//
//  LoginViewController.swift
//  Networking
//
//  Created by Mindaugas Balakauskas on 14/09/2022.
//
import LocalAuthentication
import UIKit

protocol LoginView {
    func clearData()
}

class LoginViewController: UIViewController {
    
    let loginViewModel = LoginViewModel()
    var coordinator: AppCoordinator?
    

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authenticate()

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! RoomsViewController
        controller.loginViewController = self
        controller.name = userNameTextField.text ?? ""
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        let loginViewModel = LoginViewModel()
        let output = loginViewModel.validate(username: userNameTextField.text, password: passwordTextField.text)
        if output.count > 0 {
            let alert = UIAlertController(title: "Alert", message: "Login credentials are not valid", preferredStyle: .alert)
            print("Login failed")
            let alertAction = UIAlertAction(title: "OK", style: .destructive)
            alert.addAction(alertAction)
            self.present(alert, animated: true)
        } else {
            coordinator?.navigateToRoomsList()
        
        }
    }
    func authenticate(){
        let context = LAContext()
        var error: NSError?
        
        let hasCapabilities = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        
        if hasCapabilities {
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Identfiy your self to access this feature") { isSuccess, error in
                if isSuccess {
                    DispatchQueue.main.async {
                        self.coordinator?.navigateToRoomsList()
                    }
                }
            }
        } else {
            // we can use this to hide login fields userNameTextField.isHidden = true
            print("Hardwared not supported")
        }
    }
    
}
extension LoginViewController: LoginView {
    func clearData(){
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
}
