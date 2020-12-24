//
//  ViewController.swift
//  Homework3_3
//
//  Created by Sasha on 20/12/2020.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Variables
    
    let diameter: CGFloat = 40
    let radius: CGFloat = 80
    
    var cicleView = UIView()
    var colorArray: [UIColor] = [.yellow, .orange, .red, .blue, .green, .purple]
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    // MARK: - View controller lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCicleView()
        setupGestureRecognizers()
    }
    
    // MARK: Setup Methods
    
    func setupCicleView() {
        cicleView.frame = CGRect(x: 0, y: 0, width: diameter, height: diameter)
        cicleView.center = view.center
        cicleView.backgroundColor = .red
        cicleView.clipsToBounds = true
        cicleView.layer.cornerRadius = diameter / 2
        self.view.addSubview(cicleView)
    }
    
    func setupGestureRecognizers() {
        let swipeUpGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(viewDidSwipeUp))
        swipeUpGestureRecognizer.direction = .up
        
        let swipeDownGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(viewDidSwipeDown))
        swipeDownGestureRecognizer.direction = .down
        
        let swipeLeftGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(viewDidSwipeLeft))
        swipeLeftGestureRecognizer.direction = .left
        
        let swipeRightGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(viewDidSwipeRight))
        swipeRightGestureRecognizer.direction = .right
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewDidTapped))
        tapGestureRecognizer.numberOfTapsRequired = 1
        
        let doubleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewDidDoubleTapped))
        doubleTapGestureRecognizer.numberOfTapsRequired = 2
        
        view.gestureRecognizers = [swipeUpGestureRecognizer, swipeDownGestureRecognizer, swipeLeftGestureRecognizer, swipeRightGestureRecognizer, tapGestureRecognizer,doubleTapGestureRecognizer]
    }
    
    // MARK: Gesture Recognizers Methods
    
    @objc func viewDidSwipeUp(_ sender: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 1.5) {
            self.cicleView.backgroundColor = self.colorArray.randomElement()
            self.y -= 30
            self.cicleView.transform = CGAffineTransform(translationX: self.x, y: self.y)
        }
    }
    
    @objc func viewDidSwipeDown(_ sender: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 1.5) {
            self.cicleView.backgroundColor = self.colorArray.randomElement()
            self.y += 30
            self.cicleView.transform = CGAffineTransform(translationX: self.x, y: self.y)
        }
    }
    
    @objc func viewDidSwipeLeft(_ sender: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 1.5) {
            self.cicleView.backgroundColor = self.colorArray.randomElement()
            self.x -= 30
            self.cicleView.transform = CGAffineTransform(translationX: self.x, y: self.y)
        }
    }
    
    @objc func viewDidSwipeRight(_ sender: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 1.5) {
            self.cicleView.backgroundColor = self.colorArray.randomElement()
            self.x += 30
            self.cicleView.transform = CGAffineTransform(translationX: self.x, y: self.y)
        }
    }
    
    @objc func viewDidTapped(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 1.5) {
            self.x = 0
            self.y = 0
            self.cicleView.transform = .identity
        }
    }
    
    @objc func viewDidDoubleTapped(_ sender: UITapGestureRecognizer) {
        view.isUserInteractionEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            self?.view.isUserInteractionEnabled = true
            self?.animateCicle()
        }
       
    }
    
    // MARK: - Animation methods

    func animateCicle() {
        let center = CGPoint(x: view.center.x, y: view.center.y - radius)
        let circlePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: .pi / 2, endAngle: (2 * .pi) + (1/2 * .pi), clockwise: true)
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = circlePath.cgPath
        animation.repeatCount = 1
        animation.duration = 3
        animation.isRemovedOnCompletion = true
        cicleView.layer.add(animation, forKey: "animation")
    }
    
}

