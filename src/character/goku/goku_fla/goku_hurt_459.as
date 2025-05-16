// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.goku_hurt_459

package goku_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class goku_hurt_459 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox10:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var hitBox7:MovieClip;
        public var hitBox8:MovieClip;
        public var hitBox9:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function goku_hurt_459()
        {
            addFrameScript(0, this.frame1, 8, this.frame9, 9, this.frame10, 10, this.frame11, 18, this.frame19, 19, this.frame20, 20, this.frame21, 29, this.frame30, 30, this.frame31, 31, this.frame32, 39, this.frame40, 40, this.frame41);
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


    }
}//package goku_fla

