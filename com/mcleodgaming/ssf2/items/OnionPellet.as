package com.mcleodgaming.ssf2.items
{
   import com.mcleodgaming.ssf2.engine.ItemData;
   import com.mcleodgaming.ssf2.engine.StageData;
   
   public class OnionPellet extends Item
   {
       
      
      public const RED:String = "Red";
      
      public const BLUE:String = "Blue";
      
      public const YELLOW:String = "Yellow";
      
      private var m_level:int;
      
      private var m_type:String;
      
      public function OnionPellet(param1:ItemData, param2:Number, param3:StageData)
      {
         super(param1,param2,param3);
         this.m_level = param1.LinkageID.indexOf("10") >= 0?int(3):param1.LinkageID.indexOf("5") >= 0?int(2):int(1);
         this.m_type = param1.LinkageID.indexOf(this.RED) >= 0?this.RED:param1.LinkageID.indexOf(this.BLUE) >= 0?this.BLUE:this.YELLOW;
      }
      
      public function get Level() : int
      {
         return this.m_level;
      }
      
      public function get Type() : String
      {
         return this.m_type;
      }
   }
}
