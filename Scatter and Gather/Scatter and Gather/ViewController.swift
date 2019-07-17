//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Sean Acres on 7/17/19.
//  Copyright © 2019 Sean Acres. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isScattered: Bool = false
    var labelArray: [UILabel] = []
    var imageView: UIImageView = UIImageView(image: UIImage(named: "lambda_logo"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }

    @IBAction func toggleButtonPressed(_ sender: Any) {
        if isScattered {
            performGatherAnimation()
            isScattered.toggle()
        } else {
            performScatterAnimation()
            isScattered.toggle()
        }
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
                    // rotate to random angle
                    label.transform = CGAffineTransform(rotationAngle: self.generateRandomAngle())
                    
                    // move to random point
                    let newX = self.generateRandomPoint().x - label.frame.origin.x
                    let newY = self.generateRandomPoint().y - label.frame.origin.y
                    
                    label.transform = CGAffineTransform(translationX: newX, y: newY)

                    // change colors
                    label.textColor = self.generateRandomColor()
                    label.backgroundColor = self.generateRandomColor()
                }
            })
            
        }, completion: nil)
    }
    
    func performGatherAnimation() {
        UIView.animateKeyframes(withDuration: 4, delay: 0, options: [], animations: {
            
            // fade logo
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                self.imageView.alpha = 1
            })
            
            // animate labels
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
                for label in self.labelArray {
                    
                    // reset to original rotation and position
                    label.transform = .identity
                    
                    // reset colors
                    label.textColor = .black
                    label.backgroundColor = .clear
                }
            })
        }, completion: nil)
    }
    
    // generate random angle
    func generateRandomAngle() -> CGFloat {
        let angle = CGFloat(Int.random(in: 0...360))
        
        return angle * .pi / 180
    }
    
    // generate random point
    func generateRandomPoint() -> CGPoint {
        let x = CGFloat.random(in: 1...view.safeAreaLayoutGuide.layoutFrame.size.width)
        let y = CGFloat.random(in: 1...view.safeAreaLayoutGuide.layoutFrame.size.height)

        return CGPoint(x: x, y: y)
    }
    
    // generate random color
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

