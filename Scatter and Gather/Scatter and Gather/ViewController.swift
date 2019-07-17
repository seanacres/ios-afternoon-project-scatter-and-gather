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
    }
    
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

