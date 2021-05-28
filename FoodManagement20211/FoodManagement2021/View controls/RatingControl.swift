//
//  RatingControl.swift
//  FoodManagement2021
//
//  Created by CNTT on 5/7/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    // MARK: Properties
    private var ratingButtons = [UIButton]()
    @IBInspectable var ratingValue:Int = 0 {
        didSet{
            updateRatingButtonState()
        }
    }
    @IBInspectable var startNumber:Int = 5 {
        didSet {
            setupRatingCotrol()
        }
    }
    @IBInspectable var starSize:CGSize = CGSize(width: 44.0, height: 44.0)

    // MARK: contructor
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupRatingCotrol()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupRatingCotrol()
    }
    
    // MARK: Define of setup rating control
    private func setupRatingCotrol(){
        // Load rating image
        let bundle = Bundle(for: type(of: self))
        let normal = UIImage(named: "Normal", in : bundle, compatibleWith: .none )
        let pressed = UIImage(named: "Pressed" , in : bundle, compatibleWith: .none)
        let selected = UIImage(named: "Selected", in : bundle, compatibleWith: .none)
        
        // Remove all old rating button
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        // Create rating button
        for _ in 0..<startNumber{
            let button = UIButton()
            button.setImage(normal, for: .normal)
            button.setImage(pressed, for: .highlighted)
            button.setImage(selected, for: .selected)
            
            // Setup button's properties
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = false
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = false
            
            // Add rating button's action
            button.addTarget(self, action: #selector(ratingButtonPressed(button:)), for: .touchUpInside)
            
            // Add the button to the stack view
            addArrangedSubview(button)
            
            // Add the button to the array to manage them
            ratingButtons.append(button)
        }
        updateRatingButtonState()
    }
    
    // MARK: Rating button's Action
    @objc private func ratingButtonPressed(button:UIButton){
        if let index = ratingButtons.firstIndex(of: button) {
            if ratingValue == index+1{
                ratingValue -= 1
            }
            else{
                ratingValue = index + 1
            }
        }
        updateRatingButtonState()
    }
    
    // MARK: Rating buttons state
    private func updateRatingButtonState(){
        for (i,button) in ratingButtons.enumerated() {
            button.isSelected = i < ratingValue
        }
    }
}
