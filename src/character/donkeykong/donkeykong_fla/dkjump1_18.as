// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//donkeykong_fla.dkjump1_18

package donkeykong_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class dkjump1_18 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:*;
        public var done:*;

        public function dkjump1_18()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 9, this.frame10);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
        }

        internal function frame3():*
        {
            this.xframe = "midair";
            this.done = false;
        }

        internal function frame10():*
        {
            this.done = true;
            gotoAndPlay("redo");
        }


    }
}//package donkeykong_fla

