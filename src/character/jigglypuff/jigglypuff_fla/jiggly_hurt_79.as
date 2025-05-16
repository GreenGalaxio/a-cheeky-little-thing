// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//jigglypuff_fla.jiggly_hurt_79

package jigglypuff_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class jiggly_hurt_79 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function jiggly_hurt_79()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "hurt1";
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
            };
        }

        internal function frame2():*
        {
            this.xframe = "done1";
            stop();
        }

        internal function frame3():*
        {
            gotoAndStop("done1");
        }

        internal function frame4():*
        {
            this.xframe = "hurt2";
        }

        internal function frame5():*
        {
            this.xframe = "done2";
            stop();
        }

        internal function frame6():*
        {
            gotoAndStop("done2");
        }


    }
}//package jigglypuff_fla

