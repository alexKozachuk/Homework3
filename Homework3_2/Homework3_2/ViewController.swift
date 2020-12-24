//
//  ViewController.swift
//  Homework3_2
//
//  Created by Sasha on 19/12/2020.
//

import UIKit

class ViewController: UIViewController {

    // MARK: @IBOutlets
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var fourthView: UIView!
    
    // MARK: Variables
    
    let blackView = UIView()
    let ranibowView = UIView()
    let blueView = UIView()
    let twoCircleView = UIView()
    
    var colorTupleArray: [(UIColor, UIColor)] = [ (.red,.blue), (.cyan,.yellow),
                                                  (.orange, .purple), (.white, .black),
                                                  (.black, .white),]
    let constraintService = ConstraintService.share

    // MARK: - View controller lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGestureRecognizers()
        setupViews()
    }
    
    // MARK: Setup Methods
    
    func setupGestureRecognizers() {
        let firstGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(firstViewTapped))
        firstView.addGestureRecognizer(firstGestureRecognizer)
        let secondGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(secondViewTapped))
        secondView.addGestureRecognizer(secondGestureRecognizer)
        let thirdGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(thirdViewTapped))
        thirdView.addGestureRecognizer(thirdGestureRecognizer)
        let fourthGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(fourthViewTapped))
        fourthView.addGestureRecognizer(fourthGestureRecognizer)
    }
    
    func setupViews() {
        setupBlackView()
        setupRainbowView()
        setupBlueView()
        setupTwoCircleView()
    }
    
    
    func setupTwoCircleView() {
        let radius: CGFloat = 30
        
        
        self.fourthView.addSubview(twoCircleView)
        twoCircleView.translatesAutoresizingMaskIntoConstraints = false
        constraintService.putViewInCenter(view: fourthView, subview: twoCircleView)
        
        let circle1 = UIView()
        circle1.backgroundColor = #colorLiteral(red: 0.7450980392, green: 0.8588235294, blue: 0.2235294118, alpha: 1)
        circle1.layer.cornerRadius = radius
        circle1.clipsToBounds = true
        twoCircleView.addSubview(circle1)
        circle1.translatesAutoresizingMaskIntoConstraints = false
        constraintService.putViewInCenter(view: twoCircleView, subview: circle1, verticalConstant: radius - (radius / 4))
        constraintService.addSizeConstraint(view: circle1, height: radius * 2, width: radius * 2)
        
        let circle2 = UIView()
        circle2.backgroundColor = #colorLiteral(red: 0.1215686275, green: 0.5411764706, blue: 0.4392156863, alpha: 1)
        circle2.layer.cornerRadius = radius
        circle2.clipsToBounds = true
        twoCircleView.addSubview(circle2)
        circle2.translatesAutoresizingMaskIntoConstraints = false
        constraintService.putViewInCenter(view: twoCircleView, subview: circle2, verticalConstant: -(radius - (radius / 4)))
        constraintService.addSizeConstraint(view: circle2, height: radius * 2, width:  radius * 2)
    }
    
    func setupBlueView() {
        let size: CGFloat = 40
        
        blueView.backgroundColor = .systemBlue
        self.thirdView.addSubview(blueView)
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.clipsToBounds = true
        constraintService.putViewInCenter(view: thirdView, subview: blueView)
        constraintService.addSizeConstraint(view: blueView, height: size, width: size)
    }
    
    func setupRainbowView() {
        let size: CGFloat = 80
        let radius: CGFloat = size / 4
        
        ranibowView.backgroundColor = .black
        self.secondView.addSubview(ranibowView)
        ranibowView.translatesAutoresizingMaskIntoConstraints = false
        constraintService.putViewInCenter(view: secondView, subview: ranibowView)
        constraintService.addSizeConstraint(view: ranibowView, height: size, width: size)
        
        let circle = UIView()
        circle.backgroundColor = .white
        circle.layer.cornerRadius = radius
        circle.clipsToBounds = true
        ranibowView.addSubview(circle)
        circle.translatesAutoresizingMaskIntoConstraints = false
        constraintService.putViewInCenter(view: ranibowView, subview: circle)
        constraintService.addSizeConstraint(view: circle, height: radius * 2, width:  radius * 2)
        
        
    }
    
    func setupBlackView() {
        let size: CGFloat = 40
        
        blackView.backgroundColor = .black
        self.firstView.addSubview(blackView)
        blackView.translatesAutoresizingMaskIntoConstraints = false
        constraintService.putViewInCenter(view: firstView, subview: blackView)
        constraintService.addSizeConstraint(view: blackView, height: size, width: size)
    }
    
    // Selectors methods

    @objc func firstViewTapped() {
        firstView.isUserInteractionEnabled = false
        
        UIView.animate(withDuration: 2, delay: 0, options: .autoreverse, animations: {
            self.blackView.transform = CGAffineTransform(scaleX: 2, y: 2)
        }, completion: { [weak self] _ in
            self?.blackView.transform = .identity
            self?.firstView.isUserInteractionEnabled = true
        })
        
    }
    
    @objc func secondViewTapped() {
        secondView.isUserInteractionEnabled = false
        guard let circleView = ranibowView.subviews.first else { return }
        
        var index = 0
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] timer in
            guard let array = self?.colorTupleArray else {
                timer.invalidate()
                self?.secondView.isUserInteractionEnabled = true
                return
            }
            guard index < array.count else {
                timer.invalidate()
                self?.secondView.isUserInteractionEnabled = true
                return
            }
            let colors = array[index]
            circleView.backgroundColor = colors.1
            self?.ranibowView.backgroundColor = colors.0
            index += 1
        }
        
    }
    
    @objc func thirdViewTapped() {
        thirdView.isUserInteractionEnabled = false
        
        UIView.animate(withDuration: 2, delay: 0, options: .autoreverse, animations: {
            self.blueView.layer.cornerRadius = 20
        }, completion: { [weak self] _ in
            self?.blueView.layer.cornerRadius = 0
            self?.thirdView.isUserInteractionEnabled = true
        })
        
    }
    
    @objc func fourthViewTapped() {
        fourthView.isUserInteractionEnabled = false
        
        UIView.animate(withDuration: 2,delay: 0,options: .autoreverse, animations: {
            self.twoCircleView.transform = CGAffineTransform(rotationAngle: .pi)
        }, completion: { [weak self] _ in
            self?.twoCircleView.transform = .identity
            self?.fourthView.isUserInteractionEnabled = true
        })
        
    }
    

}

