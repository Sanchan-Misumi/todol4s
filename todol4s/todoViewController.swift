//
//  todoViewController.swift
//  todol4s
//
//  Created by Maho Misumi on 2018/09/21.
//  Copyright © 2018年 Maho Misumi. All rights reserved.
//

import UIKit

class todoViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var todoArray: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        table.dataSource = self
        table.delegate = self
        
        if saveData.array(forKey: "todo") != nil {
            todoArray = saveData.array(forKey: "todo") as! [String]
        }
        print(todoArray)
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        todoArray = saveData.object(forKey: "todo") as! [String]
        print(todoArray)
        cell?.textLabel?.text = todoArray[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(todoArray[indexPath.row])が選ばれました！")
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoArray.remove(at: indexPath.row)
            table.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if saveData.array(forKey: "todo") != nil {
            todoArray = saveData.array(forKey: "todo") as! [String]
        }
        table.reloadData()
    }
    
    
    //テーブルビュー編集時に呼ばれるメソッド
//    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCell.EditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//
//        //削除の場合、配列からデータを削除する。
//        if( editingStyle == UITableViewCell.EditingStyle.delete) {
//            todoArray.index.removeAtIndex(indexPath.row)
//        }

//        //テーブルの再読み込み
//        tableView.reloadData()
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
