package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.enemies.ClockTownFlamingRock;
   import com.mcleodgaming.ssf2.enemies.TingleBalloon;
   import com.mcleodgaming.ssf2.engine.ItemData;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.items.Item;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.geom.Point;
   
   public class ClockTownHazards extends StageHazard
   {
       
      
      private var m_tingleDone:Boolean;
      
      private var m_tingleTimer:FrameTimer;
      
      private var m_fairyTimer:FrameTimer;
      
      private var m_fairyItemData:ItemData;
      
      private var m_rockTimer:FrameTimer;
      
      private var m_dayTime:Boolean;
      
      private var m_dayCount:int;
      
      private var m_finalDayEnding:Boolean;
      
      public function ClockTownHazards(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
         this.m_tingleDone = false;
         this.m_tingleTimer = new FrameTimer(30 * 3);
         this.m_fairyTimer = new FrameTimer(30 * 4);
         this.m_rockTimer = new FrameTimer(10);
         this.m_dayTime = true;
         this.m_dayCount = 1;
         this.m_finalDayEnding = false;
         this.m_fairyItemData = new ItemData();
         this.m_fairyItemData.importItemData({
            "linkage_id":"zeldaFairy",
            "holdLinkage_id":null,
            "displayName":"",
            "class_id":"ClockTownFairy",
            "width":30,
            "height":30,
            "canHit":false,
            "recover":10,
            "canPickup":true,
            "uses_max":1,
            "gravity":0,
            "max_gravity":0,
            "consume":true,
            "autopickup":true,
            "time_max":9999999
         });
      }
      
      private function updateTime() : void
      {
         this.m_finalDayEnding = false;
         var _loc1_:int = STAGEDATA.CamRef.BGs[0].currentFrame;
         if(_loc1_ <= 638)
         {
            this.m_dayTime = true;
            this.m_dayCount = 1;
         }
         if(_loc1_ >= 688 && _loc1_ <= 1343)
         {
            this.m_dayTime = false;
            this.m_dayCount = 1;
         }
         if(_loc1_ >= 1344 && _loc1_ <= 2519)
         {
            this.m_dayTime = true;
            this.m_dayCount = 2;
         }
         if(_loc1_ >= 2159 && _loc1_ <= 2793)
         {
            this.m_dayTime = false;
            this.m_dayCount = 2;
         }
         if(_loc1_ >= 2888)
         {
            this.m_dayTime = true;
            this.m_dayCount = 3;
            if(_loc1_ >= 3241)
            {
               this.m_finalDayEnding = true;
            }
         }
      }
      
      override protected function runHazard() : void
      {
      }
      
      override protected function excess() : void
      {
         var _loc3_:Item = null;
         var _loc4_:int = 0;
         var _loc1_:Point = new Point();
         var _loc2_:int = this.m_dayCount;
         this.updateTime();
         if(this.m_dayCount == 1 && _loc2_ > 1)
         {
            this.m_tingleTimer.reset();
            this.m_tingleDone = false;
         }
         this.m_tingleTimer.tick();
         if(this.m_tingleTimer.IsComplete && !this.m_tingleDone && this.m_dayCount == 1 && !STAGEDATA.hasEnemy(TingleBalloon))
         {
            _loc1_.x = Utils.random() > 0.5?Number(-200):Number(700);
            _loc1_.y = STAGEDATA.DeathBounds.y + STAGEDATA.DeathBounds.height + 100;
            STAGEDATA.spawnEnemy(TingleBalloon,_loc1_.x,_loc1_.y);
            this.m_tingleDone = true;
         }
         this.m_fairyTimer.tick();
         if(this.m_fairyTimer.IsComplete)
         {
            this.m_fairyTimer.reset();
            if(!this.m_dayTime && (this.m_dayCount == 1 && Utils.random() < 0.17 || this.m_dayCount == 2 && Utils.LastRandom < 0.25))
            {
               _loc1_.x = Utils.random() > 0.5?Number(STAGEDATA.DeathBounds.x - 50):Number(STAGEDATA.DeathBounds.x + STAGEDATA.DeathBounds.width + 50);
               _loc1_.y = Utils.randomInteger(-32,180);
               _loc3_ = STAGEDATA.ItemsRef.generateItemObj(this.m_fairyItemData,_loc1_.x,_loc1_.y,true);
               if(_loc1_.x > STAGEDATA.DeathBounds.x + STAGEDATA.DeathBounds.width)
               {
                  _loc3_.faceLeft();
               }
               else
               {
                  _loc3_.faceRight();
               }
            }
         }
         this.m_rockTimer.tick();
         if(this.m_rockTimer.IsComplete)
         {
            this.m_rockTimer.reset();
            if(this.m_dayCount >= 3 && !this.m_finalDayEnding)
            {
               if(Utils.random() < 0.9 * ((3410 - STAGEDATA.CamRef.BGs[0].currentFrame) / (3410 - 2888)))
               {
                  STAGEDATA.spawnEnemy(ClockTownFlamingRock,Utils.randomInteger(-35,619),STAGEDATA.DeathBounds.y - 10);
               }
            }
         }
         if(STAGEDATA.CamRef.BGs[0].currentFrame == 3241)
         {
            _loc4_ = 0;
            while(_loc4_ < STAGEDATA.Enemies.length)
            {
               if(STAGEDATA.Enemies[_loc4_] && STAGEDATA.Enemies[_loc4_] is ClockTownFlamingRock)
               {
                  ClockTownFlamingRock(STAGEDATA.Enemies[_loc4_]).triggerRewind();
               }
               _loc4_++;
            }
         }
      }
   }
}
