//
//  DetailVC.swift
//  Homework3_4
//
//  Created by Sasha on 21/12/2020.
//

import UIKit

class DetailVC: UIViewController {

    // MARK: @IBOutlets
    
    @IBOutlet weak var firstChildView: StatsView!
    @IBOutlet weak var secondChildView: StatsView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: Variables
    
    var name: String?
    
    // MARK: - View controller lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFirstChildView()
        setupSecondChildView()
        setupName()
    }
    
    // MARK: - Setup Methods
    
    func setupName() {
        guard let name = name else { return }
        nameLabel.text = name
    }
    
    func setupFirstChildView() {
        let firstStats = Stats(name: "Videos".localized, value: 115, image: #imageLiteral(resourceName: "video-icon"))
        let secondStats = Stats(name: "Hearts".localized, value: 5483, image: #imageLiteral(resourceName: "heart-icon"))
        firstChildView.setupViewInformation(firstStats: firstStats, secondStats: secondStats)
        firstChildView.delegate = self
    }
    
    func setupSecondChildView() {
        let firstStats = Stats(name: "Games".localized, value: 453, image: #imageLiteral(resourceName: "game-icon"))
        let secondStats = Stats(name: "Wins".localized, value: 340, image: #imageLiteral(resourceName: "win-icon"))
        secondChildView.setupViewInformation(firstStats: firstStats, secondStats: secondStats)
        secondChildView.delegate = self
    }
    
    // MARK: - @IBActions
    
    @IBAction func doneButtonTapped(_ sender: Any?) {
        dismiss(animated: true)
    }
 
}

// MARK: - StatsViewDelegate

extension DetailVC: StatsViewDelegate {
    
    func buttonTapped() {
        let vc = BigAlertVC.loadFromNib()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
        
    }
    
}

