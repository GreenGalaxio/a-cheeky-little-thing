package com.mcleodgaming.ssf2.engine
{
   import com.mcleodgaming.ssf2.util.FastCollisions;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class HitBoxSprite
   {
      
      public static const ATTACK:uint = 0;
      
      public static const HIT:uint = 1;
      
      public static const GRAB:uint = 2;
      
      public static const TOUCH:uint = 3;
      
      public static const HAND:uint = 4;
      
      public static const RANGE:uint = 5;
      
      public static const ABSORB:uint = 6;
      
      public static const COUNTER:uint = 7;
      
      public static const SHIELDATTACK:uint = 8;
      
      public static const SHIELDPROJECTILE:uint = 9;
      
      public static const REVERSE:uint = 10;
      
      public static const CATCH:uint = 11;
      
      public static const LEDGE:uint = 12;
      
      public static const CAM:uint = 13;
      
      public static const HOMING:uint = 14;
      
      public static const PLOCK:uint = 15;
      
      public static const ITEM:uint = 16;
      
      public static const HAT:uint = 17;
      
      public static const SHIELD:uint = 18;
      
      public static const EGG:uint = 19;
      
      public static const FREEZE:uint = 20;
      
      public static const STAR:uint = 21;
       
      
      private var m_name:String;
      
      private var m_type:uint;
      
      private var m_rectangle:Rectangle;
      
      private var m_flippedRectangle:Rectangle;
      
      private var m_rotation:Number;
      
      private var m_transform:Matrix;
      
      private var m_regPoint:Point;
      
      private var m_scale:Point;
      
      private var m_depth:int;
      
      private var m_circular:Boolean;
      
      private var m_customData:Object;
      
      public function HitBoxSprite(param1:uint, param2:Rectangle, param3:Boolean = false, param4:Object = null, param5:Point = null, param6:Point = null, param7:Number = 0, param8:Matrix = null, param9:int = 0)
      {
         super();
         this.m_name = null;
         this.m_type = param1;
         this.m_rectangle = param2;
         this.m_circular = param3;
         this.m_customData = param4;
         this.m_flippedRectangle = new Rectangle(-param2.x - param2.width,param2.y,param2.width,param2.height);
         this.m_rotation = param7;
         this.m_regPoint = Boolean(param5)?param5:new Point(param2.x,param2.y);
         this.m_scale = Boolean(param6)?param6:new Point(1,1);
         this.m_transform = Boolean(param8)?param8:new Matrix();
         this.m_depth = param9;
      }
      
      public static function hitTestArray(param1:Array, param2:Array, param3:Point, param4:Point, param5:Boolean, param6:Boolean, param7:Point, param8:Point, param9:Number, param10:Number) : Vector.<HitBoxCollisionResult>
      {
         var _loc13_:int = 0;
         var _loc14_:Rectangle = null;
         var _loc11_:Vector.<HitBoxCollisionResult> = new Vector.<HitBoxCollisionResult>();
         if(param1 == null || param2 == null)
         {
            return _loc11_;
         }
         var _loc12_:int = 0;
         while(_loc12_ < param1.length)
         {
            _loc13_ = 0;
            while(_loc13_ < param2.length)
            {
               _loc14_ = param1[_loc12_].hitTest(param2[_loc13_],param3,param4,param5,param6,param7,param8,param9,param10);
               if(_loc14_)
               {
                  _loc11_.push(new HitBoxCollisionResult(param1[_loc12_],param2[_loc13_],new HitBoxSprite(param1[_loc12_].Type,_loc14_,param1[_loc12_].Circular,param1[_loc12_].CustomData)));
               }
               _loc13_++;
            }
            _loc12_++;
         }
         return _loc11_;
      }
      
      public function get x() : Number
      {
         return this.m_rectangle.x;
      }
      
      public function get y() : Number
      {
         return this.m_rectangle.y;
      }
      
      public function get xreg() : Number
      {
         return this.m_regPoint.x;
      }
      
      public function get yreg() : Number
      {
         return this.m_regPoint.y;
      }
      
      public function get width() : Number
      {
         return this.m_rectangle.width;
      }
      
      public function get height() : Number
      {
         return this.m_rectangle.height;
      }
      
      public function get scaleX() : Number
      {
         return this.m_scale.x;
      }
      
      public function get scaleY() : Number
      {
         return this.m_scale.y;
      }
      
      public function get rotation() : Number
      {
         return this.m_rotation;
      }
      
      public function get transform() : Matrix
      {
         return this.m_transform;
      }
      
      public function get depth() : int
      {
         return this.m_depth;
      }
      
      public function get centerx() : Number
      {
         return this.m_rectangle.x + this.m_rectangle.width / 2;
      }
      
      public function get centery() : Number
      {
         return this.m_rectangle.y + this.m_rectangle.height / 2;
      }
      
      public function get Name() : String
      {
         return this.m_name;
      }
      
      public function set Name(param1:String) : void
      {
         this.m_name = param1;
      }
      
      public function get Type() : uint
      {
         return this.m_type;
      }
      
      public function get BoundingBox() : Rectangle
      {
         return this.m_rectangle;
      }
      
      public function get FlippedBoundingBox() : Rectangle
      {
         return this.m_flippedRectangle;
      }
      
      public function get CustomData() : Object
      {
         return this.m_customData;
      }
      
      public function set CustomData(param1:Object) : void
      {
         this.m_customData = param1;
      }
      
      public function get Circular() : Boolean
      {
         return this.m_circular;
      }
      
      public function equals(param1:HitBoxSprite) : Boolean
      {
         return this.m_type == param1.Type && this.m_rectangle.equals(param1.BoundingBox) && this.m_circular == param1.Circular && this.m_regPoint.equals(param1.m_regPoint) && this.m_scale.equals(param1.m_scale) && this.m_rotation == param1.rotation && this.m_transform.a == param1.transform.a && this.m_transform.b == param1.transform.b && this.m_transform.c == param1.transform.c && this.m_transform.d == param1.transform.d && this.m_transform.tx == param1.transform.tx && this.m_transform.ty == param1.transform.ty && this.m_depth == param1.depth;
      }
      
      public function hitTest(param1:HitBoxSprite, param2:Point, param3:Point, param4:Boolean, param5:Boolean, param6:Point, param7:Point, param8:Number, param9:Number) : Rectangle
      {
         var _loc15_:Vector.<Point> = null;
         var _loc16_:Vector.<Point> = null;
         var _loc17_:Point = null;
         var _loc18_:Point = null;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc10_:Rectangle = !!param4?this.m_flippedRectangle.clone():this.m_rectangle.clone();
         var _loc11_:Rectangle = !!param5?param1.FlippedBoundingBox.clone():param1.BoundingBox.clone();
         var _loc12_:Rectangle = _loc10_.clone();
         var _loc13_:Rectangle = _loc11_.clone();
         _loc10_ = Utils.rotateRectangleAroundOrigin(_loc10_,param8);
         _loc11_ = Utils.rotateRectangleAroundOrigin(_loc11_,param9);
         _loc10_.x = _loc10_.x * param6.x;
         _loc10_.y = _loc10_.y * param6.y;
         _loc10_.width = _loc10_.width * param6.x;
         _loc10_.height = _loc10_.height * param6.y;
         _loc11_.x = _loc11_.x * param7.x;
         _loc11_.y = _loc11_.y * param7.y;
         _loc11_.width = _loc11_.width * param7.x;
         _loc11_.height = _loc11_.height * param7.y;
         _loc10_.x = _loc10_.x + param2.x;
         _loc10_.y = _loc10_.y + param2.y;
         _loc11_.x = _loc11_.x + param3.x;
         _loc11_.y = _loc11_.y + param3.y;
         var _loc14_:Rectangle = _loc10_.intersection(_loc11_);
         if(_loc14_.isEmpty())
         {
            return null;
         }
         if(param8 == 0 && param9 == 0)
         {
            return _loc14_;
         }
         if(!this.m_circular && !param1.Circular)
         {
            _loc15_ = Utils.rotateRectangleAroundOriginPoints(_loc12_,param8,param6,param2);
            _loc16_ = Utils.rotateRectangleAroundOriginPoints(_loc13_,param9,param7,param3);
            if(FastCollisions.rectangles(_loc15_[0].x,_loc15_[0].y,_loc15_[1].x,_loc15_[1].y,_loc15_[2].x,_loc15_[2].y,_loc15_[3].x,_loc15_[3].y,_loc16_[0].x,_loc16_[0].y,_loc16_[1].x,_loc16_[1].y,_loc16_[2].x,_loc16_[2].y,_loc16_[3].x,_loc16_[3].y))
            {
               return _loc14_;
            }
            return null;
         }
         _loc17_ = new Point(_loc10_.x + _loc10_.width / 2,_loc10_.y + _loc10_.height / 2);
         _loc18_ = new Point(_loc11_.x + _loc11_.width / 2,_loc11_.y + _loc11_.height / 2);
         _loc17_.x = _loc17_.x + _loc17_.x * Math.cos(Utils.toRadians(param8));
         _loc17_.y = _loc17_.y + _loc17_.y * -Math.sin(Utils.toRadians(param8));
         _loc18_.x = _loc18_.x + _loc18_.x * Math.cos(Utils.toRadians(param9));
         _loc18_.y = _loc18_.y + _loc18_.y * -Math.sin(Utils.toRadians(param9));
         _loc19_ = Math.min(_loc10_.width,_loc10_.height);
         _loc20_ = Math.min(_loc11_.width,_loc11_.height);
         if(this.m_circular && !param1.Circular)
         {
            if(Utils.testRectangleToCircle(_loc11_.width,_loc11_.height,param9,_loc18_.x,_loc18_.y,_loc17_.x,_loc17_.y,_loc19_))
            {
               return _loc14_;
            }
            return null;
         }
         if(!this.m_circular && param1.Circular)
         {
            if(Utils.testRectangleToCircle(_loc10_.width,_loc10_.height,param8,_loc17_.x,_loc17_.y,_loc18_.x,_loc18_.y,_loc20_))
            {
               return _loc14_;
            }
            return null;
         }
         if(Point.distance(_loc17_,_loc18_) > _loc19_ + _loc20_)
         {
            return _loc14_;
         }
         return null;
      }
      
      public function hitTestPoint(param1:Point, param2:Point, param3:Boolean, param4:Point, param5:Number, param6:Boolean = false) : Boolean
      {
         var _loc7_:Rectangle = !!param3?this.m_flippedRectangle.clone():this.m_rectangle.clone();
         _loc7_ = Utils.rotateRectangleAroundOrigin(_loc7_,param5);
         _loc7_.x = _loc7_.x * param4.x;
         _loc7_.y = _loc7_.y * param4.y;
         _loc7_.width = _loc7_.width * param4.x;
         _loc7_.height = _loc7_.height * param4.y;
         _loc7_.x = _loc7_.x + param2.x;
         _loc7_.y = _loc7_.y + param2.y;
         trace("Call to HitBoxSprite.hitTestPoint(), please check");
         return !!param6?Boolean(Point.distance(param1,new Point(_loc7_.x + _loc7_.width / 2,_loc7_.y + _loc7_.height / 2)) < Math.min(_loc7_.width / 2,_loc7_.height / 2)):Boolean(_loc7_.containsPoint(param1));
      }
   }
}
