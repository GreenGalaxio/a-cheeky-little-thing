// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_fla.dizzy_85

package ness_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class dizzy_85 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;

        public function dizzy_85()
        {
            addFrameScript(0, this.frame1, 20, this.frame21);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            SSF2API.playSound("ness_dizzy");
        }

        internal function frame21():*
        {
            this.gotoAndPlay("again");
        }


    }
}//package ness_fla

