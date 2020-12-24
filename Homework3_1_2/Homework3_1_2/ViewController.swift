//
//  ViewController.swift
//  Homework3_1_2
//
//  Created by Sasha on 19/12/2020.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - @IBoutlet
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var magentaView: UIView!
    
    // MARK: - Variables
    
    var portraitConstraint: [NSLayoutConstraint] = []
    var landscapeConstraint: [NSLayoutConstraint] = []
    
    // MARK: - View controller lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstrains()
    }
    
    override func viewWillLayoutSubviews() {
        checkOrientation()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { [weak self] (UIViewControllerTransitionCoordinatorContext) -> Void in
            self?.checkOrientation()
        }, completion: { (UIViewControllerTransitionCoordinatorContext) -> Void in
                    print("rotation completed")
        })
        
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    // MARK: - Setup methods
    
    func setupConstrains() {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        portraitConstraint = [
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: magentaView.trailingAnchor, constant: 20),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: 20),
            redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            redView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            redView.widthAnchor.constraint(equalTo: greenView.widthAnchor),
            greenView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            greenView.leadingAnchor.constraint(equalTo: redView.trailingAnchor, constant: 10),
            yellowView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            yellowView.heightAnchor.constraint(equalTo: redView.heightAnchor),
            view.layoutMarginsGuide.bottomAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 20),
            yellowView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 10),
            magentaView.widthAnchor.constraint(equalTo: yellowView.widthAnchor),
            magentaView.leadingAnchor.constraint(equalTo: yellowView.trailingAnchor, constant: 10),
            magentaView.topAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 10),
            magentaView.heightAnchor.constraint(equalTo: greenView.heightAnchor),
            view.layoutMarginsGuide.bottomAnchor.constraint(equalTo: magentaView.bottomAnchor, constant: 20)
        ]
        
        landscapeConstraint = [
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: magentaView.bottomAnchor, constant: 20),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: redView.bottomAnchor, constant: 20),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 20),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 20),
            redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            redView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            yellowView.widthAnchor.constraint(equalTo: redView.widthAnchor),
            yellowView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            yellowView.leadingAnchor.constraint(equalTo: redView.trailingAnchor, constant: 10),
            magentaView.leadingAnchor.constraint(equalTo: yellowView.trailingAnchor, constant: 10),
            magentaView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            magentaView.widthAnchor.constraint(equalTo: redView.widthAnchor),
            greenView.widthAnchor.constraint(equalTo: redView.widthAnchor),
            greenView.leadingAnchor.constraint(equalTo: magentaView.trailingAnchor, constant: 10),
            greenView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            view.layoutMarginsGuide.trailingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: 20)
        ]
    }
    
    // MARK: - Helper layout methods for Pad
    
    func applyportraitConstraint() {
        NSLayoutConstraint.activate(portraitConstraint)
        NSLayoutConstraint.deactivate(landscapeConstraint)
    }
    
    func applyLandscapeConstraint() {
        NSLayoutConstraint.activate(landscapeConstraint)
        NSLayoutConstraint.deactivate(portraitConstraint)
    }
    
    func checkOrientation() {
        guard UIDevice.current.userInterfaceIdiom == .pad else { return }
        let orient = UIDevice.current.orientation

        switch orient {
        case .portrait:
            self.applyportraitConstraint()
        case .landscapeLeft:
            self.applyLandscapeConstraint()
        case .landscapeRight:
            self.applyLandscapeConstraint()
        case .portraitUpsideDown:
            self.applyportraitConstraint()
        default:
            break
        }
        
    }

}

