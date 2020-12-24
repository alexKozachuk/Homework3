//
//  ConstraintService.swift
//  Homework3_2
//
//  Created by Sasha on 20/12/2020.
//

import UIKit

// MARK: ConstraintService

class ConstraintService {
    
    static var share = ConstraintService()
    
    private init() {}
    
    func putViewInCenter(view: UIView, subview: UIView, horizontalConstant: CGFloat = 0, verticalConstant: CGFloat = 0) {
        
        let constraints = [
            subview.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: horizontalConstant),
            subview.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: verticalConstant)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func addSizeConstraint(view: UIView, height: CGFloat, width: CGFloat) {
        
        let constraints = [
            view.widthAnchor.constraint(equalToConstant: width),
            view.heightAnchor.constraint(equalToConstant: height)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
