//
//  GetNewsItem.swift
//  FitnessPartner
//
//  Created by Ahsan Ali on 02/04/2022.
//

import Foundation

enum ExerciseService {
    case getExercise
    
}

extension ExerciseService: Service {
    var baseURL: String {
        return Environment.baseURL
    }

    var path: String {
        switch self {
        case .getExercise:
            return "/api/v2/exercise"
        }
    }

    var parameters: [String: Any]? {
        // default params
        var params: [String: Any] = [:]
        
        switch self {
        case .getExercise:
            params = .init()
        }
        return params
    }

    var method: ServiceMethod {
        return .get
    }
}
