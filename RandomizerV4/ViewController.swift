//
//  ViewController.swift
//  RandomizerV4
//
//  Created by Melvyn Malherbe on 30.06.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    public func alert(_ title: String, message: String) {
         let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
         let ok = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
         alert.addAction(ok)
         self.present(alert, animated: true, completion: nil)
     }
}

