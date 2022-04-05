//
//  ExerciseListDataSource.swift
//  FitnessPartner
//
//  Created by Ahsan Ali on 04/04/2022.
//

import Foundation
import UIKit

class ExerciseTableViewDataSource<CELL : UITableViewCell,T> : NSObject, UITableViewDataSource {
    //MARK: - Properties
    private var cellIdentifier : String!
    private var items : [T]!
    var configureCell : (CELL, T) -> () = {_,_ in }
    
    //MARK: - Life Cycles
    init(cellIdentifier : String, items : [T], configureCell : @escaping (CELL, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }
    //MARK: - Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CELL else {fatalError()}
        
        if let item = self.items[safe:indexPath.row] {
            self.configureCell(cell, item)
        }
        return cell
    }
}
