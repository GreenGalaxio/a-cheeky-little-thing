// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//pikachu_fla.hurt_63

package pikachu_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class hurt_63 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function hurt_63()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 4, this.frame5, 5, this.frame6, 8, this.frame9, 9, this.frame10, 10, this.frame11, 13, this.frame14, 14, this.frame15, 15, this.frame16, 18, this.frame19, 19, this.frame20, 20, this.frame21, 23, this.frame24, 24, this.frame25);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "hurt1";
        }

        internal function frame4():*
        {
            this.xframe = "done1";
            stop();
        }

        internal function frame5():*
        {
            gotoAndStop("done1");
        }

        internal function frame6():*
        {
            this.xframe = "hurt2";
        }

        internal function frame9():*
        {
            this.xframe = "done2";
            stop();
        }

        internal function frame10():*
        {
            gotoAndStop("done2");
        }

        internal function frame11():*
        {
            this.xframe = "hurt2";
        }

        internal function frame14():*
        {
            this.xframe = "done3";
            stop();
        }

        internal function frame15():*
        {
            gotoAndStop("done3");
        }

        internal function frame16():*
        {
            this.xframe = "hurt4";
        }

        internal function frame19():*
        {
            this.xframe = "done4";
            stop();
        }

        internal function frame20():*
        {
            gotoAndStop("done4");
        }

        internal function frame21():*
        {
            this.xframe = "hurt5";
        }

        internal function frame24():*
        {
            this.xframe = "done5";
            stop();
        }

        internal function frame25():*
        {
            gotoAndStop("done5");
        }


    }
}//package pikachu_fla

