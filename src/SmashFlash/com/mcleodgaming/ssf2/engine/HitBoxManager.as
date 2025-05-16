package com.mcleodgaming.ssf2.engine
{
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class HitBoxManager 
    {

        private static var m_hitBoxManagerList:Array = new Array();

        private var m_name:String;
        private var m_hitBoxAnimationList:Vector.<HitBoxAnimation>;
        private var m_hitBoxAnimationIndexes:Array;

        public function HitBoxManager(_arg_1:String)
        {
            this.m_name = _arg_1;
            m_hitBoxManagerList[_arg_1] = this;
            this.m_hitBoxAnimationList = new Vector.<HitBoxAnimation>();
            this.m_hitBoxAnimationIndexes = new Array();
        }

        public static function get HitBoxManageList():Array
        {
            return (m_hitBoxManagerList);
        }


        public function get HitBoxAnimationList():Vector.<HitBoxAnimation>
        {
            return (this.m_hitBoxAnimationList);
        }

        public function addHitBoxAnimation(_arg_1:HitBoxAnimation):void
        {
            this.m_hitBoxAnimationList.push(_arg_1);
            this.m_hitBoxAnimationIndexes[_arg_1.Name] = (this.m_hitBoxAnimationList.length - 1);
        }

        public function getHitBoxAnimation(_arg_1:String):HitBoxAnimation
        {
            return ((this.m_hitBoxAnimationIndexes[_arg_1] !== undefined) ? this.m_hitBoxAnimationList[this.m_hitBoxAnimationIndexes[_arg_1]] : null);
        }


    }
}//package com.mcleodgaming.ssf2.engine