// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.ssgoku_screenko_633

package goku_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class ssgoku_screenko_633 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function ssgoku_screenko_633()
        {
            addFrameScript(0, this.frame1, 33, this.frame34);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame34():*
        {
            this.gotoAndPlay("redo");
        }


    }
}//package goku_fla

