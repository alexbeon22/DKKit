//
//  DKLabel.swift
//  DKKit
//
//  Created by Dineshkumar Kandasamy on 17/03/20.
//  Copyright © 2020 Mobiversa Sdn. Bhd. All rights reserved.
//

import Foundation
import UIKit

open class DKLabel: UILabel {
    
    //MARK:- initialisation
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
     
    //MARK:- setupView

    private func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK:- set title

    public func set(_ titleFont: UIFont) {
        self.font = titleFont
    }
    
    //MARK:- set title

    public func set(_ titleColor: UIColor, _ titleFont: UIFont) {
        self.textColor = titleColor
        self.font = titleFont
    }
    
    public func setAsSeprator(_ backgroundColor: UIColor) {
        self.textColor = backgroundColor
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
