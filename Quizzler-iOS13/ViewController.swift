//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressLabel: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    var counter = 0
    var wrongButton: UIButton?
    let quiz = [
        ["Four + Two is equal to Six", "True"],
        ["Fix - Three is greater than One","True"],
        ["Three + Eight is less than Ten","False"]]
                
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if(sender.titleLabel?.text == quiz[counter][1]){
            if(counter<quiz.count-1){
                counter+=1
            }else{
                counter = 0;
            }
        }else{
            wrongButton = sender
            markWrongAnswer()
        }
        updateUI()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    func updateUI (){
        questionLabel.text = quiz[counter][0]
    }
    
    
    @objc func markWrongAnswer() {
        wrongButton?.setTitleColor(.red, for: .normal)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.wrongButton?.setTitleColor(.white, for: .normal)
            }
    }
    


}

