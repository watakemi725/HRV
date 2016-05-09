//
//  ProfileViewController.swift
//  HumanRelationVisualiser
//
//  Created by Takemi Watanuki on 2016/05/07.
//  Copyright © 2016年 watakemi725. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet var nameLabel:UILabel!
    
    @IBOutlet weak var scrollView : UIScrollView!
    
    // 7. SecondViewに渡す文字列
    var selectRow: Int!
    
    
    let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate //AppDelegateのインスタンスを取得
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        nameLabel.text = appDelegate.friendsNameArray[appDelegate.selectedRowApp] as String
        
        scrollView.contentSize = CGSizeMake(320,self.view.bounds.height + 100)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
