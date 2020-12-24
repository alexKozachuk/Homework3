//
//  Extension+UIKit.swift
//  Homework3_4
//
//  Created by Sasha on 21/12/2020.
//

import UIKit

// MARK: - UIButton

@IBDesignable extension UIButton {
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            self.layer.cornerRadius = newValue
        }
        get {
            return self.layer.cornerRadius
        }
    }
    
}

// MARK: - UIViewController

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
    
    static func instantiate<T: UIViewController>(from storyboard: Storyboard) -> T {
        return storyboard.viewController(viewControllerTypes: T.self)
    }
}

// MARK: - UIImageView

@IBDesignable extension UIImageView {
    
    @IBInspectable var isCircle: Bool {
        set {
            self.layer.cornerRadius = self.frame.size.width / 2
        }
        get {
            return self.layer.cornerRadius == self.frame.size.width / 2 ? true : false
        }
    }
    
}

