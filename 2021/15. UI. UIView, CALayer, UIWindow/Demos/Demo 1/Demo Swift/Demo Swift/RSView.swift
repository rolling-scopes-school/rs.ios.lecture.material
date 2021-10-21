//
//  RSView.swift
//  Demo Swift
//
//  Created by Andrew Pokachailo on 6/28/21.
//

import UIKit

class RSView: UIView {
    
    init(withFrame frame: CGRect, andColor color: UIColor) {
        super.init(frame: frame)
        self.backgroundColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
