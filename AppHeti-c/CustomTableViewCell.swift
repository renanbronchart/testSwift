//
//  CustomTableViewCell.swift
//  AppHeti-c
//
//  Created by Renan Bronchart on 20/05/2018.
//  Copyright © 2018 Renan Bronchart. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var backgroundImageCell: UIImageView!
    @IBOutlet weak var buttonLabel: AppButton!
    
    @IBAction func buttonMission(_ sender: Any) {
        if let buttonText = buttonLabel.titleLabel!.text {
            let number = Int(buttonText) ?? 0
            
            buttonLabel.setTitle(String(number + 1), for: .normal) 
            animalLabel.text = String(number + 1)
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backgroundImageCell.image = #imageLiteral(resourceName: "dog")
        backgroundImageCell.alpha = 0.5
        backgroundImageCell.layer.cornerRadius = backgroundImageCell.frame.height / 4
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
