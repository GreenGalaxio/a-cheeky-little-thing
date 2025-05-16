// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.kgoku_revival_498

package goku_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class kgoku_revival_498 extends MovieClip 
    {

        public var stance:MovieClip;
        public var self:*;

        public function kgoku_revival_498()
        {
            addFrameScript(0, this.frame1, 151, this.frame152, 152, this.frame153);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame152():*
        {
            stop();
        }

        internal function frame153():*
        {
            stop();
        }


    }
}//package goku_fla

