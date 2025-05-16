// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.goku_screenko_490

package goku_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class goku_screenko_490 extends MovieClip 
    {

        public var self:*;

        public function goku_screenko_490()
        {
            addFrameScript(0, this.frame1, 34, this.frame35);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame35():*
        {
            this.gotoAndPlay("redo");
        }


    }
}//package goku_fla

