import UIKit


let url = "http://newsapi.org/v2/everything?q=us-stocks&from=\(yesterdayFormattedDate)&to=\(formate)&sortBy=popularity&apiKey=4e63b0592d694468a691ad35ad50dfdd"

struct Newsfeed: Codable {
  
    let status: String
    let totalResults: Int
    let articles: [Article]
}
struct Article: Codable {
    let source: [String:String?]
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
    
}

var articles = [Article]()

class FourthViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    

    
    
    @IBOutlet weak var newfeedScrollview: UIScrollView!
    
    
    @IBOutlet weak var articleTableView: UITableView!
    
    
  
    
    override func viewDidLoad() {
           super.viewDidLoad()
        
        

          
         getData(from: url)
        

           // Do any additional setup after loading the view.
       }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row % articles.count
        performSegue(withIdentifier: "articleSegue", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = articleTableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell", for: indexPath) as! DemoTableViewCell
        
        newfeedScrollview.updateContentView()
        
        
        
        cell.titleLabel.text = articles[indexPath.row % articles.count].title
      
        if articles[indexPath.row % articles.count].urlToImage != "" {
          DispatchQueue.global(qos: .background).async {
                    do
                     {
                     
                       
                      
                        let data = try Data.init(contentsOf: URL.init(string: articles[indexPath.row %  articles.count].urlToImage)!)
                           DispatchQueue.main.async {
                            cell.articleImage.image = UIImage(data: data)
                           }
                      
                     }
                    catch {
                           print(error)
                          }
             }
        }
        else {
            cell.articleImage.image = nil
        }
           
            
        
        
        
        
        return cell
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        print("calling get count \(articles.count)")
        return articles.count * 10
    }
    
    
    
    
   
    private func getData(from url: String) {
        
       
        print(url)
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
            
        
        
            
            
            articles = json.articles
       
           
        
        self.articleTableView.delegate = self
        self.articleTableView.dataSource = self
            
            
        let nib = UINib(nibName: "DemoTableViewCell", bundle: nil)
        self.articleTableView.register(nib, forCellReuseIdentifier: "DemoTableViewCell")
        self.articleTableView.rowHeight = 150
        
        
   
       
            
        }).resume()
        
        
       
        
        
    }
    
    
    
    
    

        
        
          
        
        
        
        
       
        
        
        
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIScrollView {
   func updateContentView() {
        contentSize.height = subviews.sorted(by: { $0.frame.maxY < $1.frame.maxY }).last?.frame.maxY ?? contentSize.height
    }
}

