//
//  BooleanViewController.swift
//  RandomizerV4
//
//  Created by Melvyn Malherbe on 30.06.21.
//

import UIKit

class BooleanViewController: UIViewController {
    // Mark - Outlet
    @IBOutlet var randomizerButton: UIButton!
    @IBOutlet var yesButton: UIButton!
    @IBOutlet var noButton: UIButton!
    @IBOutlet var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Boolean"

        randomizerButton.layer.cornerRadius = 32
        yesButton.layer.cornerRadius = 32
        noButton.layer.cornerRadius = 32
    }
    
    @IBAction func onRandomiz(_ sender: Any) {
        randomizerButton.alpha = 0.5
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.08
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: titleLabel.center.x - 5, y: titleLabel.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: titleLabel.center.x + 5, y: titleLabel.center.y))

        titleLabel.layer.add(animation, forKey: "position")
        
        let randomNumber = Int.random(in: 1 ... 2)
        
        DispatchQueue.global().async {
            for i in 0 ..< (10) {
                usleep(50000)
                DispatchQueue.main.async {
                    self.switchAlphaButton(i % 2 != 0)
                }
            }
            
            DispatchQueue.main.async {
                self.switchAlphaButton(randomNumber == 1)
                self.randomizerButton.alpha = 1
            }
        }
    }
    
    func switchAlphaButton(_ state: Bool) {
        UIView.animate(withDuration: 0.25) {
            if (state) {
                self.noButton.alpha = 1
                self.yesButton.alpha = 0
                return
            }
            self.noButton.alpha = 0
            self.yesButton.alpha = 1
        }
    }
}
