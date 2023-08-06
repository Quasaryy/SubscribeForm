//
//  ViewController.swift
//  SubscribeForm
//
//  Created by Yury on 06/08/2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK - IB Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var ageLabel: UILabel!
    
    // MARK - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK - IB Actions
    @IBAction func buttonTapped(_ sender: UIButton) {
    }
    
    @IBAction func sliderForAge(_ sender: UISlider) {
        var age = Int()
        age = Int(sender.value)
        let ages = rightAge(age: age, var1: "год", var2: "года", var3: "лет")
        ageLabel.text = "Возраст \(age) \(ages)"
    }
}

// MARK - Private Methods
extension ViewController {
    private func rightAge(age: Int, var1: String, var2: String, var3: String) -> String {
        var rest = age % 100
        if 11...19 ~= (rest % 10) {
            return var3
        } else if [5,6,7,8,9,0].contains(rest % 10) {
            return var3
        } else if 2...4 ~= (rest % 10) {
            return var2
        }
        return var1
    }
}

