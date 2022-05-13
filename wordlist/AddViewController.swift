//
//  AddViewController.swift
//  wordlist
//
//  Created by SayukiYamada on 2022/05/13.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var englishTextFeild:UITextField!
    @IBOutlet var japaneseTextFeild:UITextField!
    
    var wordArray:[Dictionary<String,String>] = []
    let saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        if saveData.array(forKey: "WORD") != nil{
            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String,String>]
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveWord(){
        let wordDictionary = ["english":englishTextFeild.text!,"japanese":japaneseTextFeild.text!]
       
        wordArray.append(wordDictionary)
        saveData.set(wordArray, forKey: "WORD")
                
        let alert = UIAlertController(
            title: "保存完了",
            message: "単語の登録が完了しました",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        ))
                
        present(alert, animated: true, completion: nil)
        englishTextFeild.text = ""
        japaneseTextFeild.text = ""
                
    }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


