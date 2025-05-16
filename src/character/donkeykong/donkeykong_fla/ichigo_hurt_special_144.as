// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//donkeykong_fla.ichigo_hurt_special_144

package donkeykong_fla
{
    import flash.display.MovieClip;

    public dynamic class ichigo_hurt_special_144 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var xframe:String;

        public function ichigo_hurt_special_144()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 5, this.frame6, 6, this.frame7, 10, this.frame11, 11, this.frame12, 12, this.frame13, 17, this.frame18, 18, this.frame19, 19, this.frame20, 23, this.frame24, 24, this.frame25);
        }

        internal function frame1():*
        {
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


    }
}//package donkeykong_fla

