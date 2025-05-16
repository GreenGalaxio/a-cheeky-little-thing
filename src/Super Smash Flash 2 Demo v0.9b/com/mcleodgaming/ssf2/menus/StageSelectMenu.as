package com.mcleodgaming.ssf2.menus
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.audio.SoundQueue;
   import com.mcleodgaming.ssf2.controllers.Game;
   import com.mcleodgaming.ssf2.controllers.GameController;
   import com.mcleodgaming.ssf2.controllers.MenuController;
   import com.mcleodgaming.ssf2.controllers.StageButton;
   import com.mcleodgaming.ssf2.controllers.StageSelectHand;
   import com.mcleodgaming.ssf2.engine.StageSetting;
   import com.mcleodgaming.ssf2.enums.Mode;
   import com.mcleodgaming.ssf2.util.DisplayObjectTable;
   import com.mcleodgaming.ssf2.util.Utils;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class StageSelectMenu extends Menu
   {
       
      
      private var stageButtons:Vector.<StageButton>;
      
      private var previewer:MovieClip;
      
      private var selectHand:StageSelectHand;
      
      protected var normalStageTable:DisplayObjectTable;
      
      protected var pastStageTable:DisplayObjectTable;
      
      protected var secretStageTable:DisplayObjectTable;
      
      private var m_normal_btn:MovieClip;
      
      private var m_past_btn:MovieClip;
      
      private var m_unlockable_btn:MovieClip;
      
      private var m_other_btn:MovieClip;
      
      public function StageSelectMenu()
      {
         super();
         m_subMenu = Main.getLibraryMC("menu_stageselect");
         this.stageButtons = new Vector.<StageButton>();
         this.previewer = MovieClip(m_subMenu.stage_sample.previewer.addChild(Main.getLibraryMC("stagePreviewer")));
         this.previewer.name = "mc";
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s0,StageSetting.Random));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s1,StageSetting.Battlefield));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s2,StageSetting.FinalDestination));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s3,StageSetting.DreamLand));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s4,StageSetting.HyruleTemple));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s5,StageSetting.WaitingRoom));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s6,StageSetting.GreenHillZone));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s7,StageSetting.MushroomKingdomII));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s8,StageSetting.TwilightTown));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s9,StageSetting.HuecoMundo));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s10,StageSetting.KonohaVillage));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s11,StageSetting.CometObservatory));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s12,StageSetting.CastleWily));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s13,StageSetting.SectorZ));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s14,StageSetting.TowerOfSalvation));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s15,StageSetting.CasinoNightZone));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s16,StageSetting.RainbowRoute));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s17,StageSetting.SaturnValley));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s18,StageSetting.JungleHijinx));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s19,StageSetting.CentralHighway));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s20,StageSetting.WarioWare));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s21,StageSetting.TempleOfTime));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s22,StageSetting.YoshisIsland));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s23,StageSetting.Namek));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s24,StageSetting.ChaosShrine));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s25,StageSetting.ShadowMosesIsland));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s26,StageSetting.ClockTown));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s27,StageSetting.SkySanctuary));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s28,StageSetting.GangplankGalleon));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s29,StageSetting.MushroomKingdomIII));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s30,StageSetting.Skyworld));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s31,StageSetting.Fourside));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s32,StageSetting.PokemonStadium3));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s33,StageSetting.PeachsCastle));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s34,StageSetting.Crateria));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s35,StageSetting.Smashville));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s36,StageSetting.SandOcean));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s37,StageSetting.CastleSiege));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s38,StageSetting.YoshisStory));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s39,StageSetting.BowsersCastle));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s40,StageSetting.EmeraldCave));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s41,StageSetting.Nintendo3DS));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s42,StageSetting.SkywardVoyage));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s43,StageSetting.HylianSkies));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s44,StageSetting.ButterBuilding));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s45,StageSetting.LakeOfRage));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s46,StageSetting.SilphCo));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s47,StageSetting.Phase8));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s48,StageSetting.IceClimbersStage));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s49,StageSetting.DraculaCastle));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s50,StageSetting.BombFactory));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s51,StageSetting.LunarCore));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s52,StageSetting.DistantPlanet));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.s53,StageSetting.MeteoVoyage));
         this.stageButtons.push(new StageButton(GameController.currentGame,m_subMenu.sxp,StageSetting.ExpansionStage));
         this.selectHand = new StageSelectHand(m_subMenu,this.stageButtons,this.backCharSelect_CLICK);
         this.selectHand.addClickEventClipCheckBounds(m_subMenu.normal_btn);
         this.selectHand.addClickEventClipCheckBounds(m_subMenu.past_btn);
         this.selectHand.addClickEventClipHitTest(m_subMenu.bg_top.back_btn);
         this.normalStageTable = new DisplayObjectTable(7,new Rectangle(-265.55,-105,49,36));
         this.pastStageTable = new DisplayObjectTable(7,new Rectangle(-225,-55,55,42));
         this.secretStageTable = new DisplayObjectTable(7,new Rectangle(13,-105,49,36));
         this.normalStageTable.insertObject(0,m_subMenu.s1);
         this.normalStageTable.insertObject(0,m_subMenu.s2);
         this.normalStageTable.insertObject(0,m_subMenu.s5);
         this.normalStageTable.insertObject(0,m_subMenu.s11);
         this.normalStageTable.insertObject(0,m_subMenu.s29);
         this.normalStageTable.insertObject(0,m_subMenu.s39);
         this.normalStageTable.insertObject(1,m_subMenu.s18);
         this.normalStageTable.insertObject(1,m_subMenu.s28);
         this.normalStageTable.insertObject(1,m_subMenu.s22);
         this.normalStageTable.insertObject(1,m_subMenu.s20);
         this.normalStageTable.insertObject(1,m_subMenu.s40);
         this.normalStageTable.insertObject(2,m_subMenu.s41);
         this.normalStageTable.insertObject(2,m_subMenu.s42);
         this.normalStageTable.insertObject(2,m_subMenu.s26);
         this.normalStageTable.insertObject(2,m_subMenu.s43);
         this.normalStageTable.insertObject(2,m_subMenu.s16);
         this.normalStageTable.insertObject(2,m_subMenu.s44);
         this.normalStageTable.insertObject(3,m_subMenu.s32);
         this.normalStageTable.insertObject(3,m_subMenu.s45);
         this.normalStageTable.insertObject(3,m_subMenu.s46);
         this.normalStageTable.insertObject(3,m_subMenu.s53);
         this.normalStageTable.insertObject(3,m_subMenu.s34);
         this.normalStageTable.insertObject(3,m_subMenu.s47);
         this.normalStageTable.insertObject(3,m_subMenu.s36);
         this.normalStageTable.insertObject(4,m_subMenu.s17);
         this.normalStageTable.insertObject(4,m_subMenu.s48);
         this.normalStageTable.insertObject(4,m_subMenu.s49);
         this.normalStageTable.insertObject(4,m_subMenu.s50);
         this.normalStageTable.insertObject(4,m_subMenu.s14);
         this.normalStageTable.insertObject(5,m_subMenu.s12);
         this.normalStageTable.insertObject(5,m_subMenu.s19);
         this.normalStageTable.insertObject(5,m_subMenu.s8);
         this.normalStageTable.insertObject(5,m_subMenu.s24);
         this.normalStageTable.insertObject(5,m_subMenu.s51);
         this.normalStageTable.insertObject(6,m_subMenu.s15);
         this.normalStageTable.insertObject(6,m_subMenu.s27);
         this.normalStageTable.insertObject(6,m_subMenu.s9);
         this.normalStageTable.insertObject(6,m_subMenu.s10);
         this.normalStageTable.insertObject(6,m_subMenu.s23);
         this.pastStageTable.insertObject(0,m_subMenu.s33);
         this.pastStageTable.insertObject(0,m_subMenu.s38);
         this.pastStageTable.insertObject(0,m_subMenu.s3);
         this.pastStageTable.insertObject(0,m_subMenu.s4);
         this.pastStageTable.insertObject(1,m_subMenu.s13);
         this.pastStageTable.insertObject(1,m_subMenu.s31);
         this.pastStageTable.insertObject(1,m_subMenu.s30);
         this.pastStageTable.insertObject(1,m_subMenu.s52);
         this.pastStageTable.insertObject(2,m_subMenu.s37);
         this.pastStageTable.insertObject(2,m_subMenu.s35);
         this.pastStageTable.insertObject(2,m_subMenu.s25);
         this.pastStageTable.insertObject(2,m_subMenu.s6);
         this.m_normal_btn = m_subMenu.normal_btn;
         this.m_past_btn = m_subMenu.past_btn;
         this.m_unlockable_btn = m_subMenu.unlockable_btn;
         this.m_other_btn = m_subMenu.other_btn;
         this.m_normal_btn.gotoAndStop("on");
         this.m_past_btn.gotoAndStop("off");
         this.m_unlockable_btn.gotoAndStop("off");
         this.m_other_btn.gotoAndStop("off");
         m_container.addChild(m_subMenu);
         m_subMenu.x = Main.Width / 2;
         m_subMenu.y = Main.Height / 2;
         m_subMenu.sxp.visible = false;
         m_subMenu.s7.visible = false;
         this.secretStageTable.hideAll();
         this.pastStageTable.hideAll();
         this.normalStageTable.showAll();
      }
      
      override public function makeEvents() : void
      {
         if(m_showCount == 0)
         {
            findSubMenuButtons();
            findSpecificMenuButtons(m_subMenu.bg_top);
            findSpecificMenuButtons(m_subMenu);
         }
         super.makeEvents();
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.CLICK,this.backCharSelect_CLICK);
         m_subMenu.bg_top.back_btn.addEventListener(MouseEvent.MOUSE_OVER,this.backCharSelect_OVER);
         this.m_normal_btn.addEventListener(MouseEvent.CLICK,this.showNormalStages);
         this.m_past_btn.addEventListener(MouseEvent.CLICK,this.showPastStages);
         this.m_other_btn.addEventListener(MouseEvent.CLICK,this.showOtherStages);
         this.selectHand.makeEvents();
         var _loc1_:int = 0;
         while(_loc1_ < this.stageButtons.length)
         {
            this.stageButtons[_loc1_].makeEvents();
            _loc1_++;
         }
      }
      
      override public function killEvents() : void
      {
         super.killEvents();
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.CLICK,this.backCharSelect_CLICK);
         m_subMenu.bg_top.back_btn.removeEventListener(MouseEvent.MOUSE_OVER,this.backCharSelect_OVER);
         this.m_normal_btn.removeEventListener(MouseEvent.CLICK,this.showNormalStages);
         this.m_past_btn.removeEventListener(MouseEvent.CLICK,this.showPastStages);
         this.m_other_btn.removeEventListener(MouseEvent.CLICK,this.showOtherStages);
         this.selectHand.killEvents();
         var _loc1_:int = 0;
         while(_loc1_ < this.stageButtons.length)
         {
            this.stageButtons[_loc1_].killEvents();
            _loc1_++;
         }
      }
      
      public function setCurrentGame(param1:Game) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.stageButtons.length)
         {
            this.stageButtons[_loc2_].setCurrentGame(param1);
            _loc2_++;
         }
      }
      
      private function showNormalStages(param1:MouseEvent) : void
      {
         this.resetAll();
         this.normalStageTable.showAll();
         this.m_normal_btn.gotoAndStop("on");
         this.updateIcons();
         this.normalStageTable.spaceObjects();
         this.pastStageTable.hideAll();
         this.secretStageTable.hideAll();
         SoundQueue.instance.playSoundEffect("menu_select");
      }
      
      private function showPastStages(param1:MouseEvent) : void
      {
         this.resetAll();
         this.pastStageTable.showAll();
         this.m_past_btn.gotoAndStop("on");
         this.updateIcons();
         this.pastStageTable.spaceObjects();
         this.normalStageTable.hideAll();
         this.secretStageTable.hideAll();
         SoundQueue.instance.playSoundEffect("menu_select");
      }
      
      private function showUnlockableStages(param1:MouseEvent) : void
      {
         this.resetAll();
         this.secretStageTable.showAll();
         this.m_unlockable_btn.gotoAndStop("on");
         this.updateIcons();
         this.secretStageTable.spaceObjects();
         this.pastStageTable.hideAll();
         this.normalStageTable.hideAll();
         SoundQueue.instance.playSoundEffect("menu_select");
      }
      
      private function showOtherStages(param1:MouseEvent) : void
      {
      }
      
      private function resetAll() : void
      {
         this.normalStageTable.hideAll();
         this.secretStageTable.hideAll();
         this.pastStageTable.hideAll();
         this.m_normal_btn.gotoAndStop("off");
         this.m_past_btn.gotoAndStop("off");
         this.m_unlockable_btn.gotoAndStop("off");
         this.m_other_btn.gotoAndStop("off");
      }
      
      private function updateIcons() : void
      {
         if(!Main.DEBUG)
         {
            m_subMenu.sxp.visible = false;
            m_subMenu.s5.visible = false;
            m_subMenu.s44.visible = false;
            m_subMenu.s45.visible = false;
            m_subMenu.s48.visible = false;
            if(!Main.DEBUG)
            {
               m_subMenu.s30.visible = false;
            }
         }
         else
         {
            m_subMenu.sxp.visible = Main.getLoadedStage("xpstage") != null;
         }
         Utils.setBrightness(this.m_unlockable_btn,-100);
         Utils.setBrightness(this.m_other_btn,-100);
         m_subMenu.s21.visible = false;
      }
      
      override public function show() : void
      {
         this.resetAll();
         this.normalStageTable.showAll();
         this.updateIcons();
         this.normalStageTable.spaceObjects();
         this.m_normal_btn.gotoAndStop("on");
         MovieClip(m_subMenu.stage_sample.previewer.getChildByName("mc")).gotoAndStop("paused");
         m_subMenu.stage_sample.stage_txt.text = "";
         this.selectHand.resetPosition();
         GameController.isStarted = false;
         super.show();
      }
      
      private function backCharSelect_CLICK(param1:MouseEvent) : void
      {
         removeSelf();
         SoundQueue.instance.playSoundEffect("menu_back");
         if(GameController.currentGame && GameController.currentGame.GameMode === Mode.ONLINE)
         {
            MenuController.showSpecialModeMenu();
         }
         else
         {
            MenuController.CurrentCharacterSelectMenu.show();
         }
      }
      
      private function backCharSelect_OVER(param1:MouseEvent) : void
      {
         SoundQueue.instance.playSoundEffect("menu_hover");
      }
   }
}
