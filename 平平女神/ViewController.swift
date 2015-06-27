//
//  ViewController.swift
//  平平女神
//
//  Created by 刘伟龙 on 15/6/27.
//  Copyright (c) 2015年 刘伟龙. All rights reserved.
//

import UIKit
import AVFoundation

//图片索引
var indexOfImage:Int = 1
var indexOfString:Int = 0

//音频播放
var err:NSError?
let mp3Path = NSBundle.mainBundle().pathForResource("赤道和北极", ofType: "mp3")
let url = NSURL(fileURLWithPath: mp3Path!)
var avAudioPlayer = AVAudioPlayer(contentsOfURL: url, error: &err)

//定时器
var timer: NSTimer?

//文字内容
var str1:[String] =
["感谢God让我认识了你",
 "是你让我的生活",
 "变得更加有劲头",
 "更加有意义"]

var str01:[String] =
[
"六一",
"第一次想表白，但觉得有点匆忙，冷静",
"做自己，已不是年少轻狂冲动的时期，",
"愿好事多磨！",
"第一次因为平平不开心，出去玩回家应",
"该告诉我，无论多晚，这样即使我睡着",
"了，在我醒来的一瞬间，我会看到手机",
"上你的消息，也会比较放心！我不怕被",
"吵，就怕醒来看不到你的消息！"
]

var str02:[String] =
[
"六二",
"平平大早上，给我回过电话来，吃惊！只",
"要你没事，就放心了！不知道你喝了多少",
"酒，一天上吐下泻，就不知道爱惜自己的",
"身体。我酒精过敏，所以我不能喝，也不",
"愿意喝。即使平平你可以喝一些，但毕竟",
"女孩子没必要喝太多，自己的身体最重",
"要！",
"平平，换工作，打心底为你高兴，毕竟是",
"更好的环境，做更有挑战性的工作，心底",
"默默地为你加油，能想象到，也许会很累，",
"很难，但希望你可以开开心心的坚持，压",
"力大的时候有我，有你的朋友，可以陪你！"
]

var str03:[String] =
[
"0605",
"回家三天，没有收到你的消息。也许就是想",
"好好在家陪陪家人，好好休息一下，但终究",
"是没有点消息，没想打扰你，只想你能给我",
"个回复，能知道你挺好就行！已然，你已经",
"走去我的内心，开始惦记你，担心你，挂念",
"你。想你了，平平"
]

var str04:[String] =
[]

var str05:[String] =
[]

var str06:[String] =
[]

var str07:[String] =
[]

var str08:[String] =
[]

var str09:[String] =
[]
class ViewController: UIViewController ,AVAudioPlayerDelegate{
    
    @IBOutlet weak var longInfo: UILabel!
    @IBOutlet weak var pingpingImage: UIImageView!
   
    @IBOutlet weak var sayWords: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        avAudioPlayer!.delegate = self
        
        avAudioPlayer.prepareToPlay()
        avAudioPlayer.play()
        
        self.doTimer()
        
        getSayWord()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pingpingNext(sender: AnyObject) {
        if(indexOfImage <= 4)
        {
            longInfo.hidden = true
            sayWords.hidden = false
            pingpingImage.hidden = false
            
            pingpingImage.image = UIImage(named: "\(indexOfImage)")
            sayWords.text = str1[indexOfString]
            
            var y = Float(indexOfString) * 50.0
            sayWords.frame.origin.y += CGFloat(y);
            
            indexOfImage++;
            
            if(indexOfString++ == 3)
            {
                indexOfString = 0
                
                sayWords.frame.origin.y = 50
            }
        }
        else
        {
            longInfo.hidden = false
            sayWords.hidden = true
            pingpingImage.hidden = true
//            var stringLongInfo:String = "xxx"
//            
//            var i = 0
//            for( i = 0; i < str01.count; i++)
//            {
//                stringLongInfo += "\n"
//                stringLongInfo += str01[i]
//            }
//            
//            longInfo.text = stringLongInfo
//            
            if(indexOfImage++ == 10)
            {
                indexOfImage = 1
            }
        }
    }
    
    func getSayWord(){
        var sp = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentationDirectory, NSSearchPathDomainMask.AllDomainsMask, true)
        //循环出力取得路径
        for file in sp {
            println(file)
        }
        
        //设定路径
        var url: NSURL = NSURL(fileURLWithPath: "//Users/liuweilong/Documents/Source/prictice/平平女神/saywords.txt")!
        
//        //定义可变数据变量
//        var data = NSMutableData()
//        //向数据对象中添加文本，并制定文字code
//        data.appendData("Hello Swift".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!)
//        //用data写文件
//        data.writeToFile(url.path!, atomically: true)
        
        //从url里面读取数据，读取成功则赋予readData对象，读取失败则走else逻辑
        if let readData = NSData(contentsOfFile: url.path!) {
            //如果内容存在 则用readData创建文字列
            println(NSString(data: readData, encoding: NSUTF8StringEncoding))
            longInfo.text = NSString(data: readData, encoding: NSUTF8StringEncoding)! as String
        } else {  
            //nil的话，输出空  
            println("Null")  
        }
    }
    
    func doTimer(){
        var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "pingpingNext:", userInfo: nil, repeats:true);
        timer.fire()
    }
}

