package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   import flash.utils.Dictionary;
   
   public class SMISnow extends StageHazard
   {
       
      
      private var m_snowflakes:Array;
      
      private var m_snowflakeProps:Dictionary;
      
      private var m_max_snowsize:Number;
      
      private var m_snowflakesCnt:Number;
      
      private var m_oheight:Number;
      
      private var m_owidth:Number;
      
      private var m_container:MovieClip;
      
      private var m_flakesReady:Boolean;
      
      public function SMISnow(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
         this.m_snowflakes = new Array();
         this.m_snowflakeProps = new Dictionary(true);
         this.m_max_snowsize = 0.04;
         this.m_snowflakesCnt = 100;
         this.m_owidth = Main.Width;
         this.m_oheight = Main.Height;
         this.m_container = STAGEDATA.WeatherRef;
         this.m_flakesReady = false;
         m_delayStart = false;
         m_safe = true;
         this.init();
      }
      
      override protected function runHazard() : void
      {
         if(!this.m_flakesReady && (this.m_container.visible && this.m_container.parent != null && this.m_container.parent.visible))
         {
            this.prepFlakes();
            this.m_flakesReady = true;
         }
         this.snowFlakeMover();
      }
      
      protected function init() : void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:Object = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.m_snowflakesCnt)
         {
            _loc2_ = Utils.random() > 0.5?Main.getLibraryMC("snowflake"):Main.getLibraryMC("snowdrop");
            _loc2_.name = "snowflake" + _loc1_;
            _loc2_.alpha = 0.2 + Utils.random() * 0.6;
            _loc3_ = new Object();
            _loc3_.k = 1 + Utils.random() * 2;
            _loc3_.wind = -1.5 + Utils.random() * (1.4 * 3);
            this.m_snowflakeProps[_loc2_] = _loc3_;
            this.m_container.addChild(_loc2_);
            this.m_snowflakes.push(_loc2_);
            _loc1_++;
         }
      }
      
      private function prepFlakes() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < 30 * 10)
         {
            this.snowFlakeMover();
            _loc1_++;
         }
      }
      
      protected function shakeUp() : void
      {
         var _loc2_:MovieClip = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.m_snowflakes.length)
         {
            _loc2_ = this.m_snowflakes[_loc1_] as MovieClip;
            _loc2_.x = -(this.m_owidth / 2) + Utils.random() * (1.5 * this.m_owidth);
            _loc2_.y = -(this.m_oheight / 2) + Utils.random() * (1.5 * this.m_oheight);
            _loc1_++;
         }
      }
      
      protected function snowFlakeMover() : void
      {
         var _loc1_:MovieClip = null;
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         if(this.m_container.visible && this.m_container.parent != null && this.m_container.root != null)
         {
            _loc3_ = 0;
            while(_loc3_ < this.m_snowflakes.length)
            {
               _loc1_ = this.m_snowflakes[_loc3_] as MovieClip;
               _loc2_ = this.m_snowflakeProps[_loc1_];
               _loc1_.y = _loc1_.y + _loc2_.k;
               _loc1_.x = _loc1_.x + _loc2_.wind;
               if(_loc1_.y > this.m_oheight + 10)
               {
                  _loc1_.y = -20;
               }
               if(_loc1_.x > this.m_owidth + 20)
               {
                  _loc1_.x = -(this.m_owidth / 2) + Utils.random() * (1.5 * this.m_owidth);
                  _loc1_.y = -20;
               }
               else if(_loc1_.x < -20)
               {
                  _loc1_.x = -(this.m_owidth / 2) + Utils.random() * (1.5 * this.m_owidth);
                  _loc1_.y = -20;
               }
               _loc3_++;
            }
         }
      }
   }
}
