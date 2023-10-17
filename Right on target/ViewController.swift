//
//  ViewController.swift
//  Right on target
//
//  Created by Павел Николаев on 08.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //сущность «Игра»
    var game: Game!
    
    //элементы на сцене
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    //MARK: - Жизненный цикл
    
    override func loadView() {
        super.loadView()
        //создаем метку для вывода номера версии
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        //меняем текст метки
        versionLabel.text = "Версия 1.2"
        versionLabel.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        //добавляем метку в родительский view
        self.view.addSubview(versionLabel)
        print("loadView")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //создаем экземпляр сущности «Игра»
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        
        //обновляем данные о екущем значении загаданного числа
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
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
    
    //MARK: - Взаимодействие View - Model
    
    //проверка выбранного пользователем числа
    
    
    @IBAction func checkNumber() {
        //высчитываем очки за раунд
        game.calculateScore(with: Int(slider.value))
        
        //проверяем, окончена ли игра
        if game.isGameEnded {
            showAlertWith(score: game.score)
            //начинаем игру заново
            game.restartGame()
        } else {
            game.startNewRound()
        }
        
        //обновляем данные о текущем значении загаданного числа
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    
    //MARK: - Обновление View
    //обновление текста загаданного числа
    private func updateLabelWithSecretNumber(newText: String) {
        print("Загаданное число - \(String(game.currentSecretValue))")
        label.text = newText
    }
    
    //отображение всплывающего окна со счетом
    private func showAlertWith(score: Int) {
        let alert = UIAlertController(title: "Игра окончена", message: "Вы набрали \(score) баллов", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default))
        self.present(alert, animated: true)
    }

}

