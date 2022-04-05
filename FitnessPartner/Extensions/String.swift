//
//  String.swift
//  FitnessPartner
//
//  Created by Ahsan Ali on 02/04/2022.
//

import UIKit

extension String {
    ///to getBundle images
    var bundleImage:UIImage {
        return UIImage(named: self) ?? UIImage()
    }
    ///Localization
    static func localizedString(_ key: String) -> String {
        precondition(!key.normalize.isEmpty)
        let result = Bundle.main.localizedString(forKey: key, value: nil, table: nil)
        return result
    }
    
    var normalize: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
