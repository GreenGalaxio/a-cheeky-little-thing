// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_doublejump_90

package ichigo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class ichigo_doublejump_90 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:*;
        public var done:*;

        public function ichigo_doublejump_90()
        {
            addFrameScript(0, this.frame1, 13, this.frame14);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "midair";
            this.done = false;
        }

        internal function frame14():*
        {
            this.done = true;
            gotoAndPlay("redo");
        }


    }
}//package ichigo_fla

