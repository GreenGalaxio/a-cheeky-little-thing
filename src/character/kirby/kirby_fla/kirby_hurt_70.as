// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_hurt_70

package kirby_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class kirby_hurt_70 extends MovieClip 
    {

        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function kirby_hurt_70()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 14, this.frame15, 16, this.frame17);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "hurt1";
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

        internal function frame7():*
        {
            this.xframe = "hurt3";
        }

        internal function frame8():*
        {
            this.xframe = "done3";
            stop();
        }

        internal function frame9():*
        {
            gotoAndStop("done3");
        }

        internal function frame10():*
        {
            this.xframe = "hurt4";
        }

        internal function frame11():*
        {
            this.xframe = "done4";
            stop();
        }

        internal function frame12():*
        {
            gotoAndStop("done4");
        }

        internal function frame13():*
        {
            this.xframe = "hurt5";
        }

        internal function frame15():*
        {
            this.xframe = "done5";
            stop();
        }

        internal function frame17():*
        {
            gotoAndStop("done5");
        }


    }
}//package kirby_fla

