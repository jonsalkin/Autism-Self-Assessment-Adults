//
//  LoginViewController.swift
//  Autism Self Assessment Adults
//
//  Created by Jon Salkin on 4/11/23.
//

import UIKit

class LoginViewController: UIViewController {

    // The storyboard is setup for future use. The Login page is not functional currently.
    
    //MARK: - IBOutlets
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var registerButton: UIButton!
    @IBOutlet var forgotUsernameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    
    
    
    
    //MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    
    //MARK: - IBActions
    @IBAction func loginButtonPressed(_ sender: UIButton) {
    }
    @IBAction func registerButtonPressed(_ sender: UIButton) {
    }
    @IBAction func forgotUsernameButtonPressed(_ sender: UIButton) {
    }
    @IBAction func forgotPasswordButtonPressed(_ sender: UIButton) {
    }
    
    
    
}
