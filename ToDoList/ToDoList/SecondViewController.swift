//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Young Joong Kim on 2/21/16.
//  Copyright © 2016 Pikapi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var toDoText: UITextField!
    @IBAction func addToDo(sender: AnyObject) {
        toDoList.append((toDoText.text!))
        toDoText.text! = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        toDoText.resignFirstResponder()
        return true
    }

}

