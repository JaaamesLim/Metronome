//
//  CircleView.swift
//  Metronome
//
//  Created by JAMES GOT GAME 07 on 23/11/17.
//  Copyright © 2017 James. All rights reserved.
//

import UIKit

class CircleView: UIView {

    var radius: CGFloat = 0
    var interval: Double = 0
    
    func setup(_ i: Double, _ r: CGFloat, _ c: CGPoint, _ color: UIColor) {
        interval = i
        radius = r
        frame.size = CGSize(width: radius*2, height: radius*2)
        center = c
        backgroundColor = color
        layer.cornerRadius = radius
        additionalSetup()
    }
    
    func additionalSetup() {}

}
