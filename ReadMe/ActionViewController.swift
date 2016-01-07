//
//  ActionViewController.swift
//  ReadMe
//
//  Created by Parth Adroja on 1/7/16.
//  Copyright © 2016 Parth Adroja. All rights reserved.
//

import UIKit
import MobileCoreServices
import AVFoundation

class ActionViewController: UIViewController {

    @IBOutlet weak var IBtxtView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let item = self.extensionContext?.inputItems[0] as! NSExtensionItem
        let itemProvider = item.attachments![0] as! NSItemProvider
        
        if itemProvider.hasItemConformingToTypeIdentifier(kUTTypePlainText as String) {
            itemProvider.loadItemForTypeIdentifier(kUTTypePlainText as String, options: nil, completionHandler: { (stringItem, error) -> Void in
                if stringItem != nil {
                    NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                        self.IBtxtView.text = stringItem as! String
                        let synth = AVSpeechSynthesizer()
                        let utterance = AVSpeechUtterance(string: self.IBtxtView.text)
                        utterance.rate = 0.5
                        synth.speakUtterance(utterance)
                    })
                }
            })
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func done() {
        // Return any edited content to the host app.
        // This template doesn't do anything, so we just echo the passed in items.
        self.extensionContext!.completeRequestReturningItems(self.extensionContext!.inputItems, completionHandler: nil)
    }

}
