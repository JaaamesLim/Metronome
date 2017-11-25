//
//  OuterCircleView.swift
//  Metronome
//
//  Created by JAMES GOT GAME 07 on 23/11/17.
//  Copyright © 2017 James. All rights reserved.
//

import UIKit

class OuterCircleView: CircleView {

    let main = UIColor(red: 22/255, green: 21/255, blue: 25/255, alpha: 1)
    let bckg = UIColor(red: 230/255, green: 103/255, blue: 96/255, alpha: 1)
    
    var inner_circle = InnerCircleView()
    
    override func additionalSetup() {
        inner_circle.setup(interval, 0.5, CGPoint(x: radius, y: radius), bckg)
        addSubview(inner_circle)
    }
    
    @objc func expand() {
        inner_circle.expand(radius*0.8)
        UIView.animate(withDuration: interval, delay: 0, options: [], animations: {
            self.transform = CGAffineTransform(scaleX: 3, y: 3)
        }) { (Bool) in
            self.collapse()
        }
    }
    
    func collapse() {
        inner_circle.collapse()
        UIView.animate(withDuration: interval, delay: 0, options: [], animations: {
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
        }) { (Bool) in
            
        }
    }

}
