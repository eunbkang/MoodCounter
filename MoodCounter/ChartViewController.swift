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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    func configUI() {
        configMoodNameLabels()
        configScoreLabels()
        configCardBackgrounds()
    }
    
    func configMoodNameLabels() {
        for label in moodNameLabels {
            configMoodNameLabel(label)
        }
    }
    
    func configMoodNameLabel(_ label: UILabel) {
        let moodNames = Mood.allCases
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
        label.text = "1점"
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
