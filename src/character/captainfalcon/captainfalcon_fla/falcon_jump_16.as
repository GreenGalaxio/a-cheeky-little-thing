// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//captainfalcon_fla.falcon_jump_16

package captainfalcon_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class falcon_jump_16 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var xframe:*;
        public var done:*;

        public function falcon_jump_16()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 19, this.frame20);
        }

        internal function frame1():*
        {
            this.xframe = "midair";
            this.done = false;
        }

        internal function frame2():*
        {
            SSF2API.playSound("falcon_jumpS1");
        }

        internal function frame20():*
        {
            this.done = true;
        }


    }
}//package captainfalcon_fla

