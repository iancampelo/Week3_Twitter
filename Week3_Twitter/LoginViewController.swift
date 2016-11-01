//
//  LoginViewController.swift
//  Week3_Twitter
//
//  Created by Ian Campelo on 10/31/16.
//  Copyright © 2016 Ian Campelo. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class LoginViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLoginButton(_ sender: AnyObject) {
        let twitterClient = BDBOAuth1SessionManager(baseURL: NSURL(string: "https://api.twitter.com") as URL!, consumerKey: "aIlNvximikrwuTuiCbvozWfe6", consumerSecret: "5rwL9cPLoFYMcx5joqNuSFMDtxkCU0UZnzJEjttYgdQyfkS19Q")
        
        twitterClient?.deauthorize()
        twitterClient?.fetchRequestToken(withPath: "oauth/request_token", method: "GET", callbackURL: URL(string: "twitterapp://oauth"), scope: nil, success: { (request:BDBOAuth1Credential?) in
            
            if let token = request?.token{
                print("Got token!")
                let url = URL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(token)")!
                UIApplication.shared.open(url)
            }
            
            
            }, failure: { (error: Error?) in
                print("F*ck, got this error: \(error?.localizedDescription)")
        })
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
