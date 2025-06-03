package com.mcleodgaming.ssf2.enemies
{
   import com.mcleodgaming.ssf2.engine.AttackDamage;
   import com.mcleodgaming.ssf2.engine.HitBoxSprite;
   import com.mcleodgaming.ssf2.engine.StageData;
   
   public class QuestionMarkCloud extends Enemy
   {
       
      
      public function QuestionMarkCloud(param1:StageData, param2:Number, param3:Number, param4:int = -1)
      {
         super("questioncloud",param1,param2,param3,param4);
         m_width = 20;
         m_height = 20;
      }
      
      override public function takeDamage(param1:AttackDamage, param2:HitBoxSprite = null) : Boolean
      {
         STAGEDATA.ItemsRef.makeItem(m_sprite.x,m_sprite.y);
         destroy();
         if(param1.EffectSound)
         {
            STAGEDATA.playSpecificSound(param1.EffectSound);
         }
         attachHurtEffect(param1.EffectID,param2);
         return true;
      }
   }
}
