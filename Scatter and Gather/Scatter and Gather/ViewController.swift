//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Sean Acres on 7/17/19.
//  Copyright © 2019 Sean Acres. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isScattered: Bool?
    var labelArray: [UILabel] = []
    var imageView: UIImageView = UIImageView(image: UIImage(named: "lambda_logo"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }

    @IBAction func toggleButtonPressed(_ sender: Any) {
        performScatterAnimation()
    }
    
    func performScatterAnimation() {
        UIView.animateKeyframes(withDuration: 4, delay: 0, options: [], animations: {
            
            // fade logo
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                self.imageView.alpha = 0
            })
            
            // animate labels
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
                for label in self.labelArray {
                    label.transform = CGAffineTransform(rotationAngle: self.generateRandomAngle())
                    label.center = self.generateRandomPoint()
                    label.textColor = self.generateRandomColor()
                    label.backgroundColor = self.generateRandomColor()
                }
            })
            
        }, completion: nil)
    }
    
    func performGatherAnimation() {
        UIView.animateKeyframes(withDuration: 4, delay: 0, options: [], animations: {
            
            // fade logo
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
                self.imageView.alpha = 1
            })
            
            // animate labels
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
                for label in self.labelArray {
                    label.transform = .identity
                }
            })
            
            
        }, completion: nil)
    }
    
    func generateRandomAngle() -> CGFloat {
        let angle = CGFloat(Int.random(in: 0...360))
        
        return angle * .pi / 180
    }
    
    func generateRandomPoint() -> CGPoint {
        let x = CGFloat(Int.random(in: 1...250))
        let y = CGFloat(Int.random(in: 1...600))
        
        return CGPoint(x: x, y: y)
    }
    
    func generateRandomColor() -> UIColor {
        let hue = CGFloat.random(in: 0...1)
        let saturation = CGFloat.random(in: 0.5...1)
        let brightness = CGFloat.random(in: 0.5...1)
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
    
    // set up and configure views for controller
    func configureViews() {
        
        // string to create labels for
        let lambdaString = "Lambda"
        
        // set up stackview
        let stackView = UIStackView()
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
            ])
        
        // create labels for each character in string and add to stackview
        for c in lambdaString {
            let label = UILabel()
            label.text = "\(c)"
            label.font = UIFont.boldSystemFont(ofSize: 50.0)
            label.textAlignment = .center
            labelArray.append(label)
            stackView.addArrangedSubview(label)
        }
        
        // set up imageview
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 58)
            ])
    }
    
    
}

