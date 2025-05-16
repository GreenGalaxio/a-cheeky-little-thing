package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.enemies.Batton;
   import com.mcleodgaming.ssf2.enemies.Enemy;
   import com.mcleodgaming.ssf2.enemies.Met;
   import com.mcleodgaming.ssf2.enemies.SniperJoe;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.*;
   import flash.geom.Point;
   
   public class CastleWilyHazard extends StageHazard
   {
       
      
      private var m_action:int;
      
      private var m_startTimer:FrameTimer;
      
      private var m_bgTimer:FrameTimer;
      
      private var m_delayTimer:FrameTimer;
      
      private var m_waitTimer:FrameTimer;
      
      private var m_currentDirectionRight:Boolean;
      
      private var m_enemyQueue:Vector.<Class>;
      
      private var m_locationQueue:Vector.<Point>;
      
      public function CastleWilyHazard(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
         this.m_action = 0;
         this.m_startTimer = new FrameTimer(30 * 25);
         this.m_bgTimer = new FrameTimer(30 * 4);
         this.m_delayTimer = new FrameTimer(30 * 1);
         this.m_waitTimer = new FrameTimer(30 * 25);
         this.m_enemyQueue = new Vector.<Class>();
         this.m_locationQueue = new Vector.<Point>();
         this.m_currentDirectionRight = false;
      }
      
      override protected function runHazard() : void
      {
      }
      
      override protected function excess() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Enemy = null;
         if(this.m_action == 0)
         {
            this.m_startTimer.tick();
            if(this.m_startTimer.IsComplete)
            {
               this.m_startTimer.reset();
               this.m_action = 1;
               this.m_currentDirectionRight = Utils.random() > 0.5;
               STAGEDATA.CamRef.gotoAndPlayBG(!!this.m_currentDirectionRight?"left":"right");
            }
         }
         else if(this.m_action == 1)
         {
            this.m_bgTimer.tick();
            if(this.m_bgTimer.IsComplete)
            {
               this.m_bgTimer.reset();
               this.m_action = 2;
               _loc1_ = 0;
               while(_loc1_ < 8)
               {
                  if(Utils.random() < 0.15)
                  {
                     this.m_enemyQueue.push(Batton);
                     this.m_locationQueue.push(!!this.m_currentDirectionRight?new Point(-546,-169):new Point(1020,-120));
                  }
                  else
                  {
                     this.m_enemyQueue.push(Met);
                     this.m_locationQueue.push(!!this.m_currentDirectionRight?new Point(-546,-169):new Point(994,-94));
                  }
                  _loc1_++;
               }
               if(Utils.random() < 0.2)
               {
                  this.m_enemyQueue.push(SniperJoe);
                  this.m_locationQueue.push(!!this.m_currentDirectionRight?new Point(-246,-409):new Point(709,-409));
               }
            }
         }
         else if(this.m_action == 2)
         {
            this.m_delayTimer.tick();
            if(this.m_delayTimer.IsComplete)
            {
               this.m_delayTimer.reset();
               _loc2_ = STAGEDATA.spawnEnemy(this.m_enemyQueue[0],this.m_locationQueue[0].x,this.m_locationQueue[0].y);
               if(this.m_currentDirectionRight)
               {
                  _loc2_.faceRight();
               }
               else
               {
                  _loc2_.faceLeft();
               }
               this.m_enemyQueue.splice(0,1);
               this.m_locationQueue.splice(0,1);
               if(this.m_enemyQueue.length == 0)
               {
                  this.m_action = 3;
               }
            }
         }
         else if(this.m_action == 3)
         {
            this.m_waitTimer.tick();
            if(this.m_waitTimer.IsComplete)
            {
               this.m_waitTimer.reset();
               this.m_action = 0;
            }
         }
      }
   }
}
