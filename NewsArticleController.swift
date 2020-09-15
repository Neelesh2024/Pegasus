//
//  NewsArticleController.swift
//  Pegasus
//
//  Created by Choudary Rayani on 9/1/20.
//  Copyright © 2020 Neel Rayani. All rights reserved.
//

import UIKit

let date = Date()
let formate = date.getFormattedDate(format: "yyyy-MM-dd") // Set output formate

       extension Date {
          func getFormattedDate(format: String) -> String {
               let dateformat = DateFormatter()
               dateformat.dateFormat = format
               return dateformat.string(from: self)
           }
       }

func yesterday() -> Date {
 
   var dateComponents = DateComponents()
   dateComponents.setValue(-1, for: .day) // -1 day
 
   let now = Date() // Current date
   let yesterday = Calendar.current.date(byAdding: dateComponents, to: now) // Add the DateComponents
 
   return yesterday!
}

let yesterdayDate = yesterday()
let yesterdayFormattedDate = yesterdayDate.getFormattedDate(format: "yyyy-MM-dd")

var myIndex = 0

class NewsArticleController: UIViewController {

    
    
    
    @IBOutlet weak var articleImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
         
        
        
        
        contentLabel.font = UIFont(name: "Arial", size: 12.0)
        titleLabel.font = UIFont(name: "Arial", size: 18.0)
        authorLabel.font = UIFont(name: "Arial", size: 14.0)
       
        self.title = articles[myIndex].title
        
        contentLabel.text = articles[myIndex].content
        
        
        titleLabel.text = articles[myIndex].title
        
        authorLabel.text = "By: \(articles[myIndex].author)"
        
        
        if articles[myIndex].urlToImage != "" {
        DispatchQueue.global(qos: .background).async {
                  do
                   {
                   
                     
                    
                      let data = try Data.init(contentsOf: URL.init(string: articles[myIndex].urlToImage)!)
                         DispatchQueue.main.async {
                            self.articleImage.image = UIImage(data: data)
                         }
                    
                   }
                  catch {
                         print(error)
                        }
           }
          }
        
            else {
          articleImage.image = nil
            }
                 
        
        
}
    
    public func getData(from url: String, label: UILabel, label2: UILabel, label3: UILabel, vc: UIViewController, imageView: UIImageView, index: Int) {
         
         
     URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
         guard let data = data, error == nil else {
                 print("Something went wrong")
                 return
             }
         var results: Newsfeed?
         do {
             results = try JSONDecoder().decode(Newsfeed.self, from: data)
         }
         catch {
            print("Error parsing: \(error)")
         }
         guard let json = results else {
             return
         }
             
         
         DispatchQueue.main.async {
           label.text = json.articles[index].content
            label2.text = json.articles[index].title
            label3.text = "By: \(json.articles[index].author)"
            vc.title = json.articles[index].title
            if json.articles[index].urlToImage != "" {
            DispatchQueue.global(qos: .background).async {
                      do
                       {
                       
                         
                        
                        let data = try Data.init(contentsOf: URL.init(string: json.articles[index].urlToImage)!)
                             DispatchQueue.main.async {
                                imageView.image = UIImage(data: data)
                             }
                        
                       }
                      catch {
                             print(error)
                            }
               }
              }
            
                else {
                    imageView.image = nil
                }
         }
         
    
        
             
         }).resume()
     }
     
}

