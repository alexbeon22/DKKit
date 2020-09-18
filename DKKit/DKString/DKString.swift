//
//  DKString.swift
//  DKKit
//
//  Created by Dineshkumar Kandasamy on 17/03/20.
//  Copyright © 2020 Mobiversa Sdn. Bhd. All rights reserved.
//

import Foundation
import UIKit


public func isValidEmail(email: String) -> Bool {

    let emailRegExpression = "^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$"
    let predicateValue = NSPredicate(format: "SELF MATCHES %@", emailRegExpression)
    return predicateValue.evaluate(with: email)

}

extension String {

    //.*[!&^%$#@()/]+.*
    //.*[!&^%$#@()/_*+-]+.*
    var containsSpecialCharacter: Bool {
        let regex = ".*[:}?{!&>|=<^%$#@()./_*+-]+.*"
        let testString = NSPredicate(format: "SELF MATCHES %@", regex)
        return testString.evaluate(with: self)
    }

    var containsUpperCaseCharacter: Bool {
        let regex = ".*[A-Z]+.*"
        let testString = NSPredicate(format: "SELF MATCHES %@", regex)
        return testString.evaluate(with: self)
    }

    var containsLowerCaseCharacter: Bool {
        let regex = ".*[a-z]+.*"
        let testString = NSPredicate(format: "SELF MATCHES %@", regex)
        return testString.evaluate(with: self)
    }

    var containsNumberCharacter: Bool {
        let regex = ".*[0-9]+.*"
        let testString = NSPredicate(format: "SELF MATCHES %@", regex)
        return testString.evaluate(with: self)
    }

}
