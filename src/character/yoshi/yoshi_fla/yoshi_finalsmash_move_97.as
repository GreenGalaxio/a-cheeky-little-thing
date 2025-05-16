// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//yoshi_fla.yoshi_finalsmash_move_97

package yoshi_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class yoshi_finalsmash_move_97 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var done:Boolean;

        public function yoshi_finalsmash_move_97()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 9, this.frame10);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.done = false;
            };
        }

        internal function frame5():*
        {
            SSF2API.playSound("yoshi_wingflap2");
        }

        internal function frame10():*
        {
            this.done = true;
        }


    }
}//package yoshi_fla

