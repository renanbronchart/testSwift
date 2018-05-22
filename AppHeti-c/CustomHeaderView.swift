//
//  CustomHeaderView.swift
//  AppHeti-c
//
//  Created by Renan Bronchart on 23/05/2018.
//  Copyright © 2018 Renan Bronchart. All rights reserved.
//

import UIKit

class CustomHeaderView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public func decrementColorAlpha (colorView: UIView, offset: CGFloat) {
        if colorView.alpha <= 1 {
            let alphaOffset = (offset / 500) / 85
            
            colorView.alpha += alphaOffset
        }
    }
    
    public func decrementArticleAlpha(imageView: UIImageView, offset: CGFloat) {
        if imageView.alpha >= 0 {
            let alphaOffset = max((offset - 65) / 85.0, 0)
            
            imageView.alpha = alphaOffset
        }
    }
    
    public func incrementColorAlpha (colorView: UIView, offset: CGFloat) {
        if colorView.alpha >= 0.45 {
            let alphaOffset = (offset / 200) / 85
            
            colorView.alpha -= alphaOffset
        }
    }
    
    public func incrementArticleAlpha(imageView: UIImageView, offset: CGFloat) {
        if imageView.alpha <= 1 {
            let alphaOffset = max((offset - 65) / 85.0, 0)
            
            imageView.alpha = alphaOffset
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
