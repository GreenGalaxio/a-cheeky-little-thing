package com.mcleodgaming.ssf2.hazards
{
   import com.mcleodgaming.ssf2.enemies.Birdo;
   import com.mcleodgaming.ssf2.engine.StageData;
   
   public class BirdoHazard extends StageHazard
   {
       
      
      private const STARTX_1:Number = -124;
      
      private const STARTY_1:Number = 85;
      
      private const STARTX_2:Number = 544;
      
      private const STARTY_2:Number = 85;
      
      private var m_switch:Boolean;
      
      public function BirdoHazard(param1:uint, param2:StageData, param3:int = -1)
      {
         super(param1,param2,param3);
         this.m_switch = true;
      }
      
      override protected function runHazard() : void
      {
         Birdo(STAGEDATA.spawnEnemy(Birdo,!!this.m_switch?Number(this.STARTX_1):Number(this.STARTX_2),!!this.m_switch?Number(this.STARTY_1):Number(this.STARTY_2))).setFacingForward(!!this.m_switch?Boolean(true):Boolean(false));
         this.m_switch = !this.m_switch;
      }
   }
}
