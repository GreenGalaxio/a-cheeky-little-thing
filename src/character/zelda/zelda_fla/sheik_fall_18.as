// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zelda_fla.sheik_fall_18

package zelda_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class sheik_fall_18 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var hitBox7:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:*;
        public var done:*;

        public function sheik_fall_18()
        {
            addFrameScript(0, this.frame1, 7, this.frame8);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            this.xframe = "midair";
            this.done = false;
        }

        internal function frame8():*
        {
            this.done = true;
            gotoAndPlay("redo");
        }


    }
}//package zelda_fla

