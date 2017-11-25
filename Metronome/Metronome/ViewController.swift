//
//  ViewController.swift
//  Metronome
//
//  Created by JAMES GOT GAME 07 on 23/11/17.
//  Copyright © 2017 James. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let main = UIColor(red: 22/255, green: 21/255, blue: 25/255, alpha: 1)
    let bckg = UIColor(red: 230/255, green: 103/255, blue: 96/255, alpha: 1)
    
    var bpm: Double = 180
    
    var width: CGFloat = 0
    var height: CGFloat = 0
    var radius: CGFloat = 0
    
    @IBOutlet weak var interactionView: UIView!
    
    var activated = false
    var startTrigger = UITapGestureRecognizer()
    
    var menuTrigger = UILongPressGestureRecognizer()
    
    var pulsing = 1
    
    var circle_count = 0
    let outer_circle_one = OuterCircleView()
    let outer_circle_two = OuterCircleView()
    let outer_circle_three = OuterCircleView()
    var ticker_timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = bckg
        
        width = view.frame.width
        height = view.frame.height
        radius = width/24
        
        createSources()
        
        startTrigger = UITapGestureRecognizer(target: self, action: #selector(self.startStop))
        startTrigger.numberOfTapsRequired = 2
        interactionView.addGestureRecognizer(startTrigger)
        
        menuTrigger = UILongPressGestureRecognizer(target: self, action: #selector(self.openMenu))
        menuTrigger.minimumPressDuration = 0.5
        interactionView.addGestureRecognizer(menuTrigger)
    }
    
    @objc func startStop() {
        activated = !activated
        if activated {
            startAnim()
        } else {
            ticker_timer.invalidate()
        }
    }
    
    func createSources() {
        if bpm <= 75 {
            circle_count = 1
            outer_circle_one.setup(60/bpm, radius, view.center, main)
            view.insertSubview(outer_circle_one, belowSubview: interactionView)
            
            outer_circle_two.removeFromSuperview()
            outer_circle_three.removeFromSuperview()
        } else if 75 < bpm && bpm <= 150 {
            circle_count = 2
            outer_circle_one.setup(60/bpm, radius, CGPoint(x: view.frame.width/4 * 1, y: view.center.y), main)
            view.insertSubview(outer_circle_one, belowSubview: interactionView)
            
            outer_circle_two.setup(60/bpm, radius, CGPoint(x: view.frame.width/4 * 3, y: view.center.y), main)
            view.insertSubview(outer_circle_two, belowSubview: interactionView)
            
            outer_circle_three.removeFromSuperview()
        } else if 150 < bpm {
            let o = view.frame.width/4
            let a = o * tan(CGFloat.pi/6)
            let h = o / sin(CGFloat.pi/3)
            
            circle_count = 3
            outer_circle_one.setup(60/bpm, radius, CGPoint(x: view.center.x, y: view.center.y - h), main)
            view.insertSubview(outer_circle_one, belowSubview: interactionView)
            
            outer_circle_two.setup(60/bpm, radius, CGPoint(x: o, y: view.center.y + a), main)
            view.insertSubview(outer_circle_two, belowSubview: interactionView)
            
            outer_circle_three.setup(60/bpm, radius, CGPoint(x: o * 3, y: view.center.y + a), main)
            view.insertSubview(outer_circle_three, belowSubview: interactionView)
        }
    }
    
    func startAnim() {
        anim()
        ticker_timer = Timer.scheduledTimer(timeInterval: 60/bpm, target: self, selector: #selector(self.anim), userInfo: nil, repeats: true)
    }
    
    @objc func anim() {
        if circle_count == 1 {
            outer_circle_one.expand()
            createPulse(outer_circle_one.center)
        } else if circle_count == 2 {
            if pulsing == 1 {
                pulsing = 2
                outer_circle_one.expand()
                createPulse(outer_circle_one.center)
            } else {
                pulsing = 1
                outer_circle_two.expand()
                createPulse(outer_circle_two.center)
            }
        } else if circle_count == 3 {
            if pulsing == 1 {
                pulsing = 2
                outer_circle_one.expand()
                createPulse(outer_circle_one.center)
            } else if pulsing == 2 {
                pulsing = 3
                outer_circle_two.expand()
                createPulse(outer_circle_two.center)
            } else {
                pulsing = 1
                outer_circle_three.expand()
                createPulse(outer_circle_three.center)
            }
        }
    }
    
    func createPulse(_ c: CGPoint) {
        let pulse = PulseView()
        pulse.setup(60/bpm, radius, c, main)
        view.insertSubview(pulse, belowSubview: outer_circle_one)
        pulse.expand(view.frame.height)
    }
    
    @objc func openMenu() {
        print("Bring up menu")
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}

