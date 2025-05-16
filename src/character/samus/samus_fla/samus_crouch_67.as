// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//samus_fla.samus_crouch_67

package samus_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class samus_crouch_67 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function samus_crouch_67()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 5, this.frame6);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            this.xframe = null;
            if (((parent) && (SSF2API.isReady())))
            {
                SSF2API.playSound("samus_crouch");
            };
        }

        internal function frame5():*
        {
            this.xframe = "loop";
            stop();
        }

        internal function frame6():*
        {
            this.gotoAndPlay("loop");
        }


    }
}//package samus_fla

