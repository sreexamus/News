//
//  ViewController.swift
//  AllNews
//
//  Created by sreekanth reddy iragam reddy on 7/26/17.
//  Copyright © 2017 com.sree.objc. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    var news:News!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 400
         self.tableView.rowHeight = UITableViewAutomaticDimension;
        loadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func loadData() {
        
        let urlStr = "https://newsapi.org/v1/articles?source=the-next-web&sortBy=latest&apiKey=3ded26fc6bb74d59a8b797ffe2ab908a"
        print("call started")
        
        Alamofire.request(URL(string:urlStr)!, method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: [:] ).responseJSON { (response) in
            
            if(response.error != nil){
                print(response.error)
            }
            print(response.result.value)
            print(response.result)
            let jsonRe:JSON = JSON(response.result.value)
            print(jsonRe)
             self.news = News(dictionary: jsonRe.dictionaryObject as! NSDictionary)
            print(self.news?.source)
            self.tableView.reloadData()
            
        }            
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(news != nil){
            return (news.articles?.count)!
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0) {
            return UITableViewAutomaticDimension
        } else {
            return UITableViewAutomaticDimension
        }
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let article = news.articles?[indexPath.row]
        if(indexPath.row == 0) {
            let cell = Bundle.main.loadNibNamed("LargeTableViewCell", owner: self, options: nil)?.first as! LargeTableViewCell
            cell.descLbl.text = article?.description
            
            let url = URL(string: (article?.urlToImage)!)
            
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                DispatchQueue.main.async {
                    cell.img.image = UIImage(data: data!)
                }
            }
            return cell

        }else if(indexPath.row == 4) {
            let cell = Bundle.main.loadNibNamed("MediumTableViewCell", owner: nil, options: nil)?.first as! MediumTableViewCell
            cell.descLbl.text = article?.description
            
            let url = URL(string: (article?.urlToImage)!)
            
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                DispatchQueue.main.async {
                    cell.img.image = UIImage(data: data!)
                }
            }
            return cell
            
        }else{
            let cell = Bundle.main.loadNibNamed("MediumTableViewCell", owner: nil, options: nil)?.first as! MediumTableViewCell
            cell.descLbl.text = article?.description
            
            
            let url = URL(string: (article?.urlToImage)!)
            
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                DispatchQueue.main.async {
                    cell.img.image = UIImage(data: data!)
                }
            }
            
            return cell
        
        }
        
       // return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(indexPath.row == 0) {
            let payvideoVC = self.storyboard?.instantiateViewController(withIdentifier: "playVD") as! PlayVideoViewController
            payvideoVC.videoUrl = "http://www.html5videoplayer.net/videos/toystory.mp4"
            self.present(payvideoVC, animated: true, completion: nil)
            } else {
            let article = news.articles?[indexPath.row]
            let newsVC = self.storyboard?.instantiateViewController(withIdentifier: "NewsDet") as! NewDetailsViewController
            newsVC.article = article
            self.present(newsVC, animated: true, completion: nil)
        
        }
        
    }
    
}
