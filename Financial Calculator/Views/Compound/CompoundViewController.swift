//
//  CompoundViewController.swift
//  Financial Calculator
//
//  Created by Janitha Katukenda on 2022-03-26.
//

import UIKit

class CompoundViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //dismiss keaboard when touch view
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }

}
