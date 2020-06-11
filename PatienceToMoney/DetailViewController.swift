//
//  DetailViewController.swift
//  PatienceToMoney
//
//  Created by 松山響也 on 2020/06/10.
//  Copyright © 2020 Kyoya Matsuyama. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

protocol DetailViewControllerDelegate{
    func didAdded(sumMoney:Int)
}

class DetailViewController: UIViewController {

    var delegate:DetailViewControllerDelegate? = nil
    var titleString = String()
    var moneyString = String()
    var descriptionString = String()
    var sumMoneyString = String()
    var documentIdString = String()
    @IBOutlet weak var sumMoneyLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var sumMoney: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = titleString
        moneyLabel.text = moneyString
        descriptionLabel.text = descriptionString
        sumMoneyLabel.text = sumMoneyString

        // Do any additional setup after loading the view.
    }
    
    @IBAction func patient(_ sender: Any) {
        var resultMoney = Int(sumMoneyString)!
        
        var patientMoney = Int(moneyString)
        
        resultMoney = resultMoney + patientMoney!
        
        sumMoneyLabel.text = String(resultMoney)
        
        self.delegate?.didAdded(sumMoney: resultMoney)
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func toEdit(_ sender: Any) {
        
        performSegue(withIdentifier:"toEdit" , sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editVC = segue.destination as! EditViewController
        editVC.titleString = titleString
        editVC.moneyString = moneyString
        editVC.descriptionString = descriptionString
        editVC.documentId = documentIdString
    }

    
    @IBAction func deletePatient(_ sender: Any) {
        let db = Firestore.firestore()
        let ref:DocumentReference? = nil
        print("DB入ります")
        db.collection("patients").document(documentIdString).delete(completion: { (error) in
            if error != nil {
                print(error)
                print("エラーが発生しました")
            }else{
                let indexVC = self.storyboard?.instantiateViewController(withIdentifier: "index") as! IndexViewController
                indexVC.modalPresentationStyle = .fullScreen
                self.present(indexVC, animated: true, completion: nil)
                
            }
        })
    }
    
}
