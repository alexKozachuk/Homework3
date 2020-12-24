//
//  EnabledButton.swift
//  Homework3_4
//
//  Created by Sasha on 22/12/2020.
//

import UIKit

class EnabledButton: UIButton {
    
    var defaultDisenabledAlpha: CGFloat = 0.6
    
    override var isEnabled: Bool {
        didSet {
            self.alpha = isEnabled ? 1.0 : defaultDisenabledAlpha
        }
    }
}
