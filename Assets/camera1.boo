import UnityEngine

class camera1 (MonoBehaviour): 
  public _rt_0 as RenderTexture
  def Start ():
    pass

  def Update ():
    pass
  def OnPreRender():
    Graphics.SetRenderTarget(camera.targetTexture.colorBuffer, _rt_0.depthBuffer)
    GL.Clear(false, true, Color.clear, 1.0f)
