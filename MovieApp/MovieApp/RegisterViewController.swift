//
//  RegisterViewController.swift
//  MovieApp
//
//  Created by Jesus Perez Mojica on 11/05/22.
//

import UIKit
import FirebaseAuth
import FirebaseAnalytics

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var nameRegisterTextField: UITextField!
    @IBOutlet weak var emailRegisterTextField: UITextField!
    @IBOutlet weak var passwordRegisterTextField: UITextField!
    @IBOutlet weak var messageRegisterLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageRegisterLabel.text = ""
        
    }
    
    @IBAction func RegisterButton(_ sender: UIButton) {
        
        if let email = emailRegisterTextField.text, let password = passwordRegisterTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if error == nil {
                    
                    //registro en la database
                    
                    self.performSegue(withIdentifier: "TabBarSegue", sender: self)
                    print(authResult ?? "")
                    print(error ?? "")
                    
                    
                } else {
                    self.messageRegisterLabel.text = "Haz colocado incorrectamente tu correo o tu contraseña es demasiado corta"
                }
            }
            
            
            
        }
    }
}
