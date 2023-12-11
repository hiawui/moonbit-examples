fn date_now() -> Int64 = "date" "now"

fn setBallCurrPos(x : Double, y : Double) = "ball" "setCurrPos"

fn setDraggerEndpoint(x : Double, y : Double) = "dragger" "setEndpoint"

pub fn calFlyingBallPos(g : Double, ballStartX : Double, ballStartY : Double,
        dragOffsetX : Double, dragOffsetY : Double, flyStartTime : Int64) {
  let speedRatio = 0.01
  let now = date_now()
  let t = (now - flyStartTime).to_double()
  let speedX = dragOffsetX * speedRatio
  let speedY = dragOffsetY * speedRatio
  let cx = speedX * t + ballStartX
  let cy = ballStartY + speedY * t + g * t * t * 0.5
  setBallCurrPos(cx, cy)
}

pub fn calDraggerEndpoint(dragStartX : Double, dragStartY : Double,
        clientX : Double, clientY : Double) {
  var endY = if clientY >= dragStartY {
    dragStartY
  } else {
    clientY
  }
  if dragStartY - endY > 300.0 {
    endY = dragStartY - 300.0
  }
  var endX = if clientX <= dragStartX {
    dragStartX
  } else {
    clientX
  }
  if endX - dragStartX > 300.0 {
    endX = dragStartX + 300.0
  }
  setDraggerEndpoint(endX, endY)
}
