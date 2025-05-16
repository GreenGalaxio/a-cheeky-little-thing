// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.wariohurt_139

package wario_fla
{
    import flash.display.MovieClip;

    public dynamic class wariohurt_139 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var xframe:String;

        public function wariohurt_139()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 20, this.frame21, 21, this.frame22);
        }

        internal function frame1():*
        {
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
            this.xframe = "shock";
        }

        internal function frame21():*
        {
            this.xframe = "done5";
            stop();
        }

        internal function frame22():*
        {
            gotoAndStop("done5");
        }


    }
}//package wario_fla

