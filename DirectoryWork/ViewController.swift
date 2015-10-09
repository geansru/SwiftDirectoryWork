//
//  ViewController.swift
//  DirectoryWork
//
//  Created by Dmitriy Roytman on 09.10.15.
//  Copyright © 2015 Dmitriy Roytman. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    // MARK: Properties
    var fileManager: NSFileManager = NSFileManager.defaultManager()
    var docsDir: String?
    var dataFile: String?
    
    // MARK: @IBOutlet
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func save(sender: AnyObject) {
        textField.resignFirstResponder()
        if !textField.text!.isEmpty {
            let dataBuffer = (textField.text! as NSString).dataUsingEncoding(NSUTF8StringEncoding)
            fileManager.createFileAtPath(dataFile!, contents: dataBuffer, attributes: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textView.layer.cornerRadius = 5
        textView.layer.masksToBounds = true
        
        saveButton.layer.cornerRadius = 5
        saveButton.layer.masksToBounds = true
        helper()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func helper() {
        let dirPaths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        docsDir = dirPaths.first
        guard let dir = docsDir else { return }
//        log(dir)
        dataFile = dir.stringByAppendingPathComponent("datafile.dat")
        
        if fileManager.fileExistsAtPath(dataFile!) {
            let dataBuffer = fileManager.contentsAtPath(dataFile!)
            let str: String = NSString(data: dataBuffer!, encoding: NSUTF8StringEncoding) as! String
            log(str)
        }
    }
    
    func log(m: String) {
        textView.text = textView.text + m + "\n"
    }
}

