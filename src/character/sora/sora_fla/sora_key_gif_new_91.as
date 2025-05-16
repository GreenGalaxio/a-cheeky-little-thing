package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import com.mcleodgaming.ssf2api.core.SSF2Event;
   import flash.display.MovieClip;
   
   public dynamic class sora_key_gif_new_91 extends MovieClip
   {
       
      
      public var attackBox:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var self;
      
      public var character;
      
      public function sora_key_gif_new_91()
      {
         super();
         addFrameScript(0,this.frame1,2,this.frame3,4,this.frame5,6,this.frame7,8,this.frame9,10,this.frame11,12,this.frame13,14,this.frame15,16,this.frame17,18,this.frame19,20,this.frame21,22,this.frame23,23,this.frame24);
      }
      
      function frame1() : *
      {
         this.self = SSF2API.getProjectile(this);
         if(SSF2API.isReady() && this.self)
         {
            this.character = SSF2API.getCharacter(this.self.getID());
            SSF2API.addEventListener(this.self,SSF2Event.HIT_WALL,this.self.destroy);
         }
      }
      
      function frame3() : *
      {
         this.self.refreshAttackID();
      }
      
      function frame5() : *
      {
         this.self.refreshAttackID();
      }
      
      function frame7() : *
      {
         this.self.refreshAttackID();
      }
      
      function frame9() : *
      {
         this.self.refreshAttackID();
      }
      
      function frame11() : *
      {
         this.self.refreshAttackID();
      }
      
      function frame13() : *
      {
         this.self.setXSpeed(0);
         this.self.updateAttackBoxStats(1,{"direction":-5});
         this.self.refreshAttackID();
      }
      
      function frame15() : *
      {
         this.self.refreshAttackID();
      }
      
      function frame17() : *
      {
         this.self.refreshAttackID();
      }
      
      function frame19() : *
      {
         this.self.refreshAttackID();
      }
      
      function frame21() : *
      {
         this.self.refreshAttackID();
      }
      
      function frame23() : *
      {
         this.self.updateAttackBoxStats(1,{
            "damage":3,
            "hitStun":-1.1,
            "direction":120,
            "power":60,
            "kbConstant":50
         });
         this.self.refreshAttackID();
      }
      
      function frame24() : *
      {
         this.self.destroy();
      }
   }
}
