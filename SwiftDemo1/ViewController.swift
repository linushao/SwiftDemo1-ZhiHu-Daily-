//
//  ViewController.swift
//  SwiftDemo1
//
//  Created by AceWei on 16/4/26.
//  Copyright © 2016年 AceWei. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var textfild: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var btn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableFooterView = UIView()
        
        setupData()
        
    }
    
    func setupData() {
        let manager = AFHTTPSessionManager()
        manager.GET("http://news-at.zhihu.com/api/4/stories/latest?client=0", parameters: nil, success: { (task, data) -> Void in
            print(data)
//            print(data)
            print(object_getClass(data))
            
            }) { (task, error) -> Void in
                print(error)
        }
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellID = "Cell"
        let cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellID)
        
        cell.contentView.backgroundColor = UIColor.redColor()
        
        
        return cell
    }


}

