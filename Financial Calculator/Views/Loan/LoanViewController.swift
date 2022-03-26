//
//  LoanViewController.swift
//  Financial Calculator
//
//  Created by Janitha Katukenda on 2022-03-26.
//

import UIKit

class LoanViewController: UIViewController {

    @IBOutlet weak var loan_amount: UITextField!
    @IBOutlet weak var interest: UITextField!
    @IBOutlet weak var monthly_payment: UITextField!
    @IBOutlet weak var numberOf_paymnets: UITextField!
    @IBOutlet weak var worning_lbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //dismiss keaboard when touch view
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
        func checkFunction() {
            if (loan_amount.text?.isEmpty == true && interest.text?.isEmpty == false && monthly_payment.text?.isEmpty == false && numberOf_paymnets.text?.isEmpty == false) {
                getLoanAmount()
            }
           else if (loan_amount.text?.isEmpty == false && interest.text?.isEmpty == true && monthly_payment.text?.isEmpty == false && numberOf_paymnets.text?.isEmpty == false) {
                worning_lbl.text = "Plase Enter interest"
            }
           else if (loan_amount.text?.isEmpty == false && interest.text?.isEmpty == false && monthly_payment.text?.isEmpty == true && numberOf_paymnets.text?.isEmpty == false) {
                getmonthlyPayment()
            }
           else if (loan_amount.text?.isEmpty == false && interest.text?.isEmpty == false && monthly_payment.text?.isEmpty == false && numberOf_paymnets.text?.isEmpty == true) {
                getNumberOfpayments()
            }
           else if (loan_amount.text?.isEmpty == false && interest.text?.isEmpty == false && monthly_payment.text?.isEmpty == false && numberOf_paymnets.text?.isEmpty == false){
                            let alert = UIAlertController(title: "Loan Section", message: "Plase Clear One Field", preferredStyle: UIAlertController.Style.alert)
                            // add an action (button)
                            self.present(alert, animated: true, completion: nil)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            }
            else {
                let alert = UIAlertController(title: "Loan Section", message: "You Can Emplty Ony one field", preferredStyle: UIAlertController.Style.alert)
                // add an action (button)
                self.present(alert, animated: true, completion: nil)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            }

        }
    

   func getLoanAmount() {
        
       guard let loanAmount = loan_amount.text else { return }
       guard let interestAmount = interest.text else { return }
       guard let monthlyAmount = monthly_payment.text else { return }
       guard let numberOfPaymnets = numberOf_paymnets.text else { return }
       
       //var LA = Double(loanAmount)!
       var i = Double(interestAmount)!
       var MP = Double(monthlyAmount)!
       var NOP = Double(numberOfPaymnets)!
       
       
       var LA = round((MP / (i / 1200)) * (1 - (1 / pow(1 + (i/1200), NOP))))
       
       loan_amount.text = String(LA)
       
    }
    
    func getInterest(){
        guard let loanAmount = loan_amount.text else { return }
        guard let interestAmount = interest.text else { return }
        guard let monthlyAmount = monthly_payment.text else { return }
        guard let numberOfPaymnets = numberOf_paymnets.text else { return }
        
        var LA = Double(loanAmount)!
       // var i = Double(interestAmount)!
        var MP = Double(monthlyAmount)!
        var NOP = Double(numberOfPaymnets)!
        
        
        var i = round(log(8.0))
        
        interest.text = String(log(8.0))
    }
    
    func getmonthlyPayment(){
        guard let loanAmount = loan_amount.text else { return }
        guard let interestAmount = interest.text else { return }
        guard let monthlyAmount = monthly_payment.text else { return }
        guard let numberOfPaymnets = numberOf_paymnets.text else { return }
        
        var LA = Double(loanAmount)!
        var i = Double(interestAmount)!
        //var MP = Double(monthlyAmount)!
        var NOP = Double(numberOfPaymnets)!
        
        
        var MP = round((LA * (i / 1200)) / (1 - (1 / pow((1 + (i / 1200)), NOP))))
        
        monthly_payment.text = String(MP)
    }
    func getNumberOfpayments(){
        guard let loanAmount = loan_amount.text else { return }
        guard let interestAmount = interest.text else { return }
        guard let monthlyAmount = monthly_payment.text else { return }
        guard let numberOfPaymnets = numberOf_paymnets.text else { return }
        
        var LA = Double(loanAmount)!
        var i = Double(interestAmount)!
        var MP = Double(monthlyAmount)!
        //var NOP = Double(numberOfPaymnets)!
        
        
        var NOP = round(log(((MP)/(i / 1200)) / ((MP / (i / 1200)) - LA)) / log(1 + i / 1200))
        
        numberOf_paymnets.text = String(NOP)
    }
    
    @IBAction func checkFunction(_ sender: Any) {
        checkFunction()
        print("click")
    }
    
    
    
    
}
