//
//  restaran_blok.swift
//  
//
//  Created by RealityFamily on 27/09/2019.
//

import UIKit

@IBDesignable
class restaran_block: UIView {
    override func draw(_ rect: CGRect){
        super.draw(rect)
        
        let pathRect = CGRect(x: 100, y:100, width: rect.width - 100,
                              height: rect.height - 100)
        let path = UIBezierPath(roundedRect: pathRect, cornerRadius: 24)
        let color = UIColor.red
        color.setFill()
        path.fill()
    }
}
