package com.mcleodgaming.ssf2.menus
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.controllers.GameController;
   import com.mcleodgaming.ssf2.controllers.ItemButton;
   import com.mcleodgaming.ssf2.controllers.ItemSwitchHand;
   import com.mcleodgaming.ssf2.controllers.MenuController;
   import com.mcleodgaming.ssf2.util.SaveData;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ItemSwitchMenu extends Menu
   {
       
      
      private var selectHand:ItemSwitchHand;
      
      private var buttonList:Vector.<ItemButton>;
      
      private var itemsList:Array;
      
      public function ItemSwitchMenu()
      {
         this.buttonList = new Vector.<ItemButton>();
         this.itemsList = new Array();
         super();
         m_subMenu = Main.getLibraryMC("menu_itemswitch");
         this.buttonList = new Vector.<ItemButton>();
         this.itemsList = new Array();
         this.itemsList.push("smashball");
         this.itemsList.push("pokeball");
         this.itemsList.push("capsule,capsule_ex");
         this.itemsList.push("beamsword");
         this.itemsList.push("fan");
         this.itemsList.push("homerunbat");
         this.itemsList.push("maximumtomato");
         this.itemsList.push("fooditem");
         this.itemsList.push("assistTrophy");
         this.itemsList.push("heartContainer");
         this.itemsList.push("greenShell,redShell,spinyShell");
         this.itemsList.push("rayGun");
         this.itemsList.push("bobomb");
         this.itemsList.push("cucco");
         this.itemsList.push("mrsaturn");
         this.itemsList.push("explodingtag");
         this.itemsList.push("energytank");
         this.itemsList.push("supermushroom");
         this.itemsList.push("poisonmushroom");
         this.itemsList.push("freezie");
         this.itemsList.push("starrod");
         this.itemsList.push("bumper");
         this.itemsList.push("pitfall");
         if(!Main.DEBUG)
         {
            Utils.setBrightness(m_subMenu["i" + 15],-75);
            m_subMenu["i" + 15].disabled = true;
            m_subMenu["i" + 15].visible = false;
         }
         var _loc1_:Number = 0;
         while(_loc1_ < this.itemsList.length)
         {
            this.buttonList.push(new ItemButton(m_subMenu["i" + _loc1_],this.itemsList[_loc1_]));
            _loc1_++;
         }
         this.selectHand = new ItemSwitchHand(m_subMenu,this.buttonList,this.back_CLICK);
         this.selectHand.addClickEventClipCheckBounds(m_subMenu.allitems_btn);
         this.selectHand.addClickEventClipHitTest(m_subMenu.bg_top.back_btn);
         this.selectHand.addClickEventClipHitTest(m_subMenu.bg_top.home_btn);
         m_container.addChild(m_subMenu);
         m_subMenu.x = Main.Width / 2;
         m_subMenu.y = Main.Height / 2;
         this.updateItems();
         this.checkAllBtn();
      }
      
      override public function makeEvents() : void
      {
         if(m_showCount == 0)
         {
            findSubMenuButtons();
            findSpecificMenuButtons(m_subMenu.bg_top);
         }
         super.makeEvents();
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.CLICK,this.back_CLICK);
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.CLICK,this.back_ROLL_OVER);
         var _loc1_:Number = 0;
         while(_loc1_ < this.itemsList.length)
         {
            if(!m_subMenu["i" + _loc1_].disabled)
            {
               if(!this.buttonList[_loc1_].ButtonInstance.disabled)
               {
                  this.buttonList[_loc1_].makeEvents();
                  m_subMenu["i" + _loc1_].addEventListener(MouseEvent.MOUSE_OVER,this["i" + _loc1_ + "_MOUSE_OVER"]);
                  m_subMenu["i" + _loc1_].addEventListener(MouseEvent.MOUSE_OUT,this.clearDesc);
                  m_subMenu["i" + _loc1_].addEventListener(MouseEvent.CLICK,this.checkAllBtn);
               }
            }
            _loc1_++;
         }
         m_subMenu.allitems_btn.addEventListener(MouseEvent.CLICK,this.allitems_CLICK);
         m_subMenu.allitems_btn.addEventListener(MouseEvent.MOUSE_OVER,this.allitems_MOUSE_OVER);
         m_subMenu.bg_top.home_btn.addEventListener(MouseEvent.CLICK,this.home_CLICK);
         this.selectHand.makeEvents();
      }
      
      override public function killEvents() : void
      {
         super.killEvents();
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.CLICK,this.back_CLICK);
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.CLICK,this.back_ROLL_OVER);
         var _loc1_:Number = 0;
         while(_loc1_ < this.itemsList.length)
         {
            if(!m_subMenu["i" + _loc1_].disabled)
            {
               this.buttonList[_loc1_].killEvents();
               m_subMenu["i" + _loc1_].removeEventListener(MouseEvent.MOUSE_OVER,this["i" + _loc1_ + "_MOUSE_OVER"]);
               m_subMenu["i" + _loc1_].removeEventListener(MouseEvent.MOUSE_OUT,this.clearDesc);
               m_subMenu["i" + _loc1_].removeEventListener(MouseEvent.CLICK,this.checkAllBtn);
            }
            _loc1_++;
         }
         m_subMenu.allitems_btn.removeEventListener(MouseEvent.CLICK,this.allitems_CLICK);
         m_subMenu.allitems_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.allitems_MOUSE_OVER);
         m_subMenu.bg_top.home_btn.removeEventListener(MouseEvent.CLICK,this.home_CLICK);
         this.selectHand.killEvents();
      }
      
      private function back_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_back");
         removeSelf();
      }
      
      private function back_ROLL_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
      }
      
      private function updateItems() : void
      {
         var _loc1_:Number = 0;
         while(_loc1_ < this.itemsList.length)
         {
            m_subMenu["i" + _loc1_].gotoAndStop(!!SaveData.getItemStatus(this.itemsList[_loc1_])?"on":"off");
            _loc1_++;
         }
      }
      
      private function clearDesc(param1:MouseEvent) : void
      {
         m_subMenu.item_name.text = "";
         m_subMenu.item_desc.text = "";
      }
      
      private function i0_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.item_name.text = "Smash Ball";
         m_subMenu.item_desc.text = "Allows you to use your Final Smash.";
         Utils.fitText(m_subMenu.item_name,14);
      }
      
      private function i1_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.item_name.text = "Pokéball";
         m_subMenu.item_desc.text = "Releases a Pokémon to fight alongside you.";
         Utils.fitText(m_subMenu.item_name,14);
      }
      
      private function i2_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.item_name.text = "Capsule";
         m_subMenu.item_desc.text = "Contains a random item, or may explode!";
         Utils.fitText(m_subMenu.item_name,14);
      }
      
      private function i3_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.item_name.text = "Beam Sword";
         m_subMenu.item_desc.text = "Saber of pure energy. Hits hard!";
         Utils.fitText(m_subMenu.item_name,14);
      }
      
      private function i4_MOUSE_OVER(param1:MouseEvent) : void
      {
         m_subMenu.item_name.text = "Fan";
         m_subMenu.item_desc.text = "Repeatedly pummel your opponents!";
         Utils.fitText(m_subMenu.item_name,14);
      }
      
      private function i5_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.item_name.text = "Home Run Bat";
         m_subMenu.item_desc.text = "Knock your opponent out of the park!";
         Utils.fitText(m_subMenu.item_name,14);
      }
      
      private function i6_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.item_name.text = "Maximum Tomato";
         m_subMenu.item_desc.text = "Replenishes 50% damage when eaten.";
         Utils.fitText(m_subMenu.item_name,14);
      }
      
      private function i7_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.item_name.text = "Food";
         m_subMenu.item_desc.text = "Replenishes damage when eaten.";
         Utils.fitText(m_subMenu.item_name,14);
      }
      
      private function i8_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.item_name.text = "Assist Trophies";
         m_subMenu.item_desc.text = "Guest characters come to aid the fighter!";
         Utils.fitText(m_subMenu.item_name,14);
      }
      
      private function i9_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.item_name.text = "Heart Container";
         m_subMenu.item_desc.text = "Replenishes 100% damage.";
         Utils.fitText(m_subMenu.item_name,14);
      }
      
      private function i10_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.item_name.text = "Koopa Shells";
         m_subMenu.item_desc.text = "Throw them at opponents and watch them slide!";
         Utils.fitText(m_subMenu.item_name,14);
      }
      
      private function i11_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.item_name.text = "Ray Gun";
         m_subMenu.item_desc.text = "Fires a laser bullet at your opponent.";
         Utils.fitText(m_subMenu.item_name,14);
      }
      
      private function i12_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.item_name.text = "Bob-omb";
         m_subMenu.item_desc.text = "Explodes on contact. Caution - may walk around!";
         Utils.fitText(m_subMenu.item_name,14);
      }
      
      private function i13_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.item_name.text = "Cucco";
         m_subMenu.item_desc.text = "Toss them around, but don\'t make them angry!";
         Utils.fitText(m_subMenu.item_name,14);
      }
      
      private function i14_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.item_name.text = "Mr. Saturn";
         m_subMenu.item_desc.text = "Walks around stage - throw him at your opponents!";
         Utils.fitText(m_subMenu.item_name,14);
      }
      
      private function i15_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.item_name.text = "Exploding Tag";
         m_subMenu.item_desc.text = "Senses motion nearby and explodes.";
         Utils.fitText(m_subMenu.item_name,14);
      }
      
      private function i16_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.item_name.text = "Energy Tank";
         m_subMenu.item_desc.text = "Fully replenishes damage.";
         Utils.fitText(m_subMenu.item_name,14);
      }
      
      private function i17_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.item_name.text = "Super Mushroom";
         m_subMenu.item_desc.text = "Makes you become giant-sized.";
         Utils.fitText(m_subMenu.item_name,14);
      }
      
      private function i18_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.item_name.text = "Poison Mushroom";
         m_subMenu.item_desc.text = "Shrinks your character to mini-size.";
         Utils.fitText(m_subMenu.item_name,14);
      }
      
      private function i19_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.item_name.text = "Freezie";
         m_subMenu.item_desc.text = "Turns characters into a block of ice.";
         Utils.fitText(m_subMenu.item_name,14);
      }
      
      private function i20_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.item_name.text = "Star Rod";
         m_subMenu.item_desc.text = "Capable of firing a star projectile.";
         Utils.fitText(m_subMenu.item_name,14);
      }
      
      private function i21_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.item_name.text = "Bumper";
         m_subMenu.item_desc.text = "Bounces characters off like a pinball.";
         Utils.fitText(m_subMenu.item_name,14);
      }
      
      private function i22_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
         m_subMenu.item_name.text = "Pitfall";
         m_subMenu.item_desc.text = "Set a trap for your opponenets!";
         Utils.fitText(m_subMenu.item_name,14);
      }
      
      private function allitems_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_select");
         var _loc2_:Boolean = m_subMenu.allitems_btn.currentFrameLabel == "on";
         m_subMenu.allitems_btn.gotoAndStop(!!_loc2_?"off":"on");
         var _loc3_:Number = 0;
         while(_loc3_ < this.buttonList.length)
         {
            if(!m_subMenu["i" + _loc3_].disabled)
            {
               this.buttonList[_loc3_].setStatus(_loc2_);
            }
            else
            {
               this.buttonList[_loc3_].setStatus(false);
            }
            _loc3_++;
         }
      }
      
      private function allitems_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
      }
      
      public function checkAllBtn(param1:Event = null) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Number = 0;
         while(_loc3_ < this.buttonList.length)
         {
            if(!m_subMenu["i" + _loc3_].disabled)
            {
               if(!this.buttonList[_loc3_].getStatus())
               {
                  _loc2_ = true;
               }
            }
            _loc3_++;
         }
         m_subMenu.allitems_btn.gotoAndStop(!_loc2_?"off":"on");
      }
      
      private function home_CLICK(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_back");
         SoundQueue.instance.stopMusic();
         if(MenuController.CurrentCharacterSelectMenu)
         {
            MenuController.CurrentCharacterSelectMenu.resetScreen();
         }
         if(GameController.currentGame)
         {
            GameController.currentGame.killEvents();
         }
         GameController.currentGame = null;
         MenuController.removeAllMenus();
         MenuController.showTitleMenu();
      }
   }
}
