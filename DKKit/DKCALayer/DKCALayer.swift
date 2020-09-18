//
//  DKCALayer.swift
//  DKKit
//
//  Created by Dineshkumar Kandasamy on 17/03/20.
//  Copyright © 2020 Mobiversa Sdn. Bhd. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func DKGradientBackground(topColor: UIColor, bottomColor: UIColor) {
        
        let colorTop =  topColor.cgColor
        let colorBottom = bottomColor.cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
}

extension CALayer {
    func DKShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0)
    {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
    
    
      class func setLayerForGivenFrame(_ frame: CGRect, givenColor color: UIColor) -> CALayer {
            let commonTopOrBottomLayer: CALayer = CALayer()
            commonTopOrBottomLayer.frame = frame
            commonTopOrBottomLayer.backgroundColor = color.cgColor
            return commonTopOrBottomLayer
        }
}

public func DKBezierPathTopLeftRight(view:UIView, frameSize:CGRect, radius:CGSize) {
    
    let maskLayer = CAShapeLayer()
    let path = UIBezierPath(roundedRect: frameSize,
                            byRoundingCorners: [.topRight, .topLeft],
                            cornerRadii: radius)
    
    maskLayer.frame = frameSize
    maskLayer.path = path.cgPath
    view.layer.mask = maskLayer
    
}

public func DKBezierPathBottomLeftRight(view:UIView, frameSize:CGRect, radius:CGSize) {
    
    let maskLayer = CAShapeLayer()
    let path = UIBezierPath(roundedRect: frameSize,
                            byRoundingCorners: [.bottomLeft, .bottomRight],
                            cornerRadii: radius)
    
    maskLayer.frame = frameSize
    maskLayer.path = path.cgPath
    view.layer.mask = maskLayer
    
}
