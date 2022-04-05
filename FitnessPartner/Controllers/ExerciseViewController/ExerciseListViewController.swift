//
//  ExerciseListViewController.swift
//  FitnessPartner
//
//  Created by Ahsan Ali on 04/04/2022.
//

import UIKit
import Combine
import SwiftUI
class ExerciseListViewController: UIViewController {
    //MARK: -  Properties
     lazy var exerciseTableView:UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.register(types: ExerciseTableViewCell.self)
        return tv
    }()
    lazy var exerciseViewModel = {
        ExerciseListViewModel(provider: ServiceProvider<ExerciseService>())
    }()
    private var dataSource : ExerciseTableViewDataSource<ExerciseTableViewCell,ExerciseItem>!
    private var bag = Set<AnyCancellable>()

    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        fetchData()
        callToViewModelForUIUpdate()
    }
    
    //MARK: - Helpers
    private func setupViews(){
        title = .localizedString("exer_title")
        view.addSubview(exerciseTableView)
        exerciseTableView.constrainEdges(to: self.view)
    }
    /**
     Updating UI and bindings
     */
    func callToViewModelForUIUpdate(){
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
    /**
     Fetch Exercise List
     */
    private func fetchData(){
        exerciseViewModel.getExerciseList()
    }
    /**
     setup DataSource for TableView
     */
    private func updateDataSource(_ source:ExerciseList){
       self.dataSource = ExerciseTableViewDataSource(cellIdentifier: ExerciseTableViewCell.identifier, items: source, configureCell: { (cell, item) in
            cell.configure(item)
        })
        exerciseTableView.dataSource = dataSource
        exerciseTableView.reloadData()
    }
    /**
     loading View
     */
    private func showLoader(){
        exerciseTableView.setLoadingView()
    }
    /**
     hide loading View
     */
    private func hideLoader(){
        exerciseTableView.resetBackgroundView()
    }
}

extension ExerciseListViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
         let item = dataSource.item(at: indexPath.row)
         if let id = item?.id {
            let vc = UIHostingController(rootView: ExerciseDetailView(id:id))
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
