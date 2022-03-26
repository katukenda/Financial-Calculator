//
//  SavingViewController.swift
//  Financial Calculator
//
//  Created by Janitha Katukenda on 2022-03-26.
//

import UIKit

class SavingViewController: UIViewController {
    
    @IBOutlet weak var principle_amount: UITextField!
    @IBOutlet weak var interest: UITextField!
    @IBOutlet weak var future_value: UITextField!
    @IBOutlet weak var numberOf_years: UITextField!
    @IBOutlet weak var NumberOf_payments: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //dismiss keaboard when touch view
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    func checkFunction() {
        if principle_amount.text?.isEmpty == true {
            getPrincipleAmount()
        }
        if interest.text?.isEmpty == true {
            getInterest()
        }
        if future_value.text?.isEmpty == true {
            getFutureAmount()
        }
        if numberOf_years.text?.isEmpty == true {
            getDuration()
        }

    }
    
    func getPrincipleAmount(){
        
        guard let principleAmount = principle_amount.text else { return }
        guard let interestAmount = interest.text else { return }
        guard let futureAmount = future_value.text else { return }
        guard let numberOfYears = numberOf_years.text else { return }
        
        var FV = Double(futureAmount)!
         var l = Double(interestAmount)!
        var t = Double(numberOfYears)!
        var PV = round(FV / (1 + ((l * t) / 100 )))
        
        principle_amount.text = String(PV)
        
        print(PV)

    }
    func getInterest() {
        
        guard let principleAmount = principle_amount.text else { return }
        guard let interestAmount = interest.text else { return }
        guard let futureAmount = future_value.text else { return }
        guard let numberOfYears = numberOf_years.text else { return }
        
        var FV = Double(futureAmount)!
         var PV = Double(principleAmount)!
        var t = Double(numberOfYears)!
        var l = round(((FV / PV) - 1) * ( 100 / t) )
        
        
        interest.text = String(l)
        
        print("interest")
    }
    func getFutureAmount() {
        guard let principleAmount = principle_amount.text else { return }
        guard let interestAmount = interest.text else { return }
        guard let futureAmount = future_value.text else { return }
        guard let numberOfYears = numberOf_years.text else { return }
        
        var l = Double(interestAmount)!
         var PV = Double(principleAmount)!
        var t = Double(numberOfYears)!
        var FV = round(PV * (1 + (l * t)/100))
        
        future_value.text = String(FV)
        print("Future")
    }
    
    func getDuration() {
        guard let principleAmount = principle_amount.text else { return }
        guard let interestAmount = interest.text else { return }
        guard let futureAmount = future_value.text else { return }
        guard let numberOfYears = numberOf_years.text else { return }
        
        var l = Double(interestAmount)!
         var PV = Double(principleAmount)!
        var FV = Double(futureAmount)!
        var t = round(((FV / PV) - 1) * ( 100 / l) )
        
        numberOf_years.text = String(t)
        print("Duration")
    }
    @IBAction func calculate(_ sender: Any) {
   
checkFunction()
    }
}
