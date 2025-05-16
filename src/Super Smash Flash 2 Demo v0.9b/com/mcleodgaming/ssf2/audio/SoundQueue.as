package com.mcleodgaming.ssf2.audio
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.util.SaveData;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class SoundQueue
   {
      
      public static var instance:SoundQueue = new SoundQueue();
       
      
      private var m_sounds:Vector.<SoundObject>;
      
      private var m_index:int;
      
      private var m_musicIsPlaying:Boolean;
      
      private var m_musicIsOgg:Boolean;
      
      private var m_currentSong:SoundChannel;
      
      private var m_currentSongID:String;
      
      private var m_queueSize:int;
      
      private var m_nextSongID:String;
      
      private var m_loopLocation:Number;
      
      private var m_loopFunction:Function;
      
      private var m_nextSongLoopLocation:Number;
      
      public function SoundQueue()
      {
         super();
         this.m_queueSize = 60;
         this.m_sounds = new Vector.<SoundObject>(this.m_queueSize,true);
         this.m_index = 0;
         this.m_musicIsPlaying = false;
         this.m_musicIsOgg = false;
         this.m_currentSong = null;
         this.m_currentSongID = null;
         this.m_nextSongID = null;
         this.m_nextSongLoopLocation = 0;
         this.m_loopLocation = 0;
         this.m_loopFunction = this.loopMusic;
      }
      
      public function nextMusic(param1:Event) : void
      {
         var _loc2_:Boolean = false;
         if(this.m_nextSongID.indexOf(".ogg|") == 0)
         {
            _loc2_ = true;
         }
         var _loc3_:* = null;
         if(_loc2_)
         {
            _loc3_ = Main.getLibraryClass(this.m_nextSongID.substr(5));
            this.m_musicIsOgg = true;
         }
         else
         {
            _loc3_ = Main.getLibrarySound(this.m_nextSongID);
            this.m_musicIsOgg = false;
         }
         if(_loc3_ != null)
         {
            if(!this.m_musicIsOgg)
            {
               this.m_currentSong.removeEventListener(Event.SOUND_COMPLETE,this.nextMusic);
               this.m_currentSong = _loc3_.play(0,0,new SoundTransform(SaveData.BGVolumeLevel));
               this.m_currentSongID = this.m_nextSongID;
               this.m_loopLocation = this.m_nextSongLoopLocation;
               this.m_loopFunction = this.loopMusic;
               if(this.m_currentSong != null)
               {
                  this.m_currentSong.addEventListener(Event.SOUND_COMPLETE,this.m_loopFunction);
                  this.m_musicIsPlaying = true;
               }
            }
         }
      }
      
      public function setNextMusic(param1:String, param2:Number) : void
      {
         this.m_nextSongID = param1;
         this.m_nextSongLoopLocation = param2;
      }
      
      public function get LoopLocation() : Number
      {
         return this.m_loopLocation;
      }
      
      public function get NextSongLoopLocation() : Number
      {
         return this.m_loopLocation;
      }
      
      public function get CurrentSong() : SoundChannel
      {
         return this.m_currentSong;
      }
      
      public function get CurrentSongID() : String
      {
         return this.m_currentSongID;
      }
      
      public function setLoopFunction(param1:Function) : void
      {
         this.m_loopFunction = param1;
      }
      
      public function getSoundObject(param1:int) : SoundObject
      {
         return param1 >= 0 && param1 < this.m_sounds.length && this.m_sounds[param1] != null?this.m_sounds[param1]:null;
      }
      
      public function playMusic(param1:String, param2:Number) : void
      {
         var _loc4_:* = undefined;
         if(!param1)
         {
            this.stopMusic();
            return;
         }
         var _loc3_:Boolean = false;
         if(param1.indexOf(".ogg|") == 0)
         {
            _loc3_ = true;
         }
         if(param1 == this.m_currentSongID)
         {
            return;
         }
         this.m_loopLocation = param2;
         if(this.m_musicIsPlaying)
         {
            this.stopMusic();
         }
         if(param1 != null)
         {
            _loc4_ = null;
            if(_loc3_)
            {
               _loc4_ = Main.getLibraryClass(param1.substr(5));
               this.m_musicIsOgg = true;
            }
            else
            {
               _loc4_ = Main.getLibrarySound(param1);
               this.m_musicIsOgg = false;
            }
            if(_loc4_ != null)
            {
               if(!this.m_musicIsOgg)
               {
                  this.m_currentSong = _loc4_.play(0,0,new SoundTransform(SaveData.BGVolumeLevel));
                  if(this.m_currentSong != null)
                  {
                     this.m_currentSongID = param1;
                     this.m_currentSong.addEventListener(Event.SOUND_COMPLETE,this.m_loopFunction);
                     this.m_musicIsPlaying = true;
                  }
               }
            }
         }
      }
      
      public function loopMusic(param1:Event) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:Sound = null;
         if(this.m_musicIsOgg)
         {
            _loc2_ = Main.getLibraryClass(this.m_currentSongID.substr(5));
            if(_loc2_ != null)
            {
            }
         }
         else
         {
            _loc3_ = Main.getLibrarySound(this.m_currentSongID);
            if(_loc3_ != null)
            {
               this.m_currentSong.removeEventListener(Event.SOUND_COMPLETE,this.loopMusic);
               this.m_currentSong = _loc3_.play(this.m_loopLocation,0,new SoundTransform(SaveData.BGVolumeLevel));
               if(this.m_currentSong != null)
               {
                  this.m_currentSong.addEventListener(Event.SOUND_COMPLETE,this.m_loopFunction);
                  this.m_musicIsPlaying = true;
               }
            }
         }
      }
      
      public function setMusicVolume(param1:Number) : void
      {
         if(!this.m_musicIsOgg)
         {
            this.m_currentSong.soundTransform = new SoundTransform(param1);
         }
      }
      
      public function stopMusic() : void
      {
         if(this.m_musicIsPlaying)
         {
            if(!this.m_musicIsOgg)
            {
               this.m_currentSong.removeEventListener(Event.SOUND_COMPLETE,this.m_loopFunction);
               this.m_currentSong.stop();
               this.m_currentSong = null;
            }
            this.m_currentSongID = null;
            this.m_musicIsPlaying = false;
         }
      }
      
      public function playSoundEffect(param1:String, param2:Number = 1) : int
      {
         var _loc4_:SoundObject = null;
         var _loc5_:Number = NaN;
         var _loc3_:Sound = Main.getLibrarySound(param1);
         if(_loc3_ == null)
         {
            _loc3_ = Main.getLibrarySound(param1);
         }
         if(_loc3_ != null)
         {
            if(this.m_sounds[this.m_index] != null && this.m_sounds[this.m_index] != undefined)
            {
               this.m_sounds[this.m_index].stop();
            }
            if(_loc3_ != null)
            {
               if(this.m_sounds[this.m_index] != null)
               {
                  if(!this.m_sounds[this.m_index].IsFinished)
                  {
                     this.m_sounds[this.m_index].stop();
                  }
                  this.m_sounds[this.m_index] = null;
               }
               _loc4_ = new SoundObject();
               _loc4_.play(_loc3_,SaveData.SEVolumeLevel * param2,param1);
               if(!_loc4_.IsError)
               {
                  this.m_sounds[this.m_index] = _loc4_;
                  _loc5_ = this.m_index;
                  this.m_index++;
                  if(this.m_index > this.m_queueSize - 1)
                  {
                     this.m_index = 0;
                  }
                  return _loc5_;
               }
               return -1;
            }
            return -1;
         }
         return -1;
      }
      
      public function playVoiceEffect(param1:String, param2:Number = 1) : int
      {
         var _loc4_:SoundObject = null;
         var _loc5_:Number = NaN;
         var _loc3_:Sound = Main.getLibrarySound(param1);
         if(_loc3_ == null)
         {
            _loc3_ = Main.getLibrarySound(param1);
         }
         if(_loc3_ != null)
         {
            if(this.m_sounds[this.m_index] != null && this.m_sounds[this.m_index] != undefined)
            {
               this.m_sounds[this.m_index].stop();
            }
            if(_loc3_ != null)
            {
               if(this.m_sounds[this.m_index] != null)
               {
                  if(!this.m_sounds[this.m_index].IsFinished)
                  {
                     this.m_sounds[this.m_index].stop();
                  }
                  this.m_sounds[this.m_index] = null;
               }
               _loc4_ = new SoundObject();
               _loc4_.play(_loc3_,SaveData.VAVolumeLevel * param2,param1);
               if(!_loc4_.IsError)
               {
                  this.m_sounds[this.m_index] = _loc4_;
                  _loc5_ = this.m_index;
                  this.m_index++;
                  if(this.m_index > this.m_queueSize - 1)
                  {
                     this.m_index = 0;
                  }
                  return _loc5_;
               }
               return -1;
            }
            return -1;
         }
         return -1;
      }
      
      public function updateVolumeLevel() : void
      {
         this.m_currentSong.soundTransform = new SoundTransform(SaveData.BGVolumeLevel);
      }
      
      public function stopSound(param1:int) : void
      {
         if(param1 >= 0 && this.m_sounds[param1] != null)
         {
            this.m_sounds[param1].stop();
         }
      }
      
      public function stopAllSounds() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.m_sounds.length)
         {
            if(this.m_sounds[_loc1_] != null)
            {
               this.m_sounds[_loc1_].stop();
               this.m_sounds[_loc1_] = null;
            }
            _loc1_++;
         }
      }
      
      public function pauseAllSounds() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.m_sounds.length)
         {
            if(this.m_sounds[_loc1_] != null && !this.m_sounds[_loc1_].IsFinished)
            {
               this.m_sounds[_loc1_].pause();
            }
            _loc1_++;
         }
      }
      
      public function unpauseAllSounds() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.m_sounds.length)
         {
            if(this.m_sounds[_loc1_] != null && !this.m_sounds[_loc1_].IsFinished)
            {
               this.m_sounds[_loc1_].unpause();
            }
            _loc1_++;
         }
      }
   }
}
