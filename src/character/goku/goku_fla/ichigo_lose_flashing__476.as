// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.ichigo_lose_flashing__476

package goku_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class ichigo_lose_flashing__476 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function ichigo_lose_flashing__476()
        {
            addFrameScript(0, this.frame1, 22, this.frame23);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame23():*
        {
            this.gotoAndPlay("again");
        }


    }
}//package goku_fla

