//
//  ExerciseTableViewCell.swift
//  FitnessPartner
//
//  Created by Ahsan Ali on 04/04/2022.
//

import UIKit
import Kingfisher
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
        if let img = item.image,let url = URL(string: img){
            exerciseImage.kf.setImage(with: url,placeholder: Constants.placeholderImage)
        }else{
            exerciseImage.image = Constants.placeholderImage
        }
        lblExerciseName.text = item.name
    }
}
