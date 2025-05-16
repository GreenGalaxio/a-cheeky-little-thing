// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_jump_special_47

package mario_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class mario_jump_special_47 extends MovieClip 
    {

        public var itemBox:MovieClip;
        public var hitBox:MovieClip;
        public var hand:MovieClip;
        public var self:*;
        public var done:*;

        public function mario_jump_special_47()
        {
            addFrameScript(0, this.frame1, 24, this.frame25, 25, this.frame26);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.done = false;
                SSF2API.playSound("jump_common");
            };
        }

        internal function frame25():*
        {
            this.done = true;
            stop();
        }

        internal function frame26():*
        {
            this.gotoAndStop("done");
        }


    }
}//package mario_fla

