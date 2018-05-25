//
//  moraViewController.swift
//  mora
//
//  Created by user on 2018/5/25.
//  Copyright © 2018年 user. All rights reserved.
//

import UIKit
import GameplayKit

class moraViewController: UIViewController {
    
    var randomDistribution: GKRandomDistribution!
    let images = ["剪刀", "石頭", "布"]
    let directionPkImages = ["pkUp","pkDown","pkLeft","pkRight"]
    let directionImages = ["up","down","left","right"]
    let radomDirection = GKRandomDistribution(lowestValue: 1, highestValue: 4)
    var peterCount = 0
    var pikachuCount = 0
    //判斷猜拳輸贏
    var isWin = false

    @IBOutlet weak var pikachuImage: UIImageView!
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var peterLabel: UILabel!
    @IBOutlet weak var pikachuLabel: UILabel!
    
    @IBOutlet weak var stoneImage: UIImageView!
    @IBOutlet weak var paperImage: UIImageView!
    @IBOutlet weak var downImage: UIImageView!
    @IBOutlet weak var scissorsImage: UIImageView!
    
    @IBOutlet var stoneGesture: UITapGestureRecognizer!
    @IBOutlet var paperGestrue: UITapGestureRecognizer!
    @IBOutlet var scissorsGestrue: UITapGestureRecognizer!
    
    @IBOutlet var upGesture: UITapGestureRecognizer!
    @IBOutlet var rightGesture: UITapGestureRecognizer!
    @IBOutlet var leftGesture: UITapGestureRecognizer!
    @IBOutlet var downGesture: UITapGestureRecognizer!
    
    @IBOutlet weak var renewButton: UIButton!
    
    @IBAction func nextButton(_ sender: UIButton) {
        directionFalse()
        moraGestureTrue()
        imageIsHiddenFalse()
        downImage.isHidden = true
        pikachuImage.image = UIImage(named: "皮卡丘")
        scissorsImage.image = UIImage(named: "剪刀")
        stoneImage.image = UIImage(named: "石頭")
        paperImage.image = UIImage(named: "布")
        textLabel.text = ""
        titleLabel.text = "黑白配"
        if sender == renewButton{
            peterCount = 0
            pikachuCount = 0
            peterLabel.text = "Peter得分：\(peterCount)"
            pikachuLabel.text = "皮卡丘得分：\(pikachuCount)"
        }
    }
    
    @IBAction func moraGesture(_ sender: UITapGestureRecognizer) {
        //產生亂數
        let number = randomDistribution.nextInt()
        pikachuImage.image = UIImage(named: images[number-1])
        switch sender {
        case paperGestrue:
            switch number{
            case 1:
                textLabel.text = "你猜拳輸了"
                moraLose()
            case 2:
                textLabel.text = "你猜拳贏了"
                moraWin()
            default:
                textLabel.text = "平手"
            }
        case scissorsGestrue:
            switch number{
            case 1:
                textLabel.text = "平手"
            case 2:
                textLabel.text = "你猜拳輸了"
                moraLose()
            default:
                textLabel.text = "你猜拳贏了"
                moraWin()
            }

        default:
            switch number{
            case 1:
                textLabel.text = "你猜拳贏了"
                moraWin()
            case 2:
                textLabel.text = "平手"
            default:
                textLabel.text = "你猜拳輸了"
                moraLose()
            }
        }
    }
    
    @IBAction func directionGesture(_ sender: UITapGestureRecognizer) {
        let number = radomDirection.nextInt()
        if isWin {
            pikachuImage.image = UIImage(named: directionPkImages[number-1])
            imageIsHiddenTrue()
            switch sender {
            case upGesture:
                stoneImage.image = UIImage(named: "up")
                if number == 1 {
                    textLabel.text = "你贏了"
                    directionWin()
                }else{
                    textLabel.text = "你猜錯了！！"
                    directionFalse()
                }
            case downGesture:
                stoneImage.image = UIImage(named: "down")
                if number == 2 {
                    textLabel.text = "你贏了"
                    directionWin()
                }else{
                    textLabel.text = "你猜錯了！！"
                    directionFalse()
                }
            case leftGesture:
                stoneImage.image = UIImage(named: "left")
                if number == 3 {
                    textLabel.text = "你贏了"
                    directionWin()
                }else{
                    textLabel.text = "你猜錯了！！"
                    directionFalse()
                }
            default:
                stoneImage.image = UIImage(named: "right")
                if number == 4 {
                    textLabel.text = "你贏了"
                    directionWin()
                }else{
                    textLabel.text = "你猜錯了！！"
                    directionFalse()
                }
            }
        }else{
            pikachuImage.image = UIImage(named: directionImages[number-1])
            imageIsHiddenTrue()
            switch sender {
            case upGesture:
                stoneImage.image = UIImage(named: "pkUp")
                if number == 1 {
                    textLabel.text = "你輸了"
                    directionLose()
                }else{
                    textLabel.text = "皮卡丘猜錯了！！"
                    directionFalse()
                }
            case downGesture:
                stoneImage.image = UIImage(named: "pkDown")
                if number == 2 {
                    textLabel.text = "你輸了"
                    directionLose()
                }else{
                    textLabel.text = "皮卡丘猜錯了！！"
                    directionFalse()
                }
            case leftGesture:
                stoneImage.image = UIImage(named: "pkLeft")
                if number == 3 {
                    textLabel.text = "你輸了"
                    directionLose()
                }else{
                    textLabel.text = "皮卡丘猜錯了！！"
                    directionFalse()
                }
            default:
                stoneImage.image = UIImage(named: "pkRight")
                if number == 4 {
                    textLabel.text = "你輸了"
                    directionLose()
                }else{
                    textLabel.text = "皮卡丘猜錯了！！"
                    directionFalse()
                }
            }
        }
        
    }
    func directionWin(){
        directionFalse()
        peterCount += 10
        peterLabel.text = "Peter得分：\(peterCount)"
    }
    func directionLose(){
        directionFalse()
        pikachuCount += 10
        pikachuLabel.text = "皮卡丘得分：\(pikachuCount)"

    }
    func imageIsHiddenFalse() {
        downImage.isHidden = false
        paperImage.isHidden = false
        scissorsImage.isHidden = false
    }
    func imageIsHiddenTrue() {
        downImage.isHidden = true
        paperImage.isHidden = true
        scissorsImage.isHidden = true
    }

    func moraGestureFalse() {
        stoneGesture.isEnabled = false
        paperGestrue.isEnabled = false
        scissorsGestrue.isEnabled = false
    }
    func moraGestureTrue() {
        stoneGesture.isEnabled = true
        paperGestrue.isEnabled = true
        scissorsGestrue.isEnabled = true
    }

    func moraWin() {
        isWin = true
        moraGestureFalse()
        directionTrue()
        titleLabel.text = "男生女生配"
        imageIsHiddenFalse()
        stoneImage.image = UIImage(named: "up")
        paperImage.image = UIImage(named: "right")
        scissorsImage.image = UIImage(named: "left")
        downImage.image = UIImage(named: "down")
    }
    func moraLose() {
        isWin = false
        moraGestureFalse()
        directionTrue()
        titleLabel.text = "男生女生配"
        imageIsHiddenFalse()
        stoneImage.image = UIImage(named: "pkUp")
        paperImage.image = UIImage(named: "pkRight")
        scissorsImage.image = UIImage(named: "pkLeft")
        downImage.image = UIImage(named: "pkDown")
    }
    func directionFalse() {
        upGesture.isEnabled = false
        rightGesture.isEnabled = false
        leftGesture.isEnabled = false
        downGesture.isEnabled = false
    }
    func directionTrue() {
        upGesture.isEnabled = true
        rightGesture.isEnabled = true
        leftGesture.isEnabled = true
        downGesture.isEnabled = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //猜拳時隱藏downImage
        downImage.isHidden = true
        //猜拳時把方向手勢設false
        directionFalse()
        randomDistribution = GKRandomDistribution(lowestValue: 1, highestValue: images.count)
        titleLabel.text = "黑白配"
        textLabel.text = ""
        peterLabel.text = "Peter得分：0"
        pikachuLabel.text = "皮卡丘得分：0"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
