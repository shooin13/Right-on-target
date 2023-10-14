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
    @IBOutlet weak var button: UIButton!
    
    
    
    //загаданное число
    var number: Int = 0
    //раунд
    var round: Int = 0
    //сумма очков за раунд
    var points: Int = 0
    
    private func newRound() {
        number = Int.random(in: 1...50)
        label.text = String(number)
        round += 1
    }
    
    private func newGame() {
        newRound()
        points = 0
        round = 0
        button.setTitle("Проверить", for: .normal)
    }
    
    
    
    @IBAction func checkNumber(_ sender: UIButton) {
        
        if round < 5 {
            print("раунд \(round)")
            let sliderNumber = Int(slider.value.rounded())
            print("Попытка ввода \(sliderNumber)")
            
            if sliderNumber == number {
                let pointsEarned = 50
                points += pointsEarned
                print("Число угадано")
                let alert = UIAlertController(title: "Вы угадали", message: "Вы заработали \(pointsEarned) баллов", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Продолжить", style: .default))
                present(alert, animated: true)
                
                points += pointsEarned
                
                if round == 4 {
                    button.setTitle("Показать результаты", for: .normal)
                }
                
                newRound()
            } else {
                var pointsEarned = 0
                
                if sliderNumber > number {
                    pointsEarned = 50 - (sliderNumber - number)
                } else {
                    pointsEarned = 50 - (number - sliderNumber)
                }
                print("промах на \(sliderNumber - number)")
                let alert = UIAlertController(title: "Вы не угадали", message: "Число отличается на \(sliderNumber - number). Вы заработали \(pointsEarned) баллов", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Продолжить", style: .default))
                present(alert, animated: true)
                
                points += pointsEarned
                
                if round == 4 {
                    button.setTitle("Показать результаты", for: .normal)
                }
                
                newRound()
            }
            
        } else {
            
            label.text = ""
            let alert = UIAlertController(title: "Игра окончена", message: "По результатам 5 раундов вы заработали \(points) баллов. Вы молодец!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Начать заново", style: .default))
            present(alert, animated: true)
            
            newGame()
        }

    }
    //ленивое свойство для хранения ViewController
    lazy var secondViewController: SecondViewController = getSecondViewController()
    //приватный метод, загружающий View Controller
    private func getSecondViewController() -> SecondViewController {
        //загрузка Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //загрузка View Controller и его сцены со Storyboard
        let viewController = storyboard.instantiateViewController(identifier: "SecondViewController")
        return viewController as! SecondViewController
    }
    @IBAction func showSecondScreen(){
        present(secondViewController, animated: true, completion: nil)
    }
    
    
    override func loadView() {
        super.loadView()
        //создаем метку для вывода номера версии
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        //меняем текст метки
        versionLabel.text = "Версия 1.1"
        versionLabel.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        //добавляем метку в родительский view
        self.view.addSubview(versionLabel)
        print("loadView")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        number = Int.random(in: 1...50)
        label.text = String(number)
        label.textColor = .black
        print("Загаданное число - \(number)")
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    


}

