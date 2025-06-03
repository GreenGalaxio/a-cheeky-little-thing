package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.Disposable;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.PixelSnapping;
   import flash.display.StageQuality;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class CollisionBoundary implements Disposable
   {
      
      public static const TRANS_COLOR:uint = 1127270;
       
      
      protected var STAGEDATA:StageData;
      
      protected var m_collisionClip:MovieClip;
      
      protected var m_collisionClipContainer:MovieClip;
      
      protected var m_bitmapData:Bitmap;
      
      protected var m_offset:Point;
      
      protected var m_originalLocation:Point;
      
      protected var m_useRectangle:Boolean;
      
      public function CollisionBoundary(param1:MovieClip, param2:StageData, param3:String = "ground", param4:Boolean = false)
      {
         var _loc5_:BitmapData = null;
         var _loc6_:Rectangle = null;
         var _loc7_:Rectangle = null;
         var _loc8_:Matrix = null;
         var _loc9_:Point = null;
         var _loc10_:String = null;
         var _loc11_:Matrix = null;
         super();
         this.STAGEDATA = param2;
         this.m_collisionClip = Boolean(param1[param3])?param1[param3]:param1;
         this.m_collisionClipContainer = param1;
         this.m_originalLocation = new Point(this.m_collisionClipContainer.x,this.m_collisionClipContainer.y);
         this.m_useRectangle = param4;
         if(!this.m_useRectangle)
         {
            _loc5_ = null;
            _loc6_ = null;
            _loc7_ = null;
            if(param1[param3])
            {
               _loc6_ = param1[param3].getBounds(param1.parent);
               _loc7_ = param1[param3].getBounds(param1[param3]);
            }
            else
            {
               _loc6_ = param1.getBounds(param1.parent);
               _loc7_ = param1.getBounds(param1);
            }
            this.m_bitmapData = new Bitmap(null,PixelSnapping.ALWAYS,false);
            this.m_bitmapData.x = _loc6_.x;
            this.m_bitmapData.y = _loc6_.y;
            this.m_offset = new Point(_loc6_.x - param1.x,_loc6_.y - param1.y);
            _loc8_ = new Matrix();
            _loc9_ = new Point();
            _loc9_.x = _loc7_.x;
            _loc9_.y = _loc7_.y;
            _loc8_.tx = -_loc9_.x;
            _loc8_.ty = -_loc9_.y;
            if(param1[param3])
            {
               _loc8_.scale(param1.scaleX * param1[param3].scaleX,param1.scaleY * param1[param3].scaleY);
            }
            else
            {
               _loc8_.scale(param1.scaleX,param1.scaleY);
            }
            if(param1.transform.matrix.a < 0 || param1.transform.matrix.d < 0)
            {
               _loc11_ = new Matrix();
               _loc11_.a = param1.transform.matrix.a < 0?Number(-1):Number(1);
               _loc11_.d = param1.transform.matrix.d < 0?Number(-1):Number(1);
               _loc11_.translate(_loc11_.a < 0?Number(_loc6_.width):Number(0),_loc11_.d < 0?Number(_loc6_.height):Number(0));
               _loc8_.concat(_loc11_);
            }
            _loc10_ = Main.Root.stage.quality;
            if(Main.Root.stage.quality != StageQuality.BEST)
            {
               Main.Root.stage.quality = StageQuality.BEST;
            }
            _loc5_ = new BitmapData(int(_loc6_.width + 0.5),int(_loc6_.height + 0.5),true,TRANS_COLOR);
            _loc5_.draw(this.m_collisionClip,_loc8_,this.m_collisionClip.transform.colorTransform,null,null,false);
            if(Main.Root.stage.quality != StageQuality.BEST)
            {
               Main.Root.stage.quality = _loc10_;
            }
            this.m_bitmapData.bitmapData = _loc5_;
         }
      }
      
      public function get X() : Number
      {
         return this.m_collisionClipContainer.x;
      }
      
      public function get Y() : Number
      {
         return this.m_collisionClipContainer.y;
      }
      
      public function get Width() : Number
      {
         return this.m_bitmapData.width;
      }
      
      public function get Height() : Number
      {
         return this.m_bitmapData.height;
      }
      
      public function get Container() : MovieClip
      {
         return this.m_collisionClipContainer;
      }
      
      public function get Offset() : Point
      {
         return this.m_offset;
      }
      
      public function get BMPData() : Bitmap
      {
         return this.m_bitmapData;
      }
      
      public function stop() : void
      {
         this.m_collisionClipContainer.stop();
      }
      
      public function play() : void
      {
         this.m_collisionClipContainer.play();
      }
      
      public function hitTestRect(param1:Rectangle, param2:Boolean = true) : Boolean
      {
         if(this.m_useRectangle)
         {
            return new Rectangle(this.m_collisionClipContainer.x,this.m_collisionClipContainer.y,this.m_collisionClipContainer.width,this.m_collisionClipContainer.height).containsRect(param1);
         }
         if(param2)
         {
            return this.m_bitmapData.bitmapData.hitTest(new Point(this.m_collisionClipContainer.x + this.m_offset.x,this.m_collisionClipContainer.y + this.m_offset.y),0,param1);
         }
         return new Rectangle(this.m_collisionClipContainer.x + this.m_offset.x,this.m_collisionClipContainer.y + this.m_offset.y,this.m_bitmapData.width,this.m_bitmapData.height).containsRect(param1);
      }
      
      public function hitTestPoint(param1:Number, param2:Number, param3:Boolean = true) : Boolean
      {
         if(this.m_useRectangle)
         {
            return new Rectangle(this.m_collisionClipContainer.x,this.m_collisionClipContainer.y,this.m_collisionClipContainer.width,this.m_collisionClipContainer.height).containsPoint(new Point(param1,param2));
         }
         if(param3)
         {
            return this.m_bitmapData.bitmapData.hitTest(new Point(this.m_collisionClipContainer.x + this.m_offset.x,this.m_collisionClipContainer.y + this.m_offset.y),0,new Point(param1,param2));
         }
         return new Rectangle(this.m_collisionClipContainer.x + this.m_offset.x,this.m_collisionClipContainer.y + this.m_offset.y,this.m_bitmapData.width,this.m_bitmapData.height).containsPoint(new Point(param1,param2));
      }
	  
	  public function dispose() : void
	  {
		  if(this.m_bitmapData != null && this.m_bitmapData.bitmapData != null)
		  {
			  this.m_bitmapData.bitmapData.dispose();
			  this.m_bitmapData.bitmapData = null;
		  }
	  }
   }
}
