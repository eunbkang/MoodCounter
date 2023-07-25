//
//  InputViewController.swift
//  MoodCounter
//
//  Created by Eunbee Kang on 2023/07/25.
//

import UIKit

class InputViewController: UIViewController {
    @IBOutlet var moodButtons: [UIButton]!
    
    var countedValue: [Int] = [0, 0, 0, 0, 0]
    
    let moodNames = Mood.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configMoodButtons()
    }

    @IBAction func tappedMoodButton(_ sender: UIButton) {
        let index = sender.tag - 1
        addScore(index: index, score: 1)
    }
    
    func configMoodButtons() {
        for button in moodButtons {
            configMoodButtonMenu(button)
        }
    }
    
    func configMoodButtonMenu(_ button: UIButton) {
        let index = button.tag - 1
        let score1 = UIAction(title: "+1점", handler: { _ in
            self.addScore(index: index, score: 1)
        })
        let score5 = UIAction(title: "+5점", handler: { _ in
            self.addScore(index: index, score: 5)
        })
        let score10 = UIAction(title: "+10점", handler: { _ in
            self.addScore(index: index, score: 10)
        })
        let reset = UIAction(title: "초기화", handler: { _ in
            self.countedValue[index] = 0
            print("\(self.moodNames[index].rawValue) \(self.countedValue[index])점으로 초기화")
            self.printAllScores()
        })
        
        let buttonMenu = UIMenu(children: [score1, score5, score10, reset])
        button.menu = buttonMenu
    }
    
    func addScore(index: Int, score: Int) {
        countedValue[index] += score
        print("\(moodNames[index].rawValue) \(score)점 추가하여 총 \(countedValue[index])점")
        printAllScores()
    }
    
    func printAllScores() {
        for i in 0...moodNames.count - 1 {
            let terminator = i == moodNames.count - 1 ? "" : ", "
            print("\(moodNames[i].rawValue): \(countedValue[i])점", separator: " ", terminator: terminator)
        }
        print("")
    }
}
