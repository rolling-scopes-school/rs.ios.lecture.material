//
//  ViewController.swift
//  Demo Swift
//
//  Created by Andrew Pokachailo on 6/28/21.
//

import UIKit

class ViewController: UIViewController {
    
    let blueView = RSView(withFrame: CGRect(x: 30, y: 150, width: 100, height: 100), andColor: .blue)
    let yellowView = RSView(withFrame: CGRect(x: 40, y: 200, width: 200, height: 200), andColor: .yellow)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(blueView)
        self.view.addSubview(yellowView)
        
        self.view.bringSubviewToFront(blueView)
        self.view.backgroundColor = .black
        //        Adding UIButton
        
        let button = UIButton(frame: CGRect(x: 20, y: 20, width: 60, height: 60))
        //        let button = UIButton(frame: CGRect(x: 120, y: -60, width: 60, height: 60))
        button.setTitle("Tap", for: UIControl.State.normal)
        button.addTarget(self, action: #selector(tapHandle), for: UIControl.Event.touchUpInside)
        
        self.blueView.addSubview(button)
        print("Frame: \(self.blueView.frame)")
        print("Bounds: \(self.blueView.bounds)")
        
    }
    
    @objc func tapHandle() {
        print("Tap")
        //        UIView.animate(withDuration: 1, animations:  {self.blueView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 6)})
        
        
        UIView.animate(withDuration: 1, animations: {self.blueView.transform = self.blueView.transform.rotated(by: CGFloat.pi / 6)}, completion: { _ in
            print("-----Values after animation-----")
            print("Frame: \(self.blueView.frame)")
            print("Bounds: \(self.blueView.bounds)")
        })
    }
}



