// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//yoshi_fla.Yoshi_ice_81

package yoshi_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class Yoshi_ice_81 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function Yoshi_ice_81()
        {
            addFrameScript(0, this.frame1);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            stop();
        }


    }
}//package yoshi_fla

