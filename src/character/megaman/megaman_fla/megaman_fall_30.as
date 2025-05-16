// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.megaman_fall_30

package megaman_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class megaman_fall_30 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var done:Boolean;

        public function megaman_fall_30()
        {
            addFrameScript(0, this.frame1, 6, this.frame7);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.done = false;
        }

        internal function frame7():*
        {
            this.done = true;
            gotoAndPlay("redo");
        }


    }
}//package megaman_fla

