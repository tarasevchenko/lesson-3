//
//  ViewController.swift
//  lesson 3
//
//  Created by Тарас Евченко on 28.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            let bottomOffset = CGPoint(x: 0, y: self.scrollView.contentSize.height - self.scrollView.bounds.height + self.scrollView.contentInset.bottom)
            self.scrollView.setContentOffset(bottomOffset, animated: true)
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6, execute: {
            self.scrollView.setContentOffset(.zero, animated: true)
        })
    }
    
    
}

