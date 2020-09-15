//
//  TermOfDayController.swift
//  Pegasus
//
//  Created by Choudary Rayani on 9/14/20.
//  Copyright © 2020 Neel Rayani. All rights reserved.
//

import UIKit

public var termString = ""

class TermOfDayController: UIViewController {

    
    @IBOutlet weak var termOfDayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        termOfDayLabel.text = termString
        // Do any additional setup after loading the view.
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
