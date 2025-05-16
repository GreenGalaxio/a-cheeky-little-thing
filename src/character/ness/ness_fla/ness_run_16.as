// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_fla.ness_run_16

package ness_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class ness_run_16 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function ness_run_16()
        {
            addFrameScript(0, this.frame1, 17, this.frame18, 25, this.frame26, 30, this.frame31);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame18():*
        {
            gotoAndPlay("run");
        }

        internal function frame26():*
        {
            gotoAndPlay("run");
        }

        internal function frame31():*
        {
            gotoAndPlay("run");
        }


    }
}//package ness_fla

