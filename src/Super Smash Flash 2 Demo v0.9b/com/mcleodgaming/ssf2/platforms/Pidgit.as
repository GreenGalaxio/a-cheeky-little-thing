package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import flash.display.MovieClip;
   
   public class Pidgit extends MovingPlatform
   {
       
      
      private var m_goingRight:Boolean;
      
      private var m_goingUp:Boolean;
      
      private var m_xPercent:Number;
      
      private var m_yPercent:Number;
      
      private var m_yHide:Number;
      
      private var m_yCount:Number;
      
      private var m_yCount_max:Number;
      
      private var m_appearClock:FrameTimer;
      
      private var m_comingIn:Boolean;
      
      private var m_waiting:Boolean;
      
      private const XSPEED:Number = 7;
      
      private const YSPEED:Number = 3;
      
      private const ENTRANCESPEED:Number = 15;
      
      public function Pidgit(param1:MovieClip, param2:StageData)
      {
         super(param1,param2);
         m_x_start = m_platform.x;
         this.m_yCount = 0;
         this.m_yCount_max = 600;
         this.m_yHide = m_platform.y - this.m_yCount_max;
         m_platform.y = this.m_yHide;
         this.m_appearClock = new FrameTimer(150);
         this.m_comingIn = false;
         this.m_waiting = true;
         m_y_start = m_platform.y;
         m_xSpeed = 0;
         m_ySpeed = 0;
         this.m_xPercent = 25;
         this.m_yPercent = 125;
         this.m_goingRight = true;
         this.m_goingUp = true;
      }
      
      override protected function move() : void
      {
         storeOldLocation();
         this.m_xPercent = this.m_xPercent + (!!this.m_goingRight?0.7:-0.7);
         this.m_yPercent = this.m_yPercent + (!!this.m_goingUp?0.7:-0.7);
         if(this.m_xPercent > 100)
         {
            this.m_xPercent = 99;
            this.m_goingRight = false;
         }
         else if(this.m_xPercent < 0)
         {
            this.m_xPercent = 1;
            this.m_goingRight = true;
         }
         if(this.m_yPercent > 100)
         {
            this.m_yPercent = 99;
            this.m_goingUp = false;
         }
         else if(this.m_yPercent < 0)
         {
            this.m_yPercent = 1;
            this.m_goingUp = true;
         }
         m_xSpeed = !!this.m_goingRight?Number(this.XSPEED * Math.sin(this.m_xPercent / 100 * (2 * Math.PI))):Number(-this.XSPEED * Math.sin(this.m_xPercent / 100 * (2 * Math.PI)));
         if(m_xSpeed > 0)
         {
            m_ySpeed = !this.m_goingUp?Number(this.YSPEED * Math.sin(this.m_yPercent / 100 * (2 * Math.PI))):Number(-this.YSPEED * Math.sin(this.m_yPercent / 100 * (2 * Math.PI)));
         }
         else
         {
            m_ySpeed = !!this.m_goingUp?Number(this.YSPEED * Math.sin(this.m_yPercent / 100 * (2 * Math.PI))):Number(-this.YSPEED * Math.sin(this.m_yPercent / 100 * (2 * Math.PI)));
         }
         m_platform.x = m_platform.x + m_xSpeed;
         m_platform.y = m_platform.y + m_ySpeed;
         if(this.m_waiting)
         {
            this.m_appearClock.tick();
            if(this.m_appearClock.IsComplete)
            {
               this.m_waiting = false;
               this.m_appearClock.reset();
               this.m_comingIn = !this.m_comingIn;
               this.m_yCount = 0;
            }
         }
         else
         {
            m_ySpeed = !!this.m_comingIn?Number((this.m_yCount_max - this.m_yCount) / this.ENTRANCESPEED):Number(-this.m_yCount_max / this.m_appearClock.MaxTime);
            this.m_yCount = this.m_yCount + Math.abs(m_ySpeed);
            m_platform.y = m_platform.y + m_ySpeed;
            this.m_waiting = this.m_yCount >= this.m_yCount_max - 2?Boolean(true):Boolean(this.m_waiting);
         }
         super.move();
      }
   }
}
