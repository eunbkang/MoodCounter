//
//  ArchiveViewController.swift
//  MoodCounter
//
//  Created by Eunbee Kang on 2023/07/26.
//

import UIKit

class ArchiveViewController: UIViewController {
    @IBOutlet var date1Label: UILabel!
    @IBOutlet var moodLabels: [UILabel]!
    @IBOutlet var scoreLabels: [UILabel]!
    
    let moodNames = Mood.allCases
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    @IBAction func tappedTrashButton(_ sender: UIButton) {
        guard let dateString = userDefaults.string(forKey: .archivedDate) else {
            print("dateString error")
            return
        }
        userDefaults.removeObject(forKey: dateString)
        userDefaults.removeObject(forKey: .archivedDate)
        configScoreLabels()
        configDate1Label()
    }
    
    func configUI() {
        configDate1Label()
        configMoodLabels()
        configScoreLabels()
    }

    func configDate1Label() {
        guard let dateString = userDefaults.string(forKey: .archivedDate) else {
            date1Label.text = "0000.00.00"
            
            return
        }
        date1Label.text = dateString
    }
    
    func configMoodLabels() {
        for label in moodLabels {
            configMoodLabel(label)
        }
    }
    
    func configMoodLabel(_ label: UILabel) {
        let index = label.tag - 1
        let moodString = moodNames[index].rawValue
        
        label.text = moodString
        label.font = .preferredFont(forTextStyle: .caption1)
    }
    
    func configScoreLabels() {
        guard let dateString = userDefaults.string(forKey: .archivedDate) else {
            let scores = [0, 0, 0, 0, 0]
            setTextToScoreLabels(scores: scores)
            
            return
        }
        if let scores = userDefaults.array(forKey: dateString) {
            print(scores)
            setTextToScoreLabels(scores: scores)
        }
    }
    
    func setTextToScoreLabels(scores: [Any]) {
        for label in scoreLabels {
            let index = label.tag - 1
            label.text = "\(scores[index])점"
        }
    }
}
