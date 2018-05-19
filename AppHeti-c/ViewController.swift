//
//  ViewController.swift
//  AppHeti-c
//
//  Created by Renan Bronchart on 17/05/2018.
//  Copyright © 2018 Renan Bronchart. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBAction func login(_ sender: Any) {
        if self.usernameTextField.text == "Hetic" && self.passwordTextField.text == "Hetic" {
            if let HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeNavigationControllerIdentifier") {
                
                self.present(HomeViewController, animated: true)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = UIColor(displayP3Red: 30/255, green: 20/255, blue: 180/255, alpha: 1)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
}

