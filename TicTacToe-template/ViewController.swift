//
//  ViewController.swift
//  TicTacToe-template
//
//  Created by Mohammad Kiani on 2020-06-08.
//  Copyright © 2020 mohammadkiani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnPlayAgain: UIButton!
    @IBOutlet weak var svBoard: UIStackView!
    
    var isCross = false
    var crossIds : [Int] = []
    var noughtsIds : [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        btnPlayAgain.isHidden = true
    }

    @IBAction func onPlayAgainClicked(_ sender: Any) {
        btnPlayAgain.isHidden = true
        lblResult.isHidden = true
        svBoard.isHidden = false
    }
    
    @IBAction func onBtn1Pressed(_ sender: Any) {
        handleButtonPressed(btn : btn1)
    }
    
    @IBAction func onBtn2Pressed(_ sender: Any) {
        handleButtonPressed(btn : btn2)
    }
    
    @IBAction func onBtn3Pressed(_ sender: Any) {
        handleButtonPressed(btn : btn3)
    }
    
    @IBAction func onBtn4Pressed(_ sender: Any) {
        handleButtonPressed(btn : btn4)
    }
    
    @IBAction func onBtn5Pressed(_ sender: Any) {
        handleButtonPressed(btn : btn5)
    }
    
    @IBAction func onBtn6Pressed(_ sender: Any) {
        handleButtonPressed(btn : btn6)
    }
    
    @IBAction func onBtn7Pressed(_ sender: Any) {
        handleButtonPressed(btn : btn7)
    }
    
    @IBAction func onBtn8Pressed(_ sender: Any) {
        handleButtonPressed(btn : btn8)
    }
    
    @IBAction func onBtn9Pressed(_ sender: Any) {
        handleButtonPressed(btn : btn9)
    }
    
    func handleButtonPressed(btn: UIButton){
        
        if(crossIds.contains(btn.tag) || noughtsIds.contains(btn.tag)){
            return
        }
      
        if(isCross){
            crossIds.append(btn.tag)
            btn.setImage(UIImage(named: "cross.png"), for: .normal)
            checkForResult(selectedBtnIds: crossIds , isCross :isCross)
            isCross = false
        }else{
            noughtsIds.append(btn.tag)
            btn.setImage(UIImage(named: "nought.png"), for: .normal)
            checkForResult(selectedBtnIds :noughtsIds  , isCross :isCross)
            isCross = true
        }
        btn.alpha = 0
                UIView.animate(withDuration: 2) {
                    btn.alpha = 1
                }
        
    }
    
    func checkForResult(selectedBtnIds :[Int] , isCross : Bool){
        if((selectedBtnIds.contains(btn1.tag) && selectedBtnIds.contains(btn2.tag) &&
           selectedBtnIds.contains(btn3.tag)) ||
           (selectedBtnIds.contains(btn4.tag) && selectedBtnIds.contains(btn5.tag) &&
              selectedBtnIds.contains(btn6.tag)) ||
           (selectedBtnIds.contains(btn7.tag) && selectedBtnIds.contains(btn8.tag) &&
               selectedBtnIds.contains(btn9.tag)) ||
           (selectedBtnIds.contains(btn1.tag) && selectedBtnIds.contains(btn4.tag) &&
              selectedBtnIds.contains(btn7.tag)) ||
              (selectedBtnIds.contains(btn2.tag) && selectedBtnIds.contains(btn5.tag) &&
                 selectedBtnIds.contains(btn8.tag)) ||
              (selectedBtnIds.contains(btn3.tag) && selectedBtnIds.contains(btn6.tag) &&
                  selectedBtnIds.contains(btn9.tag)) ||
           (selectedBtnIds.contains(btn1.tag) && selectedBtnIds.contains(btn5.tag) &&
               selectedBtnIds.contains(btn9.tag)) ||
           (selectedBtnIds.contains(btn3.tag) && selectedBtnIds.contains(btn5.tag) &&
               selectedBtnIds.contains(btn7.tag))
        ){
            displayResult(isCross : isCross)
        }
    }
    
    func displayResult(isCross :Bool){
        lblResult.isHidden = false
        btnPlayAgain.isHidden = false
        if(isCross){
            lblResult.text = "Cross is the Winner"
        }else{
            lblResult.text = "Nought is the Winner"
        }
        resetValues()
    }
    
    func resetValues(){
        crossIds = []
        noughtsIds = []
        isCross = false
        btn1.setImage(nil, for: .normal)
        btn2.setImage(nil, for: .normal)
        btn3.setImage(nil, for: .normal)
        btn4.setImage(nil, for: .normal)
        btn5.setImage(nil, for: .normal)
        btn6.setImage(nil, for: .normal)
        btn7.setImage(nil, for: .normal)
        btn8.setImage(nil, for: .normal)
        btn9.setImage(nil, for: .normal)
    }
}

