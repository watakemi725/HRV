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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        library = []
        // Do any additional setup after loading the view.
        
        library = ["1日","2日","SEP 3","SEP 4","SEP 5","SEP 6","SEP 7","SEP 4","SEP 5","SEP 6","SEP 7","SEP 4","SEP 5","SEP 6","SEP 7","2日","SEP 3","SEP 4","SEP 5","SEP 6","SEP 7","SEP 4","SEP 5","SEP 6","SEP 7","SEP 4","SEP 5","SEP 6","SEP 7"]
        
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
        return library.count
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
        
        cell.textLabel!.text = library[indexPath.row] as String
//        cell.detailTextLabel!.text = String(locationTime.startTime)+"〜"+String(locationTime.goalTime)
        return cell
        // Configure the cell...
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        //        let text: String = texts[indexPath.row]
        //        print(text)
        
//        selectedRow = indexPath.row
        //刺された値を受け渡しながら画面遷移を行う
        // 8. SecondViewControllerへ遷移するSegueを呼び出す
//        performSegueWithIdentifier("goKWSK",sender: nil)
        
    }
    
    
    
    
    /*
    
    // Segueで遷移時の処理
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "goKWSK") {
            let secondVC: DetailRunViewController = (segue.destinationViewController as? DetailRunViewController)!
            
            // 11. SecondViewControllerのtextに選択した文字列を設定する
            secondVC.selectRow = selectedRow
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate //AppDelegateのインスタンスを取得
            appDelegate.selectedRowApp = selectedRow
        }
        
    }

    
    */
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}