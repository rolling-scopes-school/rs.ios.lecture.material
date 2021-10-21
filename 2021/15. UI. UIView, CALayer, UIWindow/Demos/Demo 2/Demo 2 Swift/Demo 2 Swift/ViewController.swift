//
//  ViewController.swift
//  Demo 2 Swift
//
//  Created by Andrew Pokachailo on 6/28/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myView = UIView(frame: CGRect(x: 40, y: 60, width: 300, height: 300))
        myView.layer.backgroundColor = UIColor.purple.cgColor
        myView.layer.cornerRadius = 20
        myView.layer.borderWidth = 3
        myView.layer.borderColor = UIColor.yellow.cgColor
        
        myView.layer.shadowOffset = CGSize(width: -15, height: 20)
        myView.layer.shadowRadius = 5
        myView.layer.shadowOpacity = 0.5
        
        let blueSublayer = CALayer()
        blueSublayer.backgroundColor = UIColor.blue.cgColor
        blueSublayer.frame = CGRect(x: 30, y: 30, width: 100, height: 150)
        myView.layer.addSublayer(blueSublayer)
        
        self.view.addSubview(myView)
    }


}

