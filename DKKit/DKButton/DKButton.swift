//
//  DKKit.swift
//  DKKit
//
//  Created by Dineshkumar Kandasamy on 17/03/20.
//  Copyright © 2020 Mobiversa Sdn. Bhd. All rights reserved.
//

import Foundation
import UIKit

open class DKButton: UIButton {
    
    //MARK:- initialisation
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
     
    //MARK:- setupView

    private func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK:- setup button

    public func set(_ backgroundcolor: UIColor, _ titleName: String, _ titleColor: UIColor, _ titleFont: UIFont) {
        self.backgroundColor = backgroundcolor
        self.titleLabel?.font = titleFont
        self.setTitle(titleName, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.setTitleColor(titleColor.withAlphaComponent(0.8), for: .highlighted)
    }
    
    public func setImage(_ image: String) {
        self.setImage(UIImage(named: image), for: .normal)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//public func DKButton(backgroundcolor: UIColor, titleName: String, titleColor: UIColor, textFont: UIFont) -> UIButton {
//
//    let button = UIButton()
//    button.translatesAutoresizingMaskIntoConstraints = false
//    button.backgroundColor = backgroundcolor
//    button.titleLabel?.font = textFont
//    button.setTitle(titleName, for: .normal)
//    button.setTitleColor(titleColor, for: .normal)
//    button.setTitleColor(titleColor.withAlphaComponent(0.8), for: .highlighted)
//    return button
//
//}

public func DKButtonWithImage(_ imageName: String) -> UIButton {

    let button = UIButton(type: .custom)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(UIImage(named: imageName), for: .normal)
    return button

}

 public func DKButtonWithFrame(backgroundcolor: UIColor, titleName: String, titleColor: UIColor, textFont: UIFont) -> UIButton {

     let button = UIButton()
     button.backgroundColor = backgroundcolor
     button.titleLabel?.font = textFont
     button.setTitle(titleName, for: .normal)
     button.setTitleColor(titleColor, for: .normal)
     button.setTitleColor(titleColor.withAlphaComponent(0.8), for: .highlighted)
     return button

 }


public func DKAnimateButton(_ sender: UIButton) {
    UIView.animate(withDuration: 0.5) {
        sender.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
    }
    UIView.animate(withDuration: 0.5) {
        sender.transform = CGAffineTransform(scaleX: 1, y: 1)
    }
}

public func DKGradientButton(topColor: UIColor, bottomColor: UIColor, button: UIButton) {

    let colorTop =  topColor.cgColor
    let colorBottom = bottomColor.cgColor
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [colorTop, colorBottom]
    gradientLayer.locations = [0.0, 1.0]
    gradientLayer.frame = button.bounds
    button.layer.insertSublayer(gradientLayer, at: 0)

}

public func DKButtonWithUnderLine(backgroundcolor: UIColor, titleName: String, textFont: UIFont, titleColor: UIColor) -> UIButton {
    
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = backgroundcolor
    button.setTitle(titleName, for: .normal)
    button.setTitleColor(titleColor.withAlphaComponent(0.8), for: .highlighted)
    button.setUnderLineTitle(title: titleName, textFont: textFont, textColor: titleColor)
    return button

}

extension UIButton {

    func setUnderLineTitle(title: String, textFont: UIFont, textColor: UIColor) {

        let yourAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: textFont,
            NSAttributedString.Key.foregroundColor: textColor,
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]

        let attributeString = NSMutableAttributedString(string: title as String,
                                                        attributes: yourAttributes)
        self.setAttributedTitle(attributeString, for: .normal)

    }
        
    func setRightArrowImage() {

        let arrowImageItem = UIImageView()
        arrowImageItem.translatesAutoresizingMaskIntoConstraints = false
        if let image = UIImage(named: "arrowRight") {
            arrowImageItem.image = image.tint(with: .warmGrey)
            self.addSubview(arrowImageItem)

            arrowImageItem.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            arrowImageItem.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
            arrowImageItem.heightAnchor.constraint(equalToConstant: 24).isActive = true
            arrowImageItem.widthAnchor.constraint(equalToConstant: 24).isActive = true
        }
        

    }
    
}
