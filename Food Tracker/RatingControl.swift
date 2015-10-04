//
//  RatingControl.swift
//  Food Tracker
//
//  Created by Mike Gilroy on 24/09/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    // MARK: Properties
    
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    var ratingButtons = [UIButton]()
    var spacing = 5
    var stars = 5
    

    // MARK: Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        for _ in 0..<stars {
            let button = UIButton()
            
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            
            // make sure that the image doesn’t show an additional highlight during the state change.
            button.adjustsImageWhenHighlighted = false
            
            
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            addSubview(button)
            ratingButtons += [button]
            
        }
    }

    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize + spacing) * stars
        
        return CGSize(width: width, height: buttonSize)
    }
    
    
    override func layoutSubviews() {
        
        var buttonFrame = CGRect(x: 0, y: 0, width: 44, height: 44)
        
        // Set the button's width and height to a square the size of the frame's height.
        let buttonSize = Int(frame.size.height)
        
        // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + 5))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionStates()
    }
    
    
    // MARK: Button action
    
    func ratingButtonTapped(button: UIButton) {
        rating = ratingButtons.indexOf(button)! + 1
        updateButtonSelectionStates()
    }
    
    
    func updateButtonSelectionStates() {
        
        for (index, button) in ratingButtons.enumerate() {
            
            // If the index of a button is less than the rating, that button should be selected. NOTE: Right hand side either true/false
            button.selected = index < rating
        }
    }
}
