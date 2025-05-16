// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_select_screen_76

package ichigo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class ichigo_select_screen_76 extends MovieClip 
    {

        public var self:*;

        public function ichigo_select_screen_76()
        {
            addFrameScript(0, this.frame1, 14, this.frame15);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame15():*
        {
            gotoAndPlay("again");
        }


    }
}//package ichigo_fla

