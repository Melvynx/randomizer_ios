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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onRandomiz(sender: UIButton) {
        let numbers = getMinAndMaxNumber()
        let randomNumber = Int.random(in: numbers.min ... numbers.max)
        
        resultLabel.text = "\(randomNumber)"
        // randomNumberAnimated(randomNumber, interval: numbers)
    }
    
    func randomNumberAnimated(_ finalRandomNumber: Int, interval: (min: Int, max: Int)) {
        for _ in 1...10 {
            let randomNumber = Int.random(in: interval.min ..< interval.max)
            resultLabel.text = "\(randomNumber)"
        }
        
        resultLabel.text = "\(finalRandomNumber)"
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

