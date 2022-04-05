//
//  ExerciseTableViewCell.swift
//  FitnessPartner
//
//  Created by Ahsan Ali on 04/04/2022.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell,Registerable {
    //MARK: - outlets
    @IBOutlet private(set) weak var exerciseImage: UIImageView!
    @IBOutlet private(set) weak var lblExerciseName: UILabel!
    
    //MARK: - Life Cycles
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    //MARK: - Helpers
    func configure(_ item:ExerciseItem){
        exerciseImage.load(urlStr: item.image)
        lblExerciseName.text = item.name
    }
}
