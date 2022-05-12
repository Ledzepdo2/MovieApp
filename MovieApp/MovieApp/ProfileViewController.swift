//
//  ProfileViewController.swift
//  MovieApp
//
//  Created by Jesus Perez Mojica on 11/05/22.
//

import UIKit
import FirebaseFirestore

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var emailProfileLabel: UILabel!
    @IBOutlet weak var nameProfileLabel: UILabel!
    
    let db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        db.collection("users").document("jesus@empresa.com").getDocument{
            (DocumentSnapshot, error) in
            
            if let document = DocumentSnapshot, error == nil {
                if let name = document.get("name") as? String {
                    self.nameProfileLabel.text = name
                }
                if let email = document.get("email") as? String {
                    self.emailProfileLabel.text = email
                }
            }
        }
    }
    @IBAction func LogoutActionButton(_ sender: Any) {
        
        let refreshAlert = UIAlertController(title: "Cerraras sesión", message: "¿Seguro que deseas cerrar sesión?", preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            self.performSegue(withIdentifier: "logoutReference", sender: self)
            self.navigationController?.navigationBar.isUserInteractionEnabled = true
            self.navigationController?.navigationBar.tintColor = UIColor.clear
        }))

        refreshAlert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { (action: UIAlertAction!) in
        }))

        present(refreshAlert, animated: true, completion: nil)
        
        
    }
}

//self.performSegue(withIdentifier: "TabBarSegue", sender: self)
