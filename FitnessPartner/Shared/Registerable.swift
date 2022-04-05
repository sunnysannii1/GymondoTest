//
//  Registerable.swift
//  FitnessPartner
//
//  Created by Ahsan Ali on 02/04/2022.
//

import UIKit

protocol Registerable: AnyObject {
    static var identifier: String { get }
    static func getNIB() -> UINib
}

extension Registerable {

    static var identifier: String {
        return String(describing: self)
    }
    
    static func getNIB() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
