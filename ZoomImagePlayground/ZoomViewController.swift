//
//  ZoomViewController.swift
//  ZoomImagePlayground
//
//  Created by Laura Evans on 9/3/17.
//  Copyright © 2017 Laura Evans. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    var scrollView: UIScrollView = UIScrollView()
    var imageViewZoomed: UIImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setUpImageZoomView()
    }
    
    func setUpImageZoomView() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        imageViewZoomed.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor.black
        scrollView.isHidden = true
        scrollView.maximumZoomScale = 5
        scrollView.delegate = self
        view.addSubview(scrollView)
    
        imageViewZoomed.image = imageView.image
        scrollView.addSubview(imageViewZoomed)
        imageViewZoomed.contentMode = .scaleAspectFit
        
        // scrollview constraints
        let scrollLeading = scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let scrollTrailing = scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let scrollTop = scrollView.topAnchor.constraint(equalTo: view.topAnchor)
        let scrollBottom = scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        NSLayoutConstraint.activate([scrollLeading, scrollTrailing, scrollTop, scrollBottom])
        
        // image view constraints
        
        let imageLeading = imageViewZoomed.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor)
        let imageTrailing = imageViewZoomed.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        let imageTop = imageViewZoomed.topAnchor.constraint(equalTo: scrollView.topAnchor)
        let imageBottom = imageViewZoomed.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        let imageCenterX = imageViewZoomed.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        let imageCenterY = imageViewZoomed.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        NSLayoutConstraint.activate([imageLeading, imageTrailing, imageTop, imageBottom, imageCenterX, imageCenterY])
    }
    
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        print("image tapped")
        scrollView.isHidden = false
        
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageViewZoomed
    }
    
    
}
