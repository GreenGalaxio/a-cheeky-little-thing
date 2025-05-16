// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.bmselectscreen_139

package blackmage_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class bmselectscreen_139 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;

        public function bmselectscreen_139()
        {
            addFrameScript(0, this.frame1, 55, this.frame56);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
        }

        internal function frame56():*
        {
            this.gotoAndPlay("loop");
        }


    }
}//package blackmage_fla

