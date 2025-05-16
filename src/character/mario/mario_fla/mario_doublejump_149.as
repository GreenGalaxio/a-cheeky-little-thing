// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_doublejump_149

package mario_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class mario_doublejump_149 extends MovieClip 
    {

        public var itemBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox:MovieClip;
        public var hand:MovieClip;
        public var self:*;
        public var done:*;

        public function mario_doublejump_149()
        {
            addFrameScript(0, this.frame1, 18, this.frame19, 19, this.frame20);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.done = false;
            if (SSF2API.isReady())
            {
                SSF2API.playSound("mario_doublejumpsfx");
                SSF2API.playSound("jump_common");
            };
        }

        internal function frame19():*
        {
            this.done = true;
            stop();
        }

        internal function frame20():*
        {
            gotoAndStop("done");
        }


    }
}//package mario_fla

