//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 吉田なつみ on 2021/09/28.
//

import UIKit

class ViewController: UIViewController {
    
    
    //imageView(画像が表示される場所)の中に3つの画像を宣言
    @IBOutlet weak var imageView: UIImageView!
    var image1: UIImage!
    var image2: UIImage!
    var image3: UIImage!
    
    //進むと戻る
    @IBOutlet weak var playview: UIButton!
    @IBOutlet weak var backview: UIButton!
    
    //画像の上に載せたボタン
    @IBOutlet weak var seguebutton: UIButton!
    
    
    // どの画像にするか
    var flg = 0
    
    // タイマー
    var timer: Timer!
    
    //trueの時再生
    //falseの時停止
    var timerflg = false
    
    // タイマー用の時間のための変数
    var timer_sec: Float = 0
    
    //進むと同じ動きをchange()を使用して実行できる
    func change() {
        if flg == 0 {
            imageView.image = image2
            flg = 1
        }
        else if flg == 1 {
            imageView.image = image3
            flg = 2
        }else if flg == 2{
            imageView.image = image1
            flg = 0
        }
    }
    
    //Main.storybooadに表示されるもの
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image1 = UIImage(named:"img1")
        image2 = UIImage(named:"img2")
        image3 = UIImage(named:"img3")
        imageView.isUserInteractionEnabled = true
        imageView.image = image1
        
    }
    
    // timeInterval: 2, repeats: true で指定された通り、2秒毎に呼び出され続ける
    //change()を使用し、2秒毎に画像が変わる
    @objc func updateTimer(_ timer: Timer) {
        change()
        
    }
    
    // " 再生/停止ボタン "を押した時に実行される動き IBAction
    @IBAction func startTimer(_ sender: Any) {
        
        if timerflg == false {
            // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
            if self.timer == nil {
                self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
                timerflg = true
                //再生ボタンを押している間は他のボタンが使えなくなる
                playview.isEnabled = false // ボタン無効
                backview.isEnabled = false // ボタン無効
                
            }
        }else{
            if self.timer != nil {
                self.timer.invalidate()   // タイマーを停止する
                self.timer = nil          // startTimer() の self.timer == nil で判断するために、 self.timer = nil としておく
                timerflg = false
                //停止ボタンを押したらボタンが使える
                playview.isEnabled = true // ボタン有効
                backview.isEnabled = true // ボタン有効
            }
        }
        
    }
    
    //" 進むボタン "を押したときに実行される動き
    @IBAction func tapped(_ sender: Any) {
        if flg == 0 {
            imageView.image = image2
            flg = 1
        }
        else if flg == 1 {
            imageView.image = image3
            flg = 2
        }else if flg == 2{
            imageView.image = image1
            flg = 0
        }
    }
    //" 戻るボタン "を押したときに実行される動き
    @IBAction func back(_ sender: Any) {
        if flg == 0 {
            imageView.image = image3
            flg = 2
        }
        else if flg == 1 {
            imageView.image = image1
            flg = 0
        }else if flg == 2{
            imageView.image = image2
            flg = 1
        }
    }
    
    //画面遷移
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    //遷移先の表示に関する記述
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultControllerを取得する
        let ResultController:ResultController = segue.destination as! ResultController
        // 遷移先のResulControllerで宣言しているResultImageSrcにimageViewを代入して渡す
        ResultController.ResultImageSrc = imageView.image!
        //遷移中は画像が2秒毎に変えるのを止める
        self.timer.invalidate()
        self.timer = nil          // startTimer() の self.timer == nil で判断するために、 self.timer = nil としておく
        timerflg = false
        //停止ボタンを押したらボタンが使える
        playview.isEnabled = true // ボタン有効
        backview.isEnabled = true // ボタン有効
        
        //拡大から戻ったらどうするか？
    }
    
    @IBAction func tapaction(_ segue: UIStoryboardSegue) {
    }
    
}

