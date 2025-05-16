// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.RushPitFall_gif_148

package megaman_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class RushPitFall_gif_148 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function RushPitFall_gif_148()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 5, this.frame6);
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


    }
}//package megaman_fla

