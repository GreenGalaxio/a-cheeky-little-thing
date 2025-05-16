// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_jump_148

package mario_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class mario_jump_148 extends MovieClip 
    {

        public var itemBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var hitBox:MovieClip;
        public var hand:MovieClip;
        public var self:*;
        public var xframe:*;
        public var done:*;

        public function mario_jump_148()
        {
            addFrameScript(0, this.frame1, 25, this.frame26, 26, this.frame27, 49, this.frame50, 50, this.frame51);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "midair";
            this.done = false;
            if (SSF2API.isReady())
            {
                SSF2API.playSound("mario_jumpsfx");
                SSF2API.playSound("jump_common");
            };
        }

        internal function frame26():*
        {
            this.done = true;
            stop();
        }

        internal function frame27():*
        {
            gotoAndStop("done");
        }

        internal function frame50():*
        {
            this.done = true;
            stop();
        }

        internal function frame51():*
        {
            gotoAndStop("done2");
        }


    }
}//package mario_fla

