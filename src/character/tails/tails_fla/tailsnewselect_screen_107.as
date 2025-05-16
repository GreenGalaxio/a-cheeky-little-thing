// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//tails_fla.tailsnewselect_screen_107

package tails_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class tailsnewselect_screen_107 extends MovieClip 
    {

        public var self:*;

        public function tailsnewselect_screen_107()
        {
            addFrameScript(0, this.frame1, 6, this.frame7);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame7():*
        {
            this.gotoAndPlay("redo");
        }


    }
}//package tails_fla

