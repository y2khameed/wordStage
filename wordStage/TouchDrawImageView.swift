import UIKit

class TouchDrawImageView: UIImageView {
    
    var previousPoint1 = CGPoint()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        previousPoint1 = touch.previousLocation(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let previousPoint2 = previousPoint1
        previousPoint1 = touch.previousLocation(in: self)
        let currentPoint = touch.location(in: self)
        
        
        // calculate mid point
        let mid1 = midPoint(p1: previousPoint1, p2: previousPoint2)
        let mid2 = midPoint(p1: currentPoint, p2: previousPoint1)
        
        UIGraphicsBeginImageContext(self.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        if let image = self.image {
            image.draw(in: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        }
        
        context.move(to: mid1)
        context.addQuadCurve(to: mid2, control: previousPoint1)
        
        context.setLineCap(.round)
        context.setLineWidth(2.0)
        context.setStrokeColor(red: 1.0, green: 0, blue: 0, alpha: 1.0)
        context.strokePath()
        
        self.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    func midPoint(p1: CGPoint, p2: CGPoint) -> CGPoint {
        return CGPoint(x: (p1.x + p2.x) / 2.0, y: (p1.y + p2.y) / 2.0)
    }
}

