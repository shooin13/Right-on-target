//
//  ViewController.swift
//  Right on target
//
//  Created by Павел Николаев on 08.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    
    //загаданное число
    var number: Int = Int.random(in: 1...50)
    //раунд
    var round: Int = 0
    //сумма очков за раунд
    var points: Int = 0
    
    
    
    @IBAction func checkNumber(_ sender: UIButton) {
        let sliderNumber = Int(slider.value.rounded())
        print("Попытка ввода \(sliderNumber)")
        
        if sliderNumber == number {
            print("Число угадано")
            let alert = UIAlertController(title: "Игра окончена", message: "Вы угадали", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Играть еще раз", style: .default))
            present(alert, animated: true)
            number = Int.random(in: 1...50)
            label.text = String(number)
        } else {
            print("промах на \(sliderNumber - number)")
            let alert = UIAlertController(title: "Вы не угадали", message: "Число отличается на \(sliderNumber - number)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Продолжить", style: .default))
            present(alert, animated: true)
        }

    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.text = String(number)
        print("Загаданное число - \(number)")
    }


}

