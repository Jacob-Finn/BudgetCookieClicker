//
//  ViewController.swift
//  Clicker
//
//  Created by Jacob Finn on 8/23/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var userScore = 0
    var gameTimer: Timer!
    var grannyPrice = 50
    var farmPrice = 100
    var farmsOwned = 0
    var timerScoreToAdd = 0
    var granniesOwned = 0
    @IBOutlet weak var farmCostLabel: UILabel!
    @IBOutlet weak var grannyCost: UILabel!
    @IBOutlet weak var clickMeButton: UIButton!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var granniesOwnedLabel: UILabel!
    @IBOutlet weak var farmsOwnedLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        gameTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.addScore), userInfo: nil, repeats: true)
        grannyCost.text = String(grannyPrice)
        granniesOwnedLabel.text = String(granniesOwned)
        farmCostLabel.text = String(farmPrice)
        farmsOwnedLabel.text = String(farmsOwned)
    }
    
    @IBAction func farmButtonPressed(_ sender: Any) {
        if userScore >= farmPrice
        {
            userScore -= farmPrice
            updateScore()
            farmsOwned += 1
            farmPrice = (farmPrice * 2)
            timerScoreToAdd += 2
            farmCostLabel.text = String(farmPrice)
            farmsOwnedLabel.text = String(farmsOwned)
        }
        else
        {
            print("not enough funds!")
        }
    }
    
    
    
    
    
    
    @IBAction func grannyButtonPressed(_ sender: Any) {
        if userScore >= grannyPrice
        {
            userScore -= grannyPrice
            updateScore()
            granniesOwned += 1
            timerScoreToAdd += 1
            grannyPrice += (granniesOwned * 50)
            grannyCost.text = String(grannyPrice)
            granniesOwnedLabel.text = String(granniesOwned)
            
        }
        else
        {
            print("Not enough funds!")
        }
        
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        userScore += (1 + farmsOwned + granniesOwned)
        updateScore()
    }
    @objc func addScore()
    {
        userScore += timerScoreToAdd
        updateScore()
    }
    
    func updateScore()
    {
        pointsLabel.text = String(userScore)
        //clickMeButton.frame.origin = CGPoint(x: 246, y: 264)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

