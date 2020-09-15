//
//  SecondViewController.swift
//  Pegasus
//
//  Created by Choudary Rayani on 8/20/20.
//  Copyright © 2020 Neel Rayani. All rights reserved.
//

import UIKit
struct term {
    var term: String
    var definition : String
    var full: String
    init (term: String, definition: String){
        self.term = term
        self.definition = definition
        
        self.full = "\(term): \(definition)"
    }
    
}

class ThirdViewController: UIViewController {

    @IBOutlet weak var termOfDayButton: UIButton!
    
   
    var terms = [term]()
    
    let termStrings = ["P/E Ratio"]
    let definitionStrings = ["A number that can show whether a stock is too expensive to buy or cheap and a very good deal. A good P/E ratio is around 15-20"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for item in termStrings{
            for item2 in definitionStrings{
                terms.append(term(term: item, definition: item2))
            }
        }
        termOfDayButton.titleLabel?.text = terms[0].full
        
        
        
                // Do any additional setup after loading the view.
    }
    
    
    
    
    

}
