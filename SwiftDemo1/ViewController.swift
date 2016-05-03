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
    
    
    var HomeModel: Home!
    

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
            
            self.HomeModel = Home.modelObjectWithDictionary(data as! [NSObject : AnyObject])
            
            self.tableView.reloadData()
            
            }) { (task, error) -> Void in
                print(error)
        }
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if ((self.HomeModel) != nil){
            return self.HomeModel.stories.count
        } else {
            return 0
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellID = "Cell"
        
//        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellID)
        
        
//        var cell: UITableViewCell! = tableView.cellForRowAtIndexPath(indexPath)
        
        
        if (cell == nil) {
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellID)
        } else {
            while(cell.contentView.subviews.last != nil){
                cell.contentView.subviews.last?.removeFromSuperview()
            }
        }
        
        cell.contentView.backgroundColor = UIColor.redColor()
        
        let stories: Stories = self.HomeModel.stories[indexPath.row] as! Stories
        
        cell.textLabel?.text = stories.title
        
        cell.imageView?.sd_setImageWithURL(NSURL(string: stories.images.first as! String), completed: { (image, error, SDImageCacheType, url) -> Void in
//            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Bottom)
        })
        
        return cell
    }


}

