// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.goku_pitfall_491

package goku_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class goku_pitfall_491 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;

        public function goku_pitfall_491()
        {
            addFrameScript(0, this.frame1, 1, this.frame2);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame2():*
        {
            this.gotoAndPlay("again");
        }


    }
}//package goku_fla

