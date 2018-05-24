//
//  AppButton.swift
//  AppHeti-c
//
//  Created by Renan Bronchart on 24/05/2018.
//  Copyright © 2018 Renan Bronchart. All rights reserved.
//

import UIKit

class AppButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderWidth = 1 / UIScreen.main.nativeScale
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        titleLabel?.adjustsFontForContentSizeCategory = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.height / 2
        layer.borderColor = isEnabled ? tintColor.cgColor : UIColor.lightGray.cgColor
        
        if let buttonTitleLabel = self.titleLabel {
            if let buttonText = buttonTitleLabel.text {
                let size: CGSize = buttonText.size(withAttributes: [NSAttributedStringKey.font: buttonTitleLabel.font])
                
                
                
                //                let widthContraints =  NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 200)
                self.frame.size = CGSize(width: (size.width + 32), height: (size.width + 32))
                
                
                
                //                NSLayoutConstraint.activate([widthContraints])
            }
        }
    }
}
