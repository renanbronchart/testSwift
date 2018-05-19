//
//  HomeViewController.swift
//  AppHeti-c
//
//  Created by Renan Bronchart on 17/05/2018.
//  Copyright © 2018 Renan Bronchart. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func viewMovies(_ sender: Any) {
        if let moviesTableView =
            self.storyboard?.instantiateViewController(withIdentifier: "moviesTableViewCellIdentifier") as? MoviesTableViewController {
            self.navigationController?.pushViewController(moviesTableView, animated: true)
        }
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
