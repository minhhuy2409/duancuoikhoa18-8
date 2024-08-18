//
//  vcEx.swift
//  duancuoikhoa1
//
//  Created by huy bin on 18/8/24.
//

import UIKit
struct Exercise {
    let name: String
    let imageUrl: String
}

class vcEx: UIViewController {
    @IBOutlet var leg: UIImageView!
    @IBOutlet var arm: UIImageView!
    @IBOutlet var body: UIImageView!
    
    let legExercises = [
        Exercise(name: "Squats", imageUrl: "https://example.com/squats.jpg"),
        Exercise(name: "Lunges", imageUrl: "https://example.com/lunges.jpg")
    ]
    
    let armExercises = [
        Exercise(name: "Bicep Curls", imageUrl: "https://example.com/bicep_curls.jpg"),
        Exercise(name: "Tricep Dips", imageUrl: "https://example.com/tricep_dips.jpg")
    ]
    
    let bodyExercises = [
        Exercise(name: "Plank", imageUrl: "https://example.com/plank.jpg"),
        Exercise(name: "Sit-ups", imageUrl: "https://example.com/situps.jpg")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Chọn ngẫu nhiên một bài tập từ mỗi danh sách
        if let randomLegExercise = legExercises.randomElement() {
            loadImage(from: randomLegExercise.imageUrl, into: leg)
        }
        
        if let randomArmExercise = armExercises.randomElement() {
            loadImage(from: randomArmExercise.imageUrl, into: arm)
        }
        
        if let randomBodyExercise = bodyExercises.randomElement() {
            loadImage(from: randomBodyExercise.imageUrl, into: body)
        }
    }
    
    func loadImage(from urlString: String, into imageView: UIImageView) {
        guard let url = URL(string: urlString) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    imageView.image = image
                }
            }
        }
        task.resume()
    }
}
