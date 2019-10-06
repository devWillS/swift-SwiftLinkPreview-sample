//
//  ViewController.swift
//  stv-news-poster
//
//  Created by devWill on 2019/10/06.
//  Copyright © 2019 devWill. All rights reserved.
//

import UIKit
import SwiftLinkPreview
import Nuke

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let slp = SwiftLinkPreview(session: URLSession.shared,
        workQueue: SwiftLinkPreview.defaultWorkQueue,
        responseQueue: DispatchQueue.main,
            cache: DisabledCache.instance)
        
        slp.preview("https://www.apple.com/jp/",
        onSuccess: { result in
            print("\(result)")
            self.descriptionLabel.text = result.description ?? ""
            if let url = result.image {
                Nuke.loadImage(with: URL(string: url)!, into: self.imageView)
            }
        },
        onError: { error in print("\(error)")})
    }


}

