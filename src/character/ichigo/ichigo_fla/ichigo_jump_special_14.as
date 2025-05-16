// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_jump_special_14

package ichigo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class ichigo_jump_special_14 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var done:*;

        public function ichigo_jump_special_14()
        {
            addFrameScript(0, this.frame1, 11, this.frame12);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.done = false;
        }

        internal function frame12():*
        {
            this.done = true;
            this.gotoAndPlay("again");
        }


    }
}//package ichigo_fla

