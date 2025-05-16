// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bomberman_fla.Bomberman_jumpMidair2_17

package bomberman_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class Bomberman_jumpMidair2_17 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var done:*;
        public var self:*;

        public function Bomberman_jumpMidair2_17()
        {
            addFrameScript(0, this.frame1, 12, this.frame13, 13, this.frame14);
        }

        internal function frame1():*
        {
            this.done = false;
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame13():*
        {
            this.done = true;
            stop();
        }

        internal function frame14():*
        {
            this.gotoAndStop("done");
        }


    }
}//package bomberman_fla

