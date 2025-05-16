// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.supersonic_crouch_88

package sonic_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class supersonic_crouch_88 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function supersonic_crouch_88()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 4, this.frame5);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame4():*
        {
            stop();
        }

        internal function frame5():*
        {
            this.gotoAndPlay("stopped");
        }


    }
}//package sonic_fla

