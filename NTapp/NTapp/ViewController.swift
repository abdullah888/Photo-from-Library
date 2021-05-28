//
//  ViewController.swift
//  NTapp
//
//  Created by abdullah FH  on 16/10/1442 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var ButtonOutLet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.ButtonOutLet.layer.cornerRadius = 12
    }
    
    
    @IBAction func ButtonAction(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        picker.modalPresentationStyle = .overFullScreen
        self.present(picker, animated: true, completion: nil)
    }
}
extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        ImageView.contentMode = .scaleAspectFit
        ImageView.contentMode = UIView.ContentMode.scaleAspectFill
        ImageView.layer.masksToBounds = false
        ImageView.image = image
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        dismiss(animated: true, completion: nil)
    }
}

