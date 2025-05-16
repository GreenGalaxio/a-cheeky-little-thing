// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//peach_fla.peach_hit_98

package peach_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class peach_hit_98 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var stance:MovieClip;
        public var self:*;
        public var xframe:String;

        public function peach_hit_98()
        {
            addFrameScript(0, this.frame1, 8, this.frame9, 9, this.frame10, 10, this.frame11, 18, this.frame19, 19, this.frame20, 20, this.frame21, 29, this.frame30, 30, this.frame31, 31, this.frame32, 39, this.frame40, 40, this.frame41, 50, this.frame51, 51, this.frame52, 52, this.frame53, 60, this.frame61, 61, this.frame62, 62, this.frame63, 70, this.frame71, 71, this.frame72);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = "hurt1";
            };
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

        internal function frame19():*
        {
            this.xframe = "done2";
            stop();
        }

        internal function frame20():*
        {
            gotoAndStop("done2");
        }

        internal function frame21():*
        {
            this.xframe = "hurt3";
        }

        internal function frame30():*
        {
            this.xframe = "done3";
            stop();
        }

        internal function frame31():*
        {
            gotoAndStop("done3");
        }

        internal function frame32():*
        {
            this.xframe = "hurt4";
        }

        internal function frame40():*
        {
            this.xframe = "done4";
            stop();
        }

        internal function frame41():*
        {
            gotoAndStop("done4");
        }

        internal function frame51():*
        {
            this.xframe = "done3";
            stop();
        }

        internal function frame52():*
        {
            gotoAndStop("done5");
        }

        internal function frame53():*
        {
            this.xframe = "hurt5";
        }

        internal function frame61():*
        {
            this.xframe = "done4";
            stop();
        }

        internal function frame62():*
        {
            gotoAndStop("done6");
        }

        internal function frame63():*
        {
            this.xframe = "blech";
        }

        internal function frame71():*
        {
            this.xframe = "done4";
            stop();
        }

        internal function frame72():*
        {
            gotoAndStop("done7");
        }


    }
}//package peach_fla

