//
//  UIView.swift
//  FitnessPartner
//
//  Created by Ahsan Ali on 04/04/2022.
//

import UIKit
extension UIView {
    /**
     This function will allow to add constainsts to Edges of containerView
      - parameter containerView: Requires view to add Constraints
    */
    func constrainEdges(to containerView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
    }
}
