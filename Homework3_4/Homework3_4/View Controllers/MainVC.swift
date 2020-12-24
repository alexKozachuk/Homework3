//
//  ViewController.swift
//  Homework3_4
//
//  Created by Sasha on 21/12/2020.
//

import UIKit

class MainVC: UIViewController {

    // MARK: @IBOutlets
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var detailButton: EnabledButton!
    
    // MARK: - View controller lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)
        detailButton.isEnabled = false
        textField.delegate = self
    }
    
    // Selectors methods
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // @IBActions
    
    @IBAction func textFieldValueChanged() {
        if let text = textField.text, text != ""  {
            detailButton.isEnabled = true
        } else {
            detailButton.isEnabled = false
        }
    }
    
    @IBAction func detailsButtonTapped() {
        guard let text = textField.text else { return }
        let vc: DetailVC = .instantiate(from: .main)
        vc.name = text
        present(vc, animated: true) { [ weak self ] in
            self?.textField.text = ""
            self?.detailButton.isEnabled = false
        }
    }

}

// MARK: - UITextFieldDelegate

extension MainVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      textField.resignFirstResponder()
      return true;
    }
    
}

