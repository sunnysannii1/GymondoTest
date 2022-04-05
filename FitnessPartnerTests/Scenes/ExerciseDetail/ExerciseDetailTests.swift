//
//  ExerciseDetailTests.swift
//  FitnessPartnerTests
//
//  Created by Ahsan Ali on 05/04/2022.
//
@testable import FitnessPartner
import XCTest

class ExerciseDetailTests: XCTestCase {

    private var sut: ExerciseDetailView!
    private var viewModel:ExerciseDetailViewModel!
    
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = setupExerciseController()
        viewModel = ExerciseDetailViewModel(provider:ServiceProvider<ExerciseService>())
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    private func setupExerciseController()->ExerciseDetailView {
        return  ExerciseDetailView(id: 345)
    }
    
    func testExerciseName(){
        viewModel.getExerciseInfo(id: 345)
        
        let exerciseNameExpectation = XCTestExpectation(description: "exerciseNameExpectation")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
            XCTAssertTrue(self.viewModel.exerciseItem?.name == "2 Handed Kettlebell Swing")
            exerciseNameExpectation.fulfill()
        })
        wait(for: [exerciseNameExpectation], timeout: 3.5)
    }
    
    func testExerciseVariation(){
        viewModel.getExerciseInfo(id: 228)
        
        let exerciseVariationExpectation = XCTestExpectation(description: "exerciseVariationExpectation")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
            XCTAssertTrue(self.viewModel.getVariationCount() == 6)
            exerciseVariationExpectation.fulfill()
        })
        wait(for: [exerciseVariationExpectation], timeout: 3.5)
    }
    
    
    
    
    
    
}
