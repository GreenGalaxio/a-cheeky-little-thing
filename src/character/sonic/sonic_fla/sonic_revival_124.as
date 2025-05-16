// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.sonic_revival_124

package sonic_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class sonic_revival_124 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function sonic_revival_124()
        {
            addFrameScript(0, this.frame1, 149, this.frame150);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame150():*
        {
            stop();
        }


    }
}//package sonic_fla

