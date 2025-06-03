package com.mcleodgaming.ssf2.util
{
   import com.adobe.images.PNGEncoder;
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.Beacon;
   import com.mcleodgaming.ssf2.engine.InteractiveSprite;
   import com.mcleodgaming.ssf2.engine.Projectile;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.items.Item;
   import fl.motion.AdjustColor;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.FrameLabel;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.net.FileFilter;
   import flash.net.FileReference;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   public class Utils
   {
      
      public static var VELOCITY_SCALE:Number = 3.488;
      
      public static var WEIGHT2_BASE:Number = 0.051;
      
      private static var rndm:Rndm;
      
      private static var origSeed:Number;
      
      private static var lastRandom:Number;
      
      private static var UID:int = 0;
      
      private static var KEY:String = "b0cb1f1f-bc82-40bc-a1d7-1a2d16a6e8d1";
      
      public static var openSuccess:Boolean = false;
      
      public static var saveSuccess:Boolean = false;
      
      public static var finishedLoading:Boolean = false;
      
      public static var cancelled:Boolean = false;
      
      public static var fileRef:FileReference;
      
      public static var stackSafety:int = 0;
      
      {
         init();
      }
      
      public function Utils()
      {
         super();
      }
      
      public static function init() : void
      {
      }
      
      public static function initializeUtilsClass() : void
      {
         Utils.rndm = new Rndm();
         Utils.rndm.seed = origSeed = Math.round(Math.random() * 1000000 + 1);
         trace("Utils class initialized w/ seed of " + origSeed);
      }
      
      public static function resetUID() : void
      {
         Utils.UID = 0;
      }
      
      public static function getUID() : int
      {
         if(Utils.UID >= int.MAX_VALUE)
         {
            Utils.UID = 0;
         }
         return Utils.UID++;
      }
      
      public static function get LastRandom() : Number
      {
         return lastRandom;
      }
      
      public static function fastAbs(param1:Number) : Number
      {
         return param1 > 0?Number(param1):Number(-param1);
      }
      
      public static function getSign(param1:Number) : Number
      {
         return param1 > 0?Number(1):Number(-1);
      }
      
      public static function framesToTimeString(param1:int, param2:Boolean = false) : String
      {
         var _loc3_:String = "";
         var _loc4_:String = "";
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         _loc5_ = Math.floor(param1 / 30 / 60);
         _loc6_ = Math.floor(param1 / 30 - 60 * _loc5_);
         if(_loc6_ >= 10)
         {
            _loc3_ = _loc6_ != 60?_loc5_ + ":" + _loc6_:_loc5_ + 1 + ":" + "00";
         }
         else
         {
            _loc3_ = _loc5_ + ":0" + _loc6_;
         }
         if(param1 >= 0)
         {
            _loc4_ = "" + Math.round(param1 % 30 / 30 * 100);
         }
         else
         {
            _loc4_ = "" + (100 - Utils.fastAbs(Math.round(param1 % 30 / 30 * 100)));
         }
         if(_loc4_.length == 1)
         {
            _loc4_ = _loc4_ == "0"?"00":_loc4_ + "0";
         }
         _loc4_ = ":" + _loc4_;
         if(param1 <= -30)
         {
            _loc3_ = "0:00";
            _loc4_ = "00";
         }
         return !param2?_loc3_:_loc4_;
      }
      
      public static function toRadians(param1:Number) : Number
      {
         return param1 * (Math.PI / 180);
      }
      
      public static function toDegrees(param1:Number) : Number
      {
         return param1 * (180 / Math.PI);
      }
      
      public static function getDistanceFrom(param1:InteractiveSprite, param2:InteractiveSprite) : Number
      {
         if(param1 == null || param2 == null)
         {
            return 0;
         }
         return Math.sqrt(Math.pow(param1.X - param2.X,2) + Math.pow(param1.Y - param2.Y,2));
      }
      
      public static function getDistance(param1:Point, param2:Point) : Number
      {
         if(param1 == null || param2 == null)
         {
            return 0;
         }
         return Math.sqrt(Math.pow(param1.x - param2.x,2) + Math.pow(param1.y - param2.y,2));
      }
      
      public static function calculateXSpeed(param1:Number, param2:Number) : Number
      {
         return param1 * Math.cos(param2 * Math.PI / 180);
      }
      
      public static function calculateYSpeed(param1:Number, param2:Number) : Number
      {
         return param1 * Math.sin(param2 * Math.PI / 180);
      }
      
      public static function calculateSpeed(param1:Number, param2:Number) : Number
      {
         return Math.sqrt(Math.pow(param1,2) + Math.pow(param2,2));
      }
      
      public static function calculateHeightDiff(param1:Number, param2:Number = 45, param3:Number = 10) : Number
      {
         if(param1 > param3)
         {
            param1 = param3;
         }
         return Utils.fastAbs(param1 * Math.tan(Utils.toRadians(Utils.forceBase360(param2))));
      }
      
      public static function calculateBounceSpeed(param1:Number, param2:Number, param3:Number) : Number
      {
         param1 = Utils.fastAbs(param1);
         param2 = Utils.fastAbs(param2);
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         var _loc6_:int = 0;
         var _loc7_:Number = -param1;
         while(_loc7_ < 0)
         {
            _loc4_ = _loc4_ + _loc7_;
            _loc7_ = _loc7_ + param2;
         }
         _loc5_ = _loc4_ * param3;
         _loc7_ = -param1;
         _loc4_ = 0;
         while(_loc4_ > _loc5_ && _loc7_ < 0)
         {
            _loc6_++;
            _loc4_ = _loc4_ + _loc7_;
            _loc7_ = _loc7_ + param2;
         }
         return _loc7_ - param2 * _loc6_;
      }
      
      public static function swapLocations(param1:DisplayObject, param2:DisplayObject) : void
      {
         var _loc3_:int = param1.x;
         var _loc4_:int = param1.y;
         param1.x = param2.x;
         param1.y = param2.y;
         param2.x = _loc3_;
         param2.y = _loc4_;
      }
      
      public static function swapDepths(param1:DisplayObject, param2:DisplayObject) : void
      {
         if(param1 != null && param2 != null && param1.parent == param2.parent && param1.parent != null)
         {
            param1.parent.swapChildren(param1,param2);
         }
      }
      
      public static function tryToGotoAndPlay(param1:MovieClip, param2:*) : void
      {
         var _loc3_:int = 0;
         if(param2 is int || param2 is Number)
         {
            if(param2 <= param1.totalFrames)
            {
               param1.gotoAndPlay(param2);
            }
         }
         else if(param2 is String)
         {
            _loc3_ = 0;
            while(_loc3_ < param1.currentLabels.length)
            {
               if(param1.currentLabels[_loc3_].name == param2)
               {
                  param1.gotoAndPlay(param2);
                  break;
               }
               _loc3_++;
            }
         }
      }
      
      public static function tryToGotoAndStop(param1:MovieClip, param2:*) : void
      {
         var _loc3_:int = 0;
         if(!param1)
         {
            return;
         }
         if(param2 is int || param2 is Number)
         {
            if(param2 <= param1.totalFrames)
            {
               param1.gotoAndStop(param2);
            }
         }
         else if(param2 is String)
         {
            _loc3_ = 0;
            while(_loc3_ < param1.currentLabels.length)
            {
               if(param1.currentLabels[_loc3_].name == param2)
               {
                  param1.gotoAndStop(param2);
                  break;
               }
               _loc3_++;
            }
         }
      }
      
      public static function getFileNameFromURL(param1:String) : String
      {
         var _loc2_:int = param1.lastIndexOf("/");
         if(_loc2_ == param1.length - 1)
         {
            param1 = param1.substr(0,param1.length - 1);
         }
         _loc2_ = param1.lastIndexOf("/");
         if(_loc2_ < 0 || _loc2_ == param1.length - 1)
         {
            return param1;
         }
         return param1.substr(_loc2_ + 1);
      }
      
      public static function getColorString(param1:int) : String
      {
         return param1 == 1?"red":param1 == 2?"green":param1 == 3?"blue":null;
      }
      
      public static function getCostumeObject(param1:Object = null) : Object
      {
         var _loc3_:* = undefined;
         param1 = param1 || {};
         var _loc2_:Object = new Object();
         _loc2_.hue = 0;
         _loc2_.saturation = 0;
         _loc2_.brightness = 0;
         _loc2_.contrast = 0;
         _loc2_.redMultiplier = 1;
         _loc2_.greenMultiplier = 1;
         _loc2_.blueMultiplier = 1;
         _loc2_.alphaMultiplier = 1;
         _loc2_.redOffset = 0;
         _loc2_.greenOffset = 0;
         _loc2_.blueOffset = 0;
         _loc2_.alphaOffset = 0;
         for(_loc3_ in _loc2_)
         {
            if(param1[_loc3_] === undefined)
            {
               param1[_loc3_] = _loc2_[_loc3_];
            }
         }
         return param1;
      }
      
      public static function setColorFilter(param1:DisplayObject, param2:Object) : void
      {
         var _loc4_:AdjustColor = null;
         var _loc5_:Array = null;
         if(!param2)
         {
            param1.filters = null;
            return;
         }
         param2 = Utils.getCostumeObject(param2);
         var _loc3_:Array = [];
         if(!(param2.hue == 0 && param2.saturation == 0 && param2.brightness == 0 && param2.contrast == 0))
         {
            _loc4_ = new AdjustColor();
            _loc4_.hue = param2.hue;
            _loc4_.saturation = param2.saturation;
            _loc4_.brightness = param2.brightness;
            _loc4_.contrast = param2.contrast;
            _loc3_.push(new ColorMatrixFilter(_loc4_.CalculateFinalFlatArray()));
         }
         if(!(param2.redMultiplier == 1 && param2.greenMultiplier == 1 && param2.blueMultiplier == 1 && param2.alphaMultiplier == 1 && param2.redOffset == 0 && param2.greenOffset == 0 && param2.blueOffset == 0 && param2.alphaOffset == 0))
         {
            _loc5_ = new Array();
            _loc5_ = _loc5_.concat([param2.redMultiplier,0,0,0,param2.redOffset]);
            _loc5_ = _loc5_.concat([0,param2.greenMultiplier,0,0,param2.greenOffset]);
            _loc5_ = _loc5_.concat([0,0,param2.blueMultiplier,0,param2.blueOffset]);
            _loc5_ = _loc5_.concat([0,0,0,param2.alphaMultiplier,param2.alphaOffset]);
            _loc3_.push(new ColorMatrixFilter(_loc5_));
         }
         param1.filters = _loc3_;
      }
      
      public static function setTint(param1:DisplayObject, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
      {
         var _loc10_:ColorTransform = new ColorTransform();
         _loc10_.redMultiplier = param2;
         _loc10_.greenMultiplier = param3;
         _loc10_.blueMultiplier = param4;
         _loc10_.alphaMultiplier = param5;
         _loc10_.redOffset = param6;
         _loc10_.greenOffset = param7;
         _loc10_.blueOffset = param8;
         _loc10_.alphaOffset = param9;
         param1.transform.colorTransform = _loc10_;
      }
      
      public static function setBrightness(param1:MovieClip, param2:Number) : void
      {
         if(Math.abs(param2) > 100)
         {
            param2 = param2 > 0?Number(100):Number(-100);
         }
         var _loc3_:ColorTransform = new ColorTransform();
         _loc3_.redOffset = param2 * 2.55;
         _loc3_.greenOffset = param2 * 2.55;
         _loc3_.blueOffset = param2 * 2.55;
         param1.transform.colorTransform = _loc3_;
      }
      
      public static function extractAlpha(param1:int) : int
      {
         return (param1 & 4278190080) >> 24;
      }
      
      public static function extractRed(param1:int) : int
      {
         return (param1 & 16711680) >> 16;
      }
      
      public static function extractGreen(param1:int) : int
      {
         return (param1 & 65280) >> 8;
      }
      
      public static function extractBlue(param1:int) : int
      {
         return param1 & 255;
      }
      
        public static function convertTeamToColor(_arg_1:int, _arg_2:int):int
        {
            var _local_3:int = -1;
            if (_arg_2 > 0)
            {
                switch (_arg_2)
                {
                    case 1:
                        _local_3 = 1;
                        break;
                    case 2:
                        _local_3 = 4;
                        break;
                    case 3:
                        _local_3 = 2;
                        break;
                };
            }
            else
            {
                _local_3 = _arg_1
            };
            return (_local_3);
        }
      
      public static function getSnapShot(param1:MovieClip) : void
      {
         var _loc2_:BitmapData = new BitmapData(Main.Width,Main.Height);
         _loc2_.draw(param1);
         var _loc3_:ByteArray = PNGEncoder.encode(_loc2_);
         Utils.saveFile(_loc3_,"New SSF2 Screenshot.png");
      }
      
      public static function removeActionScript(param1:MovieClip) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.totalFrames)
         {
            param1.addFrameScript(_loc2_,null);
            _loc2_++;
         }
      }
      
      public static function setRandSeed(param1:Number) : void
      {
         Utils.rndm.seed = param1;
         trace("Rand seed set to: " + param1);
      }
      
      public static function random() : Number
      {
         var _loc1_:Number = Utils.rndm.nextDouble();
         lastRandom = _loc1_;
         return _loc1_;
      }
      
      public static function shuffleRandom() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < 100)
         {
            random();
            _loc1_++;
         }
      }
      
      public static function randomInteger(param1:Number, param2:Number) : int
      {
         return Math.round(Utils.random() * (param2 - param1) + param1);
      }
      
      public static function hasLabel(param1:MovieClip, param2:String) : Boolean
      {
         var _loc5_:FrameLabel = null;
         var _loc3_:Boolean = false;
         if(param1 == null)
         {
            return false;
         }
         var _loc4_:int = 0;
         while(_loc4_ < param1.currentLabels.length)
         {
            _loc5_ = param1.currentLabels[_loc4_];
            if(param2 == _loc5_.name)
            {
               return true;
            }
            _loc4_++;
         }
         return false;
      }
      
      public static function fitText(param1:TextField, param2:Number, param3:Number = 1) : void
      {
         var _loc4_:TextFormat = param1.getTextFormat();
         _loc4_.size = param2;
         param1.setTextFormat(_loc4_);
         while(param1.numLines > param3)
         {
            _loc4_.size = Number(_loc4_.size) - 1;
            param1.setTextFormat(_loc4_);
         }
         param1.setTextFormat(_loc4_);
      }
      
      public static function recursiveMovieClipPlay(param1:MovieClip, param2:Boolean, param3:Boolean = false) : void
      {
         var _loc4_:int = 0;
         while(param1 != null && _loc4_ < param1.numChildren)
         {
            if(param1.getChildAt(_loc4_) is MovieClip)
            {
               recursiveMovieClipPlayChildren(MovieClip(param1.getChildAt(_loc4_)),param2,param3);
            }
            _loc4_++;
         }
      }
      
      private static function recursiveMovieClipPlayChildren(param1:MovieClip, param2:Boolean, param3:Boolean = false) : void
      {
         if(!param2)
         {
            param1.stop();
         }
         else
         {
            if(param1.bypassTicker)
            {
               return;
            }
            if(param3)
            {
               param1.play();
            }
            else if(param1.currentFrame == param1.totalFrames)
            {
               param1.gotoAndStop(1);
            }
            else
            {
               param1.nextFrame();
            }
         }
         var _loc4_:int = 0;
         while(_loc4_ < param1.numChildren)
         {
            if(param1.getChildAt(_loc4_) is MovieClip)
            {
               recursiveMovieClipPlayChildren(MovieClip(param1.getChildAt(_loc4_)),param2,param3);
            }
            _loc4_++;
         }
      }
      
      public static function advanceFrame(param1:MovieClip) : void
      {
         if(!param1)
         {
            return;
         }
         if(param1.currentFrame == param1.totalFrames && param1.totalFrames > 1)
         {
            param1.gotoAndStop(1);
         }
         else
         {
            param1.nextFrame();
            param1.stop();
         }
      }
      
      public static function getControlsAngle(param1:Object) : Number
      {
         if(param1.UP && !param1.DOWN && param1.LEFT && !param1.RIGHT)
         {
            return 135;
         }
         if(param1.UP && !param1.DOWN && !param1.LEFT && param1.RIGHT)
         {
            return 45;
         }
         if(!param1.UP && param1.DOWN && param1.LEFT && !param1.RIGHT)
         {
            return 225;
         }
         if(!param1.UP && param1.DOWN && !param1.LEFT && param1.RIGHT)
         {
            return 315;
         }
         if(param1.UP && !param1.DOWN && !param1.LEFT && !param1.RIGHT)
         {
            return 90;
         }
         if(!param1.UP && param1.DOWN && !param1.LEFT && !param1.RIGHT)
         {
            return 270;
         }
         if(!param1.UP && !param1.DOWN && param1.LEFT && !param1.RIGHT)
         {
            return 180;
         }
         if(!param1.UP && !param1.DOWN && !param1.LEFT && param1.RIGHT)
         {
            return 0;
         }
         return -1;
      }
      
      public static function forceBase360(param1:Number) : Number
      {
         while(param1 < 0)
         {
            param1 = param1 + 360;
         }
         while(param1 >= 360)
         {
            param1 = param1 - 360;
         }
         return param1;
      }
      
      public static function calculateDifferenceBetweenAngles(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = param2 - param1;
         while(_loc3_ < -180)
         {
            _loc3_ = _loc3_ + 360;
         }
         while(_loc3_ > 180)
         {
            _loc3_ = _loc3_ - 360;
         }
         return _loc3_;
      }
      
      public static function rotateRectangleAroundOrigin(param1:Rectangle, param2:Number) : Rectangle
      {
         var _loc3_:Point = null;
         var _loc4_:Point = null;
         var _loc5_:Point = null;
         var _loc6_:Point = null;
         var _loc7_:Number = 0;
         var _loc8_:Number = 0;
         var _loc9_:Number = 0;
         var _loc10_:Number = 0;
         var _loc11_:Number = 0;
         var _loc12_:Number = 0;
         var _loc13_:Number = 0;
         var _loc14_:Number = 0;
         var _loc15_:Number = 0;
         var _loc16_:Number = 0;
         var _loc17_:Number = 0;
         var _loc18_:Number = 0;
         if(param2 != 0)
         {
            _loc3_ = new Point(param1.x,param1.y);
            _loc4_ = new Point(param1.x + param1.width,param1.y);
            _loc5_ = new Point(param1.x + param1.width,param1.y + param1.height);
            _loc6_ = new Point(param1.x,param1.y + param1.height);
            _loc11_ = Utils.toRadians(Utils.getAngleBetween(new Point(),_loc3_));
            _loc12_ = Utils.toRadians(Utils.getAngleBetween(new Point(),_loc4_));
            _loc13_ = Utils.toRadians(Utils.getAngleBetween(new Point(),_loc5_));
            _loc14_ = Utils.toRadians(Utils.getAngleBetween(new Point(),_loc6_));
            _loc15_ = Point.distance(new Point(),_loc3_);
            _loc16_ = Point.distance(new Point(),_loc4_);
            _loc17_ = Point.distance(new Point(),_loc5_);
            _loc18_ = Point.distance(new Point(),_loc6_);
            _loc3_ = Point.polar(_loc15_,_loc11_ + Utils.toRadians(param2));
            _loc4_ = Point.polar(_loc16_,_loc12_ + Utils.toRadians(param2));
            _loc5_ = Point.polar(_loc17_,_loc13_ + Utils.toRadians(param2));
            _loc6_ = Point.polar(_loc18_,_loc14_ + Utils.toRadians(param2));
            _loc3_.y = _loc3_.y * -1;
            _loc4_.y = _loc4_.y * -1;
            _loc5_.y = _loc5_.y * -1;
            _loc6_.y = _loc6_.y * -1;
            _loc7_ = Math.min(_loc3_.x,_loc4_.x,_loc5_.x,_loc6_.x);
            _loc8_ = Math.min(_loc3_.y,_loc4_.y,_loc5_.y,_loc6_.y);
            _loc9_ = Math.max(_loc3_.x,_loc4_.x,_loc5_.x,_loc6_.x);
            _loc10_ = Math.max(_loc3_.y,_loc4_.y,_loc5_.y,_loc6_.y);
            param1.x = _loc7_;
            param1.y = _loc8_;
            param1.width = _loc9_ - _loc7_;
            param1.height = _loc10_ - _loc8_;
         }
         return param1;
      }
      
      public static function rotateRectangleAroundOriginPoints(param1:Rectangle, param2:Number, param3:Point, param4:Point) : Vector.<Point>
      {
         var _loc5_:Point = null;
         var _loc6_:Point = null;
         var _loc7_:Point = null;
         var _loc8_:Point = null;
         var _loc9_:Number = 0;
         var _loc10_:Number = 0;
         var _loc11_:Number = 0;
         var _loc12_:Number = 0;
         var _loc13_:Number = 0;
         var _loc14_:Number = 0;
         var _loc15_:Number = 0;
         var _loc16_:Number = 0;
         var _loc17_:Number = 0;
         var _loc18_:Number = 0;
         var _loc19_:Number = 0;
         var _loc20_:Number = 0;
         _loc5_ = new Point(param1.x,param1.y);
         _loc6_ = new Point(param1.x + param1.width,param1.y);
         _loc7_ = new Point(param1.x + param1.width,param1.y + param1.height);
         _loc8_ = new Point(param1.x,param1.y + param1.height);
         if(param2 != 0)
         {
            _loc13_ = Utils.toRadians(Utils.getAngleBetween(new Point(),_loc5_));
            _loc14_ = Utils.toRadians(Utils.getAngleBetween(new Point(),_loc6_));
            _loc15_ = Utils.toRadians(Utils.getAngleBetween(new Point(),_loc7_));
            _loc16_ = Utils.toRadians(Utils.getAngleBetween(new Point(),_loc8_));
            _loc17_ = Point.distance(new Point(),_loc5_);
            _loc18_ = Point.distance(new Point(),_loc6_);
            _loc19_ = Point.distance(new Point(),_loc7_);
            _loc20_ = Point.distance(new Point(),_loc8_);
            _loc5_ = Point.polar(_loc17_,_loc13_ + Utils.toRadians(param2));
            _loc6_ = Point.polar(_loc18_,_loc14_ + Utils.toRadians(param2));
            _loc7_ = Point.polar(_loc19_,_loc15_ + Utils.toRadians(param2));
            _loc8_ = Point.polar(_loc20_,_loc16_ + Utils.toRadians(param2));
            _loc5_.y = _loc5_.y * -1;
            _loc6_.y = _loc6_.y * -1;
            _loc7_.y = _loc7_.y * -1;
            _loc8_.y = _loc8_.y * -1;
         }
         _loc5_.x = _loc5_.x * param3.x;
         _loc5_.y = _loc5_.y * param3.y;
         _loc6_.x = _loc6_.x * param3.x;
         _loc6_.y = _loc6_.y * param3.y;
         _loc7_.x = _loc7_.x * param3.x;
         _loc7_.y = _loc7_.y * param3.y;
         _loc8_.x = _loc8_.x * param3.x;
         _loc8_.y = _loc8_.y * param3.y;
         _loc5_.offset(param4.x,param4.y);
         _loc6_.offset(param4.x,param4.y);
         _loc7_.offset(param4.x,param4.y);
         _loc8_.offset(param4.x,param4.y);
         var _loc21_:Vector.<Point> = new Vector.<Point>();
         _loc21_.push(_loc5_);
         _loc21_.push(_loc6_);
         _loc21_.push(_loc7_);
         _loc21_.push(_loc8_);
         return _loc21_;
      }
      
      public static function rotateAroundCenter(param1:MovieClip, param2:Boolean, param3:Number) : void
      {
      }
      
      public static function testRectangleToPoint(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number) : Boolean
      {
         if(param3 == 0)
         {
            return Math.abs(param4 - param6) < param1 / 2 && Math.abs(param5 - param7) < param2 / 2;
         }
         var _loc8_:Number = Math.cos(param3) * param6 - Math.sin(param3) * param7;
         var _loc9_:Number = Math.cos(param3) * param7 + Math.sin(param3) * param6;
         var _loc10_:Number = Math.cos(param3) * param4 - Math.sin(param3) * param5;
         var _loc11_:Number = Math.cos(param3) * param5 + Math.sin(param3) * param4;
         return Math.abs(_loc10_ - _loc8_) < param1 / 2 && Math.abs(_loc11_ - _loc9_) < param2 / 2;
      }
      
      public static function testCircleToSegment(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number) : Boolean
      {
         var _loc9_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc8_:Number = Math.sqrt(Math.pow(param4 - param6,2) + Math.pow(param5 - param7,2));
         if(_loc8_ == 0)
         {
            _loc9_ = Math.sqrt(Math.pow(param1 - param4,2) + Math.pow(param2 - param5,2));
            return _loc9_ < param3;
         }
         var _loc10_:Number = ((param1 - param4) * (param6 - param4) + (param2 - param5) * (param7 - param5)) / (_loc8_ * _loc8_);
         if(_loc10_ < 0)
         {
            _loc9_ = Math.sqrt(Math.pow(param1 - param4,2) + Math.pow(param2 - param5,2));
         }
         else if(_loc10_ > 1)
         {
            _loc9_ = Math.sqrt(Math.pow(param1 - param6,2) + Math.pow(param2 - param7,2));
         }
         else
         {
            _loc11_ = param4 + _loc10_ * (param6 - param4);
            _loc12_ = param5 + _loc10_ * (param7 - param5);
            _loc9_ = Math.sqrt(Math.pow(param1 - _loc11_,2) + Math.pow(param2 - _loc12_,2));
         }
         return _loc9_ < param3;
      }
      
      public static function testRectangleToCircle(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : Boolean
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         if(param3 == 0)
         {
            _loc9_ = param6;
            _loc10_ = param7;
            _loc11_ = param4;
            _loc12_ = param5;
         }
         else
         {
            _loc9_ = Math.cos(param3) * param6 - Math.sin(param3) * param7;
            _loc10_ = Math.cos(param3) * param7 + Math.sin(param3) * param6;
            _loc11_ = Math.cos(param3) * param4 - Math.sin(param3) * param5;
            _loc12_ = Math.cos(param3) * param5 + Math.sin(param3) * param4;
         }
         return testRectangleToPoint(param1,param2,param3,param4,param5,param6,param7) || testCircleToSegment(_loc9_,_loc10_,param8,_loc11_ - param1 / 2,_loc12_ + param2 / 2,_loc11_ + param1 / 2,_loc12_ + param2 / 2) || testCircleToSegment(_loc9_,_loc10_,param8,_loc11_ + param1 / 2,_loc12_ + param2 / 2,_loc11_ + param1 / 2,_loc12_ - param2 / 2) || testCircleToSegment(_loc9_,_loc10_,param8,_loc11_ + param1 / 2,_loc12_ - param2 / 2,_loc11_ - param1 / 2,_loc12_ - param2 / 2) || testCircleToSegment(_loc9_,_loc10_,param8,_loc11_ - param1 / 2,_loc12_ - param2 / 2,_loc11_ - param1 / 2,_loc12_ + param2 / 2);
      }
      
      public static function getVelocityVector(param1:Number, param2:Number) : Point
      {
         var _loc3_:Point = new Point();
         _loc3_.x = param1 * Math.cos(param2 * Math.PI / 180);
         _loc3_.y = param1 * Math.sin(param2 * Math.PI / 180);
         return _loc3_;
      }
      
      public static function getAngleBetween(param1:Point, param2:Point) : Number
      {
         return Utils.forceBase360(Math.atan2(-(param2.y - param1.y),param2.x - param1.x) * 180 / Math.PI);
      }
      
      public static function calculateCamShake(param1:AttackDamage) : Number
      {
         return Math.floor((Math.floor(0.25 * param1.Damage + 0.75 * (0.001 * (Math.abs(param1.Power) * (param1.Power > 0?param1.KBConstant:1))) - 5) + 3) / 2);
      }
      
      public static function calculateAttackDirection(param1:AttackDamage, param2:InteractiveSprite, param3:InteractiveSprite = null) : Number
      {
         var _loc4_:Boolean = true;
         var _loc5_:Boolean = param1.IsForward;
         var _loc6_:Number = 0;
         if(param1.Direction == -1)
         {
            _loc6_ = Math.round(Utils.random() * 360);
         }
         else if(param1.Direction == -2)
         {
            _loc6_ = Math.round(Utils.random() * (150 - 60)) + 60;
         }
         else if(param1.Direction == -3)
         {
            _loc6_ = param1.XLoc < param2.X?Number(75):Number(115);
            _loc5_ = param1.XLoc < param2.X;
            _loc4_ = false;
         }
         else if(param1.Direction == -4)
         {
            _loc6_ = param1.XLoc < param2.X?Number(20):Number(160);
            _loc5_ = param1.XLoc < param2.X;
            _loc4_ = false;
         }
         else if(param1.Direction == -5)
         {
            _loc6_ = param1.XLoc < param2.X?Number(160):Number(20);
            _loc5_ = param1.XLoc < param2.X;
            _loc4_ = false;
         }
         else if(param1.Direction == -6)
         {
            _loc6_ = param1.YLoc < param2.Y?Number(115):Number(75);
            _loc5_ = param1.XLoc < param2.X;
            _loc4_ = false;
         }
         else if(param1.Direction == -7)
         {
            _loc6_ = param1.YLoc < param2.Y?Number(90):Number(270);
         }
         else if(param1.Direction == -8)
         {
            _loc6_ = Utils.getAngleBetween(new Point(param2.X,param2.Y),new Point(param2.X + param2.netXSpeed(),param2.Y + param2.netYSpeed()));
            _loc4_ = false;
         }
         else if(param1.Direction == -9 && param3)
         {
            if(Projectile(param1.Owner))
            {
               if(Projectile(param1.Owner).XSpeed != 0 || Projectile(param1.Owner).YSpeed != 0)
               {
                  _loc6_ = Utils.getAngleBetween(new Point(param2.X,param2.Y),new Point(param2.X + Projectile(param1.Owner).XSpeed,param2.Y + Projectile(param1.Owner).YSpeed));
               }
            }
            else if(Item(param1.Owner))
            {
               if(Item(param1.Owner).XSpeed != 0 || Item(param1).YSpeed != 0)
               {
                  _loc6_ = Utils.getAngleBetween(new Point(param2.X,param2.Y),new Point(param2.X + Item(param1).XSpeed,param2.Y + Item(param1).YSpeed));
               }
            }
            else if(!Projectile(param1.Owner) && !Item(param1))
            {
               if(param3.netXSpeed() != 0 || param3.netYSpeed() != 0)
               {
                  _loc6_ = Utils.getAngleBetween(new Point(param2.X,param2.Y),new Point(param2.X + param2.netXSpeed(),param2.Y + param2.netYSpeed()));
               }
               else
               {
                  _loc6_ = Utils.getAngleBetween(new Point(param2.X,param2.Y),new Point(param2.X + param3.netXSpeed(),param2.Y + param3.netYSpeed()));
               }
            }
            _loc4_ = false;
         }
         else
         {
            _loc6_ = param1.Direction;
         }
         if(!_loc5_ && _loc4_)
         {
            _loc6_ = 180 - _loc6_;
         }
         return _loc6_;
      }
      
      public static function calculateChargeDamage(param1:AttackDamage, param2:Number = -1) : Number
      {
         var _loc3_:Number = param2 >= 0?Number(param2):Number(param1.Damage);
         if(param1.SizeStatus != 0)
         {
            _loc3_ = _loc3_ * (param1.SizeStatus == 1?1.25:0.75);
         }
         if(param1.Owner as Projectile && param1.ChargeTimeMax > 0 && !param1.IgnoreChargeDamage)
         {
            _loc3_ = (_loc3_ * 0.25 + _loc3_ * 0.75 * (param1.ChargeTime / param1.ChargeTimeMax)) * param1.ChargeDamageMultiplier;
         }
         else if(param1.ChargeTimeMax > 0 && !param1.IgnoreChargeDamage)
         {
            if(param1.ChargeTime / param1.ChargeTimeMax > 0.95)
            {
               _loc3_ = _loc3_ * (1.4 * param1.ChargeDamageMultiplier);
            }
            else if(param1.ChargeTime / param1.ChargeTimeMax > 0.75)
            {
               _loc3_ = _loc3_ * ((1 + param1.ChargeTime / param1.ChargeTimeMax * 0.4) * param1.ChargeDamageMultiplier);
            }
         }
         return _loc3_;
      }
      
      public static function calculateHitlag(param1:Number, param2:Number) : Number
      {
         var _loc4_:Number = NaN;
         var _loc3_:Number = Math.floor(param1 * 0.4 * (Main.FRAMERATE / 60));
         if(param2 < 0)
         {
            if(param2 < 0)
            {
               param2 = param2 * -1;
            }
            _loc4_ = _loc3_;
            return Math.ceil(_loc4_ * param2);
         }
         return Math.round(param2);
      }
      
      public static function calculateKnockback(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Boolean, param8:Number) : Number
      {
         var _loc9_:Number = 1;
         var _loc10_:Number = 0;
         if(param4 > 999)
         {
            param4 = 999;
         }
         if(param3 != 0)
         {
            if(param2 <= 0)
            {
               param2 = param2 * -1;
            }
            _loc10_ = ((param3 * 10 * 0.05 + 1) * _loc9_ * 1.4 * (200 / (param6 + 100)) + 18) * (param1 * 0.01) + param2;
         }
         else
         {
            _loc10_ = (((param5 + param4) * 0.1 + param4 * (param5 + param4) * 0.05) * _loc9_ * 1.4 * (200 / (param6 + 100)) + 18) * (param1 * 0.01) + param2;
         }
         if(param7)
         {
            _loc10_ = _loc10_ * 1.2;
         }
         _loc10_ = _loc10_ * param8;
         return _loc10_;
      }
      
      public static function calculateVelocity(param1:Number) : Number
      {
         var _loc2_:Number = 0;
         _loc2_ = param1 * 0.03 * Utils.VELOCITY_SCALE;
         return _loc2_;
      }
      
      public static function calculateKnockbackFromVelocity(param1:Number) : Number
      {
         return param1 / (0.03 * Utils.VELOCITY_SCALE);
      }
      
      public static function calculateHitStun(param1:int, param2:Number, param3:Boolean, param4:Boolean) : int
      {
         if(param1 >= 0)
         {
            return param1;
         }
         var _loc5_:Number = !!param3?Number(1.5):Number(1);
         var _loc6_:Number = !!param4?Number(2 / 3):Number(1);
         return Math.ceil(_loc6_ * Math.floor(_loc5_ * Math.floor(param2 / 3 + 3)));
      }
      
      public static function calculateSelfHitStun(param1:int, param2:Number) : int
      {
         if(param1 >= 0)
         {
            return param1;
         }
         return Math.ceil(param2 / 3 + 3);
      }
      
      public static function getClass(param1:Object) : Class
      {
         return Class(getDefinitionByName(getQualifiedClassName(param1)));
      }
      
      public static function dijkstra(param1:StageData, param2:Vector.<Beacon>, param3:Array, param4:Beacon, param5:Beacon) : Array
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc11_:int = 0;
         param1.markBeaconsUnvisited();
         var _loc10_:int = param2.length;
         var _loc12_:Array = new Array(param2.length);
         var _loc13_:Array = new Array(param2.length);
         var _loc14_:Array = new Array(param2.length);
         _loc6_ = 0;
         while(_loc6_ < param2.length)
         {
            _loc12_[_loc6_] = int.MAX_VALUE;
            _loc13_[_loc6_] = -1;
            _loc14_[_loc6_] = -1;
            _loc6_++;
         }
         _loc12_[param4.BID] = 0;
         _loc11_ = param4.BID;
         while(_loc10_ > 0)
         {
            _loc8_ = -1;
            _loc9_ = int.MAX_VALUE;
            _loc6_ = 0;
            while(_loc6_ < param2.length)
            {
               if(param2[_loc6_].Visited == false && _loc12_[_loc6_] < _loc9_)
               {
                  _loc9_ = _loc12_[_loc6_];
                  _loc8_ = _loc6_;
               }
               _loc6_++;
            }
            if(_loc9_ == int.MAX_VALUE || _loc8_ == -1)
            {
               break;
            }
            param2[_loc8_].Visited = true;
            _loc10_--;
            _loc7_ = Beacon.nextNeighbor(param1.getBeacons(),param1.getAdjMatrix(),_loc8_,-1);
            while(_loc7_ < param2.length)
            {
               if(param2[_loc7_].Visited == false && _loc12_[_loc7_] > _loc9_ + param3[_loc8_][_loc7_])
               {
                  _loc12_[_loc7_] = _loc9_ + param3[_loc8_][_loc7_];
                  _loc13_[_loc7_] = _loc8_;
                  _loc11_ = _loc7_;
               }
               _loc7_ = Beacon.nextNeighbor(param1.getBeacons(),param1.getAdjMatrix(),_loc8_,_loc7_);
            }
         }
         return _loc13_;
      }
      
      public static function getPath(param1:Vector.<Beacon>, param2:Array, param3:Number, param4:Number) : Vector.<Beacon>
      {
         var _loc5_:Vector.<Beacon> = new Vector.<Beacon>();
         _loc5_.push(param1[param4]);
         while(param4 != param3)
         {
            _loc5_.push(param1[param2[param4]]);
            param4 = param2[param4];
         }
         return _loc5_;
      }
      
      public static function getClosetBeaconTo(param1:StageData, param2:MovieClip) : Beacon
      {
         var _loc3_:Beacon = null;
         var _loc4_:Beacon = null;
         var _loc5_:Number = int.MAX_VALUE;
         var _loc6_:Number = 0;
         var _loc7_:Vector.<Beacon> = param1.getBeacons();
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_.length)
         {
            _loc6_ = Math.sqrt(Math.pow(_loc7_[_loc8_].X - param2.x,2) + Math.pow(_loc7_[_loc8_].Y - param2.y,2));
            if(_loc6_ < _loc5_ && param1.beaconNeighborCount(_loc7_[_loc8_].BID) > 0)
            {
               _loc5_ = _loc6_;
               _loc3_ = _loc7_[_loc8_];
            }
            _loc8_++;
         }
         return _loc3_;
      }
      
      public static function get WeightBase() : Number
      {
         return 3.78 * 2.6455;
      }
      
      private static function xor(param1:String) : String
      {
         var _loc2_:String = KEY;
         var _loc3_:String = new String();
         var _loc4_:Number = 0;
         while(_loc4_ < param1.length)
         {
            if(_loc4_ > _loc2_.length - 1)
            {
               _loc2_ = _loc2_ + _loc2_;
            }
            _loc3_ = _loc3_ + String.fromCharCode(param1.charCodeAt(_loc4_) ^ _loc2_.charCodeAt(_loc4_));
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function encrypt(param1:String) : String
      {
         var _loc2_:String = param1;
         return Base64.encode(Utils.xor(_loc2_));
      }
      
      public static function decrypt(param1:String) : String
      {
         var _loc2_:String = param1;
         return Utils.xor(Base64.decode(_loc2_));
      }
      
      public static function openFile(param1:String = "SSF2 Save File (*.ssfsav)", param2:String = "*.ssfsav") : void
      {
         Utils.openSuccess = false;
         Utils.finishedLoading = false;
         Utils.cancelled = false;
         fileRef = new FileReference();
         fileRef.addEventListener(Event.SELECT,Utils.onFileSelected);
         fileRef.addEventListener(Event.CANCEL,Utils.onCancel);
         fileRef.addEventListener(IOErrorEvent.IO_ERROR,Utils.onIOError);
         fileRef.addEventListener(SecurityErrorEvent.SECURITY_ERROR,Utils.onSecurityError);
         fileRef.addEventListener(ProgressEvent.PROGRESS,onProgress);
         fileRef.addEventListener(Event.COMPLETE,onComplete);
         var _loc3_:FileFilter = new FileFilter(param1,param2);
         fileRef.browse([_loc3_]);
      }
      
      private static function killFileOpenEvents() : void
      {
         fileRef.removeEventListener(ProgressEvent.PROGRESS,onProgress);
         fileRef.removeEventListener(Event.COMPLETE,onComplete);
         fileRef.removeEventListener(Event.CANCEL,Utils.onCancel);
         fileRef.removeEventListener(IOErrorEvent.IO_ERROR,Utils.onIOError);
         fileRef.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,Utils.onSecurityError);
      }
      
      private static function onFileSelected(param1:Event) : void
      {
         fileRef.addEventListener(ProgressEvent.PROGRESS,onProgress);
         fileRef.addEventListener(Event.COMPLETE,onComplete);
         fileRef.load();
         fileRef.removeEventListener(Event.SELECT,Utils.onFileSelected);
      }
      
      private static function onProgress(param1:ProgressEvent) : void
      {
         trace("Loaded " + param1.bytesLoaded + " of " + param1.bytesTotal + " bytes.");
      }
      
      private static function onComplete(param1:Event) : void
      {
         trace("File was successfully loaded.");
         Utils.finishedLoading = true;
         Utils.openSuccess = true;
         killFileOpenEvents();
      }
      
      private static function onCancel(param1:Event) : void
      {
         trace("The browse request was canceled by the user.");
         Utils.cancelled = true;
         Utils.openSuccess = false;
         Utils.finishedLoading = true;
         killFileOpenEvents();
      }
      
      private static function onIOError(param1:IOErrorEvent) : void
      {
         trace("There was an IO Error.");
         Utils.openSuccess = false;
         Utils.finishedLoading = true;
         killFileOpenEvents();
      }
      
      private static function onSecurityError(param1:Event) : void
      {
         trace("There was a security error.");
         Utils.openSuccess = false;
         Utils.finishedLoading = true;
         killFileOpenEvents();
      }
      
      public static function saveFile(param1:ByteArray, param2:String) : void
      {
         Utils.saveSuccess = false;
         Utils.finishedLoading = false;
         Utils.cancelled = false;
         fileRef = new FileReference();
         fileRef.addEventListener(Event.SELECT,onSaveFileSelected);
         fileRef.addEventListener(IOErrorEvent.IO_ERROR,Utils.onSaveIOError);
         fileRef.addEventListener(SecurityErrorEvent.SECURITY_ERROR,Utils.onSaveSecurityError);
         fileRef.addEventListener(ProgressEvent.PROGRESS,onSaveProgress);
         fileRef.addEventListener(Event.COMPLETE,onSaveComplete);
         fileRef.save(param1,param2);
         fileRef.removeEventListener(Event.SELECT,onSaveFileSelected);
      }
      
      private static function killSaveEvents() : void
      {
         fileRef.removeEventListener(ProgressEvent.PROGRESS,onSaveProgress);
         fileRef.removeEventListener(Event.COMPLETE,onSaveComplete);
         fileRef.removeEventListener(Event.CANCEL,onSaveCancel);
         fileRef.removeEventListener(IOErrorEvent.IO_ERROR,Utils.onSaveIOError);
         fileRef.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,Utils.onSaveSecurityError);
      }
      
      private static function onSaveFileSelected(param1:Event) : void
      {
         fileRef.addEventListener(ProgressEvent.PROGRESS,onSaveProgress);
         fileRef.addEventListener(Event.COMPLETE,onSaveComplete);
         fileRef.addEventListener(Event.CANCEL,onSaveCancel);
      }
      
      private static function onSaveProgress(param1:ProgressEvent) : void
      {
         trace("Saved " + param1.bytesLoaded + " of " + param1.bytesTotal + " bytes.");
      }
      
      private static function onSaveComplete(param1:Event) : void
      {
         trace("File saved.");
         Utils.finishedLoading = true;
         Utils.saveSuccess = true;
         killSaveEvents();
      }
      
      private static function onSaveCancel(param1:Event) : void
      {
         trace("The save request was canceled by the user.");
         Utils.cancelled = true;
         Utils.finishedLoading = true;
         Utils.saveSuccess = false;
         killSaveEvents();
      }
      
      private static function onSaveIOError(param1:IOErrorEvent) : void
      {
         trace("There was an IO Error.");
         Utils.finishedLoading = true;
         Utils.saveSuccess = false;
         killSaveEvents();
      }
      
      private static function onSaveSecurityError(param1:Event) : void
      {
         trace("There was a security error.");
         Utils.finishedLoading = true;
         Utils.saveSuccess = false;
         killSaveEvents();
      }
      
      public static function loadDataFile(param1:String) : void
      {
         var _loc2_:URLLoader = new URLLoader();
         _loc2_.dataFormat = URLLoaderDataFormat.BINARY;
         _loc2_.addEventListener(Event.COMPLETE,onLoaded);
         _loc2_.load(new URLRequest(param1));
         Utils.finishedLoading = false;
      }
      
      private static function onLoaded(param1:Event) : void
      {
         trace("Loaded");
         Utils.finishedLoading = true;
      }
      
      public static function parseForCodeBlock(param1:String, param2:int) : String
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc3_:int = 0;
         stackSafety++;
         if(stackSafety > 10000)
         {
            return null;
         }
         var _loc4_:String = "";
         if(param2 > -1)
         {
            _loc5_ = param1.indexOf("{",param2);
            if(_loc5_ >= 0)
            {
               _loc6_ = 1;
               _loc5_ = _loc5_ + 1;
               while(_loc6_ > 0 && _loc5_ < param1.length && _loc5_ > 0)
               {
                  _loc3_++;
                  if(_loc3_ > 50000)
                  {
                     return null;
                  }
                  _loc7_ = param1.indexOf("}",_loc5_);
                  _loc8_ = param1.indexOf("{",_loc5_);
                  if(_loc7_ > 0 || _loc8_ > 0)
                  {
                     _loc9_ = -1;
                     if(_loc7_ < _loc8_ && _loc7_ >= 0 || _loc7_ >= 0 && _loc8_ < 0)
                     {
                        _loc6_--;
                        _loc9_ = _loc7_;
                     }
                     else
                     {
                        _loc6_++;
                        _loc9_ = _loc8_;
                     }
                     _loc4_ = _loc4_ + param1.substr(_loc5_,_loc9_ - _loc5_ + 1);
                     _loc5_ = _loc9_ + 1;
                     continue;
                  }
                  trace("Error! Malformed Brackets detected in file!");
                  return null;
               }
               if(_loc4_.lastIndexOf("}") == _loc4_.length - 1)
               {
                  _loc4_ = _loc4_.substr(0,_loc4_.length - 1);
               }
            }
         }
         stackSafety--;
         return Utils.condenseString(_loc4_);
      }
      
      private static function condenseString(param1:String) : String
      {
         param1 = param1.split(" ").join("");
         param1 = param1.split("\r").join("");
         param1 = param1.split("\t").join("");
         param1 = param1.split("%20").join(" ");
         return param1;
      }
      
      public static function convertStringToObject(param1:String) : Object
      {
         return stringToObject(param1);
      }
      
      private static function stringToObject(param1:String) : Object
      {
         var _loc7_:* = undefined;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc2_:String = null;
         var _loc3_:String = param1;
         var _loc4_:String = _loc3_;
         var _loc5_:Object = new Object();
         var _loc6_:Object = new Object();
         while(_loc4_.indexOf(":{") >= 0)
         {
            stackSafety = 0;
            _loc2_ = Utils.parseForCodeBlock(_loc4_,0);
            if(_loc2_ === null)
            {
               return null;
            }
            _loc4_ = _loc4_.replace(":{" + _loc2_ + "}","");
         }
         while(_loc3_.indexOf(":{") >= 0)
         {
            _loc8_ = _loc3_.indexOf(":{");
            _loc9_ = _loc8_ - 1;
            while(_loc9_ >= 0 && _loc3_.charAt(_loc9_) != "," && _loc3_.charAt(_loc9_) != ":" && _loc3_.charAt(_loc9_) != "{")
            {
               _loc9_--;
            }
            _loc9_++;
            stackSafety = 0;
            _loc2_ = Utils.parseForCodeBlock(_loc3_,0);
            if(_loc2_ === null)
            {
               return null;
            }
            _loc6_[_loc3_.substring(_loc9_,_loc8_)] = stringToObject(_loc2_);
            stackSafety = 0;
            _loc2_ = Utils.parseForCodeBlock(_loc3_,0);
            if(_loc2_ === null)
            {
               return null;
            }
            _loc3_ = _loc3_.replace(":{" + _loc2_ + "}","");
         }
         _loc5_ = retrieveObjectData(_loc4_);
         for(_loc7_ in _loc6_)
         {
            _loc5_[_loc7_] = _loc6_[_loc7_];
         }
         return _loc5_;
      }
      
      private static function retrieveObjectData(param1:String) : Object
      {
         var _loc5_:Array = null;
         var _loc2_:Object = new Object();
         var _loc3_:Array = param1.split(",");
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = String(_loc3_[_loc4_]).split(":");
            if(_loc5_.length == 2)
            {
               if(_loc5_[1] == "null")
               {
                  _loc2_[_loc5_[0]] = null;
               }
               else if(_loc5_[1] == "true" || _loc5_[1] == "false")
               {
                  _loc2_[_loc5_[0]] = _loc5_[1] == "true"?true:false;
               }
               else if(String(_loc5_[1]).indexOf("\"") == 0 && String(_loc5_[1]).lastIndexOf("\"") > 0 && String(_loc5_[1]).substring(1,String(_loc5_[1]).lastIndexOf("\"")).length == String(_loc5_[1]).length - 2)
               {
                  _loc2_[_loc5_[0]] = String(_loc5_[1]).substring(1,String(_loc5_[1]).lastIndexOf("\""));
               }
               else if(String(_loc5_[1]).indexOf("\"") >= 0)
               {
                  trace("Error with quotes on object[" + _loc5_[0] + "] = " + _loc5_[1]);
               }
               else if(isNaN(Number(_loc5_[1])))
               {
                  trace("Error, unknown variable type on object[" + _loc5_[0] + "] = " + _loc5_[1]);
               }
               else
               {
                  _loc2_[_loc5_[0]] = Number(_loc5_[1]);
               }
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      public static function solveString(param1:String) : String
      {
         var total:Vector.<Number> = null;
         var symbol:Array = null;
         var plusOrMinus:Array = null;
         var timesOrDivide:Array = null;
         var charEquation:Array = null;
         var i:int = 0;
         var j:int = 0;
         var num1_Start:int = 0;
         var num1_End:int = 0;
         var num2_Start:int = 0;
         var num2_End:int = 0;
         var num1_str:String = null;
         var num2_str:String = null;
         var answer:String = null;
         var num1:Number = NaN;
         var num2:Number = NaN;
         var pos:int = 0;
         var numBuffer:Number = NaN;
         var equation:String = param1;
         try
         {
            total = new Vector.<Number>();
            symbol = new Array("+","-","*","/");
            plusOrMinus = new Array("+","-");
            timesOrDivide = new Array("*","/");
            charEquation = Utils.toCharArray(equation);
            i = 0;
            while(i < charEquation.length)
            {
               if(Utils.indexOfAny(equation,symbol,i,1) > -1 && charEquation[i + 1] == "-")
               {
                  charEquation[i + 1] = "!";
               }
               i++;
            }
            equation = "";
            j = 0;
            while(j < charEquation.length)
            {
               equation = equation + charEquation[j];
               j++;
            }
            equation = "0+" + equation + "+0";
            num1_Start = 0;
            num1_End = 0;
            num2_Start = 0;
            num2_End = 0;
            num1_str = "";
            num2_str = "";
            answer = "";
            num1 = 0;
            num2 = 0;
            pos = 0;
            numBuffer = 0;
            while(Utils.indexOfAny(equation,timesOrDivide,0,equation.length) > -1)
            {
               pos = Utils.lastIndexOfAny(equation,plusOrMinus,0,Utils.indexOfAny(equation,timesOrDivide,0,equation.length));
               num1_Start = pos + 1;
               num1_End = Utils.indexOfAny(equation,timesOrDivide,0,equation.length) - 1;
               num2_Start = Utils.indexOfAny(equation,timesOrDivide,0,equation.length) + 1;
               num2_End = Utils.indexOfAny(equation,symbol,Utils.indexOfAny(equation,timesOrDivide,0,equation.length) + 1,equation.length - 1) - 1;
               num1_str = equation.substr(num1_Start,num1_End - num1_Start + 1);
               num2_str = equation.substr(num2_Start,num2_End - num2_Start + 1);
               if(num1_str.indexOf("!") > -1)
               {
                  num1_str = num1_str.split("!").join("-");
               }
               if(num2_str.indexOf("!") > -1)
               {
                  num2_str = num2_str.split("!").join("-");
               }
               num1 = Number(num1_str);
               num2 = Number(num2_str);
               if(equation.substr(Utils.indexOfAny(equation,timesOrDivide,0,equation.length),1) == "*")
               {
                  answer = String(num1 * num2);
               }
               else
               {
                  answer = String(num1 / num2);
               }
               if(answer.indexOf("-") > -1)
               {
                  answer = answer.split("-").join("!");
               }
               if(answer.indexOf("-") > -1)
               {
                  answer = answer.split("-").join("!");
               }
               equation = equation.substr(0,num1_Start) + answer + equation.substr(num2_End + 1,equation.length - num2_End - 1);
            }
            equation = "+" + equation;
            while(Utils.indexOfAny(equation,plusOrMinus,0,equation.length) > -1)
            {
               if(equation.substr(1,1) == "!")
               {
                  if(equation.substr(0,1) == "+")
                  {
                     total.push(Number("-" + equation.substr(2,Utils.indexOfAny(equation,plusOrMinus,1,equation.length) - 2)));
                     equation = equation.substr(Utils.indexOfAny(equation,plusOrMinus,1,equation.length),equation.length);
                  }
                  else
                  {
                     total.push(Number("-" + equation.substr(1,Utils.indexOfAny(equation,plusOrMinus,1,equation.length) - 1)));
                     equation = equation.substr(Utils.indexOfAny(equation,plusOrMinus,1,equation.length),equation.length);
                  }
               }
               else if(equation.length > 2)
               {
                  if(equation.substr(0,1) == "+")
                  {
                     total.push(Number(equation.substr(1,Utils.indexOfAny(equation,plusOrMinus,1,equation.length) - 1)));
                     equation = equation.substr(Utils.indexOfAny(equation,plusOrMinus,1,equation.length),equation.length);
                  }
                  else
                  {
                     total.push(Number("-" + equation.substr(1,Utils.indexOfAny(equation,plusOrMinus,1,equation.length) - 1)));
                     equation = equation.substr(Utils.indexOfAny(equation,plusOrMinus,1,equation.length),equation.length);
                  }
               }
               else
               {
                  equation = "";
               }
            }
            while(total.length > 0)
            {
               numBuffer = numBuffer + total.pop();
            }
         }
         catch(error:Error)
         {
            return null;
         }
         return String(numBuffer);
      }
      
      private static function toCharArray(param1:String) : Array
      {
         var _loc2_:Array = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_.push(param1.substr(_loc3_,1));
            _loc3_++;
         }
         return _loc2_;
      }
      
      private static function indexOfAny(param1:String, param2:Array, param3:int, param4:int) : int
      {
         var _loc8_:int = 0;
         var _loc5_:int = -1;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         while(_loc7_ < param2.length)
         {
            _loc6_ = 0;
            _loc8_ = param3;
            while(_loc8_ < param1.length && _loc6_ < param4)
            {
               if(param1.substr(_loc8_,1) == param2[_loc7_])
               {
                  _loc5_ = _loc8_;
                  return _loc5_;
               }
               _loc6_++;
               _loc8_++;
            }
            _loc7_++;
         }
         return _loc5_;
      }
      
      private static function lastIndexOfAny(param1:String, param2:Array, param3:int, param4:int) : int
      {
         var _loc8_:int = 0;
         var _loc5_:int = -1;
         var _loc6_:int = 0;
         var _loc7_:int = param2.length - 1;
         while(_loc7_ >= 0)
         {
            _loc6_ = 0;
            _loc8_ = param3;
            while(_loc8_ < param1.length && _loc6_ < param4)
            {
               if(param1.substr(_loc8_,1) == param2[_loc7_] && _loc8_ > _loc5_)
               {
                  _loc5_ = _loc8_;
               }
               _loc6_++;
               _loc8_++;
            }
            _loc7_--;
         }
         return _loc5_;
      }
      
      public static function isObject(param1:*) : Object
      {
         if(param1 is int || param1 is uint || param1 is Number || param1 is String || param1 is Boolean)
         {
            return false;
         }
         return true;
      }
      
      public static function convertObjectToString(param1:Object) : String
      {
         var _loc3_:* = undefined;
         var _loc2_:String = "";
         for(_loc3_ in param1)
         {
            if(param1[_loc3_] == null)
            {
               _loc2_ = _loc2_ + (_loc3_ + ":null,");
            }
            else if(Utils.isObject(param1[_loc3_]))
            {
               _loc2_ = _loc2_ + (_loc3_ + ":{" + convertObjectToString(param1[_loc3_]) + "},");
            }
            else if(param1[_loc3_] is String)
            {
               _loc2_ = _loc2_ + (_loc3_ + ":\"" + param1[_loc3_] + "\",");
            }
            else
            {
               _loc2_ = _loc2_ + (_loc3_ + ":" + param1[_loc3_] + ",");
            }
         }
         if(_loc2_.lastIndexOf(",") == _loc2_.length - 1)
         {
            _loc2_ = _loc2_.substr(0,_loc2_.length - 1);
         }
         return _loc2_;
      }
   }
}
