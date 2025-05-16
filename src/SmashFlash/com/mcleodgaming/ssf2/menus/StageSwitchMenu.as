package com.mcleodgaming.ssf2.menus
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.controllers.GameController;
   import com.mcleodgaming.ssf2.controllers.MenuController;
   import com.mcleodgaming.ssf2.controllers.StageSwitchButton;
   import com.mcleodgaming.ssf2.controllers.StageSwitchHand;
   import com.mcleodgaming.ssf2.engine.StageSetting;
   import com.mcleodgaming.ssf2.util.DisplayObjectTable;
   import com.mcleodgaming.ssf2.util.SaveData;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class StageSwitchMenu extends Menu
   {
       
      
      private var selectHand:StageSwitchHand;
      
      private var stageButtonsMaster:Vector.<StageSwitchButton>;
      
      private var stageButtonsNormal:Vector.<StageSwitchButton>;
      
      private var stageButtonsPast:Vector.<StageSwitchButton>;
      
      private var lastClickedNormal:StageSwitchButton;
      
      private var lastClickedPast:StageSwitchButton;
      
      protected var normalTable:DisplayObjectTable;
      
      protected var pastTable:DisplayObjectTable;
      
      public function StageSwitchMenu()
      {
         super();
         m_subMenu = Main.getLibraryMC("menu_stageswitch");
         this.stageButtonsNormal = new Vector.<StageSwitchButton>();
         this.stageButtonsPast = new Vector.<StageSwitchButton>();
         this.lastClickedNormal = null;
         this.lastClickedPast = null;
         this.stageButtonsMaster = new Vector.<StageSwitchButton>();
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s1,StageSetting.Battlefield));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s2,StageSetting.FinalDestination));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s3,StageSetting.DreamLand));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s4,StageSetting.HyruleTemple));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s5,StageSetting.WaitingRoom));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s6,StageSetting.GreenHillZone));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s8,StageSetting.TwilightTown));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s9,StageSetting.HuecoMundo));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s10,StageSetting.KonohaVillage));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s11,StageSetting.CometObservatory));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s12,StageSetting.CastleWily));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s13,StageSetting.SectorZ));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s14,StageSetting.TowerOfSalvation));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s15,StageSetting.CasinoNightZone));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s16,StageSetting.RainbowRoute));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s17,StageSetting.SaturnValley));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s18,StageSetting.JungleHijinx));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s19,StageSetting.CentralHighway));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s20,StageSetting.WarioWare));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s21,StageSetting.TempleOfTime));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s22,StageSetting.YoshisIsland));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s23,StageSetting.Namek));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s24,StageSetting.ChaosShrine));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s25,StageSetting.ShadowMosesIsland));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s26,StageSetting.ClockTown));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s27,StageSetting.SkySanctuary));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s28,StageSetting.GangplankGalleon));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s29,StageSetting.MushroomKingdomIII));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s30,StageSetting.Skyworld));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s31,StageSetting.Fourside));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s32,StageSetting.PokemonStadium3));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s33,StageSetting.PeachsCastle));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s34,StageSetting.Crateria));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s35,StageSetting.Smashville));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s36,StageSetting.SandOcean));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s37,StageSetting.CastleSiege));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s38,StageSetting.YoshisStory));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s39,StageSetting.BowsersCastle));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s40,StageSetting.EmeraldCave));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s41,StageSetting.Nintendo3DS));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s42,StageSetting.SkywardVoyage));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s43,StageSetting.HylianSkies));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s44,StageSetting.ButterBuilding));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s45,StageSetting.LakeOfRage));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s46,StageSetting.SilphCo));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s47,StageSetting.Phase8));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s48,StageSetting.IceClimbersStage));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s49,StageSetting.DraculaCastle));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s50,StageSetting.BombFactory));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s51,StageSetting.LunarCore));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s20,StageSetting.WarioWare));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s53,StageSetting.MeteoVoyage));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s1,StageSetting.Battlefield));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s2,StageSetting.FinalDestination));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s8,StageSetting.TwilightTown));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s9,StageSetting.HuecoMundo));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s10,StageSetting.KonohaVillage));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s11,StageSetting.CometObservatory));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s12,StageSetting.CastleWily));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s14,StageSetting.TowerOfSalvation));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s15,StageSetting.CasinoNightZone));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s16,StageSetting.RainbowRoute));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s17,StageSetting.SaturnValley));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s18,StageSetting.JungleHijinx));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s19,StageSetting.CentralHighway));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s21,StageSetting.TempleOfTime));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s22,StageSetting.YoshisIsland));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s23,StageSetting.Namek));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s24,StageSetting.ChaosShrine));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s26,StageSetting.ClockTown));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s46,StageSetting.SilphCo));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s27,StageSetting.SkySanctuary));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s28,StageSetting.GangplankGalleon));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s29,StageSetting.MushroomKingdomIII));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s32,StageSetting.PokemonStadium3));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s34,StageSetting.Crateria));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s36,StageSetting.SandOcean));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s39,StageSetting.BowsersCastle));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s40,StageSetting.EmeraldCave));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s41,StageSetting.Nintendo3DS));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s42,StageSetting.SkywardVoyage));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s43,StageSetting.HylianSkies));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s44,StageSetting.ButterBuilding));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s45,StageSetting.LakeOfRage));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s46,StageSetting.SilphCo));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s47,StageSetting.Phase8));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s48,StageSetting.IceClimbersStage));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s49,StageSetting.DraculaCastle));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s50,StageSetting.BombFactory));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s51,StageSetting.LunarCore));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s20,StageSetting.WarioWare));
         this.stageButtonsMaster.push(new StageSwitchButton(m_subMenu.s42,StageSetting.SkywardVoyage));
         this.stageButtonsNormal.push(new StageSwitchButton(m_subMenu.s53,StageSetting.MeteoVoyage));
         this.stageButtonsPast.push(new StageSwitchButton(m_subMenu.s13,StageSetting.SectorZ));
         this.stageButtonsPast.push(new StageSwitchButton(m_subMenu.s3,StageSetting.DreamLand));
         this.stageButtonsPast.push(new StageSwitchButton(m_subMenu.s4,StageSetting.HyruleTemple));
         this.stageButtonsPast.push(new StageSwitchButton(m_subMenu.s5,StageSetting.WaitingRoom));
         this.stageButtonsPast.push(new StageSwitchButton(m_subMenu.s6,StageSetting.GreenHillZone));
         this.stageButtonsPast.push(new StageSwitchButton(m_subMenu.s52,StageSetting.DistantPlanet));
         this.stageButtonsPast.push(new StageSwitchButton(m_subMenu.s25,StageSetting.ShadowMosesIsland));
         this.stageButtonsPast.push(new StageSwitchButton(m_subMenu.s30,StageSetting.Skyworld));
         this.stageButtonsPast.push(new StageSwitchButton(m_subMenu.s31,StageSetting.Fourside));
         this.stageButtonsPast.push(new StageSwitchButton(m_subMenu.s33,StageSetting.PeachsCastle));
         this.stageButtonsPast.push(new StageSwitchButton(m_subMenu.s35,StageSetting.Smashville));
         this.stageButtonsPast.push(new StageSwitchButton(m_subMenu.s37,StageSetting.CastleSiege));
         this.stageButtonsPast.push(new StageSwitchButton(m_subMenu.s38,StageSetting.YoshisStory));
         this.normalTable = new DisplayObjectTable(5,new Rectangle(-285,-90,50,50));
         this.normalTable.insertObject(0,m_subMenu.s1);
         this.normalTable.insertObject(0,m_subMenu.s2);
         this.normalTable.insertObject(0,m_subMenu.s29);
         this.normalTable.insertObject(0,m_subMenu.s12);
         this.normalTable.insertObject(0,m_subMenu.s11);
         this.normalTable.insertObject(0,m_subMenu.s8);
         this.normalTable.insertObject(0,m_subMenu.s49);
         this.normalTable.insertObject(0,m_subMenu.s53);
         this.normalTable.insertObject(1,m_subMenu.s19);
         this.normalTable.insertObject(1,m_subMenu.s9);
         this.normalTable.insertObject(1,m_subMenu.s10);
         this.normalTable.insertObject(1,m_subMenu.s14);
         this.normalTable.insertObject(1,m_subMenu.s15);
         this.normalTable.insertObject(1,m_subMenu.s26);
         this.normalTable.insertObject(1,m_subMenu.s46);
         this.normalTable.insertObject(1,m_subMenu.s47);
         this.normalTable.insertObject(2,m_subMenu.s27);
         this.normalTable.insertObject(3,m_subMenu.s22);
         this.normalTable.insertObject(2,m_subMenu.s23);
         this.normalTable.insertObject(2,m_subMenu.s24);
         this.normalTable.insertObject(2,m_subMenu.s28);
         this.normalTable.insertObject(2,m_subMenu.s18);
         this.normalTable.insertObject(2,m_subMenu.s45);
         this.normalTable.insertObject(2,m_subMenu.s50);
         this.normalTable.insertObject(3,m_subMenu.s36);
         this.normalTable.insertObject(3,m_subMenu.s34);
         this.normalTable.insertObject(3,m_subMenu.s16);
         this.normalTable.insertObject(3,m_subMenu.s17);
         this.normalTable.insertObject(3,m_subMenu.s32);
         this.normalTable.insertObject(3,m_subMenu.s41);
         this.normalTable.insertObject(3,m_subMenu.s51);
         this.normalTable.insertObject(4,m_subMenu.s39);
         this.normalTable.insertObject(4,m_subMenu.s43);
         this.normalTable.insertObject(4,m_subMenu.s40);
         this.normalTable.insertObject(4,m_subMenu.s44);
         this.normalTable.insertObject(4,m_subMenu.s48);
         this.normalTable.insertObject(4,m_subMenu.s42);
         this.normalTable.insertObject(4,m_subMenu.s20);
         this.pastTable = new DisplayObjectTable(4,new Rectangle(117,-90,50,50));
         this.pastTable.insertObject(0,m_subMenu.s3);
         this.pastTable.insertObject(0,m_subMenu.s13);
         this.pastTable.insertObject(0,m_subMenu.s25);
         this.pastTable.insertObject(1,m_subMenu.s35);
         this.pastTable.insertObject(1,m_subMenu.s31);
         this.pastTable.insertObject(1,m_subMenu.s52);
         this.pastTable.insertObject(1,m_subMenu.s30);
         this.pastTable.insertObject(2,m_subMenu.s33);
         this.pastTable.insertObject(2,m_subMenu.s4);
         this.pastTable.insertObject(2,m_subMenu.s6);
         this.pastTable.insertObject(3,m_subMenu.s38);
         this.pastTable.insertObject(3,m_subMenu.s5);
         this.pastTable.insertObject(3,m_subMenu.s37);
         this.updateStages();
         this.checkAllBtn();
         this.selectHand = new StageSwitchHand(m_subMenu,this.stageButtonsMaster,this.back_CLICK);
         this.selectHand.addClickEventClipCheckBounds(m_subMenu.allNormal_btn);
         this.selectHand.addClickEventClipCheckBounds(m_subMenu.allPast_btn);
         this.selectHand.addClickEventClipHitTest(m_subMenu.bg_top.back_btn);
         this.selectHand.addClickEventClipHitTest(m_subMenu.bg_top.home_btn);
         m_container.addChild(m_subMenu);
         m_subMenu.x = Main.Width / 2;
         m_subMenu.y = Main.Height / 2;
      }
      
      override public function makeEvents() : void
      {
         if(m_showCount == 0)
         {
            findSubMenuButtons();
            findSpecificMenuButtons(m_subMenu.bg_top);
         }
         super.makeEvents();
         this.selectHand.makeEvents();
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.CLICK,this.back_CLICK);
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.CLICK,this.back_ROLL_OVER);
         m_subMenu.allNormal_btn.addEventListener(MouseEvent.CLICK,this.allNormal_CLICK);
         m_subMenu.allNormal_btn.addEventListener(MouseEvent.MOUSE_OVER,this.allNormal_MOUSE_OVER);
         m_subMenu.allPast_btn.addEventListener(MouseEvent.CLICK,this.allPast_CLICK);
         m_subMenu.allPast_btn.addEventListener(MouseEvent.MOUSE_OVER,this.allPast_MOUSE_OVER);
         m_subMenu.bg_top.home_btn.addEventListener(MouseEvent.CLICK,this.home_CLICK);
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < this.stageButtonsNormal.length)
         {
            this.stageButtonsNormal[_loc1_].setClickFunc(this.checkAllBtn);
            this.stageButtonsNormal[_loc1_].makeEvents();
            if(this.lastClickedNormal == null && this.stageButtonsNormal[_loc1_].getStatus() && this.stageButtonsNormal[_loc1_].ButtonInstance.visible)
            {
               this.lastClickedNormal = this.stageButtonsNormal[_loc1_];
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.stageButtonsPast.length)
         {
            this.stageButtonsPast[_loc1_].makeEvents();
            this.stageButtonsPast[_loc1_].setClickFunc(this.checkAllBtn);
            if(this.lastClickedPast == null && this.stageButtonsPast[_loc1_].getStatus() && this.stageButtonsPast[_loc1_].ButtonInstance.visible)
            {
               this.lastClickedPast = this.stageButtonsPast[_loc1_];
            }
            _loc1_++;
         }
      }
      
      override public function killEvents() : void
      {
         var _loc1_:int = 0;
         super.killEvents();
         this.selectHand.killEvents();
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.CLICK,this.back_CLICK);
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.CLICK,this.back_ROLL_OVER);
         m_subMenu.allNormal_btn.removeEventListener(MouseEvent.CLICK,this.allNormal_CLICK);
         m_subMenu.allNormal_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.allNormal_MOUSE_OVER);
         m_subMenu.allPast_btn.removeEventListener(MouseEvent.CLICK,this.allPast_CLICK);
         m_subMenu.allPast_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.allPast_MOUSE_OVER);
         m_subMenu.bg_top.home_btn.removeEventListener(MouseEvent.CLICK,this.home_CLICK);
         _loc1_ = 0;
         while(_loc1_ < this.stageButtonsNormal.length)
         {
            this.stageButtonsNormal[_loc1_].killEvents();
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.stageButtonsPast.length)
         {
            this.stageButtonsPast[_loc1_].killEvents();
            _loc1_++;
         }
      }
      
      override public function show() : void
      {
         m_subMenu.s21.visible = false;
         if(!Main.DEBUG)
         {
            m_subMenu.s5.visible = false;
            m_subMenu.s30.visible = false;
            m_subMenu.s44.visible = false;
            m_subMenu.s45.visible = false;
            m_subMenu.s48.visible = false;
         }
         this.pastTable.spaceObjects();
         this.normalTable.spaceObjects();
         this.checkAllBtn();
         super.show();
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
      
      private function updateStages() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < this.stageButtonsNormal.length)
         {
            this.stageButtonsNormal[_loc1_].ButtonInstance.gotoAndStop(!!SaveData.getStageStatus(this.stageButtonsNormal[_loc1_].ID)?"on":"off");
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.stageButtonsPast.length)
         {
            this.stageButtonsPast[_loc1_].ButtonInstance.gotoAndStop(!!SaveData.getStageStatus(this.stageButtonsPast[_loc1_].ID)?"on":"off");
            _loc1_++;
         }
      }
      
      private function allNormal_CLICK(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         SoundQueue.instance.playSoundEffect("menu_select");
         var _loc4_:Boolean = m_subMenu.allNormal_btn.currentFrameLabel == "on";
         m_subMenu.allNormal_btn.gotoAndStop(!!_loc4_?"off":"on");
         _loc2_ = 0;
         while(_loc2_ < this.stageButtonsNormal.length)
         {
            if(this.stageButtonsNormal[_loc2_].ButtonInstance.visible)
            {
               this.stageButtonsNormal[_loc2_].setStatus(_loc4_);
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.stageButtonsPast.length)
         {
            if(this.stageButtonsPast[_loc2_].ButtonInstance.visible && this.stageButtonsPast[_loc2_].getStatus())
            {
               _loc3_++;
            }
            _loc2_++;
         }
         if(_loc3_ == 0)
         {
            if(!this.lastClickedNormal)
            {
               this.lastClickedNormal = this.stageButtonsNormal[0];
               this.lastClickedNormal.setStatus(true);
            }
            else
            {
               this.lastClickedNormal.setStatus(true);
            }
         }
      }
      
      private function allNormal_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
      }
      
      private function allPast_CLICK(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         SoundQueue.instance.playSoundEffect("menu_select");
         var _loc4_:Boolean = m_subMenu.allPast_btn.currentFrameLabel == "on";
         m_subMenu.allPast_btn.gotoAndStop(!!_loc4_?"off":"on");
         _loc2_ = 0;
         while(_loc2_ < this.stageButtonsPast.length)
         {
            if(this.stageButtonsPast[_loc2_].ButtonInstance.visible)
            {
               this.stageButtonsPast[_loc2_].setStatus(_loc4_);
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.stageButtonsNormal.length)
         {
            if(this.stageButtonsNormal[_loc2_].ButtonInstance.visible && this.stageButtonsNormal[_loc2_].getStatus())
            {
               _loc3_++;
            }
            _loc2_++;
         }
         if(_loc3_ == 0)
         {
            if(!this.lastClickedPast)
            {
               this.lastClickedPast = this.stageButtonsPast[1];
               this.lastClickedPast.setStatus(true);
            }
            else
            {
               this.lastClickedPast.setStatus(true);
            }
         }
      }
      
      private function allPast_MOUSE_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
      }
      
      private function checkAllBtn(param1:StageSwitchButton = null) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(this.stageButtonsNormal.indexOf(param1) >= 0)
         {
            _loc7_ = 0;
            this.lastClickedNormal = param1;
         }
         else if(this.stageButtonsPast.indexOf(param1) >= 0)
         {
            _loc7_ = 1;
            this.lastClickedPast = param1;
         }
         _loc2_ = 0;
         while(_loc2_ < this.stageButtonsNormal.length)
         {
            if(this.stageButtonsNormal[_loc2_].ButtonInstance.visible && this.stageButtonsNormal[_loc2_].getStatus())
            {
               _loc3_++;
            }
            else if(!this.stageButtonsNormal[_loc2_].ButtonInstance.visible)
            {
               _loc5_++;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.stageButtonsPast.length)
         {
            if(this.stageButtonsPast[_loc2_].ButtonInstance.visible && this.stageButtonsPast[_loc2_].getStatus())
            {
               _loc4_++;
            }
            else if(!this.stageButtonsPast[_loc2_].ButtonInstance.visible)
            {
               _loc6_++;
            }
            _loc2_++;
         }
         if(_loc7_ == 0)
         {
            m_subMenu.allNormal_btn.gotoAndStop(_loc3_ == this.stageButtonsNormal.length - _loc5_?"off":"on");
            if(_loc3_ == 0 && _loc4_ == 0)
            {
               this.lastClickedNormal.setStatus(true);
            }
         }
         if(_loc7_ == 1)
         {
            m_subMenu.allPast_btn.gotoAndStop(_loc4_ == this.stageButtonsPast.length - _loc6_?"off":"on");
            if(_loc3_ == 0 && _loc4_ == 0)
            {
               this.lastClickedPast.setStatus(true);
            }
         }
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
