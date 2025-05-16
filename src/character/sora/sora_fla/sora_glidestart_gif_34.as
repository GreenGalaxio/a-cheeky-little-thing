package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import com.mcleodgaming.ssf2api.core.SSF2Event;
   import flash.display.MovieClip;
   
   public dynamic class sora_glidestart_gif_34 extends MovieClip
   {
       
      
      public var attackBox:MovieClip;
      
      public var hand:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var self;
      
      public var startedOnGround:Boolean;
      
      public var controls:Object;
      
      public function sora_glidestart_gif_34()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,11,this.frame12,12,this.frame13,21,this.frame22);
      }
      
      public function restoreSpecials(param1:*) : void
      {
         SSF2API.print("Specials restored: " + param1.toString());
         this.self.setAttackEnabled(true,"b_up");
         this.self.setAttackEnabled(true,"b_up_air");
         this.self.setAttackEnabled(true,"b_forward");
         this.self.setAttackEnabled(true,"b_forward_air");
         SSF2API.removeEventListener(this.self,SSF2Event.GROUND_TOUCH,this.restoreSpecials);
         SSF2API.removeEventListener(this.self,SSF2Event.CHAR_HURT,this.restoreSpecials);
         SSF2API.removeEventListener(this.self,SSF2Event.CHAR_GRABBED,this.restoreSpecials);
         SSF2API.removeEventListener(this.self,SSF2Event.CHAR_LEDGE_GRAB,this.restoreSpecials);
      }
      
      function frame1() : *
      {
         this.self = SSF2API.getCharacter(this);
         if(this.self && SSF2API.isReady())
         {
            this.startedOnGround = this.self.isOnGround();
            this.controls = this.self.getControls();
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
         }
      }
      
      function frame2() : *
      {
         this.self.setYSpeed(-15);
         this.self.setXSpeed(8,false);
         this.self.setAttackEnabled(false,"b_up_air");
         this.self.setAttackEnabled(false,"b_up");
         this.self.setAttackEnabled(false,"b_forward");
         this.self.setAttackEnabled(false,"b_forward_air");
         this.self.updateAttackStats({"airCancel":true});
         SSF2API.addEventListener(this.self,SSF2Event.GROUND_TOUCH,this.restoreSpecials,{"persistent":true});
         SSF2API.addEventListener(this.self,SSF2Event.CHAR_HURT,this.restoreSpecials,{"persistent":true});
         SSF2API.addEventListener(this.self,SSF2Event.CHAR_GRABBED,this.restoreSpecials,{"persistent":true});
         SSF2API.addEventListener(this.self,SSF2Event.CHAR_LEDGE_GRAB,this.restoreSpecials,{"persistent":true});
         if(this.startedOnGround)
         {
            SSF2API.addEventListener(this.self,SSF2Event.CHAR_ATTACK_COMPLETE,this.restoreSpecials);
         }
      }
      
      function frame12() : *
      {
      }
      
      function frame13() : *
      {
      }
      
      function frame22() : *
      {
         this.self.endAttack();
      }
   }
}
