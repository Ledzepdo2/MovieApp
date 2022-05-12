//
//  LoginViewController.swift
//  MovieApp
//
//  Created by Jesus Perez Mojica on 11/05/22.
//

import UIKit
import FirebaseAuth
import FirebaseAnalytics

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginMessageLabel.text = ""
        // Do any additional setup after loading the view.
    }
    

    @IBAction func LoginActionButton(_ sender: Any) {
        
       
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                
                if let authResult = authResult, error == nil {
                    
                    self.loginMessageLabel.text = "Bienvenido a la mejor aplicacion de peliculas"
                    print(authResult)
                    print(error)
                    
                    self.performSegue(withIdentifier: "TabBarSegue", sender: self)
                    
                } else {
                    self.loginMessageLabel.text = "Revisa tu usuario y contraseña"
                    print(authResult)
                    print(error)
                }
             
            }


            
        }
        
    }
    
}
