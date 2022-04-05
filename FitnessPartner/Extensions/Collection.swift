//
//  Collection.swift
//  FitnessPartner
//
//  Created by Ahsan Ali on 02/04/2022.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}


