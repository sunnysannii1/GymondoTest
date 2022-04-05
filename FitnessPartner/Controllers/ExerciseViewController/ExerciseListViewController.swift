//
//  ExerciseListViewController.swift
//  FitnessPartner
//
//  Created by Ahsan Ali on 04/04/2022.
//

import UIKit
import Combine
class ExerciseListViewController: UIViewController {
    //MARK: -  Properties
    private lazy var exerciseTableView:UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.register(types: ExerciseTableViewCell.self)
        return tv
    }()
    private lazy var exerciseViewModel = {
       ExerciseListViewModel()
    }()
    private var dataSource : ExerciseTableViewDataSource<ExerciseTableViewCell,ExerciseItem>!
    private var bag = Set<AnyCancellable>()

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
       exerciseViewModel.$exerciseItems
           .receive(on: DispatchQueue.main)
           .sink { [weak self] items in
               self?.updateDataSource(items)
           }
           .store(in: &bag)
       //Loading
       exerciseViewModel.$isLoading
           .receive(on: DispatchQueue.main)
           .sink { [weak self] loading in
               loading ? self?.showLoader() : self?.hideLoader()
           }
           .store(in: &bag)
    }
    
    private func updateDataSource(_ source:ExerciseList){
       self.dataSource = ExerciseTableViewDataSource(cellIdentifier: ExerciseTableViewCell.identifier, items: source, configureCell: { (cell, item) in
            cell.configure(item)
        })
        exerciseTableView.dataSource = dataSource
        exerciseTableView.reloadData()
    }
    
    private func showLoader(){
        exerciseTableView.setLoadingView()
    }
    
    private func hideLoader(){
        exerciseTableView.resetBackgroundView()
    }
}

extension ExerciseListViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
