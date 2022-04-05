//
//  Environment.swift
//  FitnessPartner
//
//  Created by Ahsan Ali on 02/04/2022.
//
import Foundation

struct Environment {
    
   static var baseURL: String {
        return value(of: .BASEURL)
    }
   
    // MARK: - Private Methods
    private static func value<T>(of key: ConfigurationKey) -> T {
        guard let config = Bundle.main.infoDictionary,
              let value = config[key.rawValue] as? T else {
            fatalError("Looks like there is no \(key.rawValue) set for this target's xcconfig file")
        }
        return value
    }
}

// MARK: - Configuration Keys

enum ConfigurationKey: String {
    case BASEURL = "BASE_URL"
}
