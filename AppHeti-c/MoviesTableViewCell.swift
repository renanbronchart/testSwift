//
//  MoviesTableViewCell.swift
//  AppHeti-c
//
//  Created by Renan Bronchart on 18/05/2018.
//  Copyright © 2018 Renan Bronchart. All rights reserved.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {

    @IBOutlet weak var MovieCellView: UIView!
    @IBOutlet weak var MovieCellImage: UIImageView!
    @IBOutlet weak var MovieCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
