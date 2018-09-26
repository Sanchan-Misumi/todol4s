//
//  ViewController.swift
//  todol4s
//
//  Created by Maho Misumi on 2018/09/21.
//  Copyright © 2018年 Maho Misumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    
    //todoを格納する配列
    var todoArray = [Any]()

    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textField.text = ""
    }

    @IBAction func save(_ sender: Any) {
        
        if textField.text != "" {
            
        todoArray.append(textField.text as Any)
        saveData.set(todoArray, forKey:"todo")
//        todoArray.append(saveData.object(forKey: "todo") as Any)
            
        print(todoArray)
        
//        performSegueToResult()
        } else {
            
        }
        
    }
    
//    func performSegueToResult(){
//        performSegue(withIdentifier: "toToDoViewController", sender: nil)
//    }
//
//    //セグエを準備する時に呼ばれるメソッド
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toToDoViewController"{
//            let todoViewController = segue.destination as! todoViewController
//            todoViewController.todoArray = self.todoArray as! [String]
//        }
//    }
}

