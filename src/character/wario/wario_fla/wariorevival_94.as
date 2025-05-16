// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.wariorevival_94

package wario_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class wariorevival_94 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function wariorevival_94()
        {
            addFrameScript(0, this.frame1, 149, this.frame150);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame150():*
        {
            stop();
        }


    }
}//package wario_fla

