package sora_fla
{
   import com.mcleodgaming.ssf2api.core.SSF2API;
   import com.mcleodgaming.ssf2api.core.SSF2Event;
   import flash.display.MovieClip;
   
   public dynamic class SoraItem_gif_54 extends MovieClip
   {
       
      
      public var attackBox:MovieClip;
      
      public var hand:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self;
      
      public var xframe:String;
      
      public function SoraItem_gif_54()
      {
         super();
         addFrameScript(0,this.frame1,5,this.frame6,6,this.frame7,9,this.frame10,10,this.frame11,13,this.frame14,16,this.frame17,25,this.frame26,26,this.frame27,28,this.frame29,31,this.frame32,32,this.frame33,34,this.frame35,40,this.frame41,52,this.frame53,86,this.frame87,88,this.frame89,94,this.frame95,95,this.frame96,115,this.frame116,128,this.frame129,131,this.frame132);
      }
      
      function frame1() : *
      {
         if(SSF2API.isReady())
         {
            this.self = SSF2API.getCharacter(this);
         }
         this.xframe = "charging";
      }
      
      function frame6() : *
      {
         this.self.endAttack();
      }
      
      function frame7() : *
      {
         this.xframe = "charging";
      }
      
      function frame10() : *
      {
         gotoAndPlay("fan2");
      }
      
      function frame11() : *
      {
         this.xframe = "attack";
      }
      
      function frame14() : *
      {
         this.self.endAttack();
      }
      
      function frame17() : *
      {
         this.self.playAttackSound(1);
      }
      
      function frame26() : *
      {
         this.self.endAttack();
      }
      
      function frame27() : *
      {
         this.xframe = null;
      }
      
      function frame29() : *
      {
         this.xframe = "charging";
      }
      
      function frame32() : *
      {
         gotoAndPlay("beamsword2_charge");
      }
      
      function frame33() : *
      {
         this.xframe = "attack";
      }
      
      function frame35() : *
      {
         if(this.self.getItem().getUses() <= this.self.getItem().getItemStat("uses_max") && this.self.getItem().getItemStat("linkage_id") == "starrod")
         {
            this.self.getItem().fireProjectile("starrod_star");
            SSF2API.print("Uses left: " + (this.self.getItem().getItemStat("uses_max") - this.self.getItem().getUses()));
            this.self.playAttackSound(1);
         }
         else if(this.self.getItem().getItemStat("linkage_id") != "starrod")
         {
            this.self.playAttackSound(1);
         }
         else
         {
            SSF2API.print("Star Rod is empty, firing failed!");
         }
      }
      
      function frame41() : *
      {
         this.self.endAttack();
      }
      
      function frame53() : *
      {
         this.self.endAttack();
      }
      
      function frame87() : *
      {
         this.self.endAttack();
      }
      
      function frame89() : *
      {
         if(this.self.getItem().getUses() <= this.self.getItem().getItemStat("uses_max"))
         {
            this.self.getItem().fireProjectile("bullet",5,-21);
            SSF2API.print("Uses left: " + (this.self.getItem().getItemStat("uses_max") - this.self.getItem().getUses()));
            this.self.playAttackSound(1);
         }
         else
         {
            SSF2API.print("Raygun is empty, firing failed!");
            this.self.playAttackSound(2);
         }
      }
      
      function frame95() : *
      {
         this.self.endAttack();
      }
      
      function frame96() : *
      {
         SSF2API.addEventListener(this.self,SSF2Event.GROUND_TOUCH,this.self.toLand);
      }
      
      function frame116() : *
      {
         gotoAndPlay("cuccoloop");
      }
      
      function frame129() : *
      {
         if(this.self.getItem() != null)
         {
            if(this.self.getItem().getItemStat("linkage_id") == "energytank" && this.self.getDamage() > 0)
            {
               this.gotoAndPlay("assistloop");
            }
         }
      }
      
      function frame132() : *
      {
         this.self.endAttack();
      }
   }
}
