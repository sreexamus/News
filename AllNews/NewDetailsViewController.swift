//
//  NewDetailsViewController.swift
//  AllNews
//
//  Created by sreekanth reddy iragam reddy on 8/4/17.
//  Copyright © 2017 com.sree.objc. All rights reserved.
//http://blog.matthewcheok.com/design-teardown-stretchy-headers/
//

import UIKit

class NewDetailsViewController: UIViewController {
    var article:Articles!
    var viewHeader:UIView!
    @IBOutlet weak var tHeaderImage: UIImageView!
     var tHeaderView: UIView!
    @IBOutlet weak var tableView: UITableView!
    let ktableViewHeight:CGFloat = 300
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 400
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        loadImage()
        tHeaderView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(tHeaderView)
        //tableView.tableHeaderView = nil
        print(tHeaderView)
        tableView.contentInset = UIEdgeInsets(top: ktableViewHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -ktableViewHeight)
        
        self.updateHeader()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateHeader() {
        
        var headerRect = CGRect(x: 0, y: -ktableViewHeight, width: tableView.bounds.width, height: ktableViewHeight)
        if(tableView.contentOffset.y < -ktableViewHeight) {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        print("the values are")
        print(headerRect.height)
        print(headerRect.width)
        tHeaderView.frame = headerRect
    }
    
    func loadImage() {
        let url = URL(string: article.urlToImage!)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                print(self.tHeaderImage)
                self.tHeaderImage.image = UIImage(data: data!)
                self.tableView.reloadData()
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension NewDetailsViewController:UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "NewCell", for: indexPath) as! NewDetailsTableViewCell
        cell.desc.text = self.article.description
        cell.title.text = self.article.title
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.updateHeader()
    }
    
}
