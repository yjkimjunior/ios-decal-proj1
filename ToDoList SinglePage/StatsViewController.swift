//
//  StatsViewController.swift
//  ToDoList SinglePage
//
//  Created by Young Joong Kim on 2/23/16.
//  Copyright © 2016 Pikapi. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    @IBOutlet weak var numberOfCompleted: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfCompleted.text = String(completedList.count)
        // Do any additional setup after loading the view.
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }

}
