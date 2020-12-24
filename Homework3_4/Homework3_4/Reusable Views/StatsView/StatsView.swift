//
//  StatusViewController.swift
//  Homework3_4
//
//  Created by Sasha on 21/12/2020.
//

import UIKit

// MARK: - StatsViewDelegate

protocol StatsViewDelegate {
    func buttonTapped()
}

// MARK: - StatsView

class StatsView: UIView {

    // MARK: - @IBOutlets

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var secondNameLabel: UILabel!
    
    @IBOutlet weak var firstValueLabel: UILabel!
    @IBOutlet weak var secondValueLabel: UILabel!
    
    // MARK: - Variables
    
    let nibName = "StatsView"
    var contentView: UIView?
    var delegate: StatsViewDelegate!
    
    // MARK: - View controller lifecycle methods
    
    @IBAction func buttonTap(_ sender: UIButton) {
        delegate.buttonTapped()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let subviewConstrains = [
            view.layoutMarginsGuide.topAnchor.constraint(equalTo: self.topAnchor),
            view.layoutMarginsGuide.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            view.layoutMarginsGuide.leftAnchor.constraint(equalTo: self.leftAnchor),
            view.layoutMarginsGuide.rightAnchor.constraint(equalTo: self.rightAnchor)
        ]
        
        setupView(view: view)
        self.addSubview(view)
        NSLayoutConstraint.activate(subviewConstrains)
        contentView = view
    }

    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    // MARK: - Setup Methods
    
    func setupView(view: UIView) {
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
    }
    
    func setupViewInformation(firstStats: Stats, secondStats: Stats) {
        firstNameLabel.text = firstStats.name
        firstValueLabel.text = "\(firstStats.value)"
        secondNameLabel.text = secondStats.name
        secondValueLabel.text = "\(secondStats.value)"
        firstImageView.image = firstStats.image
        secondImageView.image = secondStats.image
    }
}

