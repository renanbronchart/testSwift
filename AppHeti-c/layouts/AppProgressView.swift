//
//  AppProgressView.swift
//  AppHeti-c
//
//  Created by Renan Bronchart on 25/05/2018.
//  Copyright © 2018 Renan Bronchart. All rights reserved.
//

import UIKit

class AppProgressView: UIProgressView {
    override func draw(_ rect: CGRect) {
        self.transform = self.transform.scaledBy(x: 1, y: 2)
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
        self.layer.sublayers![1].cornerRadius = 4
        self.subviews[1].clipsToBounds = true
    }

}
