//
//  ViewController.swift
//  RandomizerV2
//
//  Created by Melvyn Malherbe on 06.07.20.
//  Copyright © 2020 Melvyn Malherbe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var minNumberTextField: UITextField!
    @IBOutlet var maxNumberTextField: UITextField!
    @IBOutlet var randomizerButton: UIButton!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var randomizer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomizerButton.layer.cornerRadius = 32
        
    }
    
    @IBAction func onRandomiz(sender: UIButton) {
        let numbers = getMinAndMaxNumber()
        let randomNumber = Int.random(in: numbers.min ... numbers.max)
     
        // animation
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.08
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: randomizer.center.x - 5, y: randomizer.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: randomizer.center.x + 5, y: randomizer.center.y))

        randomizer.layer.add(animation, forKey: "position")
        
        // increment with animation
        incrementLabel(to: randomNumber)
    }
    
     func incrementLabel(to endValue: Int) {
        let duration: Double = 1.0 // seconds

        let currentValue = Int(resultLabel.text!)!
        let itterate = abs(currentValue - endValue)
        DispatchQueue.global().async {
            for i in 0 ..< (itterate + 1) {
                let sleepTime = UInt32(duration/Double(endValue) * 1000000.0)
                usleep(sleepTime)
                DispatchQueue.main.async {
                    if (currentValue < endValue) {
                        self.resultLabel.text = "\(currentValue + i)"
                    } else {
                        self.resultLabel.text = "\(currentValue - i)"
                    }
                    
                }
            }
        }
    }

    func getMinAndMaxNumber() -> (min: Int, max: Int) {
        let minString = minNumberTextField.text
        let maxString = maxNumberTextField.text
        var maxInt = 1
        var minInt = 2
        
        if let maxIntConverted = Int(maxString!) {
            maxInt = maxIntConverted
        } else {
            alert("Information", message: "Les champs sont mal rempli. Il risque de ne pas être pris en compte.")
        }
        
        if let minIntConverted = Int(minString!) {
            minInt = minIntConverted
        } else {
            alert("Information", message: "Les champs sont mal rempli. Il risque de ne pas être pris en compte.")
        }
        
        return (min: minInt, max: maxInt)
    }

   func alert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

