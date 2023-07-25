//
//  InputViewController.swift
//  MoodCounter
//
//  Created by Eunbee Kang on 2023/07/25.
//

import UIKit

class InputViewController: UIViewController {

    var countedValue: [Int] = [0, 0, 0, 0, 0]
    
    let moodNames = Mood.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func tappedMoodButton(_ sender: UIButton) {
        let index = sender.tag - 1
        countedValue[index] += 1
        
        print("\(moodNames[index].rawValue) 1점 추가, 총 \(countedValue[index])점")
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
