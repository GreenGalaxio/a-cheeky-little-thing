package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.ItemData;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class PelletPosie extends Enemy
   {
       
      
      public const RED:String = "Red";
      
      public const BLUE:String = "Blue";
      
      public const YELLOW:String = "Yellow";
      
      public var SLOT:int = 0;
      
      private var m_action:int;
      
      private var m_type:String;
      
      private var m_level:int;
      
      private var m_levelTimer:FrameTimer;
      
      private var m_itemData:Object;
      
      public function PelletPosie(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         var _loc5_:Number = 0;
         var _loc6_:Array = [this.RED,this.BLUE,this.YELLOW];
         this.m_type = _loc6_[Utils.randomInteger(0,2)];
         m_width = 25;
         m_height = 75;
         super("pikminFlower" + this.m_type,param1,param2,param3,param4);
         this.m_itemData = Main.getEnemyAttackData("distantPlanet_items");
         this.m_action = 0;
         this.m_level = 1;
         this.m_levelTimer = new FrameTimer(30 * 6);
         forceOnGround();
      }
      
      private function runAI() : void
      {
         fadeIn();
         if(this.m_action == 0)
         {
            this.m_levelTimer.tick();
            if(this.m_levelTimer.IsComplete)
            {
               this.m_levelTimer.reset();
               this.m_level++;
               playFrame("stage" + this.m_level);
               if(this.m_level >= 3)
               {
                  this.m_action = 1;
               }
            }
         }
         else if(this.m_action == 1)
         {
         }
      }
      
      override public function takeDamage(param1:AttackDamage, param2:HitBoxSprite = null) : Boolean
      {
         if(param1.EffectSound)
         {
            STAGEDATA.playSpecificSound(param1.EffectSound);
         }
         var _loc3_:int = this.m_level == 3?int(10):this.m_level == 2?int(5):int(1);
         var _loc4_:ItemData = new ItemData();
         if(this.m_itemData["pellet" + this.m_type + "" + _loc3_])
         {
            _loc4_.importItemData(this.m_itemData["pellet" + this.m_type + "" + _loc3_]);
            STAGEDATA.ItemsRef.generateItemObj(_loc4_,m_sprite.x,m_sprite.y - m_height,true);
         }
         if(param1.EffectID != null && param1.EffectID != null)
         {
            attachHurtEffect(param1.EffectID,param2);
         }
         destroy();
         return true;
      }
      
      override public function PERFORMALL() : void
      {
         if(!m_dead && !STAGEDATA.Paused && !STAGEDATA.StageEvent)
         {
            checkTimers();
            this.runAI();
            if(!m_dead)
            {
               move();
               gravity();
               m_groundCollisionTest();
               performAttackChecks();
               attackCollisionTest();
            }
         }
      }
   }
}
