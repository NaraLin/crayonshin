//
//  crayonshinViewController.swift
//  
//
//  Created by 林靖芳 on 2024/4/16.
//

import UIKit

class crayonshinViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //設定漸層背景色
        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = CGRect(x: 0, y: 0, width: 428, height: 926)
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [CGColor(red: 0.95, green: 0.8, blue: 0.9, alpha: 1), CGColor(red: 0.1, green: 0.2, blue: 0.7, alpha: 0.5), CGColor(red: 0.2, green: 1, blue: 0.8, alpha: 0.5)]
        gradientLayer.locations = [0,0.7,1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        
        //設定四個小新圖片的大小與位置、邊框顏色與粗細、背景顏色、圖片呈現動畫效果
        let shin1ImageView = UIImageView(frame: CGRect(x: 40, y: 270, width: 150, height: 150))
        view.addSubview(shin1ImageView)
        shin1ImageView.image = UIImage.animatedImageNamed("小新-1-", duration: 1)
        shin1ImageView.layer.borderColor = CGColor(red: 10, green: 10, blue: 10, alpha: 1)
        shin1ImageView.layer.borderWidth = 6
        shin1ImageView.layer.cornerRadius = 60
        shin1ImageView.layer.masksToBounds = true
        shin1ImageView.layer.backgroundColor = CGColor(red: 250/255, green: 80/255, blue: 120/255, alpha: 0.8)
        
        let shin2ImageView = UIImageView(frame: CGRect(x: shin1ImageView.frame.maxX + 24, y: shin1ImageView.frame.minY, width: 150, height: 150))
        view.addSubview(shin2ImageView)
        shin2ImageView.image = UIImage.animatedImageNamed("小新-2-", duration: 1)
        shin2ImageView.layer.borderWidth = 6
        shin2ImageView.layer.cornerRadius = 60
        shin2ImageView.layer.borderColor = CGColor(red: 10, green: 10, blue: 10, alpha: 1)
        shin2ImageView.layer.backgroundColor = CGColor(red: 90/255, green: 255/255, blue: 190/255, alpha: 0.7)
        
        let shin3ImageView = UIImageView(frame: CGRect(x: shin1ImageView.frame.minX, y: shin1ImageView.frame.maxY + 24, width: 150, height: 150))
        view.addSubview(shin3ImageView)
        
        shin3ImageView.image = UIImage.animatedImageNamed("小新-3-", duration: 1)
        shin3ImageView.layer.borderWidth = 6
        shin3ImageView.layer.cornerRadius = 60
        shin3ImageView.layer.borderColor = CGColor(red: 10, green: 10, blue: 10, alpha: 1)
        shin3ImageView.layer.backgroundColor = CGColor(red: 180/255, green: 120/255, blue: 200/255, alpha: 0.8)
        
        
        let shin4ImageView = UIImageView(frame: CGRect(x: shin1ImageView.frame.maxX + 24, y: shin1ImageView.frame.maxY + 24, width: 150, height: 150))
        view.addSubview(shin4ImageView)
        shin4ImageView.image = UIImage.animatedImageNamed("小新-4-", duration: 1)
        shin4ImageView.layer.borderWidth = 6
        shin4ImageView.layer.cornerRadius = 60
        shin4ImageView.layer.masksToBounds = true
        shin4ImageView.layer.borderColor = CGColor(red: 10, green: 10, blue: 10, alpha: 1)
        shin4ImageView.layer.backgroundColor = CGColor(red: 90/255, green: 100/255, blue: 250/255, alpha: 0.8)
        
        //設定 startButton，設定樣式
        startButton.frame = CGRect(x: 272, y: 626, width: 100, height: 72)
        var configuration = UIButton.Configuration.filled()
        var buttonText = AttributedString("start")
        buttonText.font = UIFont(name: "Verdana", size: 28)
        configuration.attributedTitle = buttonText
        configuration.baseForegroundColor = .black
        configuration.background.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.2, alpha: 0.9)
        configuration.background.cornerRadius = 40
        configuration.background.strokeWidth = 4
        configuration.background.strokeColor = .black
        startButton.configuration = configuration
        

        //新增questionLabel，設定文字、大小位置、字體大小
        let questionLabel = UILabel()
        questionLabel.text = "蠟筆小新問答題"
        questionLabel.frame = CGRect(x: 60, y: 160, width: 300, height: 80)
        questionLabel.textAlignment = .center
        questionLabel.font = UIFont.boldSystemFont(ofSize: 40)
        view.addSubview(questionLabel)
        
        
        
        // Do any additional setup after loading the view.
    }
   
    //點選Button跳到下一頁
    @IBAction func buttonTap(_ sender: Any) {
        performSegue(withIdentifier: "QA", sender: nil)
    }
    //    @IBSegueAction func tapped(_ coder: NSCoder) -> QandAViewController? {
//        return QandAViewController(coder: coder)
//    }
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
    return storyboard.instantiateViewController(withIdentifier: "crayonShinViewController")
}
