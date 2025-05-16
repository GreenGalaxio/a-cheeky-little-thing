package com.mcleodgaming.ssf2.pokemon
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.ItemData;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.items.Item;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class Delibird extends Pokemon
   {
       
      
      private var m_action:uint;
      
      private var m_throwTimer:FrameTimer;
      
      private var m_totalItems:int;
      
      private var m_bombitem:Object;
      
      private var m_fooditem:Object;
      
      private var m_tomatoitem:Object;
      
      public function Delibird(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("delibird",param1,param2,param3,param4);
         m_gravity = 1.5;
         m_max_ySpeed = 30;
         this.m_action = 0;
         this.m_throwTimer = new FrameTimer(30 * 2);
         playFrame("idle");
         this.m_totalItems = 10;
         this.m_fooditem = Main.getEnemyAttackData("delibird_items")["delibird_food"];
         this.m_bombitem = Main.getEnemyAttackData("delibird_items")["delibird_bomb"];
         this.m_tomatoitem = Main.getEnemyAttackData("delibird_items")["delibird_maximtomato"];
         m_width = 30;
         m_height = 40;
         m_currentTarget = getNearestTarget();
         if(m_currentTarget != null)
         {
            if(m_currentTarget.CurrentTarget.X > m_sprite.x)
            {
               m_faceRight();
            }
            else if(m_currentTarget.CurrentTarget.X < m_sprite.x)
            {
               m_faceLeft();
            }
         }
         else if(Utils.random() > 0.5)
         {
            m_faceLeft();
         }
         STAGEDATA.playSpecificVoice("delibird_appear");
      }
      
      private function runAI() : void
      {
         var _loc1_:Item = null;
         var _loc2_:ItemData = null;
         if(this.m_action == 0)
         {
            fadeIn();
            this.m_throwTimer.tick();
            if(this.m_throwTimer.IsComplete)
            {
               this.m_throwTimer.reset();
               this.m_throwTimer.MaxTime = 10;
               this.m_action = 1;
               playFrame("throw");
            }
         }
         else if(this.m_action == 1)
         {
            this.m_throwTimer.tick();
            if(this.m_throwTimer.CurrentTime == 7)
            {
               this.m_totalItems--;
               _loc1_ = null;
               _loc2_ = null;
               if(Utils.random() > 0.1)
               {
                  _loc2_ = new ItemData();
                  _loc2_.importItemData(this.m_fooditem);
                  STAGEDATA.playSpecificSound("delibird_throwfood");
                  _loc1_ = STAGEDATA.ItemsRef.generateItemObj(_loc2_,!!m_facingForward?Number(m_sprite.x + 14.5):Number(m_sprite.x - 14.5),m_sprite.y - 23.5);
                  if(_loc1_ != null)
                  {
                     _loc1_.setXSpeed(!!m_facingForward?Number(2):Number(-2));
                     _loc1_.setYSpeed(-5 + Utils.randomInteger(-5,2));
                  }
               }
               else
               {
                  _loc2_ = new ItemData();
                  if(Utils.random() >= 0.9)
                  {
                     _loc2_.importItemData(this.m_tomatoitem);
                     STAGEDATA.playSpecificSound("delibird_throwfood");
                  }
                  else
                  {
                     _loc2_.importItemData(this.m_bombitem);
                     STAGEDATA.playSpecificSound("delibird_bombsizzle");
                  }
                  _loc1_ = STAGEDATA.ItemsRef.generateItemObj(_loc2_,!!m_facingForward?Number(m_sprite.x + 14.5):Number(m_sprite.x - 14.5),m_sprite.y - 23.5,_loc2_.LinkageID == this.m_bombitem.linkage_id);
                  if(_loc1_ != null)
                  {
                     if(Utils.LastRandom >= 0.9)
                     {
                        _loc1_.SetPlayer(-1);
                     }
                     _loc1_.Toss(!!m_facingForward?Number(m_sprite.x + 14.5):Number(m_sprite.x - 14.5),m_sprite.y - 23.5,!!m_facingForward?Number(3):Number(-3),-8 + Utils.randomInteger(-5,2));
                  }
               }
            }
            else if(this.m_throwTimer.IsComplete)
            {
               this.m_throwTimer.reset();
               playFrame("idle");
               if(this.m_totalItems <= 0)
               {
                  m_fadeTimer.reset();
                  this.m_action = 2;
               }
               else
               {
                  this.m_action = 0;
               }
            }
         }
         else if(this.m_action == 2)
         {
            fadeOut();
            if(m_fadeTimer.IsComplete)
            {
               destroy();
            }
         }
      }
      
      override public function PERFORMALL() : void
      {
         if(!m_dead && !STAGEDATA.Paused && !STAGEDATA.StageEvent)
         {
            this.runAI();
            if(!m_dead)
            {
               performAttackChecks();
               attackCollisionTest();
               move();
               gravity();
               m_groundCollisionTest();
               checkDeath();
            }
         }
      }
   }
}
