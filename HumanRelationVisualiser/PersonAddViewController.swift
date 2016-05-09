//
//  PersonAddViewController.swift
//  HumanRelationVisualiser
//
//  Created by Takemi Watanuki on 2016/05/08.
//  Copyright © 2016年 watakemi725. All rights reserved.
//

import UIKit

class PersonAddViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textfield : UITextField!
    
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate //AppDelegateのインスタンスを取得
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textfield.delegate = self
        
        // Do any additional setup after loading the view.
    }
    /*
    UITextFieldが編集された直後に呼ばれるデリゲートメソッド.
    */
    func textFieldDidBeginEditing(textField: UITextField){
        print("textFieldDidBeginEditing:" + textField.text!)
    }
    
    /*
    UITextFieldが編集終了する直前に呼ばれるデリゲートメソッド.
    */
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing:" + textField.text!)
        
        return true
    }
    
    /*
    改行ボタンが押された際に呼ばれるデリゲートメソッド.
    */
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(){
        appDelegate.friendsNameArray.append(textfield.text!)
    }
    
    @IBAction func back(){
        self.dismissViewControllerAnimated(true, completion: nil)
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
