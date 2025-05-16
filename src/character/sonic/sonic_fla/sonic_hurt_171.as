// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.sonic_hurt_171

package sonic_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class sonic_hurt_171 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function sonic_hurt_171()
        {
            addFrameScript(0, this.frame1, 8, this.frame9, 9, this.frame10, 10, this.frame11, 16, this.frame17, 17, this.frame18, 18, this.frame19, 25, this.frame26, 26, this.frame27, 27, this.frame28, 31, this.frame32, 32, this.frame33, 33, this.frame34, 38, this.frame39, 39, this.frame40);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "hurt1";
        }

        internal function frame9():*
        {
            this.xframe = "done1";
            stop();
        }

        internal function frame10():*
        {
            gotoAndStop("done1");
        }

        internal function frame11():*
        {
            this.xframe = "hurt2";
        }

        internal function frame17():*
        {
            this.xframe = "done2";
            stop();
        }

        internal function frame18():*
        {
            gotoAndStop("done2");
        }

        internal function frame19():*
        {
            this.xframe = "hurt3";
        }

        internal function frame26():*
        {
            this.xframe = "done3";
            stop();
        }

        internal function frame27():*
        {
            gotoAndStop("done3");
        }

        internal function frame28():*
        {
            this.xframe = "hurt4";
        }

        internal function frame32():*
        {
            this.xframe = "done4";
            stop();
        }

        internal function frame33():*
        {
            gotoAndStop("done4");
        }

        internal function frame34():*
        {
            this.xframe = "hurt5";
        }

        internal function frame39():*
        {
            this.xframe = "done5";
            stop();
        }

        internal function frame40():*
        {
            gotoAndStop("done5");
        }


    }
}//package sonic_fla

