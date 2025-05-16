package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.util.FrameTimer;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.geom.Point;
   
   public class WarioWareTree extends Enemy
   {
       
      
      private var m_deathTimer:FrameTimer;
      
      private var m_warioWareApples:Vector.<WarioWareApple>;
      
      public function WarioWareTree(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Point = null;
         var _loc10_:WarioWareApple = null;
         super("warioware_tree",param1,param2,param3,param4);
         this.m_deathTimer = new FrameTimer(30 * 4);
         this.m_warioWareApples = new Vector.<WarioWareApple>();
         STAGE.setChildIndex(m_sprite,0);
         var _loc5_:int = 0;
         while(_loc5_ < 15)
         {
            _loc6_ = Utils.randomInteger(0,360);
            _loc7_ = Utils.randomInteger(0,30);
            _loc8_ = Utils.randomInteger(0,40);
            _loc9_ = new Point(230 + Utils.calculateXSpeed(_loc7_,_loc6_),55 + Utils.calculateYSpeed(_loc8_,_loc6_));
            _loc10_ = WarioWareApple(STAGEDATA.spawnEnemy(WarioWareApple,_loc9_.x,_loc9_.y));
            this.m_warioWareApples.push(_loc10_);
            STAGE.setChildIndex(_loc10_.MC,1);
            _loc5_++;
         }
      }
      
      override public function takeDamage(param1:AttackDamage, param2:HitBoxSprite = null) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         if(param1.PlayerID > 0 && !attackIDArrayContains(param1.AttackID))
         {
            _loc3_ = 0;
            _loc4_ = Utils.calculateChargeDamage(param1);
            _loc5_ = _loc4_ >= 14?int(2):int(1);
            _loc3_ = 0;
            while(_loc3_ < _loc5_ && this.m_warioWareApples.length > 0)
            {
               this.m_warioWareApples[0].drop();
               this.m_warioWareApples.splice(0,1);
               STAGEDATA.getPlayer(param1.PlayerID).WWScore++;
               _loc3_++;
            }
            _loc3_ = 0;
            while(_loc3_ < this.m_warioWareApples.length)
            {
               this.m_warioWareApples[_loc3_].shake();
               _loc3_++;
            }
            if(param1.EffectSound)
            {
               STAGEDATA.playSpecificSound(param1.EffectSound);
            }
            if(param1.EffectID != null && param1.EffectID != null)
            {
               attachHurtEffect(param1.EffectID,param2);
            }
            stackAttackID(param1.AttackID);
            if(STAGEDATA.StageBG.tree)
            {
               STAGEDATA.StageBG.tree.gotoAndStop(!!param1.IsForward?"shakeright":"shakeleft");
            }
            return true;
         }
         return false;
      }
      
      private function runAI() : void
      {
         this.m_deathTimer.tick();
         if(this.m_deathTimer.IsComplete)
         {
            while(this.m_warioWareApples.length > 0)
            {
               this.m_warioWareApples[0].destroy();
               this.m_warioWareApples.splice(0,1);
            }
            destroy();
         }
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
