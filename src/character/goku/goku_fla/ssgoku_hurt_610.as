// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.ssgoku_hurt_610

package goku_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class ssgoku_hurt_610 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function ssgoku_hurt_610()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = "done1";
                stop();
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = "hurt1";
            };
        }

        internal function frame2():*
        {
            gotoAndStop("done1");
        }

        internal function frame3():*
        {
            this.xframe = "done2";
            stop();
            this.xframe = "hurt2";
        }

        internal function frame4():*
        {
            gotoAndStop("done2");
        }

        internal function frame5():*
        {
            this.xframe = "done3";
            stop();
            this.xframe = "hurt3";
        }

        internal function frame6():*
        {
            gotoAndStop("done3");
        }

        internal function frame7():*
        {
            this.xframe = "done4";
            stop();
            this.xframe = "hurt4";
        }

        internal function frame8():*
        {
            gotoAndStop("done4");
        }


    }
}//package goku_fla

