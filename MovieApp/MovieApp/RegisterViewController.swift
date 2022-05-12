//
//  RegisterViewController.swift
//  MovieApp
//
//  Created by Jesus Perez Mojica on 11/05/22.
//

import UIKit
import FirebaseAuth
import FirebaseAnalytics
import FirebaseFirestore

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var nameRegisterTextField: UITextField!
    @IBOutlet weak var emailRegisterTextField: UITextField!
    @IBOutlet weak var passwordRegisterTextField: UITextField!
    @IBOutlet weak var messageRegisterLabel: UILabel!
    
    //DB FIREBASE
    let db = Firestore.firestore()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageRegisterLabel.text = ""
        
    }
    
    @IBAction func RegisterButton(_ sender: UIButton) {
        
        if let email = emailRegisterTextField.text, let password = passwordRegisterTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { [self] authResult, error in
                if error == nil {
                    
                    //registro en la database
                    self.db.collection("users").document(emailRegisterTextField.text ?? "").setData([
                        "email": emailRegisterTextField.text ?? "",
                        "name": nameRegisterTextField.text ?? "",
                        "password" : passwordRegisterTextField.text ?? ""
                    ]) { err in
                        if let err = err {
                            print("Error writing document: \(err)")
                        } else {
                            print("Document successfully written!")
                        }
                    }
                    
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
