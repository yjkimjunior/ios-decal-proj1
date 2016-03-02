//
//  ViewController.swift
//  ToDoList SinglePage
//
//  Created by Young Joong Kim on 2/22/16.
//  Copyright © 2016 Pikapi. All rights reserved.
//

import UIKit

var toDoList:NSMutableArray = NSMutableArray()
class ViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var item: UITextField!
    @IBOutlet weak var toDoListTable: UITableView!
    
    @IBAction func addItem(sender: AnyObject) {
        
        let dataSet:NSMutableDictionary = NSMutableDictionary()
        
        if let taskText = item.text where !taskText.isEmpty {
            dataSet.setObject(item.text!, forKey: "taskName")
            dataSet.setObject(false, forKey: "completed")
            dataSet.setObject(0, forKey: "hoursSinceCompleted")
        }
    
        toDoList.addObject(dataSet)
        
        item.text = ""
        print(dataSet)
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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        toDoListTable.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = toDoListTable.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        let toDoItem:NSDictionary = toDoList.objectAtIndex(indexPath.row) as! NSDictionary
        print(toDoItem)
        cell.textLabel?.text = toDoItem.objectForKey("taskName") as? String
//        let completed:Bool = (toDoItem.objectForKey("completed") as? Bool)!
 

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
//    func tableView(tableView: UITableView!, moveRowAtIndexPath sourceIndexPath: NSIndexPath!, toIndexPath destinationIndexPath: NSIndexPath!) {
//
//        let item : String = toDoList[sourceIndexPath.row];
//        toDoList.removeAtIndex(sourceIndexPath.row);
//        toDoList.insert(item, atIndex: destinationIndexPath.row)
//        
//    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {

        if editingStyle == .Delete {
            // Delete the row from the data source
            let mutableItemList:NSMutableArray = NSMutableArray()
            
            for dict:AnyObject in toDoList {
                mutableItemList.addObject(dict as! NSDictionary)
            }
            
            mutableItemList.removeObjectAtIndex(indexPath.row)
        
            toDoList = mutableItemList
            
            //toDoItems.removeObjectAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        item.resignFirstResponder()
        return true
    }

}

