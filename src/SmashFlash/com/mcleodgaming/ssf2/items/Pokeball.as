package com.mcleodgaming.ssf2.items
{
   import com.mcleodgaming.ssf2.engine.ItemData;
   import com.mcleodgaming.ssf2.engine.StageData;
   import com.mcleodgaming.ssf2.enums.CState;
   import com.mcleodgaming.ssf2.events.SSF2Event;
   import com.mcleodgaming.ssf2.pokemon.Pokemon;
   
   public class Pokeball extends Item
   {
       
      
      private var m_pokemonClass:Class;
      
      public function Pokeball(param1:ItemData, param2:Number, param3:StageData)
      {
         super(param1,param2,param3);
         STAGEDATA.PokemonCount++;
         this.m_pokemonClass = STAGEDATA.getRandomPokemon();
      }
      
      public function get PokemonClass() : Class
      {
         return this.m_pokemonClass;
      }
      
      public function set PokemonClass(param1:Class) : void
      {
         this.m_pokemonClass = param1;
      }
      
      override protected function m_groundCollisionTest() : void
      {
         var _loc3_:Pokemon = null;
         var _loc1_:Boolean = Boolean(m_collision.ground);
         if(m_collision.ground)
         {
            attachToGround();
         }
         var _loc2_:Boolean = m_ySpeed > 0 && !m_collision.ground;
         m_collision.ground = (m_currentPlatform = testGroundWithCoord(m_sprite.x,m_sprite.y + 1)) != null;
         m_checkBounce();
         if(_loc2_ && m_ySpeed < 0 && !m_collision.ground)
         {
            STAGEDATA.playSpecificSound(m_landSound);
         }
         if(m_collision.ground && !m_collision.leftSide && !m_collision.rightSide)
         {
            attachToGround();
         }
         if(m_collision.ground && m_thrown)
         {
            playGlobalSound(m_effectSound);
            playFrame(Item.ATTACK_IDLE);
            stancePlayFrame("finish");
            m_xSpeed = 0;
            m_ySpeed = 0;
            m_itemStats.CanPickup = false;
            m_thrown = false;
            m_bounce_limit.reset();
            m_itemStats.Bounce = m_bounceOrig;
            m_itemStats.CanBeReversed = false;
            _loc3_ = STAGEDATA.spawnPokemon(this.m_pokemonClass,m_sprite.x,m_sprite.y,!m_wasReversed?int(m_player_id):int(m_reverse_id));
         }
         else if(m_collision.ground && !m_pickedUp && !m_thrown)
         {
            if(!_loc1_)
            {
               STAGEDATA.playSpecificSound(m_landSound);
            }
            m_xSpeed = 0;
         }
         if(m_collision.ground && !_loc1_)
         {
            m_eventManager.dispatchEvent(new SSF2Event(SSF2Event.GROUND_TOUCH,{"caller":this}));
         }
      }
      
      override protected function m_checkDead() : void
      {
         m_totalTime++;
         if(m_thrown)
         {
            m_tossTimer++;
         }
         if(m_itemStats.TimeMax > 0 && !m_dead && !m_pickedUp)
         {
            m_time--;
            if(m_time <= 0)
            {
               destroy();
               STAGEDATA.PokemonCount--;
            }
         }
         if(m_itemStats.RemoveAfterUse && m_uses >= m_itemStats.UsesMax && !m_dead)
         {
            if(!m_itemStats.RemoveWhileHolding && !m_pickedUp && m_collision.ground)
            {
               destroy();
            }
            else if(m_itemStats.RemoveWhileHolding && m_pickedUp && !STAGEDATA.getPlayer(m_player_id).inState(CState.ATTACKING))
            {
               destroy();
            }
         }
      }
      
      override protected function m_checkDeathBounds() : void
      {
         var _loc1_:Boolean = m_dead;
         super.m_checkDeathBounds();
         if(!_loc1_ && m_dead)
         {
            STAGEDATA.PokemonCount--;
         }
      }
      
      override public function PERFORMALL() : void
      {
         if(m_pickedUp && !m_dead)
         {
            checkTimers();
            m_itemAttack();
            this.m_checkDead();
         }
         else if(!m_pickedUp && !m_dead)
         {
            checkTimers();
            m_itemAttack();
            m_pushAwayItems();
            this.m_groundCollisionTest();
            m_checkReverse();
            m_itemFall();
            m_itemMove();
            checkRichochetTimer();
            this.m_checkDeathBounds();
            this.m_checkDead();
         }
      }
   }
}
