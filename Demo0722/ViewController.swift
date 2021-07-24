//
//  ViewController.swift
//  Demo0722
//
//  Created by 林思甯 on 2021/7/22.
//

import UIKit

class ViewController: UIViewController {
    
    //people
    @IBOutlet weak var personBackgroundView: UIView!
    @IBOutlet weak var bodyImage: UIImageView!
    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var faceImage: UIImageView!
    @IBOutlet weak var glassImage: UIImageView!
    
    //scroll view
    @IBOutlet weak var selectScrollView: UIScrollView!
    @IBOutlet var headScrollView: UIScrollView!
    @IBOutlet weak var faceScrollView: UIScrollView!
    @IBOutlet weak var bodyScrollView: UIScrollView!
    @IBOutlet weak var glassScrollView: UIScrollView!
    @IBOutlet weak var colorScrollView: UIScrollView!
    @IBOutlet weak var headView: UIView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var faceView: UIView!
    @IBOutlet weak var glassView: UIView!
    @IBOutlet weak var colorView: UIView!
    
    // change color
    @IBOutlet weak var randomColorButton: UIButton!
    @IBOutlet weak var clearColorButton: UIButton!
    @IBOutlet weak var color1RSlider: UISlider!
    @IBOutlet weak var color1GSlider: UISlider!
    @IBOutlet weak var color1BSlider: UISlider!
    @IBOutlet weak var color1AlphaSlider: UISlider!
    @IBOutlet weak var color1Preview: UIImageView!
    @IBOutlet weak var color2RSlider: UISlider!
    @IBOutlet weak var color2GSlider: UISlider!
    @IBOutlet weak var color2BSlider: UISlider!
    @IBOutlet weak var color2AlphaSlider: UISlider!
    @IBOutlet weak var color2Preview: UIImageView!
    // 漸層
    var color1 = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    var color2 = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    var randomColor1 = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    var randomColor2 = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    
    var red1: Float = 0/255
    var green1: Float = 0/255
    var blue1: Float = 0/255
    var alpha1: Float = 1
    var red2: Float = 0/255
    var green2: Float = 0/255
    var blue2 : Float = 0/255
    var alpha2: Float = 1
    
    let gradientLayer = CAGradientLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //hiddenView
        headScrollView.isHidden = false
        bodyScrollView.isHidden = true
        glassScrollView.isHidden = true
        faceScrollView.isHidden = true
        colorScrollView.isHidden = true
    }
    // random pic
    @IBAction func randomCharacter(_ sender: UIButton) {
        let numberOfFace = Int.random(in: 1...15)
        faceImage.image = UIImage(named: "f\(numberOfFace)")
        let numberOfHead = Int.random(in: 1...15)
        headImage.image = UIImage(named: "p\(numberOfHead)")
        let numberOfGlass = Int.random(in: 0...8)
        glassImage.image = UIImage(named: "g\(numberOfGlass)")
        let numberOfBody = Int.random(in: 1...15)
        bodyImage.image = UIImage(named: "w\(numberOfBody)")
    }
    // select head
    @IBAction func selectHead(_ sender: UIButton) {
        headScrollView.isHidden = false
        bodyScrollView.isHidden = true
        glassScrollView.isHidden = true
        faceScrollView.isHidden = true
        colorScrollView.isHidden = true
    }
    // select face
    @IBAction func selectFace(_ sender: UIButton) {
        headScrollView.isHidden = true
        bodyScrollView.isHidden = true
        glassScrollView.isHidden = true
        faceScrollView.isHidden = false
        colorScrollView.isHidden = true
    }
    // select body
    @IBAction func selectBody(_ sender: UIButton) {
        headScrollView.isHidden = true
        bodyScrollView.isHidden = false
        glassScrollView.isHidden = true
        faceScrollView.isHidden = true
        colorScrollView.isHidden = true
    }
    // select glass
    @IBAction func selectGlass(_ sender: UIButton) {
        headScrollView.isHidden = true
        bodyScrollView.isHidden = true
        glassScrollView.isHidden = false
        faceScrollView.isHidden = true
        colorScrollView.isHidden = true
    }
    // select color
    @IBAction func selectColor(_ sender: UIButton) {
        headScrollView.isHidden = true
        bodyScrollView.isHidden = true
        glassScrollView.isHidden = true
        faceScrollView.isHidden = true
        colorScrollView.isHidden = false
    }
    // change head
    @IBAction func changeHead(_ sender: UIButton) {
        let thisImage = sender.currentImage
        headImage.image = thisImage
    }
    // change face
    @IBAction func changeFace(_ sender: UIButton) {
        let thisImage = sender.currentImage
        faceImage.image = thisImage
    }
    // change body
    @IBAction func changeBody(_ sender: UIButton) {
        let thisImage = sender.currentImage
        bodyImage.image = thisImage
    }
    // change glass
    @IBAction func changeGlass(_ sender: UIButton) {
        let thisImage = sender.currentImage
        glassImage.image = thisImage
    }
    //change color slider
    @IBAction func changeColor(_ sender: Any) {
        color1 = UIColor(red: CGFloat(color1RSlider.value), green: CGFloat(color1GSlider.value), blue: CGFloat(color1BSlider.value), alpha: CGFloat(color1AlphaSlider.value))
        color2 = UIColor(red: CGFloat(color2RSlider.value), green: CGFloat(color2GSlider.value), blue: CGFloat(color2BSlider.value), alpha: CGFloat(color2AlphaSlider.value))
        color1Preview.backgroundColor = color1
        color2Preview.backgroundColor = color2
        //漸層
        gradientLayer.frame = personBackgroundView.bounds
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        personBackgroundView.layer.addSublayer(gradientLayer)
    }
    // clear color
    @IBAction func clearBtn(_ sender: UIButton) {
        red1 = 255/255
        green1 = 255/255
        blue1 = 255/255
        alpha1 = 1
        red2 = 255/255
        green2 = 255/255
        blue2 = 255/255
        alpha2 = 1
        //兩個顏色＆preview image
        color1 = UIColor(red: CGFloat(color1RSlider.value), green: CGFloat(color1GSlider.value), blue: CGFloat(color1BSlider.value), alpha: CGFloat(color1AlphaSlider.value))
        color2 = UIColor(red: CGFloat(color2RSlider.value), green: CGFloat(color2GSlider.value), blue: CGFloat(color2BSlider.value), alpha: CGFloat(color2AlphaSlider.value))
        color1Preview.backgroundColor = color1
        color2Preview.backgroundColor = color2
        
        //漸層remove
        gradientLayer.removeFromSuperlayer()
        
        //slider連動
        color1RSlider.value = red1
        color1GSlider.value = green1
        color1BSlider.value = blue1
        color1AlphaSlider.value = alpha1
        color2RSlider.value = red2
        color2GSlider.value = green2
        color2BSlider.value = blue2
        color2AlphaSlider.value = alpha2
        
    }
    // random color
    @IBAction func RandoCcolor(_ sender: UIButton) {
        
        //定義RGB亂數
        red1 = Float.random(in: 1...255)/255
        green1 = Float.random(in: 1...255)/255
        blue1 = Float.random(in: 1...255)/255
        alpha1 = Float.random(in: 1...255)/255
        red2 = Float.random(in: 1...255)/255
        green2 = Float.random(in: 1...255)/255
        blue2 = Float.random(in: 1...255)/255
        alpha2 = Float.random(in: 1...255)/255
        
        //兩個顏色＆preview image
        randomColor1 = UIColor(red: CGFloat(red1), green: CGFloat(green1), blue: CGFloat(blue1), alpha: CGFloat(alpha1))
        randomColor2 = UIColor(red: CGFloat(red2), green: CGFloat(green2), blue: CGFloat(blue2), alpha: CGFloat(alpha2))
        color1Preview.backgroundColor = randomColor1
        color2Preview.backgroundColor = randomColor2
        
        //漸層
        gradientLayer.frame = personBackgroundView.bounds
        gradientLayer.colors = [randomColor1.cgColor, randomColor2.cgColor]
        personBackgroundView.layer.addSublayer(gradientLayer)
        
        //slider連動
        color1RSlider.value = red1
        color1GSlider.value = green1
        color1BSlider.value = blue1
        color1AlphaSlider.value = alpha1
        color2RSlider.value = red2
        color2GSlider.value = green2
        color2BSlider.value = blue2
        color2AlphaSlider.value = alpha2
        
    }
}

