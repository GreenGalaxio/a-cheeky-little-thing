package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import com.mcleodgaming.ssf2api.core.SSF2Event;
   import flash.display.MovieClip;
   
   public dynamic class sora_finalsmash_79 extends MovieClip
   {
       
      
      public var attackBox:MovieClip;
      
      public var range:MovieClip;
      
      public var touchBox:MovieClip;
      
      public var self;
      
      public var controls:Object;
      
      public var unpressed:Boolean;
      
      public var damage:int;
      
      public var continuePlaying:Boolean;
      
      public var handled:Boolean;
      
      public var cheapblock:Boolean;
      
      public function sora_finalsmash_79()
      {
         super();
         addFrameScript(0,this.frame1,2,this.frame3,17,this.frame18,18,this.frame19,32,this.frame33,38,this.frame39,41,this.frame42,62,this.frame63,67,this.frame68,72,this.frame73,76,this.frame77,78,this.frame79,80,this.frame81,82,this.frame83,83,this.frame84,86,this.frame87,90,this.frame91,94,this.frame95,95,this.frame96,98,this.frame99,101,this.frame102,104,this.frame105,107,this.frame108,111,this.frame112,115,this.frame116,119,this.frame120,136,this.frame137,145,this.frame146,146,this.frame147,155,this.frame156);
      }
      
      public function keepGoing(param1:* = null) : *
      {
         SSF2API.print("KeepGoingFired");
         SSF2API.removeEventListener(this.self,SSF2Event.ATTACK_HIT,this.keepGoing);
         SSF2API.removeEventListener(this.self,SSF2Event.ATTACK_CONNECT_SHIELD,this.keepGoing);
         this.continuePlaying = true;
      }
      
      function frame1() : *
      {
         this.self = SSF2API.getCharacter(this);
         this.unpressed = true;
         this.damage = 2;
         this.continuePlaying = false;
         this.handled = true;
         this.cheapblock = true;
         if(parent && SSF2API.isReady() && this.self)
         {
            SSF2API.print("SpecialFired");
            this.self.playVoiceSound(1);
            SSF2API.addEventListener(this.self,SSF2Event.ATTACK_HIT,this.keepGoing);
            SSF2API.addEventListener(this.self,SSF2Event.ATTACK_CONNECT_SHIELD,this.keepGoing);
         }
      }
      
      function frame3() : *
      {
         if(this.continuePlaying)
         {
            this.gotoAndPlay("begin");
         }
         this.self.updateAttackBoxStats(1,{"hasEffect":false});
      }
      
      function frame18() : *
      {
         this.self.endAttack();
      }
      
      function frame19() : *
      {
         this.continuePlaying = false;
         this.self.refreshAttackID();
         this.self.attachEffectOverlay("sora_fsbox",{
            "flip":false,
            "resize":false
         });
         this.self.updateAttackBoxStats(1,{
            "damage":4,
            "priority":7,
            "hitStun":1,
            "selfHitStun":0,
            "hitLag":-1,
            "direction":45,
            "power":0,
            "kbConstant":0,
            "effect_id":"effect_lightHit",
            "effectSound":"sw_brawl_hit_H"
         });
         this.self.updateAttackBoxStats(1,{"hasEffect":false});
      }
      
      function frame33() : *
      {
         this.self.playVoiceSound(2);
      }
      
      function frame39() : *
      {
         this.self.playVoiceSound(3);
      }
      
      function frame42() : *
      {
         this.self.playVoiceSound(12);
         this.self.playVoiceSound(13);
      }
      
      function frame63() : *
      {
         this.self.playVoiceSound(4);
         this.self.playAttackSound(3);
         this.self.refreshAttackID();
      }
      
      function frame68() : *
      {
         this.self.playVoiceSound(5);
         this.self.playAttackSound(1);
         this.self.refreshAttackID();
      }
      
      function frame73() : *
      {
         this.self.refreshAttackID();
         this.self.playAttackSound(1);
      }
      
      function frame77() : *
      {
         this.self.playVoiceSound(6);
         this.self.playAttackSound(1);
         this.self.refreshAttackID();
      }
      
      function frame79() : *
      {
         SSF2API.playSound("noticeSound");
      }
      
      function frame81() : *
      {
         this.self.refreshAttackID();
         this.self.playAttackSound(3);
      }
      
      function frame83() : *
      {
         this.continuePlaying = false;
         this.handled = false;
         this.cheapblock = true;
      }
      
      function frame84() : *
      {
         this.self.playVoiceSound(7);
         this.self.refreshAttackID();
         this.self.playAttackSound(3);
      }
      
      function frame87() : *
      {
         this.self.refreshAttackID();
         this.self.playAttackSound(2);
      }
      
      function frame91() : *
      {
         this.self.refreshAttackID();
         this.self.playAttackSound(2);
      }
      
      function frame95() : *
      {
         SSF2API.playSound("noticeSound");
      }
      
      function frame96() : *
      {
         this.self.playVoiceSound(5);
         this.self.refreshAttackID();
         this.self.playAttackSound(2);
      }
      
      function frame99() : *
      {
         this.self.playVoiceSound(7);
         this.self.refreshAttackID();
         this.self.playAttackSound(3);
      }
      
      function frame102() : *
      {
         this.self.refreshAttackID();
         this.self.playAttackSound(1);
      }
      
      function frame105() : *
      {
         this.self.playVoiceSound(6);
         this.self.refreshAttackID();
         this.self.playAttackSound(1);
      }
      
      function frame108() : *
      {
         this.self.refreshAttackID();
         this.self.playAttackSound(1);
      }
      
      function frame112() : *
      {
         this.self.playVoiceSound(4);
         this.self.refreshAttackID();
         this.self.playAttackSound(1);
      }
      
      function frame116() : *
      {
         this.self.refreshAttackID();
         this.self.playAttackSound(1);
      }
      
      function frame120() : *
      {
         SSF2API.playSound("noticeSound");
         this.self.playVoiceSound(5);
         this.self.refreshAttackID();
         this.self.playAttackSound(3);
      }
      
      function frame137() : *
      {
         this.self.updateAttackBoxStats(1,{
            "power":86,
            "kbConstant":240,
            "hasEffect":true
         });
         this.self.refreshAttackID();
         this.self.playVoiceSound(11);
         this.self.playAttackSound(2);
      }
      
      function frame146() : *
      {
         this.self.endAttack();
      }
      
      function frame147() : *
      {
         this.self.releaseOpponent();
         this.self.updateAttackStats({"forceComboContinue":false});
      }
      
      function frame156() : *
      {
         this.self.endAttack();
      }
   }
}
