//
//  ExerciseListViewController.swift
//  FitnessPartner
//
//  Created by Ahsan Ali on 04/04/2022.
//

import UIKit

class ExerciseListViewController: UIViewController {
    //MARK: -  Properties
    private lazy var exerciseTableView:UITableView = {
        let tv = UITableView()
        tv.register(types: ExerciseTableViewCell.self)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.setLoadingView()
        return tv
    }()
    private lazy var exerciseViewModel = {
       ExerciseListViewModel()
    }()
    private var dataSource : ExerciseTableViewDataSource<ExerciseTableViewCell,ExerciseItem>!
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        callToViewModelForUIUpdate()
    }
    
    //MARK: - Helpers
    private func setupViews(){
        title = .localizedString("exer_title")
        view.addSubview(exerciseTableView)
        exerciseTableView.constrainEdges(to: self.view)
    }
    
   private func callToViewModelForUIUpdate(){
        self.exerciseViewModel.bindExerciseViewModelToController = {[weak self] in
            self?.updateDataSource()
        }
    }
    
   private func updateDataSource(){
       self.dataSource = ExerciseTableViewDataSource(cellIdentifier: ExerciseTableViewCell.identifier, items: self.exerciseViewModel.exerciseItems, configureCell: { (cell, item) in
            cell.configure(item)
        })
        
        DispatchQueue.main.async { [weak self] in
            self?.exerciseTableView.dataSource = self?.dataSource
            self?.exerciseTableView.resetBackgroundView()
            self?.exerciseTableView.reloadData()
        }
    }
    
}
