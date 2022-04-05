//
//  ExerciseModel.swift
//  FitnessPartner
//
//  Created by Ahsan Ali on 04/04/2022.
//

import Foundation

struct Exercise:Decodable {
    let results:[ExerciseItem]
}

struct ExerciseItem:Decodable {
    let id:Int
    let name:String
    let image:String?
}
