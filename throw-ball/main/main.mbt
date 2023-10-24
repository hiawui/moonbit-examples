pub fn calFlyingBallPos(g : Double, ballStartX : Double, ballStartY : Double,
        dragOffsetX : Double, dragOffsetY : Double, flyStartTime : Int64) {
  @lib.calFlyingBallPos(
    g,
    ballStartX,
    ballStartY,
    dragOffsetX,
    dragOffsetY,
    flyStartTime,
  )
}

pub fn calDraggerEndpoint(dragStartX : Double, dragStartY : Double,
        clientX : Double, clientY : Double) {
  @lib.calDraggerEndpoint(dragStartX, dragStartY, clientX, clientY)
}

fn init {
  println("throw ball wasm start")
}

