// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_comboeffect

package 
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class mario_comboeffect extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var self:*;
        public var canPlay:Boolean;

        public function mario_comboeffect()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 14, this.frame15);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.canPlay = false;
                stop();
            };
        }

        internal function frame2():*
        {
            if (!this.canPlay)
            {
                gotoAndStop("start");
            };
        }

        internal function frame15():*
        {
            stop();
        }


    }
}//package 

