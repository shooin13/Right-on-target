import UIKit

protocol GameProtocol {
    //количество заработанных очков
    var score: Int {get}
    
    //загаданное значение
    var currentSecretValue: Int {get}
    
    //проверяет, закончена ли игра
    var isGameEnded: Bool {get}
    
    //начинает новую игру и сразу стартует первый раунд
    func restartGame()
    
    //начинает новый раунд
    func startNewRound()
    
    //сравнивает переданное значение с загаданным и начисляет очки
    func calculateScore(with value: Int)
}

class Game: GameProtocol {
    
    var score: Int = 0
    
    //минимальное загаданное значение
    private var minSecretValue: Int
    
    //максимальное загаданное значение
    private var maxSecretValue: Int
    
    var currentSecretValue: Int = 0
    
    //количество раундов
    private var lastRound: Int
    
    private var currentRound: Int = 1
    
    var isGameEnded: Bool {
        if currentRound >= lastRound {
            return true
        } else {
            return false
        }
    }
    
    init?(startValue: Int, endValue: Int, rounds: Int) {
        //стартовое значение для выбора числа не может быть больше конечного
        guard startValue <= endValue else {
            return nil
        }
        
        minSecretValue = startValue
        maxSecretValue = endValue
        lastRound = rounds
        currentSecretValue = self.getNewSecretValue()
    }
    
    func restartGame() {
        currentRound = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound() {
        currentSecretValue = self.getNewSecretValue()
        currentRound += 1
    }
    
    //загадать и вывести новое случайное значение
    func getNewSecretValue() -> Int {
        (minSecretValue...maxSecretValue).randomElement()!
    }
    
    //подсчитать количество очков
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - (value - currentSecretValue)
        } else if value < currentSecretValue {
            score += 50 - (currentSecretValue - value)
        } else {
            score += 50
        }
    }
}
