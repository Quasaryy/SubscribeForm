//
//  ViewController.swift
//  SubscribeForm
//
//  Created by Yury on 06/08/2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var manOrWoomenSegmentControl: UISegmentedControl!
    @IBOutlet weak var newsSwitcher: UISwitch!
    @IBOutlet weak var ageLabel: UILabel!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IB Actions
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        let switcher = newsSwitcher.isOn ? "успешно" : "не" // Check if the user has subscribed to the mailing list or not
        
        // User пegnder check
        var manOrWoomen = String()
        var gender = String()
        if manOrWoomenSegmentControl.selectedSegmentIndex == 0 {
            manOrWoomen = "лся"
            gender = ""
        } else if manOrWoomenSegmentControl.selectedSegmentIndex == 1 {
            manOrWoomen = "лась"
            gender = "a"
        }
        
        // Checking for empty fileds of name and email user
        guard let name = nameTextField.text, let email = emailTextField.text else { return }
        guard !name.isEmpty && !email.isEmpty else {
            alert(title: "Упс!", description: "Пожалуйста введите Ваше имя и имейл 😀")
            return
        }
        
        // Alert window with confirmation
        alert(title: "Запрос", description: """
\(name), спасибо за Ваш запрос!
Ты \(switcher) подписа\(manOrWoomen) на новости.
Ты указал\(gender) email: \(email).
""")
    }
    
    @IBAction func sliderForAge(_ sender: UISlider) {
        var age = Int()
        age = Int(sender.value)
        let rightAges = rightAge(age: age, var1: "год", var2: "года", var3: "лет")
        ageLabel.text = "Возраст \(age) \(rightAges)"
    }
}

// MARK: - Private Methods
extension ViewController {
    // Method for for the correct case of age
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
    
    // Alert window method
    private func alert(title: String, description: String) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Спасибо", style: .default)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
    
}

extension ViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            emailTextField.becomeFirstResponder()
        }
        
        return true
    }
}

