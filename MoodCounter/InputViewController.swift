//
//  InputViewController.swift
//  MoodCounter
//
//  Created by Eunbee Kang on 2023/07/25.
//

import UIKit

class InputViewController: UIViewController {
    @IBOutlet var moodButtons: [UIButton]!
    
    let moodNames = Mood.allCases
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configMoodButtons()
    }
    
    @IBAction func tappedResetButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "리셋", message: "모든 카운트가 초기화됩니다.", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let confirm = UIAlertAction(title: "확인", style: .default, handler: { _ in
            self.resetCurrentData()
        })
        alert.addAction(cancel)
        alert.addAction(confirm)
        present(alert, animated: true)
    }

    @IBAction func tappedMoodButton(_ sender: UIButton) {
        let index = sender.tag - 1
        
        addScore(mood: moodNames[index].rawValue, score: 1)
    }
    
    func configMoodButtons() {
        for button in moodButtons {
            configMoodButtonMenu(button)
        }
    }
    
    func configMoodButtonMenu(_ button: UIButton) {
        let index = button.tag - 1
        let moodString = moodNames[index].rawValue
        
        let score1 = UIAction(title: Score.one.buttonTitle, handler: { _ in
            self.addScore(mood: moodString, score: Score.one.rawValue)
        })
        let score5 = UIAction(title: Score.five.buttonTitle, handler: { _ in
            self.addScore(mood: moodString, score: Score.five.rawValue)
        })
        let score10 = UIAction(title: Score.ten.buttonTitle, handler: { _ in
            self.addScore(mood: moodString, score: Score.ten.rawValue)
        })
        let reset = UIAction(title: Score.reset.buttonTitle, handler: { _ in
            self.resetScore(mood: moodString)
        })
        
        button.menu = UIMenu(children: [score1, score5, score10, reset])
    }
    
    func addScore(mood: String, score: Int) {
        let pastScore = userDefaults.integer(forKey: mood)
        let newScore = pastScore + score
        
        userDefaults.set(newScore, forKey: mood)
        
        print("\(mood) \(score)점 추가하여 총 \(newScore)점")
        printAllScores()
    }
    
    func resetScore(mood: String) {
        userDefaults.set(Score.reset.rawValue, forKey: mood)
        
        print("\(mood) 0점으로 초기화")
        printAllScores()
    }
    
    func printAllScores() {
        for i in 0...moodNames.count - 1 {
            let terminator = i == moodNames.count - 1 ? "" : ", "
            let mood = moodNames[i].rawValue
            let score = userDefaults.integer(forKey: mood)
            
            print("\(mood): \(score)점", separator: " ", terminator: terminator)
        }
        print("")
    }
    
    func resetCurrentData() {
        for name in moodNames {
            userDefaults.removeObject(forKey: name.rawValue)
        }
        printAllScores()
    }
}
