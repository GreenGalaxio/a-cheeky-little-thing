package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.enemies.Enemy;
   import com.mcleodgaming.ssf2.enemies.GangplankKannonball;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.*;
   import flash.display.MovieClip;
   
   public class GangplankGalleonHazard extends StageHazard
   {
       
      
      private var m_opponents:Vector.<Number>;
      
      private var m_action:int;
      
      private var m_spawnTimer:FrameTimer;
      
      private var m_kremling:MovieClip;
      
      public function GangplankGalleonHazard(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
         this.m_action = 0;
         this.m_spawnTimer = new FrameTimer(30 * 5);
         this.m_kremling = STAGEDATA.StageBG.kremling;
         this.m_kremling.visible = false;
         this.m_opponents = new Vector.<Number>();
         var _loc4_:int = 0;
         _loc4_ = 0;
         while(_loc4_ < STAGEDATA.PlayerList.length)
         {
            this.m_opponents.push(STAGEDATA.PlayerList[_loc4_]);
            _loc4_++;
         }
      }
      
      override protected function runHazard() : void
      {
         var _loc1_:Enemy = null;
         var _loc2_:Vector.<Number> = null;
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         if(this.m_action == 0)
         {
            this.m_kremling.gotoAndPlay("again");
            this.m_spawnTimer.tick();
            if(this.m_spawnTimer.IsComplete)
            {
               this.m_spawnTimer.reset();
               this.m_action = 1;
            }
         }
         else if(this.m_action == 1)
         {
            this.m_kremling.gotoAndPlay("again");
            if(STAGEDATA.StageBG.islands.currentFrame <= 2)
            {
               if(Utils.random() < 0.4)
               {
                  this.m_spawnTimer.reset();
                  this.m_action = 2;
                  this.m_kremling.gotoAndPlay("again");
                  this.m_kremling.visible = true;
               }
               else
               {
                  this.m_action = 0;
               }
            }
         }
         else if(this.m_action == 2)
         {
            STAGEDATA.StageBG.islands.gotoAndPlay("again");
            if(this.m_kremling.currentFrame == 120)
            {
               this.m_action = 3;
            }
         }
         else if(this.m_action == 3)
         {
            STAGEDATA.StageBG.islands.gotoAndPlay("again");
            if(this.m_kremling.currentFrame >= this.m_kremling.totalFrames - 2)
            {
               _loc1_ = STAGEDATA.spawnEnemy(GangplankKannonball,STAGEDATA.DeathBounds.x + STAGEDATA.DeathBounds.width / 2,STAGEDATA.DeathBounds.y - 10);
               _loc2_ = new Vector.<Number>();
               _loc3_ = 0;
               while(_loc3_ < this.m_opponents.length)
               {
                  if(!STAGEDATA.getPlayer(this.m_opponents[_loc3_]).Dead && !STAGEDATA.getPlayer(this.m_opponents[_loc3_]).StandBy && !STAGEDATA.getPlayer(this.m_opponents[_loc3_]).Revival)
                  {
                     _loc2_.push(this.m_opponents[_loc3_]);
                  }
                  _loc3_++;
               }
               if(_loc2_.length > 0)
               {
                  _loc4_ = STAGEDATA.getPlayer(_loc2_[Utils.randomInteger(0,_loc2_.length - 1)]).X;
                  if(_loc4_ > STAGEDATA.CamBounds.x + 50 && _loc4_ < STAGEDATA.CamBounds.width / 2 - 50)
                  {
                     _loc1_.X = STAGEDATA.getPlayer(_loc2_[Utils.randomInteger(0,_loc2_.length - 1)]).X;
                  }
               }
               this.m_kremling.visible = false;
               this.m_action = 1;
            }
         }
      }
   }
}
