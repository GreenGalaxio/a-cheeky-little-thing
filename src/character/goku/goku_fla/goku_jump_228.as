// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.goku_jump_228

package goku_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class goku_jump_228 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:*;
        public var done:*;

        public function goku_jump_228()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 10, this.frame11);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = null;
                this.done = false;
            };
        }

        internal function frame3():*
        {
            this.xframe = "midair";
        }

        internal function frame11():*
        {
            this.done = true;
            gotoAndPlay("redo");
        }


    }
}//package goku_fla

