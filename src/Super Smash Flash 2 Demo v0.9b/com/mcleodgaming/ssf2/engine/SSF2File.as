package com.mcleodgaming.ssf2.engine
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.util.Resource;
   
   public class SSF2File
   {
      
      private static const DIRECTORY_CHAR:String = "data/character/";
      
      private static const DIRECTORY_STAGE:String = "data/stage/";
      
      private static const DIRECTORY_MENU:String = "data/menu/";
      
      private static const DIRECTORY_AUDIO:String = "data/sound/";
      
      private static const DIRECTORY_MISC:String = "data/misc/";
      
      private static const DIRECTORY_CHAR_ENCRYPTED:String = "data/";
      
      private static const DIRECTORY_STAGE_ENCRYPTED:String = "data/";
      
      private static const DIRECTORY_MENU_ENCRYPTED:String = "data/";
      
      private static const DIRECTORY_AUDIO_ENCRYPTED:String = "data/";
      
      private static const DIRECTORY_MISC_ENCRYPTED:String = "data/";
      
      private static const URL_PROTOCOL:String = "http://";
      
      private static const URL_DIRECTORY:String = "/resources/ssf2_9b3/";
       
      
      private var m_id:String;
      
      private var m_type:int;
      
      private var m_fileName:String;
      
      private var m_encryptedFileName:String;
      
      private var m_passKey:String;
      
      public function SSF2File(param1:String, param2:String, param3:String, param4:String, param5:int)
      {
         super();
         this.m_id = param1;
         this.m_fileName = param2;
         this.m_encryptedFileName = param3;
         this.m_passKey = param4;
         this.m_type = param5;
      }
      
      public function get ID() : String
      {
         return this.m_id;
      }
      
      public function get CurrentFileName() : String
      {
         return !!Main.ENCRYPTED?this.m_encryptedFileName:this.m_fileName;
      }
      
      public function get FileName() : String
      {
         return this.m_fileName;
      }
      
      public function get Location() : String
      {
         var _loc1_:String = "";
         if(!Main.LOCALHOST)
         {
            _loc1_ = SSF2File.URL_PROTOCOL + Main.DOMAIN + SSF2File.URL_DIRECTORY;
         }
         if(this.m_type == Resource.MISC || this.m_type == Resource.EXTRA)
         {
            if(Main.ENCRYPTED)
            {
               return _loc1_ + SSF2File.DIRECTORY_MISC_ENCRYPTED + this.m_encryptedFileName;
            }
            return _loc1_ + SSF2File.DIRECTORY_MISC + this.m_fileName;
         }
         if(this.m_type == Resource.AUDIO)
         {
            if(Main.ENCRYPTED)
            {
               return _loc1_ + SSF2File.DIRECTORY_AUDIO_ENCRYPTED + this.m_encryptedFileName;
            }
            return _loc1_ + SSF2File.DIRECTORY_AUDIO + this.m_fileName;
         }
         if(this.m_type == Resource.CHARACTER || this.m_type == Resource.CHARACTER_EXPANSION)
         {
            if(Main.ENCRYPTED)
            {
               return _loc1_ + SSF2File.DIRECTORY_CHAR_ENCRYPTED + this.m_encryptedFileName;
            }
            return _loc1_ + SSF2File.DIRECTORY_CHAR + this.m_fileName;
         }
         if(this.m_type == Resource.STAGE || this.m_type == Resource.STAGE_EXPANSION)
         {
            if(Main.ENCRYPTED)
            {
               return _loc1_ + SSF2File.DIRECTORY_STAGE_ENCRYPTED + this.m_encryptedFileName;
            }
            return _loc1_ + SSF2File.DIRECTORY_STAGE + this.m_fileName;
         }
         if(this.m_type == Resource.MENU)
         {
            if(Main.ENCRYPTED)
            {
               return _loc1_ + SSF2File.DIRECTORY_MENU_ENCRYPTED + this.m_encryptedFileName;
            }
            return _loc1_ + SSF2File.DIRECTORY_MENU + this.m_fileName;
         }
         return null;
      }
      
      public function get EncryptedFileName() : String
      {
         return this.m_encryptedFileName;
      }
      
      public function get PassKey() : String
      {
         return this.m_passKey;
      }
      
      public function get Type() : int
      {
         return this.m_type;
      }
   }
}
