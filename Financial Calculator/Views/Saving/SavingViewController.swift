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
        if (principle_amount.text?.isEmpty == true && interest.text?.isEmpty == false && future_value.text?.isEmpty == false && numberOf_years.text?.isEmpty == false ){
            getPrincipleAmount()
        }
      else  if (principle_amount.text?.isEmpty == false && interest.text?.isEmpty == true && future_value.text?.isEmpty == false && numberOf_years.text?.isEmpty == false ){
            getInterest()
        }
       else if (principle_amount.text?.isEmpty == false && interest.text?.isEmpty == false && future_value.text?.isEmpty == true && numberOf_years.text?.isEmpty == false ){
            getFutureAmount()
        }
       else if (principle_amount.text?.isEmpty == false && interest.text?.isEmpty == false && future_value.text?.isEmpty == false && numberOf_years.text?.isEmpty == true ){
            getDuration()
        }
       else if (principle_amount.text?.isEmpty == false && interest.text?.isEmpty == false && future_value.text?.isEmpty == false && numberOf_years.text?.isEmpty == false ){
            let alert = UIAlertController(title: "saving Section", message: "Plase clear one field ", preferredStyle: UIAlertController.Style.alert)
            // add an action (button)
            self.present(alert, animated: true, completion: nil)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        }
        else {
             let alert = UIAlertController(title: "saving Section", message: "Plase fill all the fields except one ", preferredStyle: UIAlertController.Style.alert)
             // add an action (button)
             self.present(alert, animated: true, completion: nil)
             alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
         }

    }
    
    func getPrincipleAmount(){
        
        guard principle_amount.text != nil else { return }
        guard let interestAmount = interest.text else { return }
        guard let futureAmount = future_value.text else { return }
        guard let numberOfYears = numberOf_years.text else { return }
        
        let FV = Double(futureAmount)!
        let l = Double(interestAmount)!
        let t = Double(numberOfYears)!
        let PV = round(FV / (1 + ((l * t) / 100 )))
        
        principle_amount.text = String(PV)
        
        print(PV)

    }
    func getInterest() {
        
        guard let principleAmount = principle_amount.text else { return }
        guard interest.text != nil else { return }
        guard let futureAmount = future_value.text else { return }
        guard let numberOfYears = numberOf_years.text else { return }
        
        let FV = Double(futureAmount)!
        let PV = Double(principleAmount)!
        let t = Double(numberOfYears)!
        let l = round(((FV / PV) - 1) * ( 100 / t) * 100 )
        
        
        interest.text = String(l / 100)
        
        print("interest")
    }
    func getFutureAmount() {
        guard let principleAmount = principle_amount.text else { return }
        guard let interestAmount = interest.text else { return }
        guard future_value.text != nil else { return }
        guard let numberOfYears = numberOf_years.text else { return }
        
        let l = Double(interestAmount)!
        let PV = Double(principleAmount)!
        let t = Double(numberOfYears)!
        let FV = round(PV * (1 + (l * t)/100))
        
        future_value.text = String(FV)
        print("Future")
    }
    
    func getDuration() {
        guard let principleAmount = principle_amount.text else { return }
        guard let interestAmount = interest.text else { return }
        guard let futureAmount = future_value.text else { return }
        guard numberOf_years.text != nil else { return }
        
        let l = Double(interestAmount)!
        let PV = Double(principleAmount)!
        let FV = Double(futureAmount)!
        let t = round(((FV / PV) - 1) * ( 100 / l) )
        
        numberOf_years.text = String(t)
        print("Duration")
    }
    @IBAction func calculate(_ sender: Any) {
   
checkFunction()
    }
}
