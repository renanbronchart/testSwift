//
//  TableExampleViewController.swift
//  AppHeti-c
//
//  Created by Renan Bronchart on 20/05/2018.
//  Copyright © 2018 Renan Bronchart. All rights reserved.
//

import UIKit

class TableExampleViewController: UIViewController {
    
    let elements = ["cat", "lézard", "dog"]
    
    @IBOutlet weak var customHeaderHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var customHeaderView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
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

extension TableExampleViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCellIdentifier") as! CustomTableViewCell

        
        cell.animalLabel.text = elements[indexPath.row]
        cell.animalImage.image = UIImage(named: elements[indexPath.row])
        cell.animalImage.layer.cornerRadius = cell.animalImage.frame.height / 2
        
        return cell
    }
}

extension TableExampleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        if indexPath.section != 0 {
            return nil
        }
        
        let add = UIContextualAction(style: .normal, title: "Add") { (action, view, nil) in
            print("Accept")
        }
        
        add.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        add.image = #imageLiteral(resourceName: "add")
        
        let waitlist = UIContextualAction(style: .normal, title: "Waitlist") { (action, view, nil) in
            print("Waitlist")
        }
        
        waitlist.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        
        let config = UISwipeActionsConfiguration(actions: [add, waitlist])
        config.performsFirstActionWithFullSwipe = false
        
        return config
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "delete") { (action, view, nil) in
            print("Delete")
        }
        
        delete.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        
        let rejected = UIContextualAction(style: .normal, title: "rejected") { (action, view, nil) in
            print("Waitlist")
        }
        
        rejected.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        
        let config = UISwipeActionsConfiguration(actions: [delete, rejected])
        config.performsFirstActionWithFullSwipe = false
        
        return config
    }
}

extension TableExampleViewController:UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
}