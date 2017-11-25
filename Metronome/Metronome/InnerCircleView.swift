//
//  InnerCircleView.swift
//  Metronome
//
//  Created by JAMES GOT GAME 07 on 23/11/17.
//  Copyright © 2017 James. All rights reserved.
//

import UIKit

class InnerCircleView: CircleView {
    
    func expand(_ r: CGFloat) {
        UIView.animate(withDuration: interval, delay: 0.1, options: .curveEaseOut, animations: {
            self.transform = CGAffineTransform(scaleX: r/self.radius, y: r/self.radius)
        }) { (Bool) in
            self.collapse()
        }
    }
    
    func collapse() {
        UIView.animate(withDuration: interval, delay: 0, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }) { (Bool) in
            
        }
    }
}
