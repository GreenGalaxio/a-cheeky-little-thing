package com.mcleodgaming.ssf2.platforms
{
   import com.mcleodgaming.ssf2.engine.InteractiveSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   import flash.display.MovieClip;
   
   public class Platform extends CollisionBoundary
   {
       
      
      protected var m_spriteOwner:InteractiveSprite;
      
      protected var m_platform:MovieClip;
      
      public function Platform(param1:MovieClip, param2:StageData, param3:String = "ground", param4:Boolean = false)
      {
         super(param1,param2,param3,param4);
         this.m_platform = m_collisionClipContainer;
         this.m_spriteOwner = null;
      }
      
      protected function faceRight() : void
      {
         this.m_platform.scaleX = Math.abs(this.m_platform.scaleX);
      }
      
      protected function faceLeft() : void
      {
         this.m_platform.scaleX = -Math.abs(this.m_platform.scaleX);
      }
      
      public function get SpriteOwner() : InteractiveSprite
      {
         return this.m_spriteOwner;
      }
      
      public function set SpriteOwner(param1:InteractiveSprite) : void
      {
         this.m_spriteOwner = param1;
      }
      
      public function get fallthrough() : Boolean
      {
         return m_collisionClipContainer.fallthrough == true;
      }
      
      public function set fallthrough(param1:Boolean) : void
      {
         m_collisionClipContainer.fallthrough = param1;
      }
      
      public function get noDropThrough() : Boolean
      {
         return m_collisionClipContainer.noDropThrough == true;
      }
      
      public function set noDropThrough(param1:Boolean) : void
      {
         m_collisionClipContainer.noDropThrough = param1;
      }
      
      public function get accel_friction() : Number
      {
         return m_collisionClipContainer.accel_friction != undefined?Number(m_collisionClipContainer.accel_friction):Number(1);
      }
      
      public function set accel_friction(param1:Number) : void
      {
         m_collisionClipContainer.accel_friction = param1;
      }
      
      public function get decel_friction() : Number
      {
         return m_collisionClipContainer.decel_friction != undefined?Number(m_collisionClipContainer.decel_friction):Number(1);
      }
      
      public function set decel_friction(param1:Number) : void
      {
         m_collisionClipContainer.decel_friction = param1;
      }
      
      public function get x_influence() : Number
      {
         return Boolean(m_collisionClipContainer.x_influence)?Number(m_collisionClipContainer.x_influence):Number(0);
      }
      
      public function set x_influence(param1:Number) : void
      {
         m_collisionClipContainer.x_influence = param1;
      }
      
      public function get danger() : Boolean
      {
         return m_collisionClipContainer.danger == true;
      }
      
      public function set danger(param1:Boolean) : void
      {
         m_collisionClipContainer.danger = param1;
      }
      
      public function get bounce_speed() : Number
      {
         return m_collisionClipContainer.bounce_speed > 0?Number(m_collisionClipContainer.bounce_speed):Number(0);
      }
      
      public function set bounce_speed(param1:Number) : void
      {
         m_collisionClipContainer.bounce_speed = param1;
      }
      
      public function setAlpha(param1:Number) : void
      {
         m_collisionClipContainer.alpha = param1;
      }
   }
}
