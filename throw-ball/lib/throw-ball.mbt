func date_now() -> Int64 = "date" "now"

func setBallCurrPos(x : Float64, y : Float64) = "ball" "setCurrPos"

func setDraggerEndpoint(x : Float64, y : Float64) = "dragger" "setEndpoint"

pub func calFlyingBallPos(g : Float64, ballStartX : Float64,
        ballStartY : Float64, dragOffsetX : Float64, dragOffsetY : Float64,
        flyStartTime : Int64) {
  let speedRatio = 0.01
  let now = date_now()
  let t = (now - flyStartTime).to_float64()
  let speedX = dragOffsetX * speedRatio
  let speedY = dragOffsetY * speedRatio
  let cx = speedX * t + ballStartX
  let cy = ballStartY + speedY * t + g * t * t * 0.5
  setBallCurrPos(cx, cy)
}

pub func calDraggerEndpoint(dragStartX : Float64, dragStartY : Float64,
        clientX : Float64, clientY : Float64) {
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

