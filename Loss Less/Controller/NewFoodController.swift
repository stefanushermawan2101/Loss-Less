//
//  NewFoodController.swift
//  Loss Less
//
//  Created by Stefanus Hermawan Sebastian on 10/04/22.
//

import UIKit
import UserNotifications

class NewFoodController: UITableViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var nameTextField: RoundedTextField! {
        didSet {
            nameTextField.tag = 1
            nameTextField.becomeFirstResponder()
            nameTextField.delegate = self
        }
    }
    
    @IBOutlet var locationTextField: RoundedTextField! {
        didSet {
            locationTextField.tag = 2
            locationTextField.delegate = self
        }
    }
    
    @IBOutlet var addedTextField: RoundedTextField! {
        didSet {
            addedTextField.tag = 3
            addedTextField.delegate = self
        }
    }
    
    func getNotificationSettings() {
      UNUserNotificationCenter.current().getNotificationSettings { settings in
          print("Notification settings: \(settings)")
          guard settings.authorizationStatus == .authorized else { return }
          DispatchQueue.main.async {
            UIApplication.shared.registerForRemoteNotifications()
          }
      }
    }
    
        
    @IBAction func doneButtonTap(_ sender: Any) {
        // Request Notification Settings
        UNUserNotificationCenter.current().getNotificationSettings { [self] (notificationSettings) in
              switch notificationSettings.authorizationStatus {
              case .notDetermined:
                  UNUserNotificationCenter.current()
                    .requestAuthorization(
                      options: [.alert, .sound, .badge]) { [weak self] granted, _ in
                      print("Permission granted: \(granted)")
                      guard granted else { return }
                      self?.getNotificationSettings()
                    }
              case .authorized:
                  // Schedule Local Notification
                  let center = UNUserNotificationCenter.current()

                  let content = UNMutableNotificationContent()
                  content.title = "Food Reminder"
                  content.body = "Jangan lupa dimakan bro!"
                  content.categoryIdentifier = "alarm"
                  content.userInfo = ["customData": "fizzbuzz"]
                  content.sound = UNNotificationSound.default
                  
                  var dateComponent = self.datePicker.calendar.dateComponents([.day, .hour, .minute], from: datepickerexp.date)
                  dateComponent.hour = 9
                  dateComponent.minute = 29
                      let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)

                      let notificationReq = UNNotificationRequest(identifier: "identifier", content: content, trigger: trigger)

                  let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                  center.add(request)
                  print(dateComponent)
              case .denied:
                  print("Application Not Allowed to Display Notifications")
              case .provisional:
                  print("Case Provisional")
              case .ephemeral:
                  print("Case Ephemeral")
              @unknown default:
                  print("Error Default")
              }
          }
    
    }
    
    let datePicker = UIDatePicker()
    let datepickerexp = UIDatePicker()
    
    func createDatePicker() {

        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        
        toolbar.setItems([doneBtn], animated: true)
        
        addedTextField.inputAccessoryView = toolbar
        
        addedTextField.inputView = datePicker
                
        datePicker.datePickerMode = .date
        
        datePicker.frame.size = CGSize(width: 0, height: 300)
        
        datePicker.preferredDatePickerStyle = .inline
    }
    
    @objc func donePressed(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        addedTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @IBOutlet var expTextField: RoundedTextField! {
        didSet {
            expTextField.tag = 4
            expTextField.delegate = self
        }
    }
    
    func createDatePickerExp() {

        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedExp))
        
        toolbar.setItems([doneBtn], animated: true)
        
        
        expTextField.inputAccessoryView = toolbar
        
        expTextField.inputView = datepickerexp

        
        datepickerexp.datePickerMode = .date
        
        datepickerexp.frame.size = CGSize(width: 0, height: 300)
        
        datepickerexp.preferredDatePickerStyle = .inline
        
    }

    @objc func donePressedExp(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        expTextField.text = formatter.string(from: datepickerexp.date)
        self.view.endEditing(true)
        
        
    }
    @IBOutlet var descriptionTextView: UITextView! {
        didSet {
            descriptionTextView.tag = 5
            descriptionTextView.layer.cornerRadius = 5.0
            descriptionTextView.layer.masksToBounds = true
        }
    }
    
    @IBOutlet var photoImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //Configure navigation bar appearance
        createDatePicker()
        createDatePickerExp()
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        
    }

    // MARK: - Table view data source

    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Text Field Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextTextField = view.viewWithTag(textField.tag + 1) {
            textField.resignFirstResponder()
            nextTextField.becomeFirstResponder()
        }
        return true
    }
    
    // MARK: - Table View delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let photoSourceRequestController = UIAlertController(title: "", message: "Choose yout photo source", preferredStyle: .actionSheet)
            
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { action in
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    let imagePicker = UIImagePickerController()
                    imagePicker.delegate = self
                    imagePicker.allowsEditing = false
                    imagePicker.sourceType = .camera
                    
                    self.present(imagePicker, animated: true, completion:  nil)
                }
            }
            
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { action in
                if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                    let imagePicker = UIImagePickerController()
                    imagePicker.delegate = self
                    imagePicker.allowsEditing = false
                    imagePicker.sourceType = .photoLibrary
                    
                    self.present(imagePicker, animated: true, completion:  nil)
                }
            }
            
            photoSourceRequestController.addAction(cameraAction)
            photoSourceRequestController.addAction(photoLibraryAction)
            
            present(photoSourceRequestController, animated: true, completion:  nil)
        }
    }
    
    //MARK: - Image Picker methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            photoImageView.image = selectedImage
            photoImageView.contentMode = .scaleAspectFill
            photoImageView.clipsToBounds = true
        }
        
        let leadingConstraint = NSLayoutConstraint(item: photoImageView, attribute: .leading, relatedBy: .equal, toItem: photoImageView.superview, attribute: .leading, multiplier: 1, constant: 0)
        leadingConstraint.isActive = true
        
        let trailingConstraint = NSLayoutConstraint(item: photoImageView, attribute: .trailing, relatedBy: .equal, toItem: photoImageView.superview, attribute: .trailing, multiplier: 1, constant: 0)
        trailingConstraint.isActive = true
        
        let topConstraint = NSLayoutConstraint(item: photoImageView, attribute: .top, relatedBy: .equal, toItem: photoImageView.superview, attribute: .top, multiplier: 1, constant: 0)
        topConstraint.isActive = true
        
        let bottomConstraint = NSLayoutConstraint(item: photoImageView, attribute: .bottom, relatedBy: .equal, toItem: photoImageView.superview, attribute: .bottom, multiplier: 1, constant: 0)
        bottomConstraint.isActive = true
        
        dismiss(animated: true, completion: nil)
    }

}
