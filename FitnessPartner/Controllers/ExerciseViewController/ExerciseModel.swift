//
//  ExerciseModel.swift
//  FitnessPartner
//
//  Created by Ahsan Ali on 04/04/2022.
//

import Foundation

typealias ExerciseList = [ExerciseItem]

struct Exercise:Decodable {
    let count: Int?
    let results:[ExerciseItem]?
}

struct ExerciseItem:Decodable {
    let id:Int?
    let name:String?
    let images: [ExerciseImage]?
    let variations: [Int]?
    //main image
    var image:String?{
        return images?.filter { $0.isMain ?? false }
       .first?.image
    }
    
}

struct ExerciseImage:Decodable{
    let id: Int?
    let uuid: String?
    let image: String?
    let isMain: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, uuid
        case image
        case isMain = "is_main"
    }
}
