// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//marth_fla.marth_hurt_151

package marth_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class marth_hurt_151 extends MovieClip 
    {

        public var itemBox:MovieClip;
        public var hitBox2:MovieClip;
        public var self:*;
        public var xframe:String;

        public function marth_hurt_151()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 5, this.frame6, 6, this.frame7, 10, this.frame11, 11, this.frame12, 12, this.frame13, 16, this.frame17, 17, this.frame18, 18, this.frame19, 22, this.frame23, 23, this.frame24);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "hurt1";
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

        internal function frame17():*
        {
            this.xframe = "done3";
            stop();
        }

        internal function frame18():*
        {
            gotoAndStop("done3");
        }

        internal function frame19():*
        {
            this.xframe = "hurt4";
        }

        internal function frame23():*
        {
            this.xframe = "done4";
            stop();
        }

        internal function frame24():*
        {
            gotoAndStop("done4");
        }


    }
}//package marth_fla

