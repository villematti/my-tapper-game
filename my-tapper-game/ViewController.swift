//
//  ViewController.swift
//  my-tapper-game
//
//  Created by Ville-Matti Hakanpää on 20/12/15.
//  Copyright © 2015 Ville-Matti Hakanpää. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // PROPERTIES
    
    // How many tabs there should be?
    var maxTabs: Int = 0
    
    // How many tabs there have been?
    var currentTabs: Int = 0

    
    //OUTLETS
    
    // Outlest for the start screen
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    // These will display when play button is clicked
    @IBOutlet weak var tabButton: UIButton!
    @IBOutlet weak var tabsLabel: UILabel!
    
    // When coin image is tabbed.
    @IBAction func onCoinTapped(sender: UIButton) {
        
        // Add one to current tabs.
        currentTabs++
        
        // Update the label
        updateTabsLabel()
        
        // Check if game is over
        if isGameOver() {
            
            // Restart the game if it is.
            restartGame()
        }
    }
    
    // Action for the play button
    @IBAction func onPlayBtnPressed(sender: UIButton!) {
        
        // If user actualy put something on the textField.
        if howManyTapsTxt.text != "" && howManyTapsTxt.text != nil {
            
            // Hide all assets what belog to the start screen
            logoImg.hidden = true
            playBtn.hidden = true
            howManyTapsTxt.hidden = true
        
            // Reveil the game
            tabButton.hidden = false
            tabsLabel.hidden = false
            
            // Set maxTabs for given value
            maxTabs = Int(howManyTapsTxt.text!)!
            currentTabs = 0
            
            // Update the label
            updateTabsLabel()
        }
    }
    
    // Function for updating a label for current tabs.
    func updateTabsLabel() {
        tabsLabel.text = "\(currentTabs) Tabs"
    }

    // Restart game
    func restartGame() {
        
        // Reset everyting to empty or zero
        maxTabs = 0
        howManyTapsTxt.text = ""
        
        // Show the start screen
        logoImg.hidden = false
        playBtn.hidden = false
        howManyTapsTxt.hidden = false
        
        // Hide game screen.
        tabButton.hidden = true
        tabsLabel.hidden = true
    }
    
    // Check if game is over
    func isGameOver() -> Bool {
        if currentTabs >= maxTabs {
            return true
        }
        return false
    }
 }

