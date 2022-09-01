//
//  ViewControllerQuiz.swift
//  Genel Kultur APP Tasarim
//
//  Created by Furkan on 31.08.2022.
//

import UIKit
import CoreData

class ViewControllerQuiz: UIViewController {

    let context = appDel.persistentContainer.viewContext

    var quizList = [Soru]()
    var index = -1
    var answer = ""
    var trueCount = 0
    var falseCount = 0
    @IBOutlet weak var btnD: UIButton!
    @IBOutlet weak var btnC: UIButton!
    @IBOutlet weak var btnB: UIButton!
    @IBOutlet weak var btnA: UIButton!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblFalse: UILabel!
    @IBOutlet weak var lblTrue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readDB()
        nextQuiz()
    }
    
    func readDB() {
        do {
            quizList =  try context.fetch(Soru.fetchRequest())
        } catch  {
            print("Error")
        }
    }
    
    func nextQuiz(){
        if index < quizList.count-1 {
            index += 1
        }else{
            performSegue(withIdentifier: "goToRes", sender:nil)
        }
        setLabels()

    }
    
    func setLabels(){
        lblQuestion.text = quizList[index].soru
        btnA.setTitle(quizList[index].cvpA!.capitalized, for: .normal)
        btnB.setTitle(quizList[index].cvpB!.capitalized, for: .normal)
        btnC.setTitle(quizList[index].cvpC!.capitalized, for: .normal)
        btnD.setTitle(quizList[index].cvpD!.capitalized, for: .normal)
        answer = quizList[index].cevap!
        lblTrue.text = "Dogru: \(trueCount)"
        lblFalse.text = "Yanlış: \(falseCount)"
        print(quizList[index].cevap!)
    }
    
    func choosed(btn:Int){
        switch btn {
        case 1:
            if btnA.titleLabel?.text!.capitalized.trimmingCharacters(in: .whitespacesAndNewlines) == quizList[index].cevap?.capitalized.trimmingCharacters(in: .whitespacesAndNewlines) {
                trueCount += 1
            }
            else{
                falseCount += 1
            }
            nextQuiz()
            
        case 2:
            if btnB.titleLabel?.text!.capitalized.trimmingCharacters(in: .whitespacesAndNewlines) == quizList[index].cevap?.capitalized.trimmingCharacters(in: .whitespacesAndNewlines) {
                trueCount += 1
            }
            else{
                falseCount += 1
            }
            nextQuiz()
            
        case 3:
            if btnC.titleLabel?.text!.capitalized.trimmingCharacters(in: .whitespacesAndNewlines) == quizList[index].cevap?.capitalized.trimmingCharacters(in: .whitespacesAndNewlines) {
                trueCount += 1
            }
            else{
                falseCount += 1
            }
            nextQuiz()
        default:
            if btnD.titleLabel?.text!.capitalized.trimmingCharacters(in: .whitespacesAndNewlines)  == quizList[index].cevap?.capitalized.trimmingCharacters(in: .whitespacesAndNewlines) {
                trueCount += 1
            }
            else{
                falseCount += 1
            }
            nextQuiz()
        }
    }
    
   
    @IBAction func btnA(_ sender: Any) {
        choosed(btn: 1)
    }
    
    @IBAction func btnB(_ sender: Any) {
        choosed(btn: 2)
    }
    
    @IBAction func btnC(_ sender: Any) {
        choosed(btn: 3)
    }
    
    @IBAction func btnD(_ sender: Any) {
        choosed(btn: 4)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToRes"{
            let dest = segue.destination as! ViewControllerResult
            dest.trueData = trueCount
            dest.percentage = trueCount*100/quizList.count
        }
    }
     
}
