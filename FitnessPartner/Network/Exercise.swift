//
//  GetNewsItem.swift
//  FitnessPartner
//
//  Created by Ahsan Ali on 02/04/2022.
//

import Foundation

enum ExerciseService {
    case getExerciseList
    case getExerciseDetail(id:Int)
}

extension ExerciseService: Service {
    var baseURL: String {
        return Environment.baseURL
    }

    var path: String {
        switch self {
        case .getExerciseList:
            return "\(Environment.apiVersion)exerciseinfo"
        case .getExerciseDetail(let id):
            return "\(Environment.apiVersion)exerciseinfo/\(id)"
        }
    }

    var parameters: [String: Any]? {
        return nil
    }

    var method: ServiceMethod {
        return .get
    }
}
