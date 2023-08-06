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
    @IBOutlet weak var manOrWoomenSegmentControl: UISegmentedControl!
    @IBOutlet weak var newsSwitcher: UISwitch!
    @IBOutlet weak var ageLabel: UILabel!
    
    // MARK - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK - IB Actions
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        let name = nameTextField.text
        let email = emailTextField.text
        let switcher = newsSwitcher.isOn ? "успешно" : "не "
        
        var manOrWoomen = String()
        if manOrWoomenSegmentControl.selectedSegmentIndex == 0 {
            manOrWoomen = "н"
        } else if manOrWoomenSegmentControl.selectedSegmentIndex == 1 {
            manOrWoomen = "на"
        }
        
        alert(title: "Запрос", description: """
\(name ?? ""), спасибо за Ваш запрос!
Вы \(switcher) подписа\(manOrWoomen) на новости на Ваш email: \(email ?? "").
""")
    }
    
    @IBAction func sliderForAge(_ sender: UISlider) {
        var age = Int()
        age = Int(sender.value)
        let rightAges = rightAge(age: age, var1: "год", var2: "года", var3: "лет")
        ageLabel.text = "Возраст \(age) \(rightAges)"
    }
}

// MARK - Private Methods
extension ViewController {
    private func rightAge(age: Int, var1: String, var2: String, var3: String) -> String {
        let rest = age % 100
        if 11...19 ~= (rest % 10) {
            return var3
        } else if [5,6,7,8,9,0].contains(rest % 10) {
            return var3
        } else if 2...4 ~= (rest % 10) {
            return var2
        }
        return var1
    }
    
    private func alert(title: String, description: String) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Спасибо", style: .default)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
    
}

