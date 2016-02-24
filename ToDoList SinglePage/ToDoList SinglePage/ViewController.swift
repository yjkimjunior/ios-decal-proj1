//
//  ViewController.swift
//  ToDoList SinglePage
//
//  Created by Young Joong Kim on 2/22/16.
//  Copyright © 2016 Pikapi. All rights reserved.
//

import UIKit

var completedList = [String]()
class ViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate {
    var toDoList = [String]()
    @IBOutlet weak var item: UITextField!
    @IBAction func addItem(sender: AnyObject) {
        toDoList.append(item.text!)
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        item.text = ""
        toDoListTable.reloadData()
    }
    
    @IBAction func editButton(sender: AnyObject) {
        if self.toDoListTable.editing == true {
            self.toDoListTable.editing = false
        }
        else {
            self.toDoListTable.editing = true
        }
    }
    
    @IBOutlet weak var toDoListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if (NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil) {
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // the cells you would like the actions to appear needs to be editable
        return true
    }
    
    func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true;
    }
    
    /* stackoverflow.com/questions/24772457/swift-reorder-uitableview-cells */
    // Process the row move. This means updating the data model to correct the item indices.
    func tableView(tableView: UITableView!, moveRowAtIndexPath sourceIndexPath: NSIndexPath!, toIndexPath destinationIndexPath: NSIndexPath!) {

        let item : String = toDoList[sourceIndexPath.row];
        toDoList.removeAtIndex(sourceIndexPath.row);
        toDoList.insert(item, atIndex: destinationIndexPath.row)
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            completedList.append(toDoList.removeAtIndex(indexPath.row))
        }
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        toDoListTable.reloadData()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        item.resignFirstResponder()
        return true
    }

}

