//
//  ViewController.swift
//  MovieApp
//
//  Created by Jesus Perez Mojica on 11/05/22.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var LoginCotainerView: UIView!
    @IBOutlet weak var RegisterCotainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        LoginCotainerView.isHidden = false
        RegisterCotainerView.isHidden = true
        
    }
    

    
    @IBAction func LoginActionButton(_ sender: Any) {
        LoginCotainerView.isHidden = false
        RegisterCotainerView.isHidden = true
    }
    @IBAction func RegisterActionButton(_ sender: Any) {
        LoginCotainerView.isHidden = true
        RegisterCotainerView.isHidden = false
    }
    
}
