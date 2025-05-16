package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   
   public class PeachsCastleBlock extends Enemy
   {
      
      public static var RED:String = "red";
      
      public static var BLUE:String = "blue";
      
      public static var GREEN:String = "green";
       
      
      private var m_action:int;
      
      private var m_type:String;
      
      private var m_deathTimer:FrameTimer;
      
      private var m_hitTimer:FrameTimer;
      
      private var m_blinkTimer:FrameTimer;
      
      private var m_blinkToggle:Boolean;
      
      public function PeachsCastleBlock(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("buttonBrick",param1,param2,param3,param4);
         m_width = 38;
         m_height = 38;
         this.m_type = PeachsCastleBlock.RED;
         this.m_action = 0;
         this.m_deathTimer = new FrameTimer(30 * 17);
         this.m_blinkTimer = new FrameTimer(30 * 3);
         this.m_hitTimer = new FrameTimer(30 * 17);
         this.m_blinkToggle = true;
         createSelfPlatform(-m_width / 2,-m_height,m_width,m_height);
         STAGE.setChildIndex(m_sprite,0);
      }
      
      public function setType(param1:String) : void
      {
         this.m_type = param1;
         playFrame(this.m_type);
      }
      
      public function hit() : void
      {
         if(this.m_action == 0)
         {
            STAGEDATA.ItemsRef.makeItem(m_sprite.x,m_sprite.y - m_height - 10);
            playFrame(this.m_type + "Hit");
            m_sprite.alpha = 1;
            this.m_action = 2;
            this.m_hitTimer.CurrentTime = this.m_deathTimer.CurrentTime;
         }
      }
      
      private function runAI() : void
      {
         if(this.m_action == 0)
         {
            this.m_deathTimer.tick();
            if(this.m_deathTimer.IsComplete)
            {
               this.m_action = 1;
            }
         }
         else if(this.m_action == 1)
         {
            this.m_blinkToggle = !this.m_blinkToggle;
            m_sprite.alpha = !!this.m_blinkToggle?Number(0.8):Number(0);
            this.m_blinkTimer.tick();
            if(this.m_blinkTimer.IsComplete)
            {
               destroy();
            }
         }
         else if(this.m_action == 2)
         {
            this.m_hitTimer.tick();
            if(this.m_hitTimer.IsComplete)
            {
               this.m_action = 1;
            }
         }
      }
      
      override public function takeDamage(param1:AttackDamage, param2:HitBoxSprite = null) : Boolean
      {
         if(this.m_action == 0)
         {
            this.hit();
            return true;
         }
         return false;
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
               performAttackChecks();
               attackCollisionTest();
               updateSelfPlatform();
            }
         }
      }
   }
}
