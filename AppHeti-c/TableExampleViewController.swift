//
//  TableExampleViewController.swift
//  AppHeti-c
//
//  Created by Renan Bronchart on 20/05/2018.
//  Copyright © 2018 Renan Bronchart. All rights reserved.
//

import UIKit

class TableExampleViewController: UIViewController {
    
    let elements = ["cat", "lézard", "dog", "cat", "lézard", "dog", "cat", "lézard", "dog", "cat", "lézard", "dog", "cat", "lézard", "dog"]
    
    var minValue = 0
    var maxValue = 100
    var xpMore = 10
    var more: Int = 0
    var downloader = Timer()
    
    @IBOutlet weak var customHeaderHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var customHeaderView: CustomHeaderView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var headerImageView: UIImageView!
    
    @IBOutlet weak var purcentNumber: UILabel!
    @IBOutlet weak var downloadBar: UIProgressView!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBAction func startDownload(_ sender: Any) {
        startButton.isEnabled = false
        more = minValue + xpMore
        downloader = Timer.scheduledTimer(timeInterval: 0.06, target: self, selector: (#selector(self.updater)), userInfo: nil, repeats: true)
    }
    
    @objc func updater () {
        if minValue != maxValue {
            if minValue != more {
                minValue += 1
                purcentNumber.text = "\(minValue)"
                downloadBar.progress = Float(minValue) / Float(maxValue)
            } else {
                downloader.invalidate()
                startButton.isEnabled = true
            }
        } else {
            minValue = 0
            more = minValue
            print("Niveau suivant")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        downloadBar.setProgress(0, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animateHeader () {
        customHeaderHeightConstraint.constant = 150
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
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
        
//        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
        cell.animalImage.layer.cornerRadius = cell.animalImage.frame.height / 2
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
        if (scrollView.contentOffset.y < 0) {
            self.customHeaderHeightConstraint.constant += abs(scrollView.contentOffset.y)
            
            customHeaderView.incrementColorAlpha(colorView: self.colorView, offset: customHeaderHeightConstraint.constant)
            
            customHeaderView.incrementArticleAlpha(imageView: self.headerImageView, offset: customHeaderHeightConstraint.constant)
            
        } else if (scrollView.contentOffset.y > 0 && self.customHeaderHeightConstraint.constant >= 65) {
            self.customHeaderHeightConstraint.constant -= scrollView.contentOffset.y / 100
            customHeaderView.decrementColorAlpha(colorView: self.colorView, offset: customHeaderHeightConstraint.constant)
            
            customHeaderView.decrementArticleAlpha(imageView: self.headerImageView, offset: customHeaderHeightConstraint.constant)
        }
        
        if self.customHeaderHeightConstraint.constant < 65 {
            self.customHeaderHeightConstraint.constant = 65
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if self.customHeaderHeightConstraint.constant > 150 {
            animateHeader()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if self.customHeaderHeightConstraint.constant > 150 {
            animateHeader()
        }
    }
}
