import UIKit
class DrawView: UIView {
    var eraseAll = false
    
    
    var touch : UITouch!
    var lineArray : [[CGPoint]] = [[CGPoint]()]
    var index = -1
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touch = touches.first! as UITouch
        let lastPoint = touch.location(in: self)
        
        index += 1
        lineArray.append([CGPoint]())
        lineArray[index].append(lastPoint)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        touch = touches.first! as UITouch
        let currentPoint = touch.location(in: self)
        
        self.setNeedsDisplay()
        
        if index == -1
        {
            index += 1
        }
        lineArray[index].append(currentPoint)
        
    }
    

    override func draw(_ rect: CGRect) {
        if eraseAll
        {
            super.draw(rect)
            
            guard let context = UIGraphicsGetCurrentContext() else {
                return
            }

            
            
             //touch : UITouch!
             lineArray  = [[CGPoint]()]
             index = -1
            
            
            
            context.setLineWidth(5)
            context.setStrokeColor((UIColor(red:0.00, green:0.38, blue:0.83, alpha:1.0)).cgColor)
            context.setLineCap(.round)

            //drawHairline(in: context, scale: 4.0, color: UIColor.brown.cgColor)
            
            let aPath = UIBezierPath()
            
            aPath.move(to: CGPoint(x:0, y:0))
            aPath.addLine(to: CGPoint(x:self.frame.width, y:0))
            aPath.addLine(to: CGPoint(x:0, y:self.frame.height))
           
            aPath.move(to: CGPoint(x:self.frame.width, y:self.frame.height))
            
            aPath.addLine(to: CGPoint(x:self.frame.width, y:0))
            aPath.addLine(to: CGPoint(x:0, y:self.frame.height))
            
            
            var c = self.layer.colorOfPoint(point: CGPoint(x:0, y:self.frame.height))

            //Keep using the method addLineToPoint until you get to the one where about to close the path
            aPath.close()
            
            //If you want to stroke it with a red color
            
            
            aPath.stroke()
            //If you want to fill it as well
            aPath.fill()
            
            /* //METHOD: 2
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 10, y: 10))
            path.addLine(to: CGPoint(x: 100, y: 100))
            
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = path.cgPath
            shapeLayer.strokeColor = UIColor.blue.cgColor
            shapeLayer.lineWidth = 30.0
            
            self.layer.addSublayer(shapeLayer)
            */
            return
        }
        if(index >= 0){
            let context = UIGraphicsGetCurrentContext()
            context?.setLineWidth(20)
            context?.setStrokeColor((UIColor(red:0.00, green:0.38, blue:0.83, alpha:1.0)).cgColor)
            context?.setLineCap(.round)
            
            var j = 0
            while( j <= index ){
                context?.beginPath()
                var i = 0
                context?.move(to: lineArray[j][0])
                while(i < lineArray[j].count){
                    context?.addLine(to: lineArray[j][i])
                    i += 1
                }
                
                context?.strokePath()
                j += 1
                
            }
            
        }
    }
    

    
}

extension CALayer {
    
    func colorOfPoint(point:CGPoint) -> CGColor {
        
        var pixel: [CUnsignedChar] = [0, 0, 0, 0]
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        
        let context = CGContext(data: &pixel, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        
        context!.translateBy(x: -point.x, y: -point.y)
        
        self.render(in: context!)
        
        let red: CGFloat   = CGFloat(pixel[0]) / 255.0
        let green: CGFloat = CGFloat(pixel[1]) / 255.0
        let blue: CGFloat  = CGFloat(pixel[2]) / 255.0
        let alpha: CGFloat = CGFloat(pixel[3]) / 255.0
        
        let color = UIColor(red:red, green: green, blue:blue, alpha:alpha)
        
        return color.cgColor
    }
}

extension UIImage {
    convenience init(view: UIView) {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in:UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: image!.cgImage!)
    }
}


