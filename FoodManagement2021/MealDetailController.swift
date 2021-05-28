//
//  ViewController.swift
//  FoodManagement2021
//
//  Created by CNTT on 4/16/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit

class MealDetailController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK: properties
    
    @IBOutlet weak var editMealName: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    var meal:Meal?
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var btnSave: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editMealName.delegate = self
    }

    //MARK: TextField's Delegated Functions
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let mealName = textField.text {
            navigationItem.title = mealName
         }
    }
    //MARK: Image processing
    @IBAction func imageProcessing(_ sender: UITapGestureRecognizer) {
        // Hide the keybord
        editMealName.resignFirstResponder()
        
        // Get image from photo library
        let imagePicker = UIImagePickerController()
        
        // Config the image source
        imagePicker.sourceType = .photoLibrary
        
        // Delegation
        imagePicker.delegate = self
        
        // Show the image picker
        present(imagePicker, animated: true, completion: nil)

    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageView.image = selectedImage
            //Hide the image Picker controller
            dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: navigation
    
    @IBAction func cencel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let button = sender as? UIBarButtonItem, button === btnSave{
            let mealName = editMealName.text ?? ""
            let mealImage = imageView.image
            let ratingValue = ratingControl.ratingValue
            meal = Meal(mealName: mealName, mealImage: mealImage, mealRatingValue: ratingValue)
        }
      
    }
    
}
