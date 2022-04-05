//
//  TableView.swift
//  FitnessPartner
//
//  Created by Ahsan Ali on 02/04/2022.
//

import UIKit

extension UITableView {
    // MARK: - Public Methods
    
    func getCell<T: Registerable>(type: T.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as? T
    }
    
    func getCell<T: Registerable>(type: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: type.identifier) as? T
    }
    
    func register(types: Registerable.Type ...) {
        for type in types {
            register(type.getNIB(), forCellReuseIdentifier: type.identifier)
        }
    }
   
    func setLoadingView() {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = center
        activityIndicator.color = .black
        activityIndicator.startAnimating()
        
        backgroundView = activityIndicator
    }
    
    func setNoDataView() {
        let label = UILabel()
        label.text = .localizedString("no_data_found")
        backgroundView = label
    }
    
    func resetBackgroundView() {
        backgroundView = UIView(frame: .zero)
    }
}
