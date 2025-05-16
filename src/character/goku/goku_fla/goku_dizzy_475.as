// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.goku_dizzy_475

package goku_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class goku_dizzy_475 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox10:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var hitBox7:MovieClip;
        public var hitBox8:MovieClip;
        public var hitBox9:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function goku_dizzy_475()
        {
            addFrameScript(0, this.frame1, 11, this.frame12);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame12():*
        {
            this.gotoAndPlay("again");
        }


    }
}//package goku_fla

