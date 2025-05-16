// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_hit_special_64

package naruto_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class naruto_hit_special_64 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function naruto_hit_special_64()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9);
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


    }
}//package naruto_fla

