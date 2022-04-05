//
//  ExerciseListApiMock.swift
//  FitnessPartnerTests
//
//  Created by Ahsan Ali on 05/04/2022.
//
@testable import FitnessPartner
import XCTest
import Combine
class ExerciseListApiMock: XCTestCase {

    var bag:AnyCancellable?
    
    func testExerciseApiCall() throws {
        let provider = ServiceProvider<ExerciseService>()
        var exerciseList:Exercise?
        let expectation = self.expectation(description: "API Call complete")
        
        bag = provider.load(service: .getExerciseList, decodeType: Exercise.self).sink { completion in
            switch completion {
            case .finished:
                break
            case .failure:
                break
                
            }
        } receiveValue: { exercise in
            exerciseList = exercise
            expectation.fulfill()
        }

        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertNotNil(exerciseList)
    }
}
