//
//  ExerciseViewModel.swift
//  FitnessPartner
//
//  Created by Ahsan Ali on 04/04/2022.
//

import Foundation
import Combine
import os.log

class ExerciseListViewModel:NSObject {
    //MARK: - Properties
    private var provider : ServiceProvider<ExerciseService>?
    private  var subscription:AnyCancellable?
    private lazy var logger = Logger(subsystem: String(describing: self), category: "UI")
    private(set) var exerciseItems: [ExerciseItem]!{
        didSet{
            bindExerciseViewModelToController()
        }
    }
    
    var bindExerciseViewModelToController : (() -> ()) = {}
    //MARK: - Life Cycles
    override init() {
        super.init()
        provider = ServiceProvider<ExerciseService>()
        getExerciseList()
    }
    
    deinit{
        subscription?.cancel()
    }
    //MARK: - Helpers
    func getExerciseList(){
        subscription = provider?.load(service: .getExercise , decodeType: Exercise.self).sink { [weak self] completion in
            switch completion {
            case let .failure(error):
                self?.logger.log(level: .error, "Couldn't get exercise List ,\(error.localizedDescription)")
            case .finished:
                self?.logger.log(level: .info, "GOTCHHA")
            }
        } receiveValue: {[weak self] value in
            self?.exerciseItems = value.results
        }
    }
    
}
