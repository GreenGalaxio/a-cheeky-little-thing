package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import com.mcleodgaming.ssf2api.core.SSF2Event;
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public dynamic class sora_flowmotion_35 extends MovieClip
   {
       
      
      public var attackBox:MovieClip;
      
      public var grabBox:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var touchBox:MovieClip;
      
      public var self;
      
      public var controls:Object;
      
      public var cancelled:Boolean;
      
      public function sora_flowmotion_35()
      {
         super();
         addFrameScript(0,this.frame1,9,this.frame10,10,this.frame11,20,this.frame21,27,this.frame28,28,this.frame29,30,this.frame31,39,this.frame40,49,this.frame50,50,this.frame51,55,this.frame56,59,this.frame60,63,this.frame64,65,this.frame66,70,this.frame71,71,this.frame72,85,this.frame86,86,this.frame87,103,this.frame104,104,this.frame105,106,this.frame107,119,this.frame120,120,this.frame121,124,this.frame125,127,this.frame128,132,this.frame133,135,this.frame136);
      }
      
      public function goToHit(param1:Event = null) : *
      {
         SSF2API.removeEventListener(this.self,SSF2Event.ATTACK_CONNECT_SHIELD,this.goToHit);
         SSF2API.removeEventListener(this.self,SSF2Event.ATTACK_HIT,this.goToHit);
         gotoAndPlay("hit");
      }
      
      public function landing(param1:Event = null) : *
      {
         SSF2API.removeEventListener(this.self,SSF2Event.GROUND_TOUCH,this.self.toLand);
         this.self.setXSpeed(15,false);
         this.self.toLand();
      }
      
      public function checkControls() : void
      {
         this.controls = this.self.getControls();
         if(this.self.isFacingRight() && this.controls.LEFT || !this.self.isFacingRight() && this.controls.RIGHT)
         {
            gotoAndPlay("backB");
         }
         else if(!this.self.isFacingRight() && this.controls.LEFT || this.self.isFacingRight() && this.controls.RIGHT)
         {
            gotoAndPlay("forwardB");
         }
         else if(this.controls.UP)
         {
            gotoAndPlay("upB");
         }
         else if(this.controls.DOWN)
         {
            gotoAndPlay("downB");
         }
      }
      
      public function checkGrabbed() : void
      {
         if(this.self.getGrabbedOpponent())
         {
            this.self.gotoGrabbedCharacter();
            SSF2API.destroyTimer(this.self,this.checkGrabbed);
            gotoAndPlay("continue");
         }
      }
      
      public function flying() : void
      {
         this.self.setYSpeed(-4);
      }
      
      function frame1() : *
      {
         if(parent && SSF2API.isReady())
         {
            this.self = SSF2API.getCharacter(this);
            this.controls = this.self.getControls();
            this.cancelled = false;
         }
         SSF2API.addEventListener(this.self,SSF2Event.ATTACK_HIT,this.goToHit);
         SSF2API.addEventListener(this.self,SSF2Event.ATTACK_CONNECT_SHIELD,this.goToHit);
      }
      
      function frame10() : *
      {
         this.self.playAttackSound(1);
      }
      
      function frame11() : *
      {
         this.self.setXSpeed(25,false);
         this.controls = this.self.getControls();
         if(this.controls.UP)
         {
            this.self.setYSpeed(-12);
            this.self.updateAttackStats({"rotate":true});
         }
         else if(this.controls.DOWN)
         {
            this.self.updateAttackStats({
               "air_ease":12,
               "rotate":true
            });
            SSF2API.addEventListener(this.self,SSF2Event.GROUND_TOUCH,this.landing);
         }
      }
      
      function frame21() : *
      {
      }
      
      function frame28() : *
      {
         SSF2API.removeEventListener(this.self,SSF2Event.GROUND_TOUCH,this.self.toLand);
         this.self.toHelpless();
         this.self.endAttack();
      }
      
      function frame29() : *
      {
         this.self.updateAttackStats({"rotate":false});
         this.self.setXSpeed(0);
         if(!this.cancelled)
         {
            SSF2API.createTimer(this.self,1,6,this.checkControls);
         }
      }
      
      function frame31() : *
      {
         this.self.refreshAttackID();
      }
      
      function frame40() : *
      {
         this.self.setXSpeed(-4,false);
         this.self.setYSpeed(-15);
      }
      
      function frame50() : *
      {
         if(this.cancelled)
         {
            this.self.toHelpless();
         }
         this.self.endAttack();
      }
      
      function frame51() : *
      {
         this.self.refreshAttackID();
         this.self.updateAttackStats({
            "air_ease":0,
            "rotate":false
         });
         this.self.updateAttackBoxStats(1,{
            "selfHitStun":1,
            "direction":90,
            "damage":3,
            "power":25,
            "hitLag":-1,
            "hitStun":10
         });
      }
      
      function frame56() : *
      {
         this.self.refreshAttackID();
         this.self.updateAttackBoxStats(1,{"direction":270});
      }
      
      function frame60() : *
      {
         this.self.refreshAttackID();
         this.self.updateAttackBoxStats(1,{"direction":90});
      }
      
      function frame64() : *
      {
         this.self.refreshAttackID();
         this.self.updateAttackBoxStats(1,{
            "canDI":true,
            "damage":5,
            "direction":310,
            "hitLag":-1.07,
            "power":50,
            "kbConstant":40
         });
      }
      
      function frame66() : *
      {
         this.self.updateAttackStats({"air_ease":-1});
         this.self.setYSpeed(-10);
      }
      
      function frame71() : *
      {
         this.self.endAttack();
      }
      
      function frame72() : *
      {
         this.self.updateAttackStats({
            "air_ease":0,
            "rotate":false
         });
         SSF2API.createTimer(this.self,1,5,this.checkGrabbed);
      }
      
      function frame86() : *
      {
         this.self.endAttack();
      }
      
      function frame87() : *
      {
         this.self.flip();
         this.self.refreshAttackID();
         this.self.updateAttackBoxStats(1,{
            "canDI":true,
            "damage":5,
            "direction":60,
            "hitLag":-0.8,
            "power":30,
            "kbConstant":30
         });
      }
      
      function frame104() : *
      {
         this.self.endAttack();
      }
      
      function frame105() : *
      {
         this.self.refreshAttackID();
         this.self.setYSpeed(-8);
         this.self.updateAttackBoxStats(1,{
            "canDI":true,
            "damage":7,
            "direction":40,
            "hitLag":-1.1,
            "power":80,
            "kbConstant":40
         });
      }
      
      function frame107() : *
      {
         this.self.setXSpeed(20,false);
      }
      
      function frame120() : *
      {
         this.self.endAttack();
      }
      
      function frame121() : *
      {
         this.self.refreshAttackID();
         this.self.updateAttackStats({"air_ease":0});
         this.self.updateAttackBoxStats(1,{
            "selfHitStun":1,
            "hitStun":5,
            "damage":3,
            "direction":90,
            "hitLag":-1,
            "power":20,
            "kbConstant":0
         });
         if(!this.cancelled)
         {
            SSF2API.createTimer(this.self,1,28,this.flying);
         }
      }
      
      function frame125() : *
      {
         this.self.refreshAttackID();
      }
      
      function frame128() : *
      {
         this.self.refreshAttackID();
      }
      
      function frame133() : *
      {
         this.self.refreshAttackID();
         this.self.updateAttackBoxStats(1,{
            "canDI":true,
            "damage":10,
            "direction":79,
            "hitLag":-1.1,
            "power":70,
            "kbConstant":50
         });
      }
      
      function frame136() : *
      {
         this.self.endAttack();
      }
   }
}
