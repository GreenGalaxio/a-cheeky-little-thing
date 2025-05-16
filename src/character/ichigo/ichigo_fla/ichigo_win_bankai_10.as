// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_win_bankai_10

package ichigo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class ichigo_win_bankai_10 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;

        public function ichigo_win_bankai_10()
        {
            addFrameScript(0, this.frame1, 12, this.frame13);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame13():*
        {
            this.gotoAndPlay("again");
        }


    }
}//package ichigo_fla

