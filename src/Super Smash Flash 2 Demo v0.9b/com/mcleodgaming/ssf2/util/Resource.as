package com.mcleodgaming.ssf2.util
{
   import com.mcleodgaming.ssf2.Main;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   
   public class Resource
   {
      
      public static const NULL:int = -1;
      
      public static const MISC:int = 0;
      
      public static const CHARACTER:int = 1;
      
      public static const STAGE:int = 2;
      
      public static const AUDIO:int = 3;
      
      public static const MENU:int = 4;
      
      public static const CHARACTER_EXPANSION:int = 5;
      
      public static const STAGE_EXPANSION:int = 6;
      
      public static const EXTRA:int = 7;
       
      
      private var m_loader:Loader;
      
      private var m_type:int;
      
      private var m_loaded:Boolean;
      
      private var m_url:String;
      
      private var m_percentLoaded:Number;
      
      private var m_loadFunction:Function;
      
      private var m_startDelay:FrameTimer;
      
      public function Resource(param1:String, param2:int)
      {
         super();
         if(param2 < -1 || param2 > 7)
         {
            trace("Error importing type...");
            this.m_type = -1;
         }
         else
         {
            this.m_type = param2;
         }
         this.m_loadFunction = null;
         this.m_percentLoaded = 0;
         this.m_loaded = false;
         this.m_loader = new Loader();
         this.m_url = param1;
         this.m_startDelay = new FrameTimer(3);
      }
      
      public function get Type() : int
      {
         return this.m_type;
      }
      
      public function set Type(param1:int) : void
      {
         this.m_type = param1;
      }
      
      public function get URL() : String
      {
         return this.m_url;
      }
      
      public function get FileName() : String
      {
         return Utils.getFileNameFromURL(this.m_url).toLowerCase();
      }
      
      public function get MC() : MovieClip
      {
         return MovieClip(this.m_loader.content);
      }
      
      public function get Loaded() : Boolean
      {
         return this.m_loaded && this.m_startDelay.IsComplete;
      }
      
      public function set Loaded(param1:Boolean) : void
      {
         this.m_loaded = param1;
         if(this.m_loaded)
         {
            this.m_startDelay.finish();
            this.m_percentLoaded = 100;
         }
         else
         {
            this.m_percentLoaded = 0;
         }
      }
      
      public function get PercentLoaded() : Number
      {
         return this.m_percentLoaded;
      }
      
      public function load(param1:Function = null) : void
      {
         var _loc2_:URLRequest = null;
         var _loc3_:LoaderContext = null;
         this.m_startDelay.reset();
         this.m_loadFunction = param1;
         if(!this.m_loaded)
         {
            _loc2_ = new URLRequest(this.m_url);
            _loc3_ = new LoaderContext();
            _loc3_.applicationDomain = new ApplicationDomain(Main.Root.loaderInfo.applicationDomain);
            if(this.m_loadFunction == null)
            {
               this.m_startDelay.finish();
            }
            this.m_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.loadError);
            this.m_loader.contentLoaderInfo.addEventListener(Event.INIT,this.loadComplete);
            this.m_loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.loadComplete);
            this.m_loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,this.loadProgress);
            this.m_loader.load(_loc2_,_loc3_);
         }
         else if(this.m_loadFunction == null)
         {
            this.m_startDelay.finish();
            Main.Root.addEventListener(Event.ENTER_FRAME,this.finalFuncs);
         }
      }
      
      private function loadProgress(param1:ProgressEvent) : void
      {
         this.m_percentLoaded = param1.bytesLoaded / param1.bytesTotal * 100;
      }
      
      private function loadError(param1:IOErrorEvent) : void
      {
         trace("Failed to load resource in " + this.m_url);
         this.m_loader.unloadAndStop();
         this.m_loadFunction = null;
      }
      
      private function loadComplete(param1:Event) : void
      {
         trace("Successfully loaded " + this.m_url);
         this.MC.visible = false;
         this.m_loaded = true;
         this.m_percentLoaded = 100;
         this.m_loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.loadError);
         this.m_loader.contentLoaderInfo.removeEventListener(Event.INIT,this.loadComplete);
         this.m_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.loadComplete);
         this.m_loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,this.loadProgress);
         Main.Root.addEventListener(Event.ENTER_FRAME,this.finalFuncs);
      }
      
      private function finalFuncs(param1:*) : void
      {
         this.m_startDelay.tick();
         if(this.m_startDelay.IsComplete)
         {
            if(this.m_loadFunction != null)
            {
               this.m_loadFunction(param1);
               this.m_loadFunction = null;
            }
            Main.Root.removeEventListener(Event.ENTER_FRAME,this.finalFuncs);
         }
      }
      
      public function getLoader() : Loader
      {
         return this.m_loader;
      }
      
      public function unload() : void
      {
         if(this.m_loaded)
         {
            if(this.m_type != Resource.STAGE_EXPANSION && this.m_type != Resource.CHARACTER_EXPANSION)
            {
               trace("[Unloaded SWF] " + this.FileName);
               this.m_loaded = false;
               this.m_loader.unloadAndStop(true);
							 this.m_loader = new Loader();
               this.m_percentLoaded = 0;
               this.m_loadFunction = null;
							 //this.m_url = null;
            }
         }
      }
   }
}
