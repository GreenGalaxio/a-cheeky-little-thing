// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_hurt_special_46

package ichigo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class ichigo_hurt_special_46 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var stance:MovieClip;
        public var self:*;
        public var xframe:String;

        public function ichigo_hurt_special_46()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 5, this.frame6, 6, this.frame7, 10, this.frame11, 11, this.frame12, 12, this.frame13, 17, this.frame18, 18, this.frame19, 19, this.frame20, 23, this.frame24, 24, this.frame25, 29, this.frame30, 30, this.frame31, 35, this.frame36, 36, this.frame37);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "hurt";
        }

        internal function frame5():*
        {
            this.xframe = "done1";
            stop();
        }

        internal function frame6():*
        {
            gotoAndStop("done1");
        }

        internal function frame7():*
        {
            this.xframe = "hurt2";
        }

        internal function frame11():*
        {
            this.xframe = "done2";
            stop();
        }

        internal function frame12():*
        {
            gotoAndStop("done2");
        }

        internal function frame13():*
        {
            this.xframe = "hurt3";
        }

        internal function frame18():*
        {
            this.xframe = "done3";
            stop();
        }

        internal function frame19():*
        {
            gotoAndStop("done3");
        }

        internal function frame20():*
        {
            this.xframe = "hurt4";
        }

        internal function frame24():*
        {
            this.xframe = "done4";
            stop();
        }

        internal function frame25():*
        {
            gotoAndStop("done4");
        }

        internal function frame30():*
        {
            this.xframe = "burn";
            stop();
        }

        internal function frame31():*
        {
            gotoAndStop("burn");
        }

        internal function frame36():*
        {
            this.xframe = "shock";
            stop();
        }

        internal function frame37():*
        {
            gotoAndStop("shock");
        }


    }
}//package ichigo_fla

