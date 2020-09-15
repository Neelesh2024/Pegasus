//
//  FirstViewController.swift
//  Pegasus
//
//  Created by Choudary Rayani on 8/20/20.
//  Copyright © 2020 Neel Rayani. All rights reserved.
//

import UIKit



class SecondViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBar.delegate = self
        


   }
    
    

}
