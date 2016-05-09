//
//  ListViewController.swift
//  HumanRelationVisualiser
//
//  Created by Takemi Watanuki on 2016/05/07.
//  Copyright © 2016年 watakemi725. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var tableView : UITableView!
    
    var library : [NSString]!
    
    // 7. SecondViewに渡す文字列
    var selectedRow: Int!
    
    let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate //AppDelegateのインスタンスを取得
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        library = []
        // Do any additional setup after loading the view.
        
        appDelegate.friendsNameArray = ["1日","SEP 7"]
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        //        編集可能にする
        //        navigationItem.rightBarButtonItem = editButtonItem()
        
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        // Update Table Data
        //        tableView.beginUpdates()
        //        tableView.insertRowsAtIndexPaths([
        //            NSIndexPath(forRow: appDelegate.friendsNameArray.count-1, inSection: 0)
        //            ], withRowAnimation: .Automatic)
        //        tableView.endUpdates()
        tableView.reloadData()
    }
    
    
    //編集可能にする
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.editing = editing
    }
    
    //すべてのセルを削除可能とする
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    //削除後の処理
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        // 先にデータを更新する
        //        titles.removeAtIndex(indexPath.row)
        
        
        let listToBeDeleted = appDelegate.friendsNameArray[indexPath.row]
        // トランザクションを開始してオブジェクトを削除します
        //        try! realm.write {
        //            //            realm.delete(cheeseBook)
        //            self.realm.delete(listToBeDeleted)
        //
        //        }
        
        appDelegate.friendsNameArray.removeAtIndex(indexPath.row)
        
        // それからテーブルの更新
        tableView.deleteRowsAtIndexPaths([NSIndexPath(forRow: indexPath.row, inSection: 0)],
            withRowAnimation: UITableViewRowAnimation.Fade)
        
        //        print(locationData.count)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1//
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //        return texts.count
        return appDelegate.friendsNameArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        //        let locationTime = library[indexPath.row]
        //
        //        //        cell.textLabel!.text = texts[indexPath.row]
        //
        //        let formatter = NSDateFormatter()
        //        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        //        let dateString = formatter.stringFromDate(locationTime.createdAt)
        
        cell.textLabel!.text = appDelegate.friendsNameArray[indexPath.row] as String
        //        cell.detailTextLabel!.text = String(locationTime.startTime)+"〜"+String(locationTime.goalTime)
        return cell
        // Configure the cell...
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        //        let text: String = texts[indexPath.row]
        //        print(text)
        
        selectedRow = indexPath.row
        //刺された値を受け渡しながら画面遷移を行う
        // 8. SecondViewControllerへ遷移するSegueを呼び出す
        performSegueWithIdentifier("goProf",sender: nil)
        
    }
    
    
    // Segueで遷移時の処理
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "goProf") {
            let secondVC: ProfileViewController = (segue.destinationViewController as? ProfileViewController)!
            
            // 11. SecondViewControllerのtextに選択した文字列を設定する
//            secondVC.selectRow = selectedRow
            
            appDelegate.selectedRowApp = selectedRow
        }
        
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
