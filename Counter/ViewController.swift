//
//  ViewController.swift
//  Counter
//
//  Created by Александра Гайкова on 5.01.25.
//

import UIKit
import Foundation

class ViewController: UIViewController {
   
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var history: UITextView!
    
    func scroll() {
        history.scrollRangeToVisible(history.selectedRange)
    }
    
    override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)

        history.scrollRangeToVisible(NSMakeRange(16, 480))
    }
    
    func dateAndTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
       let dateString = dateFormatter.string(from: Date())
        return dateString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        history.isScrollEnabled = true
        counter.text = "0"
        // Do any additional setup after loading the view.
    }
    private var a = 0
    
    @IBAction func plusOne(_ sender: Any) {
        a += 1
        counter.text = "Значение счетчика: \(a)"
        history.text += "\n\(dateAndTime()): Значение изменено на +1"
        scroll()
    }
    
    @IBAction func minusOne(_ sender: Any) {
        if a != 0 {
            a -= 1
            history.text += "\n\(dateAndTime()): Значение изменено на -1"
            counter.text = "Значение счетчика: \(a)"
            scroll()
        }
    }
    
    @IBAction func zeroingOut(_ sender: Any) {
        a = 0
        counter.text = "0"
        history.text += "\n\(dateAndTime()): Значение сброшено"
        scroll()
    }
    
}
