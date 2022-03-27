//  CompoundViewController.swift
//  Financial Calculator
//
//  Created by Janitha Katukenda on 2022-03-26.
//

import UIKit

class CompoundViewController: UIViewController {

    var switchToYears = true
    @IBOutlet var switchYear: UISwitch!
    @IBOutlet weak var principle_amount: UITextField!
    @IBOutlet weak var interest: UITextField!
    @IBOutlet weak var frequescyPerTime: UITextField!
  
    @IBOutlet weak var NumberOf_years: UITextField!
    @IBOutlet weak var future_value: UITextField!
    @IBOutlet weak var month_lbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //dismiss keaboard when touch view
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }

    func checkTheFunction(){
    
        if frequescyPerTime.text?.isEmpty == true {
            let alert = UIAlertController(title: "Compound Section", message: "Frequency Can't be empty", preferredStyle: UIAlertController.Style.alert)
            // add an action (button)
            self.present(alert, animated: true, completion: nil)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        }
        else{
            
            
            if (principle_amount.text?.isEmpty == true && interest.text?.isEmpty == false && NumberOf_years.text?.isEmpty ==  false && future_value.text?.isEmpty == false) {
                getPrincipleValue()
            }
           else if (principle_amount.text?.isEmpty == false && interest.text?.isEmpty == true && NumberOf_years.text?.isEmpty ==  false && future_value.text?.isEmpty == false) {
                getInterest()
            }
            else if (principle_amount.text?.isEmpty == false && interest.text?.isEmpty == false && NumberOf_years.text?.isEmpty ==  true && future_value.text?.isEmpty == false) {
                 getNumberOfMonths()
             }
            else if (principle_amount.text?.isEmpty == false && interest.text?.isEmpty == false && NumberOf_years.text?.isEmpty ==  false && future_value.text?.isEmpty == true) {
                 getFutureValue()
             }
            else
                if (
                    
                    (principle_amount.text?.isEmpty == true && interest.text?.isEmpty == true) ||
                    (NumberOf_years.text?.isEmpty ==  true && future_value.text?.isEmpty == true) ||
                    (principle_amount.text?.isEmpty == true && NumberOf_years.text?.isEmpty == true) ||
                    (NumberOf_years.text?.isEmpty ==  true && interest.text?.isEmpty == true) ||
                    (principle_amount.text?.isEmpty == true && future_value.text?.isEmpty == true) ||
                    (interest.text?.isEmpty ==  true && future_value.text?.isEmpty == true)
                
                ) {
                    let alert = UIAlertController(title: "Compound Section", message: "Plase fill all the feild except one ", preferredStyle: UIAlertController.Style.alert)
                    // add an action (button)
                    self.present(alert, animated: true, completion: nil)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
             }
            
            else {
                let alert = UIAlertController(title: "Compound Section", message: "Plase clear one feild ", preferredStyle: UIAlertController.Style.alert)
                // add an action (button)
                self.present(alert, animated: true, completion: nil)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            }
        }
    }
    
    func getPrincipleValue(){
        guard principle_amount.text != nil else { return }
        guard let interestAmount = interest.text else { return }
        guard let frequency = frequescyPerTime.text else { return }
        guard let NumberOfYears = NumberOf_years.text else { return }
        guard let futureValue = future_value.text else { return }
        
      //  var PA = Double(principleAmount)!
        let i = Double(interestAmount)!
        var f = Double(frequency)!
        var NY = Double(NumberOfYears)!
        let FV = Double(futureValue)!
        if self.switchToYears {
            NY = NY * 1

        }
        else{
            NY = NY / 12
            f = f * 12
           
        }
        
        let PA = round(FV / (pow((1 + ( i / (f * 100))), (f * NY))))
        
        principle_amount.text = String(PA)
       
    }
    func getInterest(){
        guard let principleAmount = principle_amount.text else { return }
        guard interest.text != nil else { return }
        guard let frequency = frequescyPerTime.text else { return }
        guard let NumberOfYears = NumberOf_years.text else { return }
        guard let futureValue = future_value.text else { return }
        
        let PA = Double(principleAmount)!
       // var i = Double(interestAmount)!
        var f = Double(frequency)!
        var NY = Double(NumberOfYears)!
        let FV = Double(futureValue)!
        
        if self.switchToYears {
            NY = NY * 1

        }
        else{
            NY = NY / 12
            f = f * 12
           
        }
        
        let r = round((f * ( pow((FV / PA), (1 / (f  * NY ))) - 1)) * 100 * 100)
        
        interest.text = String(r / 100)
    }
 
    func getNumberOfMonths(){
        guard let principleAmount = principle_amount.text else { return }
        guard let interestAmount = interest.text else { return }
        guard let frequency = frequescyPerTime.text else { return }
        guard NumberOf_years.text != nil else { return }
        guard let futureValue = future_value.text else { return }
        
        let PA = Double(principleAmount)!
        let i = Double(interestAmount)!
        var f = Double(frequency)!
       // var NY = Double(NumberOfYears)!
        let FV = Double(futureValue)!
        
      
        
        if self.switchToYears {
            f = f * 1

        }
        else{
          
            f = f * 12
           
        }
        
        let NY = round(log(FV / PA) / (f * log(1 + (i / (100 * f)))))
        if self.switchToYears {
            NumberOf_years.text = String(NY)
        }
        else{
            NumberOf_years.text = String(NY * 12)
        }
        
        
        
    }
    func getFutureValue(){
        
        guard let principleAmount = principle_amount.text else { return }
        guard let interestAmount = interest.text else { return }
        guard let frequency = frequescyPerTime.text else { return }
        guard let NumberOfYears = NumberOf_years.text else { return }
        guard future_value.text != nil else { return }
        
        let PA = Double(principleAmount)!
        let i = Double(interestAmount)!
        var f = Double(frequency)!
        var NY = Double(NumberOfYears)!
        //var FV = Double(NumberOfMonths)!
        
        if self.switchToYears {
            NY = NY * 1

        }
        else{
            NY = NY / 12
            f = f * 12
           
        }
       
        let   FV = round(PA * (pow((1 + ( i / (f * 100))), (f * NY))))

          future_value.text = String(FV)
        
        // var  FV2 = round(MC * ((pow((1 + (i / (NM * 100))), NM) - 1) / (i / (NM * 100)))) for monthlly adition
        
    }

    @IBAction func switchToYears(_ sender: UISwitch) {
        if sender.isOn {
            self.switchToYears = true
            month_lbl.text = "Number of years"
        }
        else{
            self.switchToYears = false
            month_lbl.text = "Number of Months"
        }
    }
    
    @IBAction func calculate(_ sender: Any) {
        checkTheFunction()
    }
}
