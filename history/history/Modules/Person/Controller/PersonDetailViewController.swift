//
//  PersonDetailViewController.swift
//  history
//
//  Created by cuongdd on 20/04/2022.
//

import UIKit

class PersonDetailViewController: BaseViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    var person: PersonModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = person?.name
        addBackButton()
        loadFile()
        
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
        textView.font = UIFont(name: "Menlo-Regular", size: 20)
    }
    
    func loadFile() {
        guard let fileName = person?.rtfFile else { return }
        if let rtfPath = Bundle.main.url(forResource: fileName, withExtension: "rtf") {
            do {
                let attributedStringWithRtf: NSAttributedString = try NSAttributedString(url: rtfPath, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.rtf], documentAttributes: nil)
                textView.attributedText = attributedStringWithRtf
            } catch let error {
                print("Got an error \(error)")
            }
        }
    }
}
