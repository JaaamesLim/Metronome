//
//  PulseView.swift
//  Metronome
//
//  Created by JAMES GOT GAME 07 on 24/11/17.
//  Copyright © 2017 James. All rights reserved.
//

import UIKit

class PulseView: CircleView {
    override func additionalSetup() {
        layer.borderColor = backgroundColor?.cgColor
        layer.borderWidth = 0.1
        backgroundColor = .clear
    }
    
    func expand(_ x: CGFloat) {
        let t = interval * Double(x/(self.radius * 8))
        UIView.animate(withDuration: t, animations: {
            self.transform = CGAffineTransform(scaleX: x/self.radius, y: x/self.radius)
        }) { (Bool) in
            self.removeFromSuperview()
        }
    }
}
