//
//  ExerciseListViewControllerTests.swift
//  FitnessPartnerTests
//
//  Created by Ahsan Ali on 05/04/2022.
//
@testable import FitnessPartner
import XCTest
import Combine
class ExerciseListViewControllerTests: XCTestCase {

    private var sut: ExerciseListViewController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = setupExerciseController()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    private func setupExerciseController()->ExerciseListViewController {
        return  UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExerciseListViewController") as! ExerciseListViewController
    }
}

extension ExerciseListViewControllerTests {
    func testExerciseListViewControllerExistance(){
        XCTAssertNotNil(sut)
    }
    
    func testExerciseListViewControllerTitle(){
        XCTAssertEqual(sut.title,.localizedString("exer_title"))
    }
    
    func testExerciseListViewControllerTableView(){
        XCTAssert(sut.view.subviews.contains(sut.exerciseTableView))
    }
    
    func testExerciseListViewControllerDelegate() {
        XCTAssertTrue(sut.exerciseTableView.delegate is ExerciseListViewController)
    }
}
