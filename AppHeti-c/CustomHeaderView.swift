//
//  CustomHeaderView.swift
//  AppHeti-c
//
//  Created by Renan Bronchart on 22/05/2018.
//  Copyright © 2018 Renan Bronchart. All rights reserved.
//

import UIKit

class CustomHeaderView: UIView {
    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        
//        self.titleLabel.text = title.uppercased()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
