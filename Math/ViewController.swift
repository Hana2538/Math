//
//  ViewController.swift
//  Math
//
//  Created by 吉村花菜 on 2024/01/26.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let AnswerPlayer = try!AVAudioPlayer(data: NSDataAsset(name:"Answer")!.data)
    let IncorrectPlayer = try!AVAudioPlayer(data: NSDataAsset(name:"Incorrect")!.data)
    let TapPlayer = try!AVAudioPlayer(data: NSDataAsset(name:"tap")!.data)


    @IBOutlet var label1:UILabel!
    @IBOutlet var label2:UILabel!
    @IBOutlet var label3:UILabel!
    @IBOutlet var label4:UILabel!
    @IBOutlet var Button1:UIButton!
    @IBOutlet var Button2:UIButton!
    
//    let number1 = Int.random(in: 1...9)
//    let number2 = Int.random(in: 1...9)
//    let number3 = Int.random(in: 1...9)
//    var number4 = 0
    
    var select = 0
    
    var ope1 = 0
    var ope2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Button1.layer.borderColor = UIColor.white.cgColor
        Button1.layer.borderWidth = 1.0
        
        Button2.layer.borderColor = UIColor.white.cgColor
        Button2.layer.borderWidth = 1.0

        generateCalculations()
    }
    @IBAction func Button() {
        TapPlayer.play()
        

    
        generateCalculations()
        
    }
    
    @IBAction func changeButton1() {
        TapPlayer.play()
        select = 1
    }
    
    @IBAction func changeButton2() {
        TapPlayer.play()
        select = 2
    }
    
    @IBAction func plus(){
        if select == 1 {
            Button1.titleLabel?.adjustsFontSizeToFitWidth = true
            Button1.setTitle("+", for: .normal)
        } else if select == 2 {
            Button2.setTitle("+", for: .normal)
        }
        
    }
    @IBAction func minus(){
        if select == 1 {
            Button1.setTitle("-", for: .normal)
        } else if select == 2 {
            Button2.setTitle("-", for: .normal)
        }
        
        
    }
    @IBAction func times(){
        if select == 1 {
            Button1.setTitle("×", for: .normal)
        } else if select == 2 {
            Button2.setTitle("×", for: .normal)
        }
    }
    @IBAction func division(){
        if select == 1 {
            Button1.setTitle("÷", for: .normal)
        } else if select == 2 {
            Button2.setTitle("÷", for: .normal)
        }
    }
    
    @IBAction func checkAnswer(){
        var answerText1:String=Button1.currentTitle ?? ""
        var answerText2:String=Button2.currentTitle ?? ""
        
        var checkNumber1: Int = 0
        var checkNumber2: Int = 0
        
        
        if answerText1 == "+" {
            checkNumber1 = 1
        }else if answerText1 == "-"{
            checkNumber1 = 2
        }else if answerText1 == "×"{
            checkNumber1 = 3
        }else if answerText1 == "÷"{
            checkNumber1 = 4
        }
        if answerText2 == "+" {
            checkNumber2 = 1
        }else if answerText2 == "-"{
            checkNumber2 = 2
        }else if answerText2 == "×"{
            checkNumber2 = 3
        }else if answerText2 == "÷"{
            checkNumber2 = 4
        }
        
        if ope1 == checkNumber1 {
            AnswerPlayer.play()
            print("正解")
        }else  if ope2 == checkNumber2{
            AnswerPlayer.play()
            print("正解")
        }else {
            print("残念")
            IncorrectPlayer.play()
        }
       
        
    }
    
    @IBAction func backHomeButton(){
        self.dismiss(animated: true, completion: nil)
    }

    func generateCalculations(){
        let number1 = Int.random(in: 1...9)
        let number2 = Int.random(in: 1...9)
        let number3 = Int.random(in: 1...9)
        var number4 = 0
        
        ope1 = Int.random(in: 1...4)
        ope2 = Int.random(in: 1...4)
        
        var currentNumber: Int = 0
        
        if ope1 == 1 {
            currentNumber = number1 + number2
        }else if ope1 == 2{
            currentNumber = number1 - number2
        }else if ope1 == 3{
            currentNumber = number1 * number2
        }else if ope1 == 4{
            currentNumber = number1 / number2
        }
        if ope2 == 1 {
            number4 = currentNumber + number3
        }else if ope2 == 2{
            number4 = currentNumber - number3
        }else if ope2 == 3{
            number4 = currentNumber * number3
        }else if ope2 == 4{
            number4 = currentNumber / number3
        }
        
        
        
        label1.text = String(number1)
        label2.text = String(number2)
        label3.text = String(number3)
        label4.text = String(number4)
    }
    
}

