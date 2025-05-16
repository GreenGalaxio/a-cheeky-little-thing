// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.goku_select_494

package goku_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class goku_select_494 extends MovieClip 
    {

        public var self:*;

        public function goku_select_494()
        {
            addFrameScript(0, this.frame1, 15, this.frame16);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame16():*
        {
            stop();
        }


    }
}//package goku_fla

