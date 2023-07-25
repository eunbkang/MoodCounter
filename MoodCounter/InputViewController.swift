//
//  InputViewController.swift
//  MoodCounter
//
//  Created by Eunbee Kang on 2023/07/25.
//

import UIKit

class InputViewController: UIViewController {

    var countedValue: [Int] = [0, 0, 0, 0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func tappedMoodButton(_ sender: UIButton) {
        let index = sender.tag - 1
        countedValue[index] += 1
        
        let moodNames = Mood.allCases
        print("\(moodNames[index].rawValue): \(countedValue[index])점")
    }
}
