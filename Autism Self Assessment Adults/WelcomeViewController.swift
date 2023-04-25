//
//  WelcomeViewController.swift
//  Autism Self Assessment Adults
//
//  Created by Jon Salkin on 4/11/23.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var loginOrRegisterButton: UIButton!
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

// This button was deleted and disconnected after Tab control bar was added.
    // The login screen has its own tab now.
    // More to come to the Welcome screen.
    @IBAction func loginOrRegisterButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "loginSegue", sender: loginOrRegisterButton)
    }
//    @IBAction func unwindToSurveyWelcome(segue: UIStoryboardSegue) {
//
//    }
    
    
}
