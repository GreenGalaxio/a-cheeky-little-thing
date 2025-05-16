// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_flip_special_48

package mario_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class mario_flip_special_48 extends MovieClip 
    {

        public var itemBox:MovieClip;
        public var hitBox:MovieClip;
        public var hand:MovieClip;
        public var self:*;
        public var done:*;

        public function mario_flip_special_48()
        {
            addFrameScript(0, this.frame1, 18, this.frame19, 19, this.frame20);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.done = false;
                SSF2API.playSound("jump_common");
                SSF2API.playSound("mario_doublejumpsfx");
            };
        }

        internal function frame19():*
        {
            this.done = true;
            stop();
        }

        internal function frame20():*
        {
            this.gotoAndStop("done");
        }


    }
}//package mario_fla

