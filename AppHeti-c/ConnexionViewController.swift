//
//  ConnexionViewController.swift
//  AppHeti-c
//
//  Created by Renan Bronchart on 23/05/2018.
//  Copyright © 2018 Renan Bronchart. All rights reserved.
//

import UIKit

class ConnexionViewController: UIViewController {
    
    @IBOutlet weak var logIn: UIButton!
    
    @IBAction func loggIn(_ sender: Any) {
        var connexionStoryBoard: UIStoryboard!
        connexionStoryBoard = UIStoryboard(name: "Connexion", bundle: nil)
        
        if let connexionViewController =
            connexionStoryBoard.instantiateViewController(withIdentifier: "ChallengesListViewControllerIdentifier") as? ChallengesListViewController {
            self.present(connexionViewController, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
