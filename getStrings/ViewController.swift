//
//  ViewController.swift
//  getStrings
//
//  Created by Mauricio Figueroa on 9/8/17.
//  Copyright © 2017 Mauricio Figueroa. All rights reserved.
//
//limpiar

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var selectBtn: UIButton!
    @IBOutlet weak var insertBtn: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var updateBtn: UIButton!
    
    @IBOutlet weak var insertTextField: UITextField!
    @IBOutlet weak var deleteTextField: UITextField!
    @IBOutlet weak var updateTextFieldCurrent: UITextField!
    @IBOutlet weak var updateTextFieldNew: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectBtnClicked(_ sender: Any) {
        ABC2.select(uri:"http://localhost:8888/select.php") { stringsArray in
            print(stringsArray)
        }//end select
    }//end selectBtnClicked
    
    @IBAction func insertBtnClicked(_ sender: Any) {
        ABC2.insert(uri: "http://localhost:8888/insert.php", parameter: insertTextField.text!)
    }//end insertBtnClicked
    
    @IBAction func deleteBtnClicked(_ sender: Any) {
        ABC2.delete(uri: "http://localhost:8888/delete.php", parameter: deleteTextField.text!)
    }//end deleteBtnClicked
    
    @IBAction func updateBtnClicked(_ sender: Any) {
        ABC2.update(uri:"http://localhost:8888/update.php", parameter1: updateTextFieldCurrent.text!, parameter2: updateTextFieldNew.text!)
    }//end updateBtnClicked
}

