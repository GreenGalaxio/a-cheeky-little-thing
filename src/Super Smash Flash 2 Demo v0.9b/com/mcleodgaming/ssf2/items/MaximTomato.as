package com.mcleodgaming.ssf2.items
{
   import com.mcleodgaming.ssf2.engine.ItemData;
   import com.mcleodgaming.ssf2.engine.StageData;
   
   public class MaximTomato extends Item
   {
       
      
      public function MaximTomato(param1:ItemData, param2:Number, param3:StageData)
      {
         super(param1,param2,param3);
      }
      
      override public function consumeAction() : void
      {
         STAGEDATA.playSpecificSound("maximtomato_eat");
      }
   }
}
