//
//  QandAViewController.swift
//  crayonshin
//
//  Created by 林靖芳 on 2024/4/19.
//

import UIKit

class QandAViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet var choiceButtons: [UIButton]!
    
    //建立問題array
    var questions = [Question]()
    
    //建立題目
    var question1 = Question(question: "誰年紀最小？", answer: "正男", option: ["小新","小白","風間","正男"])
    var question2 = Question(question: "妮妮覺得誰適合扮演「沈默寡言又懦弱的丈夫」？", answer: "小白", option: ["小新","阿呆","小白","正男"])
    var question3 = Question(question: "誰的家裡有養兩隻貓？", answer: "妮妮", option: ["小新","妮妮","風間","正男"])
    var question4 = Question(question: "誰的生日是5/5？", answer: "小新", option: ["小新","小白","阿呆","正男"])
    var question5 = Question(question: "誰的愛好是喜歡搜集奇怪形狀的石頭？", answer: "阿呆", option: ["阿呆","妮妮","風間","正男"])
    var question6 = Question(question: "誰的夢想是成為一名漫畫家？", answer: "正男", option: ["阿呆","妮妮","風間","正男"])
    var question7 = Question(question: "誰聽得懂金魚的話？", answer: "阿呆", option: ["阿呆","小葵","風間","小新"])
    var question8 = Question(question: "誰曾經因為布丁與小新大吵一架？", answer: "小葵", option: ["阿呆","小白","風間","小葵"])
    var question9 = Question(question: "誰家住在七樓？", answer: "風間", option: ["阿呆","正男","風間","妮妮"])
    var question10 = Question(question: "園長的「老大」稱呼是誰第一個叫的？", answer: "風間", option: ["妮妮","正男","風間","小新"])
    
    //建立題目index
    var index = 0
    
    //建立初始分數
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //設定背景
        let backgroundImageView = UIImageView(frame: self.view.bounds)
        backgroundImageView.image = UIImage(named: "小新背景")
        
        view.insertSubview(backgroundImageView, at: 0)
        
        //設定四個button的位置與大小、文字、邊框粗細、圓角、陰影
        choiceButtons[0].frame = CGRect(x: 48, y: 40, width: 134, height: 130)
        choiceButtons[1].frame = CGRect(x: 246, y: 40, width: 134, height: 130)
        choiceButtons[2].frame = CGRect(x: 48, y: 200, width: 134, height: 130)
        choiceButtons[3].frame = CGRect(x: 246, y: 200, width: 134, height: 130)
        
        
        for i in 0...3{
            choiceButtons[i].setTitle("", for: .normal)
            choiceButtons[i].layer.borderWidth = 5
            choiceButtons[i].layer.cornerRadius = 60
            choiceButtons[i].layer.shadowOffset = CGSize(width: 2, height: 2)
            choiceButtons[i].layer.shadowOpacity = 0.8
            
        }
        
        
        //設定問題label的位置與大小、自動換行（行數=0）、字體大小、置中對齊
        questionLabel.frame = CGRect(x: 0, y: 100, width: 428, height: 150)
        questionLabel.numberOfLines = 0
        questionLabel.font = UIFont(name: "Verdana", size: 36)
        questionLabel.textAlignment = .center
        
        //設定答案label的位置與大小、置中對齊、初始值、字體大小、底色、圓角、外框、自動換行（行數=0）
        answerLabel.frame = CGRect(x: 74, y: 0, width: 280, height: 68)
        answerLabel.textAlignment = .center
        answerLabel.text = "目前分數：0"
        answerLabel.font = UIFont.systemFont(ofSize: 20)
        answerLabel.backgroundColor = UIColor(red: 1, green: 217/255, blue: 230/255, alpha: 1)
        answerLabel.layer.masksToBounds = true
        answerLabel.layer.cornerRadius = 10
        answerLabel.layer.borderWidth = 4
        answerLabel.numberOfLines = 0
        
        //設定slider的位置大小、滑塊的小白圖案、軌道顏色、最大值與最小值、使用者無法拉動slider
        progressSlider.frame = CGRect(x: 92, y: 850, width: 244, height: 40)
        progressSlider.setThumbImage(UIImage(named: "小白滑塊"), for:  .normal)
        progressSlider.setMinimumTrackImage(UIImage(named: "slider_pink_track"), for: .normal)
        progressSlider.setMaximumTrackImage(UIImage(named: "slider_grey_track"), for: .normal)
        progressSlider.minimumValue = Float(1)
        progressSlider.maximumValue = Float(10)
        progressSlider.isUserInteractionEnabled = false
        
        //設定countlabel的初始值、位置大小、字體
        countLabel.text = "1 / 10"
        countLabel.frame = CGRect(x: 346, y: 850, width: 100, height: 40)
        countLabel.font = UIFont(name: "Verdana", size: 12)
        
        //設定next button的文字、字體、底色、文字顏色、圓角、外框粗細與顏色、位置大小
        var configuration = UIButton.Configuration.filled()
        configuration.attributedTitle = "next"
        configuration.attributedTitle?.font = UIFont.boldSystemFont(ofSize: 20)
        configuration.background.backgroundColor = .gray
        configuration.baseForegroundColor = .white
        configuration.background.cornerRadius = 150
        configuration.background.strokeWidth = 8
        configuration.background.strokeColor = .darkGray
        
        
        nextButton.configuration = configuration
        nextButton.frame = CGRect(x: 164, y: -30, width: 100, height: 60)
        
        
        //將題目依序添加到題目陣列中
        questions.append(question1)
        questions.append(question2)
        questions.append(question3)
        questions.append(question4)
        questions.append(question5)
        questions.append(question6)
        questions.append(question7)
        questions.append(question8)
        questions.append(question9)
        questions.append(question10)
        questions.shuffle()
        
        //執行startGame function
        startGame()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func startGame() {
        
        //答案選項隨機排序
        questions[index].option.shuffle()
        
        
        //更改button的四張選擇圖片並啟用button
        for i in 0...3{
            choiceButtons[i].setImage(UIImage(named: questions[index].option[i]), for: .normal)
            choiceButtons[i].isEnabled = true
        }
        
        //題目label
        questionLabel.text = questions[index].question
        
        progressSlider.value = Float(index + 1)
        countLabel.text = "\(index+1) / 10"
        
    }
    
    func playAgain(){
        index = 0
        score = 0
        viewDidLoad()
    }
    
    
    //分數大於80分，跳出alert視窗，依據總分顯示小新大師(>80） or 太低分了(<80）的提示訊息
    //兩個選項：1. 再玩一次（回到Index=0，第一題）2. 結束，回到前一頁
    
    func endGameMessage(){
        if score >= 80{
            let alertController = UIAlertController(title: "你的分數：\(score)分", message: "太強了！你是蠟筆小新大師", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "再玩一次", style: .default) { _ in
                self.playAgain()
            }
            let cancelAction = UIAlertAction(title: "結束", style: .destructive) { _ in
                self.performSegue(withIdentifier: "main", sender: nil)
            }
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            present(alertController, animated: true)
        } else {
            let alertController = UIAlertController(title: "你的分數：\(score)分", message: "太低分啦！去刷影片壓壓驚", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "再玩一次", style: .default) { _ in
                self.playAgain()
            }
            let cancelAction = UIAlertAction(title: "結束", style: .destructive) { _ in
                self.performSegue(withIdentifier: "main", sender: nil)
            }
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            present(alertController, animated: true)
        }
    }
    
    
    
    
    //檢查是否有答題，有答題才能進到下一關，未答題按next會跳alert
    //有答題按next，index+1，檢查是否等於10，等於10則執行endGameMessage()
    //index<10，設定下一題的answerLabel的文字與顏色
    @IBAction func nextButton(_ sender: Any) {
        
        var isButtonSelected = false
        
        for i in 0...3{
            
            if !choiceButtons[i].isEnabled {
                isButtonSelected = true
            }
        }
            
        if isButtonSelected == false {
                
                
                let noChooseAlertController = UIAlertController(title: "oh no ～ 你忘記答題了！", message: "", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "ok", style: .default)
                noChooseAlertController.addAction(okAction)
                present(noChooseAlertController, animated: true)
                
            } else {
                
                index += 1
                
                if index == 10{
                    endGameMessage()
                }
                else if index < 10{
                    answerLabel.text = "目前分數：\(score)"
                    answerLabel.textColor = .black.withAlphaComponent(0.8)
                    startGame()
                }
            }
            
        }
        
    
        
    //答對與答錯顯示的label文字與顏色
    //不管答對或答錯，只能答一次
    @IBAction func choicePress(_ sender: UIButton) {
            
            
        switch sender.currentImage! {
            case UIImage(named: questions[index].answer):
                score += 10
                answerLabel.text = "答對了! 你好棒 ＼(●´ϖ`●)／\n加10分！"
                answerLabel.textColor = .blue
                    
                for i in 0...3{
                    choiceButtons[i].isEnabled = false
                    }
                    
            default:
                answerLabel.text = "答錯了！(☍﹏⁰)"
                answerLabel.textColor = .red
                for i in 0...3{
                    choiceButtons[i].isEnabled = false
                    }
            }
                                    
        }
    }

        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    
    
#Preview {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    return storyboard.instantiateViewController(withIdentifier: "QandA")
}

