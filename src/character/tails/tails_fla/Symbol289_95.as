// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//tails_fla.Symbol289_95

package tails_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class Symbol289_95 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;

        public function Symbol289_95()
        {
            addFrameScript(0, this.frame1, 16, this.frame17);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame17():*
        {
            this.gotoAndPlay("redo");
        }


    }
}//package tails_fla

