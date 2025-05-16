package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.Character;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   
   public class MK3PSwitch extends Enemy
   {
       
      
      private var m_action:int;
      
      private var m_pressedTimer:FrameTimer;
      
      public function MK3PSwitch(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("pSwitch",param1,param2,param3,param4);
         this.m_pressedTimer = new FrameTimer(30 * 2);
         m_width = 34;
         m_height = 40;
         this.m_action = 0;
         forceOnGround();
         createSelfPlatform(-m_width / 2,-m_height,m_width,m_height - 2);
      }
      
      private function press() : void
      {
         var _loc1_:int = 0;
         if(this.m_action == 0)
         {
            playFrame("down");
            m_fadeTimer.reset();
            removeSelfPlatform();
            createSelfPlatform(-m_width / 2,-10,m_width,10);
            this.m_action = 1;
            _loc1_ = 0;
            while(_loc1_ < STAGEDATA.Enemies.length)
            {
               if(STAGEDATA.Enemies[_loc1_] && STAGEDATA.Enemies[_loc1_] is MK3Block)
               {
                  MK3Block(STAGEDATA.Enemies[_loc1_]).breakBlock();
               }
               _loc1_++;
            }
         }
      }
      
      private function runAI() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Character = null;
         if(this.m_action == 0)
         {
            fadeIn();
            _loc1_ = 0;
            while(_loc1_ < STAGEDATA.PlayerList.length)
            {
               _loc2_ = STAGEDATA.getPlayer(STAGEDATA.PlayerList[_loc1_]);
               if(_loc2_ && _loc2_.CurrentPlatform == m_selfPlatform)
               {
                  this.press();
                  break;
               }
               _loc1_++;
            }
         }
         else if(this.m_action == 1)
         {
            this.m_pressedTimer.tick();
            if(this.m_pressedTimer.IsComplete)
            {
               fadeOut();
               if(m_fadeTimer.IsComplete)
               {
                  destroy();
               }
            }
         }
      }
      
      override public function takeDamage(param1:AttackDamage, param2:HitBoxSprite = null) : Boolean
      {
         if(this.m_action > 0)
         {
            return false;
         }
         if(param1.EffectSound)
         {
            STAGEDATA.playSpecificSound(param1.EffectSound);
         }
         this.press();
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
               updateSelfPlatform();
            }
         }
      }
   }
}
