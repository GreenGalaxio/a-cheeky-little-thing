// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//chibirobo_fla.chibi_hurt_64

package chibirobo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class chibi_hurt_64 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function chibi_hurt_64()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 4, this.frame5, 6, this.frame7, 7, this.frame8, 8, this.frame9, 10, this.frame11, 11, this.frame12, 12, this.frame13, 14, this.frame15, 15, this.frame16);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "hurt1";
        }

        internal function frame3():*
        {
            this.xframe = "done1";
            stop();
        }

        internal function frame4():*
        {
            gotoAndStop("done1");
        }

        internal function frame5():*
        {
            this.xframe = "hurt2";
        }

        internal function frame7():*
        {
            this.xframe = "done2";
            stop();
        }

        internal function frame8():*
        {
            gotoAndStop("done2");
        }

        internal function frame9():*
        {
            this.xframe = "hurt3";
        }

        internal function frame11():*
        {
            this.xframe = "done3";
            stop();
        }

        internal function frame12():*
        {
            gotoAndStop("done3");
        }

        internal function frame13():*
        {
            this.xframe = "hurt4";
        }

        internal function frame15():*
        {
            this.xframe = "done4";
            stop();
        }

        internal function frame16():*
        {
            gotoAndStop("done4");
        }


    }
}//package chibirobo_fla

