//
//  ViewController.swift
//  VirtualBank
//
//  Created by Conner Vieira on 7/2/19.
//  Copyright © 2019 V0LT. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var User1Cash = 0.00;
    var User2Cash = 0.00;
    var User3Cash = 0.00;
    var User4Cash = 0.00;
    
    @IBOutlet weak var User1CashDisplay: NSTextField!
    @IBOutlet weak var User2CashDisplay: NSTextField!
    @IBOutlet weak var User3CashDisplay: NSTextField!
    @IBOutlet weak var User4CashDisplay: NSTextField!
    
    @IBOutlet weak var User1Input: NSTextField!
    @IBOutlet weak var User2Input: NSTextField!
    @IBOutlet weak var User3Input: NSTextField!
    @IBOutlet weak var User4Input: NSTextField!
    
    @IBOutlet weak var User1Modification: NSTextField!
    @IBOutlet weak var User2Modification: NSTextField!
    @IBOutlet weak var User3Modification: NSTextField!
    @IBOutlet weak var User4Modification: NSTextField!
    
    var defaults = UserDefaults.standard;

    override func viewDidLoad() {
        super.viewDidLoad()

        //Load all initial accounts from storage variables, and format them appropriately
        User1CashDisplay.stringValue = "$" + String(User1Cash);
        User2CashDisplay.stringValue = "$" + String(User2Cash);
        User3CashDisplay.stringValue = "$" + String(User3Cash);
        User4CashDisplay.stringValue = "$" + String(User4Cash);
    }
    
    
    @IBAction func Plus10(_ sender: Any) { // Define the function to add $10 to the first user's account
        User1Cash = User1Cash + 10.0;
        User1CashDisplay.stringValue = "$" + String(round(User1Cash*100)/100);
    }
    @IBAction func Plus1(_ sender: Any) { // Define the function to add $1 to the first user's account
        User1Cash = User1Cash + 1.0;
        User1CashDisplay.stringValue = "$" + String(round(User1Cash*100)/100);
    }
    @IBAction func Plus_1(_ sender: Any) { // Define the function to add $0.10 to the first user's account
        User1Cash = User1Cash + 0.1;
        User1CashDisplay.stringValue = "$" + String(round(User1Cash*100)/100);
    }
    @IBAction func Plus_01(_ sender: Any) { // Define the function to add $0.01 to the first user's account
        User1Cash = User1Cash + 0.01;
        User1CashDisplay.stringValue = "$" + String(round(User1Cash*100)/100);
    }
    
    
    @IBAction func Minus10(_ sender: Any) { // Define the function to take $10 to the first user's account
        User1Cash = User1Cash - 10.0;
        User1CashDisplay.stringValue = "$" + String(round(User1Cash*100)/100);
    }
    @IBAction func Minus1(_ sender: Any) { // Define the function to take $1 to the first user's account
        User1Cash = User1Cash - 1.0;
        User1CashDisplay.stringValue = "$" + String(round(User1Cash*100)/100);
    }
    @IBAction func Minus_1(_ sender: Any) { // Define the function to take $0.10 to the first user's account
        User1Cash = User1Cash - 0.1;
        User1CashDisplay.stringValue = "$" + String(round(User1Cash*100)/100);
    }
    @IBAction func Minus_01(_ sender: Any) { // Define the function to take $0.01 to the first user's account
        User1Cash = User1Cash - 0.01;
        User1CashDisplay.stringValue = "$" + String(round(User1Cash*100)/100);
    }
    
    
    // Load existing bank details to memory
    @IBAction func Load(_ sender: Any) {
        User1Cash = defaults.double(forKey: "User1Cash");
        User2Cash = defaults.double(forKey: "User2Cash");
        User3Cash = defaults.double(forKey: "User3Cash");
        User4Cash = defaults.double(forKey: "User4Cash");
        
        User1CashDisplay.stringValue = "$" + String(round(User1Cash*100)/100);
        User2CashDisplay.stringValue = "$" + String(round(User2Cash*100)/100);
        User3CashDisplay.stringValue = "$" + String(round(User3Cash*100)/100);
        User4CashDisplay.stringValue = "$" + String(round(User4Cash*100)/100);
        
    }
    
    
    // Save current bank details to disk
    @IBAction func Save(_ sender: Any) {
        User1Cash = round(User1Cash*100)/100;
        User2Cash = round(User2Cash*100)/100;
        User3Cash = round(User3Cash*100)/100;
        User4Cash = round(User4Cash*100)/100;
        
        defaults.register(defaults: ["User1Cash" : 0.00]);
        defaults.set(User1Cash, forKey: "User1Cash")
        
        defaults.register(defaults: ["User2Cash" : 0.00]);
        defaults.set(User2Cash, forKey: "User2Cash")
        
        defaults.register(defaults: ["User3Cash" : 0.00]);
        defaults.set(User3Cash, forKey: "User3Cash")
        
        defaults.register(defaults: ["User4Cash" : 0.00]);
        defaults.set(User4Cash, forKey: "User4Cash")
    }
    
    
    
    // User 1 transactions
    @IBAction func User1ToUser2(_ sender: Any) {
        if (User1Cash >= round(User1Input.doubleValue*100)/100 && User1Input.doubleValue >= 0.0) {
            User1Cash = User1Cash - round(User1Input.doubleValue*100)/100;
            User2Cash = User2Cash + round(User1Input.doubleValue*100)/100;
        } else {
            var alert:NSAlert = NSAlert();
            alert.messageText = "Error: Transaction not completed.";
            alert.informativeText = "The transaction was not completed. This could be because you entered a negative value, or you don't have sufficient funds.";
            alert.runModal();
        }
        User1CashDisplay.stringValue = "$" + String(User1Cash);
        User2CashDisplay.stringValue = "$" + String(User2Cash);
    }
    @IBAction func User1ToUser3(_ sender: Any) {
        if (User1Cash >= round(User1Input.doubleValue*100)/100 && User1Input.doubleValue >= 0.0) {
            User1Cash = User1Cash - round(User1Input.doubleValue*100)/100;
            User3Cash = User3Cash + round(User1Input.doubleValue*100)/100;
        } else {
            var alert:NSAlert = NSAlert();
            alert.messageText = "Error: Transaction not completed.";
            alert.informativeText = "The transaction was not completed. This could be because you entered a negative value, or you don't have sufficient funds.";
            alert.runModal();
        }
        User1CashDisplay.stringValue = "$" + String(User1Cash);
        User3CashDisplay.stringValue = "$" + String(User3Cash);
    }
    @IBAction func User1ToUser4(_ sender: Any) {
        if (User1Cash >= round(User1Input.doubleValue*100)/100 && User1Input.doubleValue >= 0.0) {
            User1Cash = User1Cash - round(User1Input.doubleValue*100)/100;
            User4Cash = User4Cash + round(User1Input.doubleValue*100)/100;
        } else {
            var alert:NSAlert = NSAlert();
            alert.messageText = "Error: Transaction not completed.";
            alert.informativeText = "The transaction was not completed. This could be because you entered a negative value, or you don't have sufficient funds.";
            alert.runModal();
        }
        User1CashDisplay.stringValue = "$" + String(User1Cash);
        User4CashDisplay.stringValue = "$" + String(User4Cash);
    }
    
    
    // User 2 transactions
    @IBAction func User2ToUser1(_ sender: Any) {
        if (User2Cash >= round(User2Input.doubleValue*100)/100 && User2Input.doubleValue >= 0.0) {
            User2Cash = User2Cash - round(User2Input.doubleValue*100)/100;
            User1Cash = User1Cash + round(User2Input.doubleValue*100)/100;
        } else {
            var alert:NSAlert = NSAlert();
            alert.messageText = "Error: Transaction not completed.";
            alert.informativeText = "The transaction was not completed. This could be because you entered a negative value, or you don't have sufficient funds.";
            alert.runModal();
        }
        User2CashDisplay.stringValue = "$" + String(User2Cash);
        User1CashDisplay.stringValue = "$" + String(User1Cash);
    }
    @IBAction func User2ToUser3(_ sender: Any) {
        if (User2Cash >= round(User2Input.doubleValue*100)/100 && User2Input.doubleValue >= 0.0) {
            User2Cash = User2Cash - round(User2Input.doubleValue*100)/100;
            User3Cash = User3Cash + round(User2Input.doubleValue*100)/100;
        } else {
            var alert:NSAlert = NSAlert();
            alert.messageText = "Error: Transaction not completed.";
            alert.informativeText = "The transaction was not completed. This could be because you entered a negative value, or you don't have sufficient funds.";
            alert.runModal();
        }
        User2CashDisplay.stringValue = "$" + String(User2Cash);
        User3CashDisplay.stringValue = "$" + String(User3Cash);
    }
    @IBAction func User2ToUser4(_ sender: Any) {
        if (User2Cash >= round(User2Input.doubleValue*100)/100 && User2Input.doubleValue >= 0.0) {
            User2Cash = User2Cash - round(User2Input.doubleValue*100)/100;
            User4Cash = User4Cash + round(User2Input.doubleValue*100)/100;
        } else {
            var alert:NSAlert = NSAlert();
            alert.messageText = "Error: Transaction not completed.";
            alert.informativeText = "The transaction was not completed. This could be because you entered a negative value, or you don't have sufficient funds.";
            alert.runModal();
        }
        User2CashDisplay.stringValue = "$" + String(User2Cash);
        User4CashDisplay.stringValue = "$" + String(User4Cash);
    }
    
    
    // User 3 transactions
    @IBAction func User3ToUser1(_ sender: Any) {
        if (User3Cash >= round(User3Input.doubleValue*100)/100 && User3Input.doubleValue >= 0.0) {
            User3Cash = User3Cash - round(User3Input.doubleValue*100)/100;
            User1Cash = User1Cash + round(User3Input.doubleValue*100)/100;
        } else {
            var alert:NSAlert = NSAlert();
            alert.messageText = "Error: Transaction not completed.";
            alert.informativeText = "The transaction was not completed. This could be because you entered a negative value, or you don't have sufficient funds.";
            alert.runModal();
        }
        User3CashDisplay.stringValue = "$" + String(User3Cash);
        User1CashDisplay.stringValue = "$" + String(User1Cash);
    }
    @IBAction func User3ToUser2(_ sender: Any) {
        if (User3Cash >= round(User3Input.doubleValue*100)/100 && User3Input.doubleValue >= 0.0) {
            User3Cash = User3Cash - round(User3Input.doubleValue*100)/100;
            User2Cash = User2Cash + round(User3Input.doubleValue*100)/100;
        } else {
            var alert:NSAlert = NSAlert();
            alert.messageText = "Error: Transaction not completed.";
            alert.informativeText = "The transaction was not completed. This could be because you entered a negative value, or you don't have sufficient funds.";
            alert.runModal();
        }
        User3CashDisplay.stringValue = "$" + String(User3Cash);
        User2CashDisplay.stringValue = "$" + String(User2Cash);
    }
    @IBAction func User3ToUser4(_ sender: Any) {
        if (User3Cash >= round(User3Input.doubleValue*100)/100 && User3Input.doubleValue >= 0.0) {
            User3Cash = User3Cash - round(User3Input.doubleValue*100)/100;
            User4Cash = User4Cash + round(User3Input.doubleValue*100)/100;
        } else {
            var alert:NSAlert = NSAlert();
            alert.messageText = "Error: Transaction not completed.";
            alert.informativeText = "The transaction was not completed. This could be because you entered a negative value, or you don't have sufficient funds.";
            alert.runModal();
        }
        User3CashDisplay.stringValue = "$" + String(User3Cash);
        User4CashDisplay.stringValue = "$" + String(User4Cash);
    }
    
    
    // User 4 transactions
    @IBAction func User4ToUser1(_ sender: Any) {
        if (User4Cash >= round(User4Input.doubleValue*100)/100 && User4Input.doubleValue >= 0.0) {
            User4Cash = User4Cash - round(User4Input.doubleValue*100)/100;
            User1Cash = User1Cash + round(User4Input.doubleValue*100)/100;
        } else {
            var alert:NSAlert = NSAlert();
            alert.messageText = "Error: Transaction not completed.";
            alert.informativeText = "The transaction was not completed. This could be because you entered a negative value, or you don't have sufficient funds.";
            alert.runModal();
        }
        User4CashDisplay.stringValue = "$" + String(User4Cash);
        User1CashDisplay.stringValue = "$" + String(User1Cash);
    }
    @IBAction func User4ToUser2(_ sender: Any) {
        if (User4Cash >= round(User4Input.doubleValue*100)/100 && User4Input.doubleValue >= 0.0) {
            User4Cash = User4Cash - round(User4Input.doubleValue*100)/100;
            User2Cash = User2Cash + round(User4Input.doubleValue*100)/100;
        } else {
            var alert:NSAlert = NSAlert();
            alert.messageText = "Error: Transaction not completed.";
            alert.informativeText = "The transaction was not completed. This could be because you entered a negative value, or you don't have sufficient funds.";
            alert.runModal();
        }
        User4CashDisplay.stringValue = "$" + String(User4Cash);
        User2CashDisplay.stringValue = "$" + String(User2Cash);
    }
    @IBAction func User4ToUser3(_ sender: Any) {
        if (User4Cash >= round(User4Input.doubleValue*100)/100 && User4Input.doubleValue >= 0.0) {
            User4Cash = User4Cash - round(User4Input.doubleValue*100)/100;
            User3Cash = User3Cash + round(User4Input.doubleValue*100)/100;
        } else {
            var alert:NSAlert = NSAlert();
            alert.messageText = "Error: Transaction not completed.";
            alert.informativeText = "The transaction was not completed. This could be because you entered a negative value, or you don't have sufficient funds.";
            alert.runModal();
        }
        User4CashDisplay.stringValue = "$" + String(User4Cash);
        User3CashDisplay.stringValue = "$" + String(User3Cash);
    }
    
    
    
    // WIP - Add money to each user seperately
    @IBAction func ExecuteStockChanges(_ sender: Any) {
        User1Cash = User1Cash + User1Modification.doubleValue;
        User2Cash = User2Cash + User2Modification.doubleValue;
        User3Cash = User3Cash + User3Modification.doubleValue;
        User4Cash = User4Cash + User4Modification.doubleValue;
        
        User1CashDisplay.stringValue = "$" + String(User1Cash);
        User2CashDisplay.stringValue = "$" + String(User2Cash);
        User3CashDisplay.stringValue = "$" + String(User3Cash);
        User4CashDisplay.stringValue = "$" + String(User4Cash);
    }
    
}

