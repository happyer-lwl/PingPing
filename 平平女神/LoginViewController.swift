//
//  LoginViewController.swift
//  平平女神
//
//  Created by 刘伟龙 on 15/6/27.
//  Copyright (c) 2015年 刘伟龙. All rights reserved.
//

import UIKit

var timerx : NSTimer?
var alert : UIAlertView?

class LoginViewController: UIViewController ,UIAlertViewDelegate{

    var alertView:UIAlertView?
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var codeText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginIn(sender: UIButton) {
        if(nameText.text == "pingping")
        {
            if(codeText.text == "0218")
            {
                alert = UIAlertView(title: "恭喜！", message: "登陆成功！", delegate: self, cancelButtonTitle: "确定")
                self.view.addSubview(alert!)
                alert!.show()
                
                doTimer()
            }
            else
            {
                alert = UIAlertView(title: "哦，错了！", message: "您输入的密码错误，请重新输入！", delegate: self, cancelButtonTitle: "确定")
                self.view.addSubview(alert!)
                alert!.show()
            }
        }
        else
        {
            alert = UIAlertView(title: "哦，错了！", message: "您输入的名称错误，请重新输入！", delegate: self, cancelButtonTitle: "确定")
            self.view.addSubview(alert!)
            alert!.show()
        }

        
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        nameText.resignFirstResponder()
        
        codeText.resignFirstResponder()
    }
    
    func goStart()
    {
        var secVC = self.storyboard?.instantiateViewControllerWithIdentifier("SecondViewController") as! UIViewController
        secVC.title = "Pass"
        self.presentViewController(secVC, animated: true, completion: {})

    }
    
    func doTimer(){
        alert!.dismissWithClickedButtonIndex(0, animated: true)
        
        timerx = NSTimer.scheduledTimerWithTimeInterval(10.0, target: self, selector: "goStart", userInfo: nil, repeats:true);
        timerx!.fire()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
