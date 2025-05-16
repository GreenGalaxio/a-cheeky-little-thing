package com.mcleodgaming.ssf2.engine
{
   import com.mcleodgaming.ssf2.util.SaveData;
   import com.mcleodgaming.ssf2.util.Utils;
   
   public class StageSetting
   {
      
      private static var m_currentID:String = null;
       
      
      private var m_p1XStart:Number;
      
      private var m_p1YStart:Number;
      
      private var m_p2XStart:Number;
      
      private var m_p2YStart:Number;
      
      private var m_p3XStart:Number;
      
      private var m_p3YStart:Number;
      
      private var m_p4XStart:Number;
      
      private var m_p4YStart:Number;
      
      private var m_p1XSpawn:Number;
      
      private var m_p1YSpawn:Number;
      
      private var m_p2XSpawn:Number;
      
      private var m_p2YSpawn:Number;
      
      private var m_p3XSpawn:Number;
      
      private var m_p3YSpawn:Number;
      
      private var m_p4XSpawn:Number;
      
      private var m_p4YSpawn:Number;
      
      private var m_p1FacingRight:Boolean;
      
      private var m_p2FacingRight:Boolean;
      
      private var m_p3FacingRight:Boolean;
      
      private var m_p4FacingRight:Boolean;
      
      private var m_sizeRatio:Number;
      
      private var m_toFrame:String;
      
      private var m_displayName:String;
      
      private var m_id:String;
      
      private var m_fileName:String;
      
      public function StageSetting()
      {
         super();
         this.m_p1XStart = 0;
         this.m_p1YStart = 0;
         this.m_p2XStart = 0;
         this.m_p2YStart = 0;
         this.m_p3XStart = 0;
         this.m_p3YStart = 0;
         this.m_p4XStart = 0;
         this.m_p4YStart = 0;
         this.m_p1XSpawn = 0;
         this.m_p1YSpawn = 0;
         this.m_p2XSpawn = 0;
         this.m_p2YSpawn = 0;
         this.m_p3XSpawn = 0;
         this.m_p3YSpawn = 0;
         this.m_p4XSpawn = 0;
         this.m_p4YSpawn = 0;
         this.m_p1FacingRight = true;
         this.m_p2FacingRight = true;
         this.m_p3FacingRight = true;
         this.m_p4FacingRight = true;
         this.m_sizeRatio = 1;
         this.m_toFrame = null;
         this.m_displayName = null;
         this.m_id = null;
         this.m_fileName = null;
      }
      
      public static function get CurrentID() : String
      {
         return StageSetting.m_currentID;
      }
      
      public static function set CurrentID(param1:String) : void
      {
         StageSetting.m_currentID = param1;
      }
      
      public static function get ExpansionStage() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "xp";
         _loc1_.DisplayName = "Expansion Stage";
         _loc1_.ID = "xpstage";
         _loc1_.FileName = "xpstage1.swf";
         return _loc1_;
      }
      
      public static function get Battlefield() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage2";
         _loc1_.DisplayName = "Battlefield";
         _loc1_.ID = "battlefield";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get FinalDestination() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage3";
         _loc1_.DisplayName = "Final Destination";
         _loc1_.ID = "finaldestination";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get DreamLand() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage5";
         _loc1_.DisplayName = "Dream Land";
         _loc1_.ID = "dreamland";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get HyruleTemple() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage4";
         _loc1_.DisplayName = "Temple";
         _loc1_.ID = "hyruletemple";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get WaitingRoom() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage1";
         _loc1_.DisplayName = "Waiting Room";
         _loc1_.ID = "waitingroom";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get GreenHillZone() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage6";
         _loc1_.DisplayName = "Green Hill Zone";
         _loc1_.ID = "greenhillzone";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get MushroomKingdomII() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage7";
         _loc1_.DisplayName = "Mushroom Kingdom II";
         _loc1_.ID = "mushroomkingdom2";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get TwilightTown() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage8";
         _loc1_.DisplayName = "Twilight Town";
         _loc1_.ID = "twilighttown";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get HuecoMundo() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage9";
         _loc1_.DisplayName = "Hueco Mundo";
         _loc1_.ID = "huecomundo";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get KonohaVillage() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage10";
         _loc1_.DisplayName = "Hidden Leaf Village";
         _loc1_.ID = "konohavillage";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get CometObservatory() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage11";
         _loc1_.DisplayName = "Galaxy Tours";
         _loc1_.ID = "galaxytours";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get CastleWily() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage12";
         _loc1_.DisplayName = "Skull Fortress";
         _loc1_.ID = "castlewily";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get SectorZ() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage13";
         _loc1_.DisplayName = "Sector Z";
         _loc1_.ID = "sectorz";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get TowerOfSalvation() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage14";
         _loc1_.DisplayName = "Tower of Salvation";
         _loc1_.ID = "towerofsalvation";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get CasinoNightZone() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage15";
         _loc1_.DisplayName = "Casino Night Zone";
         _loc1_.ID = "casinonightzone";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get RainbowRoute() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage16";
         _loc1_.DisplayName = "Mirror Chamber";
         _loc1_.ID = "rainbowroute";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get SaturnValley() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage17";
         _loc1_.DisplayName = "Saturn Valley";
         _loc1_.ID = "saturnvalley";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get JungleHijinx() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage18";
         _loc1_.DisplayName = "Jungle Hijinx";
         _loc1_.ID = "junglehijinx";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get CentralHighway() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage19";
         _loc1_.DisplayName = "Central Highway";
         _loc1_.ID = "centralhighway";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get WarioWare() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage20";
         _loc1_.DisplayName = "WarioWare, Inc.";
         _loc1_.ID = "warioware";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get TempleOfTime() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage21";
         _loc1_.DisplayName = "Temple Of Time";
         _loc1_.ID = "templeoftime";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get YoshisIsland() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage22";
         _loc1_.DisplayName = "Yoshi\'s Island";
         _loc1_.ID = "yoshisisland";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get Namek() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage23";
         _loc1_.DisplayName = "Planet Namek";
         _loc1_.ID = "planetnamek";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get ChaosShrine() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage24";
         _loc1_.DisplayName = "Chaos Shrine";
         _loc1_.ID = "chaosshrine";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get ShadowMosesIsland() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage25";
         _loc1_.DisplayName = "Shadow Moses Island";
         _loc1_.ID = "shadowmosesisland";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get ClockTown() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage26";
         _loc1_.DisplayName = "Clock Town";
         _loc1_.ID = "clocktown";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get SkySanctuary() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage27";
         _loc1_.DisplayName = "Sky Sanctuary Zone";
         _loc1_.ID = "skysanctuary";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get GangplankGalleon() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage28";
         _loc1_.DisplayName = "Gangplank Galleon";
         _loc1_.ID = "gangplankgalleon";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get MushroomKingdomIII() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage29";
         _loc1_.DisplayName = "Mushroom Kingdom III";
         _loc1_.ID = "mushroomkingdom3";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get Skyworld() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage30";
         _loc1_.DisplayName = "Skyworld";
         _loc1_.ID = "skyworld";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get Fourside() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage31";
         _loc1_.DisplayName = "Fourside";
         _loc1_.ID = "fourside";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get PokemonStadium3() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage32";
         _loc1_.DisplayName = "Pokemon Stadium 3";
         _loc1_.ID = "pokemonstadium3";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get PeachsCastle() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage33";
         _loc1_.DisplayName = "Peach\'s Castle";
         _loc1_.ID = "peachscastle";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get Crateria() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage34";
         _loc1_.DisplayName = "Crateria";
         _loc1_.ID = "crateria";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get Smashville() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage35";
         _loc1_.DisplayName = "Smashville";
         _loc1_.ID = "smashville";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get SandOcean() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage36";
         _loc1_.DisplayName = "Sand Ocean";
         _loc1_.ID = "sandocean";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get CastleSiege() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage37";
         _loc1_.DisplayName = "Castle Siege";
         _loc1_.ID = "castlesiege";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get YoshisStory() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage38";
         _loc1_.DisplayName = "Yoshi\'s Story";
         _loc1_.ID = "yoshisstory";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get BowsersCastle() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage39";
         _loc1_.DisplayName = "Bowser\'s Castle";
         _loc1_.ID = "bowserscastle";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get EmeraldCave() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage40";
         _loc1_.DisplayName = "Emerald Cave";
         _loc1_.ID = "emeraldcave";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get Nintendo3DS() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage41";
         _loc1_.DisplayName = "Nintendo 3DS";
         _loc1_.ID = "nintendo3ds";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get SkywardVoyage() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage42";
         _loc1_.DisplayName = "Skyward Voyage";
         _loc1_.ID = "skywardvoyage";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get HylianSkies() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage43";
         _loc1_.DisplayName = "Hylian Skies";
         _loc1_.ID = "hylianskies";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get ButterBuilding() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage44";
         _loc1_.DisplayName = "Butter Building";
         _loc1_.ID = "butterbuilding";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get LakeOfRage() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage45";
         _loc1_.DisplayName = "Lake Of Rage";
         _loc1_.ID = "lakeofrage";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get SilphCo() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage46";
         _loc1_.DisplayName = "Silph Co.";
         _loc1_.ID = "silphco";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get Phase8() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage47";
         _loc1_.DisplayName = "Phase 8";
         _loc1_.ID = "phase8";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get IceClimbersStage() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage48";
         _loc1_.DisplayName = "Ice Climbers";
         _loc1_.ID = "iceclimbersstage";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get DraculaCastle() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage49";
         _loc1_.DisplayName = "Dracula\'s Castle";
         _loc1_.ID = "draculascastle";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get BombFactory() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage50";
         _loc1_.DisplayName = "Bomb Factory";
         _loc1_.ID = "bombfactory";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get LunarCore() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage51";
         _loc1_.DisplayName = "Lunar Core";
         _loc1_.ID = "lunarcore";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get DistantPlanet() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage52";
         _loc1_.DisplayName = "Distant Planet";
         _loc1_.ID = "distantplanet";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get MeteoVoyage() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "stage53";
         _loc1_.DisplayName = "Meteo Campaigns";
         _loc1_.ID = "meteovoyage";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get TargetTest() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "";
         _loc1_.DisplayName = "Target Test Level 1";
         _loc1_.ID = "targettest";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get TargetTest2() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "";
         _loc1_.DisplayName = "Target Test Level 2";
         _loc1_.ID = "targettest2";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function get TargetTest3() : StageSetting
      {
         var _loc1_:StageSetting = new StageSetting();
         _loc1_.SizeRatio = 1;
         _loc1_.ToFrame = "";
         _loc1_.DisplayName = "Target Test Level 3";
         _loc1_.ID = "targettest3";
         _loc1_.FileName = _loc1_.ID + ".ssf";
         return _loc1_;
      }
      
      public static function getStagesArray(param1:Boolean = false) : Vector.<StageSetting>
      {
         var _loc2_:Vector.<StageSetting> = new Vector.<StageSetting>();
         _loc2_.push(StageSetting.Battlefield);
         _loc2_.push(StageSetting.FinalDestination);
         _loc2_.push(StageSetting.DreamLand);
         _loc2_.push(StageSetting.HyruleTemple);
         _loc2_.push(StageSetting.GreenHillZone);
         _loc2_.push(StageSetting.TwilightTown);
         _loc2_.push(StageSetting.HuecoMundo);
         _loc2_.push(StageSetting.KonohaVillage);
         _loc2_.push(StageSetting.CometObservatory);
         _loc2_.push(StageSetting.CastleWily);
         _loc2_.push(StageSetting.SectorZ);
         _loc2_.push(StageSetting.TowerOfSalvation);
         _loc2_.push(StageSetting.CasinoNightZone);
         _loc2_.push(StageSetting.RainbowRoute);
         _loc2_.push(StageSetting.SaturnValley);
         _loc2_.push(StageSetting.JungleHijinx);
         _loc2_.push(StageSetting.CentralHighway);
         _loc2_.push(StageSetting.WarioWare);
         _loc2_.push(StageSetting.YoshisIsland);
         _loc2_.push(StageSetting.Namek);
         _loc2_.push(StageSetting.YoshisStory);
         _loc2_.push(StageSetting.ChaosShrine);
         _loc2_.push(StageSetting.ShadowMosesIsland);
         _loc2_.push(StageSetting.SkySanctuary);
         _loc2_.push(StageSetting.GangplankGalleon);
         _loc2_.push(StageSetting.MushroomKingdomIII);
         _loc2_.push(StageSetting.Fourside);
         _loc2_.push(StageSetting.PeachsCastle);
         _loc2_.push(StageSetting.Crateria);
         _loc2_.push(StageSetting.Smashville);
         _loc2_.push(StageSetting.PokemonStadium3);
         _loc2_.push(StageSetting.BowsersCastle);
         _loc2_.push(StageSetting.EmeraldCave);
         _loc2_.push(StageSetting.Nintendo3DS);
         _loc2_.push(StageSetting.SkywardVoyage);
         _loc2_.push(StageSetting.HylianSkies);
         _loc2_.push(StageSetting.SilphCo);
         _loc2_.push(StageSetting.Phase8);
         _loc2_.push(StageSetting.DraculaCastle);
         _loc2_.push(StageSetting.BombFactory);
         _loc2_.push(StageSetting.LunarCore);
         _loc2_.push(StageSetting.DistantPlanet);
         _loc2_.push(StageSetting.CastleSiege);
         _loc2_.push(StageSetting.MeteoVoyage);
         if(!param1)
         {
         }
         if(SaveData.Unlocks.clocktown == true || param1)
         {
            _loc2_.push(StageSetting.ClockTown);
         }
         if(SaveData.Unlocks.sandocean == true || param1)
         {
            _loc2_.push(StageSetting.SandOcean);
         }
         return _loc2_;
      }
      
      public static function getStageIndex(param1:StageSetting) : int
      {
         var _loc2_:Vector.<StageSetting> = getStagesArray();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(param1.DisplayName == _loc2_[_loc3_].DisplayName)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      public static function getStageByID(param1:String) : StageSetting
      {
         var _loc2_:Vector.<StageSetting> = getStagesArray();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(param1 == _loc2_[_loc3_].ID)
            {
               return _loc2_[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      public static function get Random() : StageSetting
      {
         var _loc3_:StageSetting = null;
         var _loc4_:Number = NaN;
         var _loc1_:Vector.<StageSetting> = getStagesArray();
         var _loc2_:int = _loc1_.length - 1;
         while(_loc2_ >= 0)
         {
            if(SaveData.VSStageDataObj[_loc1_[_loc2_].ID] != null && SaveData.VSStageDataObj[_loc1_[_loc2_].ID] == false)
            {
               _loc1_.splice(_loc2_,1);
            }
            _loc2_--;
         }
         if(_loc1_.length == 0)
         {
            _loc3_ = Battlefield;
            _loc3_.DisplayName = "Random";
            return _loc3_;
         }
         _loc4_ = Utils.randomInteger(0,_loc1_.length - 1);
         _loc1_[_loc4_].DisplayName = "Random";
         return _loc1_[_loc4_];
      }
      
      public function get DisplayName() : String
      {
         return this.m_displayName;
      }
      
      public function set DisplayName(param1:String) : void
      {
         this.m_displayName = param1;
      }
      
      public function get P1_XStart() : Number
      {
         return this.m_p1XStart;
      }
      
      public function set P1_XStart(param1:Number) : void
      {
         this.m_p1XStart = param1;
      }
      
      public function get P1_YStart() : Number
      {
         return this.m_p1YStart;
      }
      
      public function set P1_YStart(param1:Number) : void
      {
         this.m_p1YStart = param1;
      }
      
      public function get P2_XStart() : Number
      {
         return this.m_p2XStart;
      }
      
      public function set P2_XStart(param1:Number) : void
      {
         this.m_p2XStart = param1;
      }
      
      public function get P2_YStart() : Number
      {
         return this.m_p2YStart;
      }
      
      public function set P2_YStart(param1:Number) : void
      {
         this.m_p2YStart = param1;
      }
      
      public function get P3_XStart() : Number
      {
         return this.m_p3XStart;
      }
      
      public function set P3_XStart(param1:Number) : void
      {
         this.m_p3XStart = param1;
      }
      
      public function get P3_YStart() : Number
      {
         return this.m_p3YStart;
      }
      
      public function set P3_YStart(param1:Number) : void
      {
         this.m_p3YStart = param1;
      }
      
      public function get P4_XStart() : Number
      {
         return this.m_p4XStart;
      }
      
      public function set P4_XStart(param1:Number) : void
      {
         this.m_p4XStart = param1;
      }
      
      public function get P4_YStart() : Number
      {
         return this.m_p4YStart;
      }
      
      public function set P4_YStart(param1:Number) : void
      {
         this.m_p4YStart = param1;
      }
      
      public function get P1_XSpawn() : Number
      {
         return this.m_p1XSpawn;
      }
      
      public function set P1_XSpawn(param1:Number) : void
      {
         this.m_p1XSpawn = param1;
      }
      
      public function get P1_YSpawn() : Number
      {
         return this.m_p1YSpawn;
      }
      
      public function set P1_YSpawn(param1:Number) : void
      {
         this.m_p1YSpawn = param1;
      }
      
      public function get P2_XSpawn() : Number
      {
         return this.m_p2XSpawn;
      }
      
      public function set P2_XSpawn(param1:Number) : void
      {
         this.m_p2XSpawn = param1;
      }
      
      public function get P2_YSpawn() : Number
      {
         return this.m_p2YSpawn;
      }
      
      public function set P2_YSpawn(param1:Number) : void
      {
         this.m_p2YSpawn = param1;
      }
      
      public function get P3_XSpawn() : Number
      {
         return this.m_p3XSpawn;
      }
      
      public function set P3_XSpawn(param1:Number) : void
      {
         this.m_p3XSpawn = param1;
      }
      
      public function get P3_YSpawn() : Number
      {
         return this.m_p3YSpawn;
      }
      
      public function set P3_YSpawn(param1:Number) : void
      {
         this.m_p3YSpawn = param1;
      }
      
      public function get P4_XSpawn() : Number
      {
         return this.m_p4XSpawn;
      }
      
      public function set P4_XSpawn(param1:Number) : void
      {
         this.m_p4XSpawn = param1;
      }
      
      public function get P4_YSpawn() : Number
      {
         return this.m_p4YSpawn;
      }
      
      public function set P4_YSpawn(param1:Number) : void
      {
         this.m_p4YSpawn = param1;
      }
      
      public function get P1_FacingRight() : Boolean
      {
         return this.m_p1FacingRight;
      }
      
      public function set P1_FacingRight(param1:Boolean) : void
      {
         this.m_p1FacingRight = param1;
      }
      
      public function get P2_FacingRight() : Boolean
      {
         return this.m_p2FacingRight;
      }
      
      public function set P2_FacingRight(param1:Boolean) : void
      {
         this.m_p2FacingRight = param1;
      }
      
      public function get P3_FacingRight() : Boolean
      {
         return this.m_p3FacingRight;
      }
      
      public function set P3_FacingRight(param1:Boolean) : void
      {
         this.m_p3FacingRight = param1;
      }
      
      public function get P4_FacingRight() : Boolean
      {
         return this.m_p4FacingRight;
      }
      
      public function set P4_FacingRight(param1:Boolean) : void
      {
         this.m_p4FacingRight = param1;
      }
      
      public function get SizeRatio() : Number
      {
         return this.m_sizeRatio;
      }
      
      public function set SizeRatio(param1:Number) : void
      {
         this.m_sizeRatio = param1;
      }
      
      public function get ID() : String
      {
         return this.m_id;
      }
      
      public function set ID(param1:String) : void
      {
         this.m_id = param1;
      }
      
      public function get FileName() : String
      {
         return this.m_fileName;
      }
      
      public function set FileName(param1:String) : void
      {
         this.m_fileName = param1;
      }
      
      public function get ToFrame() : String
      {
         return this.m_toFrame;
      }
      
      public function set ToFrame(param1:String) : void
      {
         this.m_toFrame = param1;
      }
      
      public function copySettingsFrom(param1:StageSetting) : void
      {
         this.m_p1XStart = param1.P1_XStart;
         this.m_p1YStart = param1.P1_YStart;
         this.m_p2XStart = param1.P2_XStart;
         this.m_p2YStart = param1.P2_YStart;
         this.m_p3XStart = param1.P3_XStart;
         this.m_p3YStart = param1.P3_YStart;
         this.m_p4XStart = param1.P4_XStart;
         this.m_p4YStart = param1.P4_YStart;
         this.m_p1XSpawn = param1.P1_XSpawn;
         this.m_p1YSpawn = param1.P1_YSpawn;
         this.m_p2XSpawn = param1.P2_XSpawn;
         this.m_p2YSpawn = param1.P2_YSpawn;
         this.m_p3XSpawn = param1.P3_XSpawn;
         this.m_p3YSpawn = param1.P3_YSpawn;
         this.m_p4XSpawn = param1.P4_XSpawn;
         this.m_p4YSpawn = param1.P4_YSpawn;
         this.m_p1FacingRight = param1.P1_FacingRight;
         this.m_p2FacingRight = param1.P2_FacingRight;
         this.m_p3FacingRight = param1.P3_FacingRight;
         this.m_p4FacingRight = param1.P4_FacingRight;
         this.m_sizeRatio = param1.SizeRatio;
         this.m_toFrame = param1.ToFrame;
         this.m_displayName = param1.DisplayName;
         this.m_id = param1.ID;
         this.m_fileName = param1.FileName;
      }
   }
}
