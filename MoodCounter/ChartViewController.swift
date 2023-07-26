//
//  ChartViewController.swift
//  MoodCounter
//
//  Created by Eunbee Kang on 2023/07/25.
//

import UIKit

class ChartViewController: UIViewController {

    @IBOutlet var moodNameLabels: [UILabel]!
    @IBOutlet var scoreLabels: [UILabel]!
    @IBOutlet var cardBackgrounds: [UIView]!
    
    let moodNames = Mood.allCases
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        configScoreLabels()
    }
    
    @IBAction func tappedArchiveButton(_ sender: UIBarButtonItem) {
        var scores: [Int] = []
        
        for i in 0...moodNames.count - 1 {
            let moodString = moodNames[i].rawValue
            let score = userDefaults.integer(forKey: moodString)
            scores.append(score)
        }
        
        let date = Date().dateToString()
        userDefaults.set(date, forKey: .archivedDate)
        userDefaults.set(scores, forKey: date)
        print(scores)
    }
    
    func configUI() {
        configMoodNameLabels()
        configScoreLabels()
        configCardBackgrounds()
        configBackButton()
    }
    
    func configBackButton() {
        let backButton = UIBarButtonItem(title: " ", style: .plain, target: self, action: nil)
        backButton.tintColor = .black
        self.navigationItem.backBarButtonItem = backButton
    }
    
    func configMoodNameLabels() {
        for label in moodNameLabels {
            configMoodNameLabel(label)
        }
    }
    
    func configMoodNameLabel(_ label: UILabel) {
        label.text = moodNames[label.tag-1].rawValue
        label.font = .preferredFont(forTextStyle: .body)
        
        if label.tag == 1 || label.tag == 5 {
            label.textColor = .white
        }
    }
    
    func configScoreLabels() {
        for label in scoreLabels {
            configScoreLabel(label)
        }
    }
    
    func configScoreLabel(_ label: UILabel) {
        let index = label.tag - 1
        let moodString = moodNames[index].rawValue
        let score = userDefaults.integer(forKey: moodString)
        
        label.text = "\(score)점"
        label.font = .preferredFont(forTextStyle: .title1)
        
        if label.tag == 1 || label.tag == 5 {
            label.textColor = .white
        }
    }
    
    func configCardBackgrounds() {
        for view in cardBackgrounds {
            view.layer.cornerRadius = 12
            view.clipsToBounds = true
        }
    }
}
