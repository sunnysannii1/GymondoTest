//
//  ExerciseDetailViewModel.swift
//  FitnessPartner
//
//  Created by Ahsan Ali on 05/04/2022.
//

import Foundation
protocol ExerciseDetailRepository:AnyObject {
    func getExerciseInfo(id:Int)
    func getVariationCount()->Int
    func getVariations()->[Int]
}

import Foundation
import Combine
import os.log


class ExerciseDetailViewModel:ExerciseDetailRepository,ObservableObject {
    //MARK: - Properties
    private var provider : ServiceProvider<ExerciseService>?
    private  var subscription:AnyCancellable?
    private lazy var logger = Logger(subsystem: String(describing: self), category: "UI")
    @Published var exerciseItem:ExerciseItem?
    @Published var images:[String] = []

    
    //MARK: - Life Cycles
    init(provider:ServiceProvider<ExerciseService>) {
        self.provider = provider
    }
    
    deinit{
        subscription?.cancel()
    }
    
    func getVariations()->[Int]{
        exerciseItem?.variations ?? []
    }
    
    func getVariationCount() -> Int {
        return exerciseItem?.variations?.count ?? 0
    }
    
    func getExerciseInfo(id:Int){
        subscription = provider?.load(service: .getExerciseDetail(id: id) , decodeType: ExerciseItem.self)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
            switch completion {
            case let .failure(error):
                self?.logger.log(level: .error, "Couldn't get exercise List ,\(error.localizedDescription)")
            case .finished:
                self?.logger.log(level: .info, "GOTCHHA")
            }
        } receiveValue: {[weak self] value in
            self?.images = value.images?.compactMap{$0.image} ?? []
            self?.exerciseItem = value
        }
    }
}
