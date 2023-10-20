pub func calFlyingBallPos(g : Float64, ballStartX : Float64,
        ballStartY : Float64, dragOffsetX : Float64, dragOffsetY : Float64,
        flyStartTime : Int64) {
  @lib.calFlyingBallPos(
    g,
    ballStartX,
    ballStartY,
    dragOffsetX,
    dragOffsetY,
    flyStartTime,
  )
}

pub func calDraggerEndpoint(dragStartX : Float64, dragStartY : Float64,
        clientX : Float64, clientY : Float64) {
  @lib.calDraggerEndpoint(dragStartX, dragStartY, clientX, clientY)
}

func init {
  println("throw ball wasm start")
}

