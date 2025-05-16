// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//lloyd_fla.lloyd_select_screen_7

package lloyd_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class lloyd_select_screen_7 extends MovieClip 
    {

        public var self:*;

        public function lloyd_select_screen_7()
        {
            addFrameScript(0, this.frame1, 47, this.frame48);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame48():*
        {
            gotoAndPlay("again");
        }


    }
}//package lloyd_fla

